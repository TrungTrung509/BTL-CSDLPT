from datetime import datetime, timedelta
from uuid import uuid4

from fastapi import HTTPException, status

from configs.db import SessionLocals, get_log_session
from enums.status import EnrollmentAction, EnrollmentTransactionState, LogStatus, BuocGiaoTac, TrangThaiGiaoTac, RecoveryAction
from sqlalchemy.exc import OperationalError, InternalError
from models.CourseSections import CourseSection
from repositories.RecoveryLogRepo import RecoveryLogRepo
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
            ma_sv = user.userId

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

            Enrollment3PCCoordinator._log_3pc_step(site_new, ctx.txn_id, ctx.target_ma_lop_hp, ma_sv, "KIEM_TRA_SO_BO", "Đang xác thực điều kiện đăng ký sơ bộ", "DANG_CHAY")
            Enrollment3PCDomain.snapshot_check_eligibility(ctx, sessions)

            Enrollment3PCCoordinator._log_3pc_step(site_new, ctx.txn_id, ctx.target_ma_lop_hp, ma_sv, "KHOA_PHAN_TAN", "Đang lấy Advisory Lock phân tán trên tất cả site", "DANG_CHAY")
            acquired_locks = Enrollment3PCDB.acquire_locks(ctx, sessions)

            EnrollmentTransactionRepo.create_or_reset_rows(ctx, sessions)

            Enrollment3PCCoordinator._log_3pc_step(site_new, ctx.txn_id, ctx.target_ma_lop_hp, ma_sv, "KHOA_LOP_HP_DB", "Đang thực hiện Row Lock các lớp học phần", "DANG_CHAY")
            locked_section = Enrollment3PCDomain.prepare_lock_rows(ctx, sessions)

            Enrollment3PCCoordinator._log_3pc_step(site_new, ctx.txn_id, ctx.target_ma_lop_hp, ma_sv, "KIEM_TRA_SI_SO_CUOI", "Đang xác thực sĩ số và trạng thái cuối cùng", "DANG_CHAY")
            Enrollment3PCDomain.prepare_validate(locked_section)
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
            Enrollment3PCCoordinator._log_3pc_step(site_new, ctx.txn_id, ctx.target_ma_lop_hp, ma_sv, "INSERT", "Bắt đầu ghi vào CSDL", "DANG_CHAY")

            enrollment_id, failed_sites = Enrollment3PCCoordinator._commit_register(ctx, sessions)
            if failed_sites:
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
            
            try:
                target_sec = sessions[ctx.site_new].query(CourseSection).filter(CourseSection.MaLopHP == ctx.target_ma_lop_hp).first()
                new_sz = target_sec.SiSoHienTai if target_sec else 1
                old_sz = new_sz - 1
                log_detail = f"{ctx.target_ma_lop_hp} ({old_sz} -> {new_sz})."
                
                if ctx.old_ma_lop_hp and ctx.site_old:
                    old_sec = sessions[ctx.site_old].query(CourseSection).filter(CourseSection.MaLopHP == ctx.old_ma_lop_hp).first()
                    if old_sec:
                        old_new_sz = old_sec.SiSoHienTai
                        old_old_sz = old_new_sz + 1
                        log_detail = f" {ctx.target_ma_lop_hp} ({old_sz} -> {new_sz}), {ctx.old_ma_lop_hp} ({old_old_sz} -> {old_new_sz})."
            except Exception:
                log_detail = "Đăng ký/Đổi lớp thành công."
                
            Enrollment3PCCoordinator._log_3pc_step(site_new, ctx.txn_id, ctx.target_ma_lop_hp, ma_sv, "COMMIT", log_detail, "THANH_CONG")

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

            Enrollment3PCCoordinator._log_3pc_step(ctx.site_new, ctx.txn_id, ctx.target_ma_lop_hp, user_id, "BEGIN", "Bắt đầu giao dịch hủy đăng ký", "DANG_CHAY")

            Enrollment3PCCoordinator._log_3pc_step(ctx.site_new, ctx.txn_id, ctx.target_ma_lop_hp, user_id, "KHOA_PHAN_TAN", "Đang lấy Advisory Lock phân tán để hủy đăng ký", "DANG_CHAY")
            acquired_locks = Enrollment3PCDB.acquire_locks(ctx, sessions)

            EnrollmentTransactionRepo.create_or_reset_rows(ctx, sessions)

            Enrollment3PCCoordinator._log_3pc_step(ctx.site_new, ctx.txn_id, ctx.target_ma_lop_hp, user_id, "KHOA_LOP_HP_DB", "Đang thực hiện Row Lock bản ghi để hủy", "DANG_CHAY")
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

            Enrollment3PCCoordinator._log_3pc_step(ctx.site_new, ctx.txn_id, ctx.target_ma_lop_hp, user_id, "INSERT", "Bắt đầu xóa dữ liệu khỏi CSDL", "DANG_CHAY")
            _, failed_sites = Enrollment3PCCoordinator._commit_cancel(ctx, sessions)
            if failed_sites:
                return

            EnrollmentTransactionRepo.set_state(
                ctx,
                sessions,
                EnrollmentTransactionState.COMMITTED,
                "Tat ca participant da commit thanh cong",
            )
            
            try:
                target_sec = sessions[ctx.site_new].query(CourseSection).filter(CourseSection.MaLopHP == ctx.target_ma_lop_hp).first()
                new_sz = target_sec.SiSoHienTai if target_sec else 0
                old_sz = new_sz + 1
                log_detail = f"Hủy thành công.  {ctx.target_ma_lop_hp} ({old_sz} -> {new_sz})."
            except Exception:
                log_detail = "Hủy đăng ký thành công."
                
            Enrollment3PCCoordinator._log_3pc_step(ctx.site_new, ctx.txn_id, ctx.target_ma_lop_hp, user_id, "COMMIT", log_detail, "THANH_CONG")

        except Exception:
            if ctx is not None:
                EnrollmentTransactionRepo.mark_aborted(ctx, sessions, "Huy dang ky that bai")

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
                current_id = Enrollment3PCDomain.commit_site(ctx, sessions[site], site)
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
                Enrollment3PCDomain.commit_site(ctx, sessions[site], site)
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
            
            # Ghi log recovery vào bảng NhatKyPhucHoi
            with SessionLocals[ctx.coordinator_site]() as db:
                RecoveryLogRepo.append_recovery_log(
                    db,
                    txn_id=ctx.txn_id,
                    user_id=ctx.user_id,
                    ma_lop_hp=ctx.target_ma_lop_hp,
                    action=RecoveryAction.FORCED_COMMIT,
                    ma_co_so=ctx.coordinator_site,
                    status=LogStatus.SUCCESS,
                    message="Recovery thành công: Ép Commit giao dịch In-doubt (Pre-commit)"
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

            # Ghi log recovery vào bảng NhatKyPhucHoi
            with SessionLocals[ctx.coordinator_site]() as db:
                RecoveryLogRepo.append_recovery_log(
                    db,
                    txn_id=ctx.txn_id,
                    user_id=ctx.user_id,
                    ma_lop_hp=ctx.target_ma_lop_hp,
                    action=RecoveryAction.FORCED_ABORT,
                    ma_co_so=ctx.coordinator_site,
                    status=LogStatus.SUCCESS,
                    message="Recovery thành công: Hủy bỏ giao dịch treo (Timeout/Stale)"
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
    def _log_3pc_step(site: str, tx_id: str, ma_lop_hp: str, ma_sv: str | None, buoc: str, chi_tiet: str, trang_thai: str):
        try:
            with get_log_session(site) as log_db:
                _log_step(log_db, tx_id, ma_lop_hp, str(ma_sv), getattr(BuocGiaoTac, buoc), chi_tiet, getattr(TrangThaiGiaoTac, trang_thai), ma_co_so=site)
        except Exception:
            pass
