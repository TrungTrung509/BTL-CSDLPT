import asyncio
from contextlib import asynccontextmanager, suppress

from fastapi import FastAPI

import models
from configs.db import Base, engines
from configs.seed import seed_all
from exceptions import register_exception_handlers
from routers import auth, branch, class_section, classroom, course, department, teacher, schedule, semester, student_management, user, enrollment, failover
from services.Enrollment3PCService import Enrollment3PCService
from services.ReplicationService import ReplicationService


REPLICATION_RECOVERY_INTERVAL_SECONDS = 10
ENROLLMENT_3PC_RECOVERY_INTERVAL_SECONDS = 10

for branch_id, engine in engines.items():
    print(f"Initializing database for site: {branch_id}")
    Base.metadata.create_all(bind=engine)

seed_all()
print("All tables created and default data seeded successfully!")


async def replication_recovery_loop():
    while True:
        try:
            summary = await asyncio.to_thread(ReplicationService.dispatch_outbox_events)
            if summary.get("attempted", 0):
                print(
                    "Replication auto recovery: "
                    f"attempted={summary['attempted']}, "
                    f"delivered={summary['delivered']}, "
                    f"pending={summary['pending']}, "
                    f"failed={summary['failed']}"
                )
        except asyncio.CancelledError:
            raise
        except Exception as exc:
            print(f"Replication auto recovery failed: {exc}")

        await asyncio.sleep(REPLICATION_RECOVERY_INTERVAL_SECONDS)


async def enrollment_3pc_recovery_loop():
    while True:
        try:
            summary = await asyncio.to_thread(Enrollment3PCService.recover_in_doubt_transactions)
            if summary.get("recovered_commits", 0) or summary.get("recovered_aborts", 0):
                print(
                    "Enrollment 3PC recovery: "
                    f"committed={summary['recovered_commits']}, "
                    f"aborted={summary['recovered_aborts']}"
                )
        except asyncio.CancelledError:
            raise
        except Exception as exc:
            print(f"Enrollment 3PC recovery failed: {exc}")

        await asyncio.sleep(ENROLLMENT_3PC_RECOVERY_INTERVAL_SECONDS)


@asynccontextmanager
async def lifespan(app: FastAPI):
    recovery_task = asyncio.create_task(replication_recovery_loop())
    enrollment_3pc_task = asyncio.create_task(enrollment_3pc_recovery_loop())
    try:
        yield
    finally:
        recovery_task.cancel()
        enrollment_3pc_task.cancel()
        with suppress(asyncio.CancelledError):
            await recovery_task
        with suppress(asyncio.CancelledError):
            await enrollment_3pc_task

app = FastAPI(
    title="BTL-CSDLPT API",
    description="API for Distributed Database - Branch Registration System",
    version="1.1.1",
    lifespan=lifespan,
)

register_exception_handlers(app)

app.include_router(auth.router)
app.include_router(user.router)
app.include_router(branch.router)
app.include_router(department.router)
app.include_router(course.router)
app.include_router(semester.router)
app.include_router(class_section.router)
app.include_router(classroom.router)
app.include_router(schedule.router)
app.include_router(student_management.router)
app.include_router(teacher.router)
app.include_router(enrollment.router)
app.include_router(failover.router)


@app.get("/", tags=["Health Check"])
def read_root():
    return {
        "status": "online",
        "message": "Welcome to BTL-CSDLPT API",
    }


@app.get("/health", tags=["Health Check"])
def health_check():
    from schemas.api_response import success_response

    return success_response(
        data={"status": "healthy", "version": "1.1.1"},
        message="He thong dang hoat dong",
        status=200,
    )
