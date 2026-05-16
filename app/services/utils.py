from functools import wraps
import time
import random
from fastapi import HTTPException, status
from sqlalchemy.orm import Session
from sqlalchemy.exc import InternalError, OperationalError
from models.NhatKyThaoTac import NhatKyThaoTac
from enums.status import BuocGiaoTac, TrangThaiGiaoTac
from configs.db import get_log_session

def _site_of(ma_lop_hp: str) -> str:
    """Giải mã tên site từ MaLopHP. Ví dụ: 'HADONG_CS001' → 'HADONG'."""
    if not ma_lop_hp or "_" not in ma_lop_hp:
        return "HADONG" # Fallback ve site chinh de ghi log
    return ma_lop_hp.split("_")[0].upper()

def _log_step(
    log_db: Session,
    tx_id: str,
    ma_lop_hp: str,
    ma_sv: str,
    buoc: BuocGiaoTac,
    chi_tiet: str | None = None,
    trang_thai: TrangThaiGiaoTac = TrangThaiGiaoTac.DANG_CHAY,
    ma_co_so: str | None = None,
) -> None:
    """Ghi một bước vào NhatKyThaoTac (session autocommit, không ảnh hưởng đến TX chính)."""
    try:
        log_db.add(NhatKyThaoTac(
            MaGiaoTac=tx_id,
            MaLopHP=ma_lop_hp,
            MaSV=ma_sv,
            MaCoSo=ma_co_so,
            Buoc=buoc,
            ChiTiet=chi_tiet,
            TrangThai=trang_thai
        ))
        log_db.commit()
    except Exception:
        log_db.rollback()

def retry_on_deadlock(max_retries=3, initial_wait=0.1):
    """Tự động thử lại khi gặp Deadlock (hoặc 409 Conflict) và ghi log kể chuyện vào DB."""
    def decorator(func):
        @wraps(func)
        def wrapper(*args, **kwargs):
            retries = 0
            ma_sv = "UNKNOWN"
            ma_lop = "UNKNOWN"
            
            # Trích xuất tham số thông minh từ args hoặc kwargs
            if func.__name__ == "register":
                # Lấy user
                user = kwargs.get("user") or (args[0] if len(args) > 0 else None)
                if user:
                    ma_sv = getattr(user, "userId", getattr(user, "MaSV", "UNKNOWN"))
                
                # Lấy enroll_in
                enroll_in = kwargs.get("enroll_in") or (args[1] if len(args) > 1 else None)
                if enroll_in:
                    ma_lop = getattr(enroll_in, "MaLopHP", "UNKNOWN")
                    
            elif func.__name__ == "cancel":
                ma_sv = kwargs.get("user_id") or (args[0] if len(args) > 0 else "UNKNOWN")
                ma_lop = kwargs.get("ma_lop_hp") or (args[1] if len(args) > 1 else "UNKNOWN")
            
            tx_id = kwargs.get("tx_id") or f"RETRY-LOG-{int(time.time())}"

            while retries < max_retries:
                try:
                    return func(*args, **kwargs)
                except (InternalError, OperationalError, HTTPException) as e:
                    should_retry = False
                    err_msg = str(e).lower()
                    if isinstance(e, HTTPException):
                        if e.status_code == status.HTTP_409_CONFLICT:
                            should_retry = True
                    else:
                        if "deadlock detected" in err_msg or "40p01" in err_msg:
                            should_retry = True

                    if should_retry and retries < max_retries - 1:
                        retries += 1
                        wait_time = initial_wait * (2 ** retries) + random.uniform(0, 0.1)
                        
                        # Ghi log kể chuyện vào DB
                        try:
                            site = _site_of(str(ma_lop))
                            with get_log_session(site) as log_db:
                                # Bước 1: ROLLBACK thành công — transaction đã được thu hồi đúng cách
                                _log_step(log_db, tx_id, str(ma_lop), str(ma_sv), BuocGiaoTac.ROLLBACK,
                                         f"Giao dịch đã được rollback do xung đột tài nguyên. Sẽ thử lại sau {wait_time:.2f}s.",
                                         TrangThaiGiaoTac.THANH_CONG, ma_co_so=site)

                                # Bước 2: RETRY — bắt đầu lại từ đầu
                                _log_step(log_db, tx_id, str(ma_lop), str(ma_sv), BuocGiaoTac.RETRY,
                                         f"Bắt đầu thực hiện lại lần {retries + 1}/{max_retries}.",
                                         TrangThaiGiaoTac.DANG_CHAY, ma_co_so=site)
                        except Exception:
                            pass

                        time.sleep(wait_time)
                        continue
                    raise
            return func(*args, **kwargs)
        return wrapper
    return decorator
