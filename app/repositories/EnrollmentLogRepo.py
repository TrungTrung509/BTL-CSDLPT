from sqlalchemy.orm import Session

from enums.status import EnrollmentAction, LogStatus
from models.EnrollmentLogs import EnrollmentLog


class EnrollmentLogRepo:
    @staticmethod
    def append(
        db: Session,
        *,
        user_id: str,
        ma_lop_hp: str,
        ma_hp: str,
        action: EnrollmentAction,
        target_site: str,
        status: LogStatus,
        message: str | None = None,
    ) -> EnrollmentLog:
        log = EnrollmentLog(
            userId=user_id,
            MaLopHP=ma_lop_hp,
            MaHP=ma_hp,
            Action=action,
            TargetSite=target_site,
            Status=status,
            Message=message,
        )
        db.add(log)
        db.commit()
        db.refresh(log)
        return log

    @staticmethod
    def resolve_latest_pending(
        db: Session,
        *,
        user_id: str,
        ma_lop_hp: str,
        ma_hp: str,
        action: EnrollmentAction,
        target_site: str,
        status: LogStatus,
        message: str | None = None,
    ) -> EnrollmentLog | None:
        log = (
            db.query(EnrollmentLog)
            .filter(
                EnrollmentLog.userId == user_id,
                EnrollmentLog.MaLopHP == ma_lop_hp,
                EnrollmentLog.MaHP == ma_hp,
                EnrollmentLog.Action == action,
                EnrollmentLog.TargetSite == target_site,
                EnrollmentLog.Status == LogStatus.PENDING,
            )
            .order_by(EnrollmentLog.Timestamp.desc())
            .first()
        )
        if log is None:
            return None

        log.Status = status
        log.Message = message
        db.commit()
        db.refresh(log)
        return log
