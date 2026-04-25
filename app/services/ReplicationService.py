import json
from datetime import datetime
from typing import Any, Iterable, Optional

from fastapi.encoders import jsonable_encoder
from sqlalchemy import func, text
from sqlalchemy.exc import OperationalError, SQLAlchemyError
from sqlalchemy.orm import Session

from configs.db import SessionLocals
from enums.status import CourseStatus
from enums.types import CourseType
from models.Courses import Course
from models.ReplicationOutbox import ReplicationOutbox
from models.SiteStatus import SiteStatus
from repositories.CourseRepo import CourseRepo
from services.FailoverService import FailoverService


class ReplicationService:
    ENTITY_COURSE = "Course"
    OP_UPSERT = "UPSERT"
    OP_DELETE = "DELETE"
    STATUS_PENDING = "PENDING"
    STATUS_DONE = "DONE"
    STATUS_FAILED = "FAILED"
    STATUS_ONLINE = "ONLINE"
    STATUS_OFFLINE = "OFFLINE"
    STATUS_ERROR = "ERROR"
    STATUS_UNKNOWN = "UNKNOWN"
    @staticmethod
    def stage_course_upsert(primary_db: Session, course: Course) -> list[ReplicationOutbox]:
        payload = ReplicationService._course_to_payload(course)
        return ReplicationService._stage_events(
            primary_db=primary_db,
            entity_type=ReplicationService.ENTITY_COURSE,
            entity_id=course.MaHocPhan,
            operation=ReplicationService.OP_UPSERT,
            payload=payload,
        )

    @staticmethod
    def stage_course_delete(primary_db: Session, course_code: str) -> list[ReplicationOutbox]:
        return ReplicationService._stage_events(
            primary_db=primary_db,
            entity_type=ReplicationService.ENTITY_COURSE,
            entity_id=course_code,
            operation=ReplicationService.OP_DELETE,
            payload={"MaHocPhan": course_code},
        )

    @staticmethod
    def dispatch_outbox_events(
        event_ids: Optional[Iterable[int]] = None,
        target_site: Optional[str] = None,
    ) -> dict[str, Any]:
        primary_site = FailoverService.get_current_primary_site(auto_failover=True)
        primary_db = SessionLocals[primary_site]()
        try:
            ReplicationService._ensure_site_rows(primary_db)
            query = primary_db.query(ReplicationOutbox).filter(
                ReplicationOutbox.Status.in_(
                    [ReplicationService.STATUS_PENDING, ReplicationService.STATUS_FAILED]
                )
            )
            if event_ids:
                query = query.filter(ReplicationOutbox.EventId.in_(list(event_ids)))
            if target_site:
                query = query.filter(ReplicationOutbox.TargetSite == target_site.upper())

            events = query.order_by(
                ReplicationOutbox.CreatedAt.asc(),
                ReplicationOutbox.EventId.asc(),
            ).all()
            summary = {
                "primary_site": primary_site,
                "attempted": len(events),
                "delivered": 0,
                "pending": 0,
                "failed": 0,
                "events": [],
            }

            for event in events:
                result = ReplicationService._dispatch_single_event(primary_db, event)
                primary_db.commit()
                summary["events"].append(result)
                if result["status"] == ReplicationService.STATUS_DONE:
                    summary["delivered"] += 1
                elif result["status"] == ReplicationService.STATUS_PENDING:
                    summary["pending"] += 1
                else:
                    summary["failed"] += 1

            return summary
        finally:
            primary_db.close()

    @staticmethod
    def refresh_site_statuses() -> list[dict[str, Any]]:
        primary_site = FailoverService.get_current_primary_site(auto_failover=True)
        primary_db = SessionLocals[primary_site]()
        try:
            ReplicationService._ensure_site_rows(primary_db)
            now = datetime.utcnow()
            for site_id in SessionLocals:
                if site_id == primary_site:
                    ReplicationService._update_site_row(
                        primary_db,
                        site_id,
                        status=ReplicationService.STATUS_ONLINE,
                        heartbeat=now,
                        success_at=now,
                        error=None,
                    )
                    continue

                available, error = ReplicationService._ping_site(site_id)
                ReplicationService._update_site_row(
                    primary_db,
                    site_id,
                    status=(
                        ReplicationService.STATUS_ONLINE
                        if available
                        else ReplicationService.STATUS_OFFLINE
                    ),
                    heartbeat=now,
                    success_at=now if available else None,
                    error=error,
                )

            primary_db.commit()
            return ReplicationService._serialize_site_rows(primary_db)
        finally:
            primary_db.close()

    @staticmethod
    def get_replication_status() -> dict[str, Any]:
        primary_site = FailoverService.get_current_primary_site(auto_failover=True)
        primary_db = SessionLocals[primary_site]()
        try:
            ReplicationService._ensure_site_rows(primary_db)
            primary_db.commit()
            outbox_counts = {
                row.Status: row.count
                for row in primary_db.query(
                    ReplicationOutbox.Status,
                    func.count(ReplicationOutbox.EventId).label("count"),
                )
                .group_by(ReplicationOutbox.Status)
                .all()
            }
            pending_events = (
                primary_db.query(ReplicationOutbox)
                .filter(
                    ReplicationOutbox.Status.in_(
                        [ReplicationService.STATUS_PENDING, ReplicationService.STATUS_FAILED]
                    )
                )
                .order_by(
                    ReplicationOutbox.CreatedAt.asc(),
                    ReplicationOutbox.EventId.asc(),
                )
                .limit(20)
                .all()
            )
            return {
                "primary_site": primary_site,
                "sites": ReplicationService._serialize_site_rows(primary_db),
                "outbox": {
                    "counts": outbox_counts,
                    "pending_events": [
                        {
                            "event_id": event.EventId,
                            "entity_type": event.EntityType,
                            "entity_id": event.EntityId,
                            "operation": event.Operation,
                            "target_site": event.TargetSite,
                            "status": event.Status,
                            "retry_count": event.RetryCount,
                            "last_error": event.LastError,
                            "created_at": event.CreatedAt,
                        }
                        for event in pending_events
                    ],
                },
            }
        finally:
            primary_db.close()

    @staticmethod
    def _stage_events(
        primary_db: Session,
        entity_type: str,
        entity_id: str,
        operation: str,
        payload: dict[str, Any],
    ) -> list[ReplicationOutbox]:
        ReplicationService._ensure_site_rows(primary_db)
        events = []
        payload_json = json.dumps(jsonable_encoder(payload), ensure_ascii=False)
        primary_site = FailoverService.get_current_primary_site(auto_failover=True)

        for target_site in ReplicationService._replica_sites(primary_site):
            event = ReplicationOutbox(
                EntityType=entity_type,
                EntityId=entity_id,
                Operation=operation,
                Payload=payload_json,
                SourceSite=primary_site,
                TargetSite=target_site,
                Status=ReplicationService.STATUS_PENDING,
            )
            primary_db.add(event)
            events.append(event)

        ReplicationService._update_site_row(
            primary_db,
            primary_site,
            status=ReplicationService.STATUS_ONLINE,
            heartbeat=datetime.utcnow(),
            success_at=datetime.utcnow(),
            error=None,
        )
        return events

    @staticmethod
    def _dispatch_single_event(primary_db: Session, event: ReplicationOutbox) -> dict[str, Any]:
        target_site = event.TargetSite.upper()
        target_db = SessionLocals[target_site]()
        try:
            target_db.execute(text("SELECT 1"))
            payload = json.loads(event.Payload)
            ReplicationService._apply_event(target_db, event, payload)
            target_db.commit()

            event.Status = ReplicationService.STATUS_DONE
            event.LastError = None
            event.ProcessedAt = datetime.utcnow()
            ReplicationService._update_site_row(
                primary_db,
                target_site,
                status=ReplicationService.STATUS_ONLINE,
                heartbeat=datetime.utcnow(),
                success_at=datetime.utcnow(),
                error=None,
            )
            return {
                "event_id": event.EventId,
                "target_site": target_site,
                "status": ReplicationService.STATUS_DONE,
            }
        except OperationalError as exc:
            target_db.rollback()
            event.Status = ReplicationService.STATUS_PENDING
            event.RetryCount += 1
            event.LastError = ReplicationService._truncate_error(exc)
            ReplicationService._update_site_row(
                primary_db,
                target_site,
                status=ReplicationService.STATUS_OFFLINE,
                heartbeat=datetime.utcnow(),
                error=event.LastError,
            )
            return {
                "event_id": event.EventId,
                "target_site": target_site,
                "status": ReplicationService.STATUS_PENDING,
                "error": event.LastError,
            }
        except (SQLAlchemyError, ValueError, KeyError, json.JSONDecodeError) as exc:
            target_db.rollback()
            event.Status = ReplicationService.STATUS_FAILED
            event.RetryCount += 1
            event.LastError = ReplicationService._truncate_error(exc)
            ReplicationService._update_site_row(
                primary_db,
                target_site,
                status=ReplicationService.STATUS_ERROR,
                heartbeat=datetime.utcnow(),
                error=event.LastError,
            )
            return {
                "event_id": event.EventId,
                "target_site": target_site,
                "status": ReplicationService.STATUS_FAILED,
                "error": event.LastError,
            }
        finally:
            target_db.close()

    @staticmethod
    def _apply_event(target_db: Session, event: ReplicationOutbox, payload: dict[str, Any]) -> None:
        if event.EntityType != ReplicationService.ENTITY_COURSE:
            raise ValueError(f"Unsupported entity type: {event.EntityType}")

        course_code = event.EntityId.upper()
        course = CourseRepo.get_by_id(target_db, course_code)

        if event.Operation == ReplicationService.OP_DELETE:
            if course:
                target_db.delete(course)
            return

        if event.Operation != ReplicationService.OP_UPSERT:
            raise ValueError(f"Unsupported operation: {event.Operation}")

        mapped_data = {
            "MaHocPhan": course_code,
            "TenHocPhan": payload["TenHocPhan"],
            "SoTinChi": payload["SoTinChi"],
            "SoTietLyThuyet": payload["SoTietLyThuyet"],
            "SoTietThucHanh": payload["SoTietThucHanh"],
            "LoaiHocPhan": CourseType(payload["LoaiHocPhan"]),
            "MaKhoa": payload["MaKhoa"],
            "MoTa": payload.get("MoTa"),
            "TrangThai": CourseStatus(payload["TrangThai"]),
            "NgayTao": datetime.fromisoformat(payload["NgayTao"]),
        }

        if course is None:
            target_db.add(Course(**mapped_data))
            return

        for field, value in mapped_data.items():
            setattr(course, field, value)

    @staticmethod
    def _course_to_payload(course: Course) -> dict[str, Any]:
        return {
            "MaHocPhan": course.MaHocPhan,
            "TenHocPhan": course.TenHocPhan,
            "SoTinChi": course.SoTinChi,
            "SoTietLyThuyet": course.SoTietLyThuyet,
            "SoTietThucHanh": course.SoTietThucHanh,
            "LoaiHocPhan": course.LoaiHocPhan.value,
            "MaKhoa": course.MaKhoa,
            "MoTa": course.MoTa,
            "TrangThai": course.TrangThai.value,
            "NgayTao": course.NgayTao.isoformat(),
        }

    @staticmethod
    def _ping_site(site_id: str) -> tuple[bool, Optional[str]]:
        session = SessionLocals[site_id]()
        try:
            session.execute(text("SELECT 1"))
            return True, None
        except OperationalError as exc:
            session.rollback()
            return False, ReplicationService._truncate_error(exc)
        finally:
            session.close()

    @staticmethod
    def _ensure_site_rows(primary_db: Session) -> None:
        current_primary = FailoverService.get_current_primary_site(auto_failover=True)
        existing = {
            row.SiteId: row
            for row in primary_db.query(SiteStatus)
            .filter(SiteStatus.SiteId.in_(list(SessionLocals.keys())))
            .all()
        }

        for site_id in SessionLocals:
            if site_id in existing:
                continue
            primary_db.add(
                SiteStatus(
                    SiteId=site_id,
                    Role=("PRIMARY" if site_id == current_primary else "REPLICA"),
                    Status=(
                        ReplicationService.STATUS_ONLINE
                        if site_id == current_primary
                        else ReplicationService.STATUS_UNKNOWN
                    ),
                )
            )

        # SessionLocals use autoflush=False, so flush pending SiteStatus rows
        # before any later query/update tries to read them again.
        primary_db.flush()

    @staticmethod
    def _update_site_row(
        primary_db: Session,
        site_id: str,
        *,
        status: str,
        heartbeat: Optional[datetime] = None,
        success_at: Optional[datetime] = None,
        error: Optional[str] = None,
    ) -> None:
        current_primary = FailoverService.get_current_primary_site(auto_failover=True)
        row = primary_db.query(SiteStatus).filter(SiteStatus.SiteId == site_id).first()
        if row is None:
            row = SiteStatus(
                SiteId=site_id,
                Role=("PRIMARY" if site_id == current_primary else "REPLICA"),
            )
            primary_db.add(row)

        row.Role = "PRIMARY" if site_id == current_primary else "REPLICA"
        row.Status = status
        row.LastHeartbeat = heartbeat or datetime.utcnow()
        if success_at is not None:
            row.LastSuccessAt = success_at
        row.LastError = error

    @staticmethod
    def _serialize_site_rows(primary_db: Session) -> list[dict[str, Any]]:
        return [
            {
                "site_id": row.SiteId,
                "role": row.Role,
                "status": row.Status,
                "last_heartbeat": row.LastHeartbeat,
                "last_success_at": row.LastSuccessAt,
                "last_error": row.LastError,
                "updated_at": row.UpdatedAt,
            }
            for row in primary_db.query(SiteStatus).order_by(SiteStatus.SiteId.asc()).all()
        ]

    @staticmethod
    def _replica_sites(primary_site: str) -> list[str]:
        return [site for site in SessionLocals if site != primary_site]

    @staticmethod
    def _truncate_error(exc: Exception) -> str:
        return str(exc)[:500]
