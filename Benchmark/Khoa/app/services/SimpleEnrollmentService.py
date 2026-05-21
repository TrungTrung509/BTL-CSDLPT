import time
import random
from fastapi import HTTPException
from configs.db import open_db_by_branch
from repositories.repos import ClassSectionRepo, EnrollmentRepo
from models.models import Enrollment, EnrollmentTransfer
from sqlalchemy import text
from concurrent.futures import ThreadPoolExecutor, as_completed
from sqlalchemy.exc import TimeoutError as SQLAlchemyTimeoutError, OperationalError, IntegrityError
from monitoring.metrics import CONFLICT_CHECK_DURATION, LOCK_HOLD_DURATION, DB_ERRORS_TOTAL

MAX_RETRIES = 3

def get_site_prefix(identifier: str) -> str:
    # Thứ tự quan trọng: CNTT phải check trước NN, KT, DT
    prefixes = ["CNTT", "CB", "NN", "KT", "DT"]
    for p in prefixes:
        if identifier.upper().startswith(p) or f"_{p}_" in identifier.upper() or f"_{p}" in identifier.upper():
            return p
    return "CNTT"


class SimpleEnrollmentService:

    @staticmethod
    def _check_overlap(new_class, old_classes):
        for old_c in old_classes:
            if not old_c:
                continue
            if new_class.ThuTrongTuan == old_c.ThuTrongTuan:
                s1, e1 = new_class.TietBatDau, new_class.TietBatDau + new_class.SoTiet - 1
                s2, e2 = old_c.TietBatDau, old_c.TietBatDau + old_c.SoTiet - 1
                if max(s1, s2) <= min(e1, e2):
                    return True
        return False

    # ==========================================================
    # REGISTER hoặc ĐỔI LỚP (Nếu đã đăng ký cùng MaHP thì swap)
    # ==========================================================
    @staticmethod
    def register_simple(user_id: str, ma_lop_hp: str):
        home_site = get_site_prefix(user_id)
        target_site = get_site_prefix(ma_lop_hp)

        try:
            # BƯỚC 1: Lấy thông tin lớp mới
            with open_db_by_branch(target_site) as db_target:
                new_class = ClassSectionRepo.get_by_id(db_target, ma_lop_hp)
                if not new_class:
                    raise HTTPException(status_code=404, detail="Không tìm thấy lớp")

            # BƯỚC 2: Kiểm tra SV đã đăng ký cùng MaHP chưa
            old_enrollment = None
            old_site = None
            with open_db_by_branch(home_site) as db_home:
                existing = EnrollmentRepo.get_student_enrollments(db_home, user_id)
                for en in existing:
                    if en.MaHP == new_class.MaHP and en.MaHocKy == new_class.MaHocKy:
                        old_enrollment = en
                        old_site = home_site
                        break

                if not old_enrollment:
                    transfers = EnrollmentRepo.get_student_transfers(db_home, user_id)
                    for tr in transfers:
                        if tr.MaHP == new_class.MaHP:
                            old_enrollment = tr
                            old_site = tr.TargetSite
                            break

            if old_enrollment:
                # ĐỔI LỚP với Deadlock Retry
                return SimpleEnrollmentService._swap_class_with_retry(
                    user_id, home_site,
                    old_enrollment.MaLopHP, old_site,
                    ma_lop_hp, target_site,
                    new_class
                )
            else:
                # ĐĂNG KÝ MỚI + Kiểm tra trùng lịch (Fail-Fast dùng ThreadPool)
                start_check = time.perf_counter()
                try:
                    old_classes = []
                    with open_db_by_branch(home_site) as db_home:
                        local_enrolls = EnrollmentRepo.get_student_enrollments(db_home, user_id)
                        cross_transfers = EnrollmentRepo.get_student_transfers(db_home, user_id)
                        for en in local_enrolls:
                            old_classes.append(ClassSectionRepo.get_by_id(db_home, en.MaLopHP))

                    # Cross-shard read song song (Quan trọng vì Khoa có 70% cross-shard)
                    if cross_transfers:
                        def fetch_remote(tr):
                            with open_db_by_branch(tr.TargetSite) as db_r:
                                return ClassSectionRepo.get_by_id(db_r, tr.MaLopHP)
                        with ThreadPoolExecutor(max_workers=min(len(cross_transfers), 5)) as ex:
                            for cls_info in ex.map(fetch_remote, cross_transfers):
                                if cls_info:
                                    old_classes.append(cls_info)

                    if SimpleEnrollmentService._check_overlap(new_class, old_classes):
                        raise HTTPException(status_code=409, detail="Trùng lịch học")
                finally:
                    check_duration = time.perf_counter() - start_check
                    CONFLICT_CHECK_DURATION.labels(app="khoa").observe(check_duration)

                return SimpleEnrollmentService._do_enroll(user_id, home_site, ma_lop_hp, target_site, new_class)
        except (SQLAlchemyTimeoutError, TimeoutError):
            DB_ERRORS_TOTAL.labels(type="pool_exhaustion", app="khoa").inc()
            raise HTTPException(status_code=503, detail="Connection pool timeout")
        except IntegrityError as e:
            err_msg = str(e).lower()
            if "uq_dk_user_hp_hk" in err_msg or "duplicate key" in err_msg:
                raise HTTPException(status_code=409, detail="Sinh viên đã đăng ký học phần này trong học kỳ")
            raise HTTPException(status_code=400, detail=f"Lỗi ràng buộc database: {str(e)}")
        except OperationalError as e:
            err_msg = str(e).lower()
            if "deadlock" in err_msg:
                DB_ERRORS_TOTAL.labels(type="deadlock", app="khoa").inc()
            elif "lock timeout" in err_msg or "timeout" in err_msg:
                DB_ERRORS_TOTAL.labels(type="timeout", app="khoa").inc()
            else:
                DB_ERRORS_TOTAL.labels(type="db_other", app="khoa").inc()
            raise HTTPException(status_code=503, detail="Database operational error")

    @staticmethod
    def _do_enroll(user_id, home_site, ma_lop_hp, target_site, section):
        if home_site == target_site:
            with open_db_by_branch(home_site) as db:
                db.execute(text("SET lock_timeout = '2s'"))
                start_lock = time.perf_counter()
                try:
                    sec = ClassSectionRepo.get_by_id_for_update(db, ma_lop_hp)
                    if sec.SiSoHienTai >= sec.SiSoToiDa:
                        raise HTTPException(status_code=400, detail="Lớp đầy")
                    db.add(Enrollment(userId=user_id, MaLopHP=ma_lop_hp, MaHP=sec.MaHP, MaHocKy=sec.MaHocKy))
                    sec.SiSoHienTai += 1
                    db.commit()
                    LOCK_HOLD_DURATION.labels(type="enroll_local", app="khoa").observe(time.perf_counter() - start_lock)
                    return {"status": "Success", "type": "new", "message": f"Đăng ký cục bộ ({home_site})"}
                except Exception as e:
                    db.rollback()
                    LOCK_HOLD_DURATION.labels(type="enroll_local_fail", app="khoa").observe(time.perf_counter() - start_lock)
                    raise e
        else:
            db_t = open_db_by_branch(target_site)
            db_h = open_db_by_branch(home_site)
            start_lock = time.perf_counter()
            try:
                db_t.execute(text("SET lock_timeout = '2s'"))
                sec = ClassSectionRepo.get_by_id_for_update(db_t, ma_lop_hp)
                if sec.SiSoHienTai >= sec.SiSoToiDa:
                    raise HTTPException(status_code=400, detail="Lớp đầy")
                db_t.add(Enrollment(userId=user_id, MaLopHP=ma_lop_hp, MaHP=sec.MaHP, MaHocKy=sec.MaHocKy))
                sec.SiSoHienTai += 1
                db_h.add(EnrollmentTransfer(userId=user_id, MaLopHP=ma_lop_hp, MaHP=sec.MaHP, TargetSite=target_site))
                db_t.commit()
                db_h.commit()
                LOCK_HOLD_DURATION.labels(type="enroll_cross", app="khoa").observe(time.perf_counter() - start_lock)
                return {"status": "Success", "type": "new", "message": f"Đăng ký chéo ({home_site} -> {target_site})"}
            except HTTPException as e:
                db_t.rollback()
                db_h.rollback()
                LOCK_HOLD_DURATION.labels(type="enroll_cross_fail", app="khoa").observe(time.perf_counter() - start_lock)
                raise e
            except Exception as e:
                db_t.rollback()
                db_h.rollback()
                LOCK_HOLD_DURATION.labels(type="enroll_cross_fail", app="khoa").observe(time.perf_counter() - start_lock)
                raise e
            finally:
                db_t.close()
                db_h.close()

    @staticmethod
    def _swap_class_with_retry(user_id, home_site, old_ma_lop_hp, old_site, new_ma_lop_hp, new_site, new_class):
        """Đổi lớp có Deadlock Retry (3 lần, exponential backoff)."""
        last_exc = None
        for attempt in range(MAX_RETRIES):
            try:
                return SimpleEnrollmentService._do_swap(
                    user_id, home_site, old_ma_lop_hp, old_site, new_ma_lop_hp, new_site, new_class
                )
            except HTTPException as e:
                if e.status_code == 503:
                    last_exc = e
                    wait = 0.1 * (2 ** attempt) + random.uniform(0, 0.05)
                    time.sleep(wait)
                    continue
                raise
            except Exception as e:
                if "deadlock" in str(e).lower() or "lock timeout" in str(e).lower():
                    last_exc = HTTPException(status_code=503, detail=f"Deadlock retry #{attempt+1}")
                    wait = 0.1 * (2 ** attempt) + random.uniform(0, 0.05)
                    time.sleep(wait)
                    continue
                raise HTTPException(status_code=500, detail=str(e))
        raise last_exc or HTTPException(status_code=503, detail="Deadlock sau 3 lần retry")

    @staticmethod
    def _do_swap(user_id, home_site, old_ma_lop_hp, old_site, new_ma_lop_hp, new_site, new_class):
        """Thực hiện Cancel lớp cũ + Enroll lớp mới (best-effort 2-phase)."""
        sites_needed = list({home_site, old_site, new_site})
        dbs = {s: open_db_by_branch(s) for s in sites_needed}
        start_lock = time.perf_counter()
        try:
            for db in dbs.values():
                db.execute(text("SET lock_timeout = '2s'"))

            old_sec = ClassSectionRepo.get_by_id_for_update(dbs[old_site], old_ma_lop_hp)
            if old_sec:
                old_enrollment = dbs[old_site].query(Enrollment).filter(
                    Enrollment.userId == user_id,
                    Enrollment.MaLopHP == old_ma_lop_hp
                ).first()
                if old_enrollment:
                    dbs[old_site].delete(old_enrollment)
                    old_sec.SiSoHienTai = max(0, old_sec.SiSoHienTai - 1)
                    dbs[old_site].flush()

            new_sec = ClassSectionRepo.get_by_id_for_update(dbs[new_site], new_ma_lop_hp)
            if new_sec.SiSoHienTai >= new_sec.SiSoToiDa:
                raise HTTPException(status_code=400, detail="Lớp mới đã đầy")
            dbs[new_site].add(Enrollment(userId=user_id, MaLopHP=new_ma_lop_hp, MaHP=new_sec.MaHP, MaHocKy=new_sec.MaHocKy))
            new_sec.SiSoHienTai += 1

            if home_site != old_site:
                old_transfer = dbs[home_site].query(EnrollmentTransfer).filter(
                    EnrollmentTransfer.userId == user_id,
                    EnrollmentTransfer.MaLopHP == old_ma_lop_hp
                ).first()
                if old_transfer:
                    dbs[home_site].delete(old_transfer)

            if home_site != new_site:
                dbs[home_site].add(EnrollmentTransfer(
                    userId=user_id, MaLopHP=new_ma_lop_hp,
                    MaHP=new_sec.MaHP, TargetSite=new_site
                ))

            for db in dbs.values():
                db.commit()

            LOCK_HOLD_DURATION.labels(type="swap", app="khoa").observe(time.perf_counter() - start_lock)
            return {"status": "Success", "type": "swap", "message": f"Đổi lớp {old_ma_lop_hp} → {new_ma_lop_hp}"}
        except HTTPException as e:
            for db in dbs.values():
                db.rollback()
            LOCK_HOLD_DURATION.labels(type="swap_fail", app="khoa").observe(time.perf_counter() - start_lock)
            raise e
        except Exception as e:
            for db in dbs.values():
                db.rollback()
            LOCK_HOLD_DURATION.labels(type="swap_fail", app="khoa").observe(time.perf_counter() - start_lock)
            raise e
        finally:
            for db in dbs.values():
                db.close()

    # ==========================================================
    # HỦY ĐĂNG KÝ
    # ==========================================================
    @staticmethod
    def cancel_simple(user_id: str, ma_lop_hp: str):
        home_site = get_site_prefix(user_id)
        target_site = get_site_prefix(ma_lop_hp)

        try:
            if home_site == target_site:
                with open_db_by_branch(home_site) as db:
                    db.execute(text("SET lock_timeout = '2s'"))
                    start_lock = time.perf_counter()
                    try:
                        en = db.query(Enrollment).filter(
                            Enrollment.userId == user_id,
                            Enrollment.MaLopHP == ma_lop_hp
                        ).first()
                        if not en:
                            raise HTTPException(status_code=404, detail="Chưa đăng ký lớp này")
                        sec = ClassSectionRepo.get_by_id_for_update(db, ma_lop_hp)
                        db.delete(en)
                        if sec:
                            sec.SiSoHienTai = max(0, sec.SiSoHienTai - 1)
                        db.commit()
                        LOCK_HOLD_DURATION.labels(type="cancel_local", app="khoa").observe(time.perf_counter() - start_lock)
                        return {"status": "Success", "message": f"Hủy cục bộ ({home_site})"}
                    except Exception as e:
                        db.rollback()
                        LOCK_HOLD_DURATION.labels(type="cancel_local_fail", app="khoa").observe(time.perf_counter() - start_lock)
                        raise e
            else:
                db_t = open_db_by_branch(target_site)
                db_h = open_db_by_branch(home_site)
                start_lock = time.perf_counter()
                try:
                    db_t.execute(text("SET lock_timeout = '2s'"))
                    en = db_t.query(Enrollment).filter(
                        Enrollment.userId == user_id,
                        Enrollment.MaLopHP == ma_lop_hp
                    ).first()
                    if not en:
                        raise HTTPException(status_code=404, detail="Chưa đăng ký lớp này")
                    sec = ClassSectionRepo.get_by_id_for_update(db_t, ma_lop_hp)
                    db_t.delete(en)
                    if sec:
                        sec.SiSoHienTai = max(0, sec.SiSoHienTai - 1)

                    transfer = db_h.query(EnrollmentTransfer).filter(
                        EnrollmentTransfer.userId == user_id,
                        EnrollmentTransfer.MaLopHP == ma_lop_hp
                    ).first()
                    if transfer:
                        db_h.delete(transfer)

                    db_t.commit()
                    db_h.commit()
                    LOCK_HOLD_DURATION.labels(type="cancel_cross", app="khoa").observe(time.perf_counter() - start_lock)
                    return {"status": "Success", "message": f"Hủy chéo ({home_site} -> {target_site})"}
                except HTTPException as e:
                    db_t.rollback()
                    db_h.rollback()
                    LOCK_HOLD_DURATION.labels(type="cancel_cross_fail", app="khoa").observe(time.perf_counter() - start_lock)
                    raise e
                except Exception as e:
                    db_t.rollback()
                    db_h.rollback()
                    LOCK_HOLD_DURATION.labels(type="cancel_cross_fail", app="khoa").observe(time.perf_counter() - start_lock)
                    raise e
                finally:
                    db_t.close()
                    db_h.close()
        except (SQLAlchemyTimeoutError, TimeoutError):
            DB_ERRORS_TOTAL.labels(type="pool_exhaustion", app="khoa").inc()
            raise HTTPException(status_code=503, detail="Connection pool timeout")
        except OperationalError as e:
            err_msg = str(e).lower()
            if "deadlock" in err_msg:
                DB_ERRORS_TOTAL.labels(type="deadlock", app="khoa").inc()
            elif "lock timeout" in err_msg or "timeout" in err_msg:
                DB_ERRORS_TOTAL.labels(type="timeout", app="khoa").inc()
            else:
                DB_ERRORS_TOTAL.labels(type="db_other", app="khoa").inc()
            raise HTTPException(status_code=503, detail="Database operational error")
