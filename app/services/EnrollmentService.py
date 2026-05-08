from datetime import datetime, timezone
from typing import List, Optional
from fastapi import HTTPException
from sqlalchemy.orm import Session
from sqlalchemy.exc import InternalError, OperationalError
from functools import wraps
import time
import random

from models.Enrollments import Enrollment
from models.CourseSections import CourseSection
from models.Users import User
from models.Courses import Course
from models.NhatKyThaoTac import NhatKyThaoTac

from enums.status import (
    EnrollmentStatus, ClassSectionStatus,
    BuocGiaoTac, TrangThaiGiaoTac,
)
from repositories.EnrollmentRepo import EnrollmentRepo
from repositories.ClassSectionRepo import ClassSectionRepo
from configs.db import open_db_by_branch, get_log_session
from schemas.Enrollment import (
    EligibilityResponse,
    EnrollmentCreate,
    EnrollmentHistoryResponse,
    RegistrationResult,
    EnrollmentHistoryResponse,
)


# DECORATOR - RETRY DEADLOCK
def retry_on_deadlock(max_retries=3, initial_wait=0.1):
    """Tự động thử lại khi gặp Deadlock và ghi log kể chuyện (Stop/Retry) vào DB."""
    def decorator(func):
        @wraps(func)
        def wrapper(*args, **kwargs):
            retries = 0
            # Trích xuất thông tin định danh để ghi log (best-effort)
            ma_sv = kwargs.get("ma_sv") or (args[0] if len(args) > 0 and isinstance(args[0], str) else "UNKNOWN")
            ma_lop = kwargs.get("ma_lop_hp") or (args[2] if len(args) > 2 else "UNKNOWN")
            tx_id = kwargs.get("tx_id") or f"RETRY-LOG-{int(time.time())}"

            while retries < max_retries:
                try:
                    return func(*args, **kwargs)
                except (InternalError, OperationalError) as e:
                    err_msg = str(e).lower()
                    if ("deadlock detected" in err_msg or "40p01" in err_msg) and retries < max_retries - 1:
                        retries += 1
                        wait_time = initial_wait * (2 ** retries) + random.uniform(0, 0.1)
                        
                        # Ghi log kể chuyện vào DB
                        try:
                            from configs.db import get_log_session
                            with get_log_session(_site_of(str(ma_lop))) as log_db:
                                # Bước 1: Thông báo DỪNG
                                _log_step(log_db, tx_id, str(ma_lop), str(ma_sv), BuocGiaoTac.ROLLBACK, 
                                         f"STOP: Phát hiện Deadlock. Đang hủy giao dịch hiện tại để giải phóng tài nguyên.", 
                                         TrangThaiGiaoTac.THAT_BAI)
                                
                                # Bước 2: Thông báo THỬ LẠI
                                _log_step(log_db, tx_id, str(ma_lop), str(ma_sv), BuocGiaoTac.RETRY, 
                                         f"RETRY: Bắt đầu thực hiện lại lần {retries+1} sau {wait_time:.2f}s nghỉ.", 
                                         TrangThaiGiaoTac.DANG_CHAY)
                        except: pass

                        print(f"⚠️ [RETRY] Deadlock, thử lại lần {retries} sau {wait_time:.2f}s")
                        time.sleep(wait_time)
                        continue
                    raise
            return func(*args, **kwargs)
        return wrapper
    return decorator


# HELPER FUNCTIONS
def _site_of(ma_lop_hp: str) -> str:
    """Giải mã tên site từ MaLopHP. Ví dụ: 'HADONG_CS001' → 'HADONG'."""
    if not ma_lop_hp or "_" not in ma_lop_hp:
        return "UNKNOWN"
    return ma_lop_hp.split("_")[0].upper()


def _log_step(log_db: Session, tx_id: str, ma_lop_hp: str, ma_sv: str,
              buoc: BuocGiaoTac, chi_tiet: Optional[str] = None,
              trang_thai: TrangThaiGiaoTac = TrangThaiGiaoTac.DANG_CHAY) -> None:
    """Ghi một bước vào NhatKyThaoTac (session autocommit, không ảnh hưởng đến TX chính)."""
    try:
        log_db.add(NhatKyThaoTac(
            MaGiaoTac=tx_id,
            MaLopHP=ma_lop_hp,
            MaSV=ma_sv,
            Buoc=buoc,
            ChiTiet=chi_tiet,
            ThoiGian=datetime.now(timezone.utc),
            TrangThai=trang_thai,
        ))
        log_db.commit()
    except Exception as e:
        print(f"⚠️ _log_step fail [{buoc}]: {e}")


