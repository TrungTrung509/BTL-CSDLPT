import json
import asyncio
from aiokafka import AIOKafkaConsumer, AIOKafkaProducer
from configs.config import KAFKA_BOOTSTRAP_SERVERS
from services.EnrollmentService import EnrollmentService
from schemas.Enrollment import EnrollmentCreate
from enums.user_role import UserRole
from fastapi import HTTPException

class UserMock:
    def __init__(self, userId: str, MaCoSo: str, username: str, role: str):
        self.userId = userId
        self.MaCoSo = MaCoSo
        self.username = username
        try:
            self.role = UserRole(role)
        except ValueError:
            self.role = UserRole.SinhVien

class KafkaWorkerService:
    consumer: AIOKafkaConsumer = None
    producer: AIOKafkaProducer = None
    worker_task: asyncio.Task = None
    semaphore: asyncio.Semaphore = None
    _started: bool = False

    @classmethod
    async def start(cls):
        if cls._started:
            return

        cls.semaphore = asyncio.Semaphore(30)  # Restrict concurrent DB transactions to protect the connection pool

        cls.consumer = AIOKafkaConsumer(
            "registration_requests",
            bootstrap_servers=KAFKA_BOOTSTRAP_SERVERS,
            group_id="registration_worker_group",
            value_deserializer=lambda v: json.loads(v.decode("utf-8")),
            auto_offset_reset="latest"
        )
        await cls.consumer.start()

        cls.producer = AIOKafkaProducer(
            bootstrap_servers=KAFKA_BOOTSTRAP_SERVERS,
            value_serializer=lambda v: json.dumps(v).encode("utf-8")
        )
        await cls.producer.start()

        cls._started = True
        cls.worker_task = asyncio.create_task(cls._consume_and_process())
        print("KafkaWorkerService started successfully with concurrency limit = 15.")

    @classmethod
    async def stop(cls):
        if not cls._started:
            return

        cls._started = False
        if cls.worker_task:
            cls.worker_task.cancel()
            try:
                await cls.worker_task
            except asyncio.CancelledError:
                pass

        if cls.consumer:
            await cls.consumer.stop()
        if cls.producer:
            await cls.producer.stop()

        print("KafkaWorkerService stopped.")

    @classmethod
    async def _consume_and_process(cls):
        try:
            async for msg in cls.consumer:
                payload = msg.value
                correlation_id = payload.get("correlation_id")
                user_data = payload.get("user", {})
                enroll_in_data = payload.get("enroll_in", {})

                if not correlation_id:
                    continue

                asyncio.create_task(cls._process_single_request(correlation_id, user_data, enroll_in_data))
        except asyncio.CancelledError:
            pass
        except Exception as e:
            print(f"Error in KafkaWorkerService consumer loop: {e}")

    @classmethod
    async def _process_single_request(cls, correlation_id: str, user_data: dict, enroll_in_data: dict):
        try:
            # Reconstruct request objects
            user_mock = UserMock(
                userId=user_data.get("userId"),
                MaCoSo=user_data.get("MaCoSo"),
                username=user_data.get("username", ""),
                role=user_data.get("role", "SinhVien")
            )
            enroll_in = EnrollmentCreate(**enroll_in_data)

            # Wait for our turn in the semaphore, then run registration in a worker thread
            async with cls.semaphore:
                result = await asyncio.to_thread(EnrollmentService.register, user_mock, enroll_in)
            
            result_dict = result.model_dump()
        except HTTPException as exc:
            result_dict = {
                "MaLopHP": enroll_in_data.get("MaLopHP"),
                "status": "Failed",
                "message": exc.detail,
                "error_code": "REGISTRATION_HTTP_ERROR",
                "reasons": [exc.detail]
            }
        except Exception as exc:
            result_dict = {
                "MaLopHP": enroll_in_data.get("MaLopHP"),
                "status": "Failed",
                "message": f"System error: {str(exc)}",
                "error_code": "REGISTRATION_SYSTEM_ERROR",
                "reasons": [str(exc)]
            }

        # Send response back to registration_replies
        response_payload = {
            "correlation_id": correlation_id,
            "result": result_dict
        }

        try:
            await cls.producer.send_and_wait("registration_replies", response_payload)
        except Exception as e:
            print(f"Failed to publish registration reply for {correlation_id}: {e}")
