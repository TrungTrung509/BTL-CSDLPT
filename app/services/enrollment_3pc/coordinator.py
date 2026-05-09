from datetime import datetime, timedelta
from uuid import uuid4

from fastapi import HTTPException, status

from configs.db import SessionLocals, get_log_session
from enums.status import EnrollmentAction, EnrollmentTransactionState, LogStatus, BuocGiaoTac, TrangThaiGiaoTac
from sqlalchemy.exc import OperationalError, InternalError
from models.CourseSections import CourseSection
from models.Students import Student
from repositories.EnrollmentLogRepo import EnrollmentLogRepo
from repositories.EnrollmentTransactionRepo import EnrollmentTransactionRepo
from schemas.Enrollment import EnrollmentCreate, RegistrationResult

from services.utils import retry_on_deadlock, _log_step

from .context import Enrollment3PCContext
from .db import Enrollment3PCDB
from .domain import Enrollment3PCDomain


class Enrollment3PCCoordinator:
    RECOVERY_STALE_SECONDS = 30

    @staticmethod
    @retry_on_deadlock(max_retries=3)
    def register(user, enroll_in: EnrollmentCreate) -> RegistrationResult:
        Enrollment3PCDB.ensure_sites_alive(
            SessionLocals.keys(),
            detail="Khong the dang ky hoc phan khi mot co so dang offline",
        )

        sessions, connections = Enrollment3PCDB.open_pinned_sessions(SessionLocals.keys())
        acquired_locks: list[tuple[str, int]] = []
        ctx: Enrollment3PCContext | None = None

        try:
            site_new, _, section_new = Enrollment3PCDomain.find_section_context(sessions, enroll_in.MaLopHP)
            site_home = Enrollment3PCDB.normalize_site(user.MaCoSo)
            if site_home not in sessions:
                raise HTTPException(
                    status_code=status.HTTP_400_BAD_REQUEST,
                    detail=f"MaCoSo khong hop le: {site_home}",
                )

            existing_enrollment, site_old = Enrollment3PCDomain.find_existing_enrollment(
                sessions,
                user.userId,
                section_new.MaHP,
                section_new.MaHocKy,
            )
            if existing_enrollment and existing_enrollment.MaLopHP == section_new.MaLopHP:
                message = "Sinh vien da dang ky lop hoc phan nay"
                Enrollment3PCCoordinator._record_business_log(
                    site=site_home,
                    user_id=user.userId,
                    ma_lop_hp=section_new.MaLopHP,
                    ma_hp=section_new.MaHP,
                    action=EnrollmentAction.REGISTER,
                    target_site=site_new,
                    status=LogStatus.FAILED,
                    message=message,
                )
                return RegistrationResult(
                    MaLopHP=section_new.MaLopHP,
                    status="Failed",
                    message=message,
                    action=EnrollmentAction.REGISTER.value,
                )

            # Get MaSV from student table
            home_session = sessions.get(site_home)
            student = home_session.query(Student).filter(Student.userId == user.userId).first() if home_session else None
            ma_sv = student.MaSV if student else None

            ctx = Enrollment3PCCoordinator._build_register_context(
                user_id=user.userId,
                ma_sv=ma_sv,
                ghi_chu=enroll_in.GhiChu,
                site_home=site_home,
                site_new=site_new,
                site_old=site_old,
                section_new=section_new,
                existing_enrollment=existing_enrollment,
                lock_sites=list(sessions.keys()),
            )

            Enrollment3PCCoordinator._log_3pc_step(site_new, ctx.txn_id, ctx.target_ma_lop_hp, ma_sv, "BEGIN", "Bắt đầu giao dịch 3PC", "DANG_CHAY")

            Enrollment3PCDomain.snapshot_check_eligibility(ctx, sessions)
            Enrollment3PCCoordinator._log_3pc_step(site_new, ctx.txn_id, ctx.target_ma_lop_hp, ma_sv, "KIEM_TRA_LICH_HOC", "Xác thực lịch học không bị trùng", "DANG_CHAY")

            acquired_locks = Enrollment3PCDB.acquire_locks(ctx, sessions)
            Enrollment3PCCoordinator._log_3pc_step(site_new, ctx.txn_id, ctx.target_ma_lop_hp, ma_sv, "DA_KHOA", "Đã khóa bản ghi liên quan", "DANG_CHAY")

            EnrollmentTransactionRepo.create_or_reset_rows(ctx, sessions)
            Enrollment3PCDomain.prepare_register(ctx, sessions)
            Enrollment3PCCoordinator._log_3pc_step(site_new, ctx.txn_id, ctx.target_ma_lop_hp, ma_sv, "KIEM_TRA_SI_SO", "Xác thực điều kiện hợp lệ", "DANG_CHAY")
            EnrollmentTransactionRepo.set_state(
                ctx,
                sessions,
                EnrollmentTransactionState.PREPARED,
                "Tat ca participant da hoan tat prepare",
            )
            EnrollmentTransactionRepo.set_state(
                ctx,
                sessions,
                EnrollmentTransactionState.PRECOMMIT,
                "Coordinator da chuyen sang pha pre-commit",
            )
            Enrollment3PCCoordinator._log_3pc_step(site_new, ctx.txn_id, ctx.target_ma_lop_hp, ma_sv, "INSERT", "Bắt đầu ghi nhận dữ liệu vào CSDL", "DANG_CHAY")

            enrollment_id, failed_sites = Enrollment3PCCoordinator._commit_register(ctx, sessions)
            if failed_sites:
                Enrollment3PCCoordinator._record_business_log(
                    site=ctx.coordinator_site,
                    user_id=ctx.user_id,
                    ma_lop_hp=ctx.target_ma_lop_hp,
                    ma_hp=ctx.target_ma_hp,
                    action=ctx.action,
                    target_site=ctx.site_new,
                    status=LogStatus.PENDING,
                    message=(
                        "Giao dich da vao pha pre-commit, dang cho recovery tai: "
                        + ", ".join(failed_sites)
                    ),
                )
                return RegistrationResult(
                    MaLopHP=ctx.target_ma_lop_hp,
                    status="Success",
                    message=(
                        "Giao dich da vao pha pre-commit. He thong se tu dong recovery cho cac co so: "
                        + ", ".join(failed_sites)
                    ),
                    enrollment_id=enrollment_id,
                    action=ctx.action.value,
                    old_ma_lop_hp=ctx.old_ma_lop_hp,
                )
            EnrollmentTransactionRepo.set_state(
                ctx,
                sessions,
                EnrollmentTransactionState.COMMITTED,
                "Tat ca participant da commit thanh cong",
            )
            Enrollment3PCCoordinator._record_business_log(
                site=ctx.coordinator_site,
                user_id=ctx.user_id,
                ma_lop_hp=ctx.target_ma_lop_hp,
                ma_hp=ctx.target_ma_hp,
                action=ctx.action,
                target_site=ctx.site_new,
                status=LogStatus.SUCCESS,
                message="Doi lop thanh cong" if ctx.old_ma_lop_hp else "Dang ky thanh cong",
            )
            Enrollment3PCCoordinator._log_3pc_step(site_new, ctx.txn_id, ctx.target_ma_lop_hp, ma_sv, "COMMIT", "Đăng ký thành công", "THANH_CONG")

            return RegistrationResult(
                MaLopHP=ctx.target_ma_lop_hp,
                status="Success",
                message="Doi lop thanh cong" if ctx.old_ma_lop_hp else "Dang ky thanh cong",
                enrollment_id=enrollment_id,
                action=ctx.action.value,
                old_ma_lop_hp=ctx.old_ma_lop_hp,
            )
        except HTTPException as exc:
            if exc.status_code == status.HTTP_409_CONFLICT and "giao dich khac su dung" in exc.detail:
                raise
            if ctx is not None:
                EnrollmentTransactionRepo.mark_aborted(ctx, sessions, exc.detail)
                Enrollment3PCCoordinator._record_business_log(
                    site=ctx.coordinator_site,
                    user_id=ctx.user_id,
                    ma_lop_hp=ctx.target_ma_lop_hp,
                    ma_hp=ctx.target_ma_hp,
                    action=ctx.action,
                    target_site=ctx.site_new,
                    status=LogStatus.FAILED,
                    message=exc.detail,
                )
            return RegistrationResult(
                MaLopHP=enroll_in.MaLopHP.upper(),
                status="Failed",
                message=exc.detail,
            )
        except Exception as exc:
            if isinstance(exc, (OperationalError, InternalError)):
                err_msg = str(exc).lower()
                if "deadlock detected" in err_msg or "40p01" in err_msg:
                    raise
            if ctx is not None:
                EnrollmentTransactionRepo.mark_aborted(ctx, sessions, str(exc))
                Enrollment3PCCoordinator._record_business_log(
                    site=ctx.coordinator_site,
                    user_id=ctx.user_id,
                    ma_lop_hp=ctx.target_ma_lop_hp,
                    ma_hp=ctx.target_ma_hp,
                    action=ctx.action,
                    target_site=ctx.site_new,
                    status=LogStatus.FAILED,
                    message=str(exc),
                )
            return RegistrationResult(
                MaLopHP=enroll_in.MaLopHP.upper(),
                status="Failed",
                message=str(exc),
            )
        finally:
            Enrollment3PCDB.release_locks(sessions, acquired_locks)
            Enrollment3PCDB.close_pinned_sessions(sessions, connections)

    @staticmethod
    @retry_on_deadlock(max_retries=3)
    def cancel(user_id: str, ma_lop_hp: str, site_home: str) -> None:
        normalized_home = Enrollment3PCDB.normalize_site(site_home)
        alive_sites = [site for site in SessionLocals if Enrollment3PCDB.is_site_alive(site)]
        sessions, connections = Enrollment3PCDB.open_pinned_sessions(alive_sites)
        acquired_locks: list[tuple[str, int]] = []
        ctx: Enrollment3PCContext | None = None

        try:
            enrollment, site_target = Enrollment3PCDomain.find_enrollment_by_class(
                sessions,
                user_id,
                ma_lop_hp,
            )
            if enrollment is None or site_target is None:
                if len(alive_sites) != len(SessionLocals):
                    raise HTTPException(
                        status_code=status.HTTP_503_SERVICE_UNAVAILABLE,
                        detail="Khong the xac dinh day du trang thai dang ky khi mot co so dang offline",
                    )
                raise HTTPException(
                    status_code=status.HTTP_404_NOT_FOUND,
                    detail="Khong tim thay thong tin dang ky",
                )

            required_sites = {site_target, normalized_home}
            Enrollment3PCDB.ensure_sites_alive(
                required_sites,
                detail="Khong the huy dang ky khi co so lien quan dang offline",
            )

            target_section = sessions[site_target].query(CourseSection).filter(
                CourseSection.MaLopHP == enrollment.MaLopHP
            ).first()
            if target_section is None:
                raise HTTPException(
                    status_code=status.HTTP_404_NOT_FOUND,
                    detail=f"Khong tim thay lop hoc phan: {ma_lop_hp.upper()}",
                )

            ctx = Enrollment3PCContext(
                txn_id=Enrollment3PCCoordinator._new_txn_id(),
                coordinator_site=normalized_home,
                action=EnrollmentAction.CANCEL,
                user_id=user_id,
                site_home=normalized_home,
                site_new=site_target,
                site_old=None,
                target_ma_lop_hp=target_section.MaLopHP,
                target_ma_hp=target_section.MaHP,
                target_ma_hoc_ky=target_section.MaHocKy,
                old_ma_lop_hp=None,
                ghi_chu=None,
                lock_sites=sorted(required_sites),
            )

            acquired_locks = Enrollment3PCDB.acquire_locks(ctx, sessions)
            EnrollmentTransactionRepo.create_or_reset_rows(ctx, sessions)
            Enrollment3PCDomain.prepare_cancel(ctx, sessions)
            EnrollmentTransactionRepo.set_state(
                ctx,
                sessions,
                EnrollmentTransactionState.PREPARED,
                "Tat ca participant da hoan tat prepare",
            )
            EnrollmentTransactionRepo.set_state(
                ctx,
                sessions,
                EnrollmentTransactionState.PRECOMMIT,
                "Coordinator da chuyen sang pha pre-commit",
            )

            _, failed_sites = Enrollment3PCCoordinator._commit_cancel(ctx, sessions)
            if failed_sites:
                Enrollment3PCCoordinator._record_business_log(
                    site=ctx.coordinator_site,
                    user_id=ctx.user_id,
                    ma_lop_hp=ctx.target_ma_lop_hp,
                    ma_hp=ctx.target_ma_hp,
                    action=EnrollmentAction.CANCEL,
                    target_site=ctx.site_new,
                    status=LogStatus.PENDING,
                    message=(
                        "Giao dich da vao pha pre-commit, dang cho recovery tai: "
                        + ", ".join(failed_sites)
                    ),
                )
                return
            EnrollmentTransactionRepo.set_state(
                ctx,
                sessions,
                EnrollmentTransactionState.COMMITTED,
                "Tat ca participant da commit thanh cong",
            )
            Enrollment3PCCoordinator._record_business_log(
                site=ctx.coordinator_site,
                user_id=ctx.user_id,
                ma_lop_hp=ctx.target_ma_lop_hp,
                ma_hp=ctx.target_ma_hp,
                action=EnrollmentAction.CANCEL,
                target_site=ctx.site_new,
                status=LogStatus.SUCCESS,
                message="Huy dang ky thanh cong",
            )
        except Exception:
            if ctx is not None:
                EnrollmentTransactionRepo.mark_aborted(ctx, sessions, "Huy dang ky that bai")
                Enrollment3PCCoordinator._record_business_log(
                    site=ctx.coordinator_site,
                    user_id=ctx.user_id,
                    ma_lop_hp=ctx.target_ma_lop_hp,
                    ma_hp=ctx.target_ma_hp,
                    action=EnrollmentAction.CANCEL,
                    target_site=ctx.site_new,
                    status=LogStatus.FAILED,
                    message="Huy dang ky that bai",
                )
            raise
        finally:
            Enrollment3PCDB.release_locks(sessions, acquired_locks)
            Enrollment3PCDB.close_pinned_sessions(sessions, connections)

    @staticmethod
    def recover_in_doubt_transactions() -> dict[str, int]:
        cutoff = datetime.utcnow() - timedelta(seconds=Enrollment3PCCoordinator.RECOVERY_STALE_SECONDS)
        pending_commit, stale_abort = EnrollmentTransactionRepo.collect_recovery_candidates(cutoff)

        committed = 0
        aborted = 0
        for txn_id in sorted(pending_commit):
            if Enrollment3PCCoordinator._recover_precommit_transaction(txn_id):
                committed += 1

        for txn_id in sorted(stale_abort):
            if Enrollment3PCCoordinator._abort_transaction_records(txn_id, force=False):
                aborted += 1

        return {
            "recovered_commits": committed,
            "recovered_aborts": aborted,
        }

    @staticmethod
    def _commit_register(
        ctx: Enrollment3PCContext,
        sessions,
    ) -> tuple[int | None, list[str]]:
        enrollment_id: int | None = None
        failed_sites: list[str] = []

        for site in ctx.participant_sites:
            try:
                current_id = Enrollment3PCDomain.commit_site(ctx, sessions[site])
                if site == ctx.site_new and current_id is not None:
                    enrollment_id = current_id
            except Exception:
                sessions[site].rollback()
                failed_sites.append(site)

        return enrollment_id, failed_sites

    @staticmethod
    def _commit_cancel(
        ctx: Enrollment3PCContext,
        sessions,
    ) -> tuple[None, list[str]]:
        failed_sites: list[str] = []
        for site in ctx.participant_sites:
            try:
                Enrollment3PCDomain.commit_site(ctx, sessions[site])
            except Exception:
                sessions[site].rollback()
                failed_sites.append(site)
        return None, failed_sites

    @staticmethod
    def _recover_precommit_transaction(txn_id: str) -> bool:
        ctx = EnrollmentTransactionRepo.load_context(txn_id)
        if ctx is None:
            return False

        if EnrollmentTransactionRepo.has_state(txn_id, EnrollmentTransactionState.ABORTED):
            return Enrollment3PCCoordinator._abort_transaction_records(txn_id, force=True)
        if not all(Enrollment3PCDB.is_site_alive(site) for site in ctx.participant_sites):
            return False

        sessions, connections = Enrollment3PCDB.open_pinned_sessions(ctx.lock_sites)
        acquired_locks: list[tuple[str, int]] = []
        try:
            acquired_locks = Enrollment3PCDB.acquire_locks(ctx, sessions)
            for site in ctx.participant_sites:
                try:
                    Enrollment3PCDomain.commit_site(ctx, sessions[site])
                except Exception:
                    sessions[site].rollback()
                    return False
            EnrollmentTransactionRepo.set_state(
                ctx,
                sessions,
                EnrollmentTransactionState.COMMITTED,
                "Recovery da hoan tat commit cho tat ca participant",
            )
            Enrollment3PCCoordinator._record_business_log(
                site=ctx.coordinator_site,
                user_id=ctx.user_id,
                ma_lop_hp=ctx.target_ma_lop_hp,
                ma_hp=ctx.target_ma_hp,
                action=ctx.action,
                target_site=ctx.site_new,
                status=LogStatus.SUCCESS,
                message="Recovery da hoan tat giao dich dang ky hoc phan",
            )
            return True
        finally:
            Enrollment3PCDB.release_locks(sessions, acquired_locks)
            Enrollment3PCDB.close_pinned_sessions(sessions, connections)

    @staticmethod
    def _abort_transaction_records(txn_id: str, force: bool) -> bool:
        ctx = EnrollmentTransactionRepo.load_context(txn_id)
        if ctx is None:
            return False

        sessions, connections = Enrollment3PCDB.open_pinned_sessions(
            [site for site in ctx.transaction_sites if Enrollment3PCDB.is_site_alive(site)]
        )
        try:
            for site in ctx.transaction_sites:
                session = sessions.get(site)
                if session is None:
                    continue

                row = EnrollmentTransactionRepo.get_by_txn_and_site(session, ctx.txn_id, site)
                if row is None:
                    continue
                if row.State == EnrollmentTransactionState.PRECOMMIT and not force:
                    return False
                if row.State == EnrollmentTransactionState.COMMITTED:
                    continue

                row.State = EnrollmentTransactionState.ABORTED
                row.Message = "Recovery da abort giao dich do bi tre o pha prepare"
                session.commit()
            Enrollment3PCCoordinator._record_business_log(
                site=ctx.coordinator_site,
                user_id=ctx.user_id,
                ma_lop_hp=ctx.target_ma_lop_hp,
                ma_hp=ctx.target_ma_hp,
                action=ctx.action,
                target_site=ctx.site_new,
                status=LogStatus.FAILED,
                message="Recovery da abort giao dich dang ky hoc phan",
            )
            return True
        finally:
            Enrollment3PCDB.close_pinned_sessions(sessions, connections)

    @staticmethod
    def _build_register_context(
        *,
        user_id: str,
        ma_sv: str | None,
        ghi_chu: str | None,
        site_home: str,
        site_new: str,
        site_old: str | None,
        section_new,
        existing_enrollment,
        lock_sites: list[str],
    ) -> Enrollment3PCContext:
        return Enrollment3PCContext(
            txn_id=Enrollment3PCCoordinator._new_txn_id(),
            coordinator_site=site_home,
            action=EnrollmentAction.SWITCH if existing_enrollment else EnrollmentAction.REGISTER,
            user_id=user_id,
            ma_sv=ma_sv,
            site_home=site_home,
            site_new=site_new,
            site_old=site_old,
            target_ma_lop_hp=section_new.MaLopHP,
            target_ma_hp=section_new.MaHP,
            target_ma_hoc_ky=section_new.MaHocKy,
            old_ma_lop_hp=existing_enrollment.MaLopHP if existing_enrollment else None,
            ghi_chu=ghi_chu,
            lock_sites=sorted(lock_sites),
        )

    @staticmethod
    def _new_txn_id() -> str:
        return uuid4().hex

    @staticmethod
    def _record_business_log(
        *,
        site: str,
        user_id: str,
        ma_lop_hp: str,
        ma_hp: str,
        action: EnrollmentAction,
        target_site: str,
        status: LogStatus,
        message: str | None,
    ) -> None:
        normalized_site = Enrollment3PCDB.normalize_site(site)
        if normalized_site not in SessionLocals:
            return

        session = SessionLocals[normalized_site]()
        try:
            if status != LogStatus.PENDING:
                resolved = EnrollmentLogRepo.resolve_latest_pending(
                    session,
                    user_id=user_id,
                    ma_lop_hp=ma_lop_hp,
                    ma_hp=ma_hp,
                    action=action,
                    target_site=target_site,
                    status=status,
                    message=message,
                )
                if resolved is not None:
                    return

            EnrollmentLogRepo.append(
                session,
                user_id=user_id,
                ma_lop_hp=ma_lop_hp,
                ma_hp=ma_hp,
                action=action,
                target_site=target_site,
                status=status,
                message=message,
            )
        except Exception:
            session.rollback()
        finally:
            session.close()

    @staticmethod
    def _log_3pc_step(site: str, tx_id: str, ma_lop_hp: str, ma_sv: str | None, buoc: str, chi_tiet: str, trang_thai: str):
        try:
            with get_log_session(site) as log_db:
                _log_step(log_db, tx_id, ma_lop_hp, str(ma_sv), getattr(BuocGiaoTac, buoc), chi_tiet, getattr(TrangThaiGiaoTac, trang_thai))
        except Exception as e:
            print(f"Log 3PC error: {e}")