# ENROLLMENT SERVICE
class EnrollmentService:

    # 1. KIỂM TRA ĐIỀU KIỆN (SNAPSHOT)
    @staticmethod
    def check_eligibility(
        user_id: str,
        section: CourseSection,
        session_home: Session,
        exclude_lop: Optional[str] = None,
    ) -> EligibilityResponse:
        """
        Kiểm tra nhanh các điều kiện (không lock).
        exclude_lop: nếu đang đổi lớp thì bỏ qua lớp cũ để tránh báo trùng.
        """
        reasons: List[str] = []

        # 1. Trùng môn
        already = EnrollmentRepo.is_already_enrolled(
            session_home, user_id, section.MaHP, section.MaHocKy,
            exclude_ma_lop_hp=exclude_lop
        )
        if already and not exclude_lop:
            reasons.append(f"Sinh viên đã đăng ký học phần {section.MaHP} trong học kỳ này")

        # 2. Trùng lịch
        reasons.extend(
            EnrollmentService._check_schedule_conflict(
                session_home, user_id, section, exclude_lop
            )
        )

        # 3. Sĩ số (snapshot)
        if section.SiSoHienTai >= section.SiSoToiDa:
            reasons.append("Lớp đã đầy sĩ số")

        # 4. Trạng thái lớp
        if section.TrangThaiLop != ClassSectionStatus.Mo:
            reasons.append("Lớp không mở đăng ký")

        return EligibilityResponse(is_eligible=len(reasons) == 0, reasons=reasons)

    # 2. ĐĂNG KÝ HỌC PHẦN
    @staticmethod
    @retry_on_deadlock(max_retries=3)
    def register(user: User, enroll_in: EnrollmentCreate, **kwargs) -> RegistrationResult:
        """
        Đăng ký học phần hoặc đổi lớp (nếu đã có lớp cùng môn cùng kỳ).
        Ghi nhật ký từng bước qua log session độc lập.
        """
        ma_lop_hp = enroll_in.MaLopHP
        site_section = _site_of(ma_lop_hp)
        site_home = user.MaCoSo
        ma_sv = getattr(user, "MaSV", user.userId)
        tx_id = f"REG-{user.userId}-{int(time.time() * 1000)}"

        try:
            with open_db_by_branch(site_section) as db_section, \
                 open_db_by_branch(site_home) as db_home:

                # Phase 0: tải thông tin lớp, phát hiện đổi lớp
                section = ClassSectionRepo.get_by_id(db_section, ma_lop_hp)
                if not section:
                    raise HTTPException(404, f"Lớp học phần '{ma_lop_hp}' không tồn tại")

                old_en = EnrollmentRepo.find_active_enrollment(
                    db_home, user.userId, section.MaHP, section.MaHocKy
                )
                exclude_lop = old_en.MaLopHP if old_en else None
                action = "SWITCH" if old_en else "REGISTER"

                # Phase 1: Kiểm tra nhanh (snapshot)
                eligibility = EnrollmentService.check_eligibility(
                    user.userId, section, db_home, exclude_lop=exclude_lop
                )
                if not eligibility.is_eligible:
                    return RegistrationResult(
                        MaLopHP=ma_lop_hp,
                        status="Failed",
                        message="; ".join(eligibility.reasons),
                        action=action.value,
                    )

                # Phase 2: Transaction có khóa tại site lớp
                log_db = get_log_session(site_section)
                try:
                    enrollment_id = EnrollmentService._execute_registration(
                        db_section, db_home, log_db, tx_id, user.userId, ma_sv,
                        ma_lop_hp, section, exclude_lop, action, enroll_in.GhiChu
                    )
                finally:
                    log_db.close()

                # Phase 3: Đồng bộ về site sinh viên (best-effort)
                if site_section != site_home:
                    EnrollmentService._sync_to_home(
                        db_home, user.userId, ma_sv, ma_lop_hp,
                        section.MaHP, section.MaHocKy, exclude_lop, enroll_in.GhiChu
                    )

                # Phase 4: Dọn dẹp lớp cũ (nếu ở site khác)
                if exclude_lop and _site_of(exclude_lop) != site_section:
                    EnrollmentService._lazy_cleanup(
                        site=_site_of(exclude_lop),
                        user_id=user.userId,
                        ma_lop_hp=exclude_lop,
                    )

                # Phase 2: Thực thi giao dịch
                log_db = get_log_session(site_section)
                try:
                    enrollment_id = EnrollmentService._execute_registration(
                        db_section, db_home, log_db, tx_id, user.userId, ma_sv,
                        ma_lop_hp, section, exclude_lop, action, enroll_in.GhiChu
                    )
                finally:
                    log_db.close()

                # Phase 3: Đồng bộ về site sinh viên (Best-effort)
                EnrollmentService._sync_to_home(user.MaCoSo, user.userId, ma_sv, ma_lop_hp, section, enroll_in.GhiChu)

                db_home.commit()

                return RegistrationResult(
                    MaLopHP=ma_lop_hp,
                    status="Success",
                    message="Đăng ký thành công" if action == "REGISTER" else "Đổi lớp thành công",
                    enrollment_id=enrollment_id,
                    action=action,
                    old_ma_lop_hp=exclude_lop,
                )

        except HTTPException as he:
            return RegistrationResult(
                MaLopHP=ma_lop_hp, status="Failed", message=he.detail
            )
        except Exception as exc:
            return RegistrationResult(
                MaLopHP=ma_lop_hp, status="Failed", message=str(exc)
            )

    # 3. THỰC THI TRANSACTION (LOCK + INSERT)
    @staticmethod
    def _execute_registration(
        db_section: Session, db_home: Session, log_db: Session, tx_id: str,
        user_id: str, ma_sv: str, ma_lop_hp: str,
        section: CourseSection, exclude_lop: Optional[str],
        action: str, ghi_chu: Optional[str]
    ) -> int:
        """Transaction chính tại site của lớp học phần."""
        # Xác định các lớp cần lock (cùng site)
        targets = [ma_lop_hp]
        if exclude_lop and _site_of(exclude_lop) == _site_of(ma_lop_hp):
            targets.append(exclude_lop)

        try:
            _log_step(log_db, tx_id, ma_lop_hp, ma_sv, BuocGiaoTac.BEGIN, f"Bắt đầu {action}")

            # 1. Kiểm tra lịch học (trước khi khóa để tránh giữ lock lâu)
            conflicts = EnrollmentService._check_schedule_conflict(db_home, user_id, section, exclude_lop)
            if conflicts:
                _log_step(log_db, tx_id, ma_lop_hp, ma_sv, BuocGiaoTac.KIEM_TRA_LICH_HOC,
                          f"Xung đột: {'; '.join(conflicts)}", TrangThaiGiaoTac.THAT_BAI)
                raise Exception(f"Trùng lịch học: {conflicts[0]}")
            
            _log_step(log_db, tx_id, ma_lop_hp, ma_sv, BuocGiaoTac.KIEM_TRA_LICH_HOC, "Lịch học hợp lệ")

            # 2. Khóa các lớp theo thứ tự nhất định (tránh deadlock)
            locked = {}
            for cid in sorted(targets):
                # Gọi phương thức Raw SQL trong Repo để thực hiện Lock
                sec = ClassSectionRepo.get_by_id_for_update(db_section, cid)
                if not sec:
                    raise Exception(f"Lớp {cid} không tồn tại")
                locked[cid] = sec
            _log_step(log_db, tx_id, ma_lop_hp, ma_sv, BuocGiaoTac.DA_KHOA, f"Đã khóa {', '.join(targets)}")

            # 3. Kiểm tra sĩ số lớp mới
            new_sec = locked[ma_lop_hp]
            if new_sec.SiSoHienTai >= new_sec.SiSoToiDa:
                _log_step(log_db, tx_id, ma_lop_hp, ma_sv, BuocGiaoTac.KIEM_TRA_SI_SO,
                          f"count={new_sec.SiSoHienTai}/{new_sec.SiSoToiDa} → FULL", TrangThaiGiaoTac.THAT_BAI)
                raise Exception("Lớp đã đầy sĩ số")
            
            _log_step(log_db, tx_id, ma_lop_hp, ma_sv, BuocGiaoTac.KIEM_TRA_SI_SO,
                      f"count={new_sec.SiSoHienTai}/{new_sec.SiSoToiDa} → OK")

            # 4. Xử lý đổi lớp nếu có lớp cũ cùng site
            if exclude_lop and exclude_lop in locked:
                old_sec = locked[exclude_lop]
                if old_sec.SiSoHienTai > 0:
                    old_sec.SiSoHienTai -= 1
                # Xoá bản ghi cũ
                en_old = db_section.query(Enrollment).filter(
                    Enrollment.userId == user_id,
                    Enrollment.MaLopHP == exclude_lop
                ).first()
                if en_old:
                    db_section.delete(en_old)
                _log_step(log_db, tx_id, exclude_lop, ma_sv, BuocGiaoTac.INSERT, "Đã trừ sĩ số lớp cũ")

            # 4. Tạo mới enrollment
            new_en = Enrollment(
                userId=user_id,
                MaSV=ma_sv,
                MaLopHP=ma_lop_hp,
                MaHP=new_sec.MaHP,
                MaHocKy=new_sec.MaHocKy,
                TrangThaiDangKy=EnrollmentStatus.DaDangKy,
                GhiChu=ghi_chu,
            )
            db_section.add(new_en)
            new_sec.SiSoHienTai += 1

            _log_step(log_db, tx_id, ma_lop_hp, ma_sv, BuocGiaoTac.INSERT,
                      f"Tăng sĩ số → {new_sec.SiSoHienTai}/{new_sec.SiSoToiDa}")

            # 5. Commit
            db_section.commit()
            db_section.refresh(new_en)

            _log_step(log_db, tx_id, ma_lop_hp, ma_sv, BuocGiaoTac.COMMIT,
                      f"MaDangKy={new_en.MaDangKy}", TrangThaiGiaoTac.THANH_CONG)

            return new_en.MaDangKy

        except Exception as e:
            db_section.rollback()
            _log_step(log_db, tx_id, ma_lop_hp, ma_sv, BuocGiaoTac.ROLLBACK,
                      str(e), TrangThaiGiaoTac.THAT_BAI)
            raise

    # 4. HỦY ĐĂNG KÝ
    @staticmethod
    @retry_on_deadlock(max_retries=3)
    def cancel(user_id: str, ma_lop_hp: str, site_home: str):
        """Hủy đăng ký học phần."""
        site_section = _site_of(ma_lop_hp)
        tx_id = f"CANCEL-{user_id}-{int(time.time() * 1000)}"

        with open_db_by_branch(site_section) as db_section, \
             open_db_by_branch(site_home) as db_home:

            log_db = get_log_session(site_section)
            sec_ref = None

            try:
                _log_step(log_db, tx_id, ma_lop_hp, user_id, BuocGiaoTac.BEGIN, "Bắt đầu hủy")

                # Lock lớp bằng Raw SQL thông qua Repo
                sec = ClassSectionRepo.get_by_id_for_update(db_section, ma_lop_hp)
                if not sec:
                    raise HTTPException(404, "Lớp không tồn tại")
                _log_step(log_db, tx_id, ma_lop_hp, user_id, BuocGiaoTac.DA_KHOA, f"Đã khóa {ma_lop_hp}")

                en = EnrollmentRepo.get_by_lop_user(db_section, user_id, ma_lop_hp)
                if not en:
                    raise HTTPException(404, "Không tìm thấy đăng ký")

                if sec.SiSoHienTai > 0:
                    sec.SiSoHienTai -= 1

                db_section.delete(en)
                db_section.commit()
                sec_ref = sec

                _log_step(log_db, tx_id, ma_lop_hp, user_id, BuocGiaoTac.COMMIT,
                          "Hủy thành công", TrangThaiGiaoTac.THANH_CONG)

            except HTTPException as he:
                _log_step(log_db, tx_id, ma_lop_hp, user_id, BuocGiaoTac.ROLLBACK,
                          str(he.detail), TrangThaiGiaoTac.THAT_BAI)
                raise
            except Exception as exc:
                _log_step(log_db, tx_id, ma_lop_hp, user_id, BuocGiaoTac.ROLLBACK,
                          str(exc), TrangThaiGiaoTac.THAT_BAI)
                raise HTTPException(500, str(exc))
            finally:
                log_db.close()

            # Xóa bản sao tại site sinh viên
            try:
                copy = db_home.query(Enrollment).filter(
                    Enrollment.userId == user_id,
                    Enrollment.MaLopHP == ma_lop_hp
                ).first()
                if copy:
                    db_home.delete(copy)
                    db_home.commit()
            except Exception as e:
                db_home.rollback()
                print(f"⚠️ sync cancel fail: {e}")

    # 5. LỊCH SỬ ĐĂNG KÝ
    @staticmethod
    def get_history(user_id: str, site: str, ma_hk: Optional[str] = None) -> List[EnrollmentHistoryResponse]:
        """Lấy danh sách đăng ký của sinh viên (từ bản sao ở site home)."""
        result = []
        with open_db_by_branch(site) as db:
            enrolls = EnrollmentRepo.get_student_enrollments(db, user_id, ma_hk)
            for en in enrolls:
                sec = ClassSectionRepo.get_by_id(db, en.MaLopHP)
                course = db.query(Course).filter(Course.MaHocPhan == en.MaHP).first()
                result.append(EnrollmentHistoryResponse(
                    MaDangKy=en.MaDangKy,
                    MaSV=en.MaSV or "N/A",
                    MaLopHP=en.MaLopHP,
                    TenLopHP=sec.TenLopHP if sec else None,
                    TenHocPhan=course.TenHocPhan if course else None,
                    MaHocKy=en.MaHocKy,
                    NgayDangKy=en.NgayDangKy,
                    TrangThaiDangKy=en.TrangThaiDangKy,
                    MaCoSo=site,
                ))
        return sorted(result, key=lambda x: x.NgayDangKy, reverse=True)

    # 6. CÁC HELPER KHÁC
    @staticmethod
    def _sync_to_home(db_home: Session, user_id: str, ma_sv: str, ma_lop_hp: str,
                      ma_hp: str, ma_hk: str, exclude_lop: Optional[str], ghi_chu: Optional[str]):
        """Đồng bộ bản sao về site gốc của sinh viên (best-effort)."""
        try:
            if exclude_lop:
                old = db_home.query(Enrollment).filter(
                    Enrollment.userId == user_id,
                    Enrollment.MaLopHP == exclude_lop
                ).first()
                if old:
                    db_home.delete(old)

            copy_en = Enrollment(
                userId=user_id, MaSV=ma_sv, MaLopHP=ma_lop_hp,
                MaHP=ma_hp, MaHocKy=ma_hk,
                TrangThaiDangKy=EnrollmentStatus.DaDangKy,
                GhiChu=ghi_chu,
            )
            db_home.add(copy_en)
            db_home.commit()
        except Exception as e:
            db_home.rollback()
            print(f"⚠️ sync home fail: {e}")

    @staticmethod
    def _lazy_cleanup(site: str, user_id: str, ma_lop_hp: str):
        """Dọn dẹp lớp cũ ở site khác (best-effort)."""
        try:
            with open_db_by_branch(site) as db:
                @retry_on_deadlock(max_retries=2)
                def _do():
                    sec = ClassSectionRepo.get_by_id_for_update(db, ma_lop_hp)
                    en = EnrollmentRepo.get_by_lop_user(db, user_id, ma_lop_hp)
                    if en:
                        db.delete(en)
                    if sec and sec.SiSoHienTai > 0:
                        sec.SiSoHienTai -= 1
                    db.commit()
                _do()
        except Exception as e:
            print(f"⚠️ lazy_cleanup thất bại ({ma_lop_hp}): {e}")


    @staticmethod
    def _check_schedule_conflict(db_home: Session, user_id: str,
                                 section: CourseSection,
                                 exclude_lop: Optional[str] = None) -> List[str]:
        """Kiểm tra trùng lịch giữa lớp mới và các lớp đã đăng ký."""
        conflicts = []
        site_new = _site_of(section.MaLopHP)

        with open_db_by_branch(site_new) as db_new_site:
            new_schedules = ClassSectionRepo.list_schedules(db_new_site, section.MaLopHP)

        if not new_schedules:
            return []

        current_enrollments = EnrollmentRepo.get_student_enrollments(
            db_home, user_id, section.MaHocKy
        )

        for en in current_enrollments:
            if en.MaLopHP in (section.MaLopHP, exclude_lop):
                continue

            site_en = _site_of(en.MaLopHP)
            with open_db_by_branch(site_en) as db_en_site:
                existing_schedules = ClassSectionRepo.list_schedules(db_en_site, en.MaLopHP)
            for s_exist in existing_schedules:
                for s_new in new_schedules:
                    exist_end = s_exist.TietBatDau + s_exist.SoTiet - 1
                    new_end = s_new.TietBatDau + s_new.SoTiet - 1

                    if s_exist.ThuTrongTuan == s_new.ThuTrongTuan:
                        if not (exist_end < s_new.TietBatDau or s_exist.TietBatDau > new_end):
                            conflicts.append(
                                f"Trùng lịch với lớp {en.MaLopHP} "
                                f"(Thứ {s_exist.ThuTrongTuan}, tiết {s_exist.TietBatDau}–{exist_end})"
                            )
        return conflicts

    @staticmethod
    @retry_on_deadlock(max_retries=3)
    def swap_class(ma_sv: str, old_ma_lop_hp: str, new_ma_lop_hp: str, **kwargs) -> bool:
        """Thực hiện đổi lớp học phần (Mô phỏng quy trình chi tiết để ghi log)."""
        site_new = _site_of(new_ma_lop_hp)
        tx_id = f"SWAP-{ma_sv}-{int(time.time() * 1000)}"
        
        with open_db_by_branch(site_new) as db:
            log_db = get_log_session(site_new)
            try:
                _log_step(log_db, tx_id, new_ma_lop_hp, ma_sv, BuocGiaoTac.BEGIN, f"Đổi lớp: {old_ma_lop_hp} -> {new_ma_lop_hp}")
                
                # 1. Kiểm tra lịch học
                _log_step(log_db, tx_id, new_ma_lop_hp, ma_sv, BuocGiaoTac.KIEM_TRA_LICH_HOC, "Kiểm tra lịch học chéo... OK")

                # 2. Khóa DB (Cố tình tạo Deadlock bằng cách không sort ID)
                target_ids = [old_ma_lop_hp, new_ma_lop_hp]
                locked = {}
                for cid in target_ids:
                    sec = ClassSectionRepo.get_by_id_for_update(db, cid)
                    if not sec: raise HTTPException(404, detail=f"Không tìm thấy lớp {cid}")
                    locked[cid] = sec
                    time.sleep(1) # Delay để tạo cơ hội gây Deadlock
                _log_step(log_db, tx_id, new_ma_lop_hp, ma_sv, BuocGiaoTac.DA_KHOA, f"Đã khóa xong {len(target_ids)} lớp")

                old_sec, new_sec = locked[old_ma_lop_hp], locked[new_ma_lop_hp]
                
                # 3. Kiểm tra sĩ số
                if new_sec.SiSoHienTai >= new_sec.SiSoToiDa: 
                    _log_step(log_db, tx_id, new_ma_lop_hp, ma_sv, BuocGiaoTac.KIEM_TRA_SI_SO, "Lớp đã đầy", TrangThaiGiaoTac.THAT_BAI)
                    raise HTTPException(400, detail="Lớp mới đã đầy.")
                _log_step(log_db, tx_id, new_ma_lop_hp, ma_sv, BuocGiaoTac.KIEM_TRA_SI_SO, f"Sĩ số: {new_sec.SiSoHienTai}/{new_sec.SiSoToiDa}")

                # 4. Cập nhật dữ liệu (Insert/Update)
                en = db.query(Enrollment).filter(
                    Enrollment.MaSV == ma_sv, 
                    Enrollment.MaLopHP == old_ma_lop_hp, 
                    Enrollment.TrangThaiDangKy == EnrollmentStatus.DaDangKy
                ).first()
                if not en: raise HTTPException(400, detail="Không tìm thấy đăng ký ở lớp cũ.")
                
                old_sec.SiSoHienTai -= 1
                new_sec.SiSoHienTai += 1
                en.MaLopHP = new_ma_lop_hp
                en.NgayDangKy = datetime.now(timezone.utc)
                _log_step(log_db, tx_id, new_ma_lop_hp, ma_sv, BuocGiaoTac.INSERT, "Đã cập nhật sĩ số và bản ghi đăng ký")
                
                db.commit()
                _log_step(log_db, tx_id, new_ma_lop_hp, ma_sv, BuocGiaoTac.COMMIT, "Đổi lớp thành công", TrangThaiGiaoTac.THANH_CONG)
                return True
            except Exception as e:
                db.rollback()
                if "deadlock" not in str(e).lower():
                    _log_step(log_db, tx_id, new_ma_lop_hp, ma_sv, BuocGiaoTac.ROLLBACK, str(e), TrangThaiGiaoTac.THAT_BAI)
                raise e
            finally:
                log_db.close()
