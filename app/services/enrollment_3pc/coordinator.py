from datetime import datetime, timedelta
from uuid import uuid4
from sqlalchemy import text

from fastapi import HTTPException, status

from configs.db import SessionLocals, engines
from enums.status import EnrollmentAction, EnrollmentTransactionState, LogStatus, BuocGiaoTac, TrangThaiGiaoTac, RecoveryAction
from sqlalchemy.exc import OperationalError, InternalError
from models.CourseSections import CourseSection
from repositories.RecoveryLogRepo import RecoveryLogRepo
from repositories.EnrollmentTransactionRepo import EnrollmentTransactionRepo

from schemas.Enrollment import EnrollmentCreate, RegistrationResult
from services.utils import retry_on_deadlock

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
            detail="Không thể đăng ký học phần khi một cơ sở đang offline",
        )

        sessions, connections = Enrollment3PCDB.open_pinned_sessions(SessionLocals.keys())
        acquired_locks: list[tuple[str, int]] = []
        ctx: Enrollment3PCContext | None = None

        ma_sv = enroll_in.MaSV if hasattr(enroll_in, 'MaSV') else user.userId
        txn_id = Enrollment3PCCoordinator._new_txn_id()
        site_new = "HADONG" # Default site để ghi log nếu chưa tìm thấy site thực tế
        
        try:
            site_new, _, section_new = Enrollment3PCDomain.find_section_context(sessions, enroll_in.MaLopHP)
            site_home = Enrollment3PCDB.normalize_site(user.MaCoSo)
            if site_home not in sessions:
                raise HTTPException(
                    status_code=status.HTTP_400_BAD_REQUEST,
                    detail=f"Mã cơ sở không hợp lệ: {site_home}",
                )

            existing_enrollment, site_old = Enrollment3PCDomain.find_existing_enrollment(
                sessions,
                user.userId,
                section_new.MaHP,
                section_new.MaHocKy,
            )

            ctx = Enrollment3PCCoordinator._build_register_context(
                txn_id=txn_id,
                user_id=user.userId,
                ma_sv=ma_sv,
                ghi_chu=None,
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
                "Tất cả participant đã hoàn tất prepare",
            )
            EnrollmentTransactionRepo.set_state(
                ctx,
                sessions,
                EnrollmentTransactionState.PRECOMMIT,
                "Coordinator đã chuyển sang pha pre-commit",
            )
            Enrollment3PCCoordinator._log_3pc_step(site_new, ctx.txn_id, ctx.target_ma_lop_hp, ma_sv, "INSERT", "Bắt đầu ghi vào CSDL", "DANG_CHAY")

            enrollment_id, failed_sites = Enrollment3PCCoordinator._commit_register(ctx, sessions)
            if failed_sites:
                return RegistrationResult(
                    MaLopHP=ctx.target_ma_lop_hp,
                    status="Success",
                    message=(
                        "Giao dịch đã vào pha pre-commit. Hệ thống sẽ tự động recovery cho các cơ sở: "
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
                "Tất cả participant đã commit thành công",
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
                message="Đổi lớp thành công" if ctx.old_ma_lop_hp else "Đăng ký thành công",
                enrollment_id=enrollment_id,
                action=ctx.action.value,
                old_ma_lop_hp=ctx.old_ma_lop_hp,
            )
        except HTTPException as exc:
            should_retry = exc.status_code == status.HTTP_409_CONFLICT and (
                "giao dich khac su dung" in exc.detail
                or "bị chiếm" in exc.detail
            )

            # Luôn cập nhật bước đang chạy sang THAT_BAI trước
            Enrollment3PCCoordinator._fail_current_3pc_step(site_new, txn_id, exc.detail)

            if should_retry:
                # Không mark_aborted vì sẽ retry bằng txn_id mới
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
            
            # Cập nhật bước hiện tại sang THAT_BAI
            Enrollment3PCCoordinator._fail_current_3pc_step(site_new, txn_id, str(exc))

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
                        detail="Không thể xác định đầy đủ trạng thái đăng ký khi một cơ sở đang offline",
                    )
                raise HTTPException(
                    status_code=status.HTTP_404_NOT_FOUND,
                    detail="Không tìm thấy thông tin đăng ký",
                )

            required_sites = {site_target, normalized_home}
            Enrollment3PCDB.ensure_sites_alive(
                required_sites,
                detail="Không thể hủy đăng ký khi cơ sở liên quan đang offline",
            )

            target_section = sessions[site_target].query(CourseSection).filter(
                CourseSection.MaLopHP == enrollment.MaLopHP
            ).first()
            if target_section is None:
                raise HTTPException(
                    status_code=status.HTTP_404_NOT_FOUND,
                    detail=f"Không tìm thấy lớp học phần: {ma_lop_hp.upper()}",
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
                "Tất cả participant đã hoàn tất prepare",
            )
            EnrollmentTransactionRepo.set_state(
                ctx,
                sessions,
                EnrollmentTransactionState.PRECOMMIT,
                "Coordinator đã chuyển sang pha pre-commit",
            )

            Enrollment3PCCoordinator._log_3pc_step(ctx.site_new, ctx.txn_id, ctx.target_ma_lop_hp, user_id, "INSERT", "Bắt đầu xóa dữ liệu khỏi CSDL", "DANG_CHAY")
            _, failed_sites = Enrollment3PCCoordinator._commit_cancel(ctx, sessions)
            if failed_sites:
                return

            EnrollmentTransactionRepo.set_state(
                ctx,
                sessions,
                EnrollmentTransactionState.COMMITTED,
                "Tất cả participant đã commit thành công",
            )
            
            try:
                target_sec = sessions[ctx.site_new].query(CourseSection).filter(CourseSection.MaLopHP == ctx.target_ma_lop_hp).first()
                new_sz = target_sec.SiSoHienTai if target_sec else 0
                old_sz = new_sz + 1
                log_detail = f"Hủy thành công. {ctx.target_ma_lop_hp} ({old_sz} -> {new_sz})."
            except Exception:
                log_detail = "Hủy đăng ký thành công."
                
            Enrollment3PCCoordinator._log_3pc_step(ctx.site_new, ctx.txn_id, ctx.target_ma_lop_hp, user_id, "COMMIT", log_detail, "THANH_CONG")

        except Exception as exc:
            if ctx is not None:
                EnrollmentTransactionRepo.mark_aborted(ctx, sessions, "Hủy đăng ký thất bại")
                # Cập nhật bước hiện tại sang THAT_BAI
                Enrollment3PCCoordinator._fail_current_3pc_step(ctx.site_new, ctx.txn_id, str(exc))

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
                "Recovery đã hoàn tất commit cho tất cả participant",
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
                row.Message = "Recovery đã abort giao dịch do bị trễ ở pha prepare"
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
        txn_id: str,
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
            txn_id=txn_id,
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
        """
        Ghi log vào bảng NhatKyThaoTac sử dụng kết nối trực tiếp (Direct Execution)
        để đảm bảo AUTOCOMMIT và không bị ảnh hưởng bởi lỗi của Session chính.
        """
        try:
            engine = engines.get(site.upper())
            if not engine:
                print(f"CRITICAL: Engine not found for site {site}")
                return

            # Sử dụng kết nối trực tiếp với isolation_level AUTOCOMMIT
            with engine.connect().execution_options(isolation_level="AUTOCOMMIT") as conn:
                query = text("""
                    INSERT INTO "NhatKyThaoTac" 
                    ("MaGiaoTac", "MaLopHP", "MaSV", "MaCoSo", "Buoc", "ChiTiet", "TrangThai", "ThoiGian")
                    VALUES (:txn, :ma_lop, :ma_sv, :site, :buoc, :detail, :status, :now)
                """)
                conn.execute(query, {
                    "txn": tx_id,
                    "ma_lop": ma_lop_hp,
                    "ma_sv": str(ma_sv),
                    "site": site,
                    "buoc": buoc,
                    "detail": chi_tiet,
                    "status": trang_thai,
                    "now": datetime.utcnow()
                })
                
        except Exception as e:
            print(f"CRITICAL: Failed to write log to {site} via Direct Connection: {e}")
            pass

    @staticmethod
    def _fail_current_3pc_step(site: str, txn_id: str, error_detail: str) -> None:
        """
        Cập nhật bước đang chạy gần nhất (MAX ID) của txn_id sang THAT_BAI.
        Thay vì insert thêm một dòng 'FAILED', ta UPDATE trực tiếp bước
        đang DANG_CHAY để log rõ ràng bước nào bị lỗi.
        """
        try:
            engine = engines.get(site.upper())
            if not engine:
                return

            with engine.connect().execution_options(isolation_level="AUTOCOMMIT") as conn:
                conn.execute(
                    text("""
                        UPDATE "NhatKyThaoTac"
                        SET "TrangThai" = 'THAT_BAI',
                            "ChiTiet"   = :detail
                        WHERE "ID" = (
                            SELECT MAX("ID") FROM "NhatKyThaoTac"
                            WHERE "MaGiaoTac" = :txn_id
                        )
                    """),
                    {"txn_id": txn_id, "detail": error_detail},
                )
        except Exception as e:
            print(f"CRITICAL: Failed to update log step to THAT_BAI at {site}: {e}")
