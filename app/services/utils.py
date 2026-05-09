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
        return "UNKNOWN"
    return ma_lop_hp.split("_")[0].upper()

def _log_step(log_db: Session, tx_id: str, ma_lop_hp: str, ma_sv: str,
              buoc: BuocGiaoTac, chi_tiet: str | None = None,
              trang_thai: TrangThaiGiaoTac = TrangThaiGiaoTac.DANG_CHAY) -> None:
    """Ghi một bước vào NhatKyThaoTac (session autocommit, không ảnh hưởng đến TX chính)."""
    try:
        log_db.add(NhatKyThaoTac(
            MaGiaoTac=tx_id,
            MaLopHP=ma_lop_hp,
            MaSV=ma_sv,
            Buoc=buoc,
            ChiTiet=chi_tiet,
            TrangThai=trang_thai
        ))
        log_db.commit()
    except Exception as e:
        print(f"Lỗi ghi log NhatKyThaoTac: {e}")
        log_db.rollback()

def retry_on_deadlock(max_retries=3, initial_wait=0.1):
    """Tự động thử lại khi gặp Deadlock (hoặc 409 Conflict) và ghi log kể chuyện vào DB."""
    def decorator(func):
        @wraps(func)
        def wrapper(*args, **kwargs):
            retries = 0
            ma_sv = "UNKNOWN"
            ma_lop = "UNKNOWN"
            if func.__name__ == "register":
                if len(args) > 0:
                    ma_sv = getattr(args[0], "userId", getattr(args[0], "MaSV", "UNKNOWN"))
                if len(args) > 1:
                    ma_lop = getattr(args[1], "MaLopHP", "UNKNOWN")
            elif func.__name__ == "cancel":
                if len(args) > 0: ma_sv = args[0]
                if len(args) > 1: ma_lop = args[1]
            
            tx_id = kwargs.get("tx_id") or f"RETRY-LOG-{int(time.time())}"

            while retries < max_retries:
                try:
                    return func(*args, **kwargs)
                except (InternalError, OperationalError, HTTPException) as e:
                    should_retry = False
                    if isinstance(e, HTTPException):
                        if e.status_code == status.HTTP_409_CONFLICT:
                            should_retry = True
                    else:
                        err_msg = str(e).lower()
                        if "deadlock detected" in err_msg or "40p01" in err_msg:
                            should_retry = True

                    if should_retry and retries < max_retries - 1:
                        retries += 1
                        wait_time = initial_wait * (2 ** retries) + random.uniform(0, 0.1)
                        
                        # Ghi log kể chuyện vào DB
                        try:
                            with get_log_session(_site_of(str(ma_lop))) as log_db:
                                # Bước 1: Thông báo DỪNG
                                _log_step(log_db, tx_id, str(ma_lop), str(ma_sv), BuocGiaoTac.ROLLBACK, 
                                         f"STOP: Phát hiện xung đột tài nguyên. Đang hủy giao dịch hiện tại để nhường quyền.", 
                                         TrangThaiGiaoTac.THAT_BAI)
                                
                                # Bước 2: Thông báo THỬ LẠI
                                _log_step(log_db, tx_id, str(ma_lop), str(ma_sv), BuocGiaoTac.RETRY, 
                                         f"RETRY: Bắt đầu thực hiện lại lần {retries+1} sau {wait_time:.2f}s nghỉ.", 
                                         TrangThaiGiaoTac.DANG_CHAY)
                        except Exception:
                            pass

                        print(f"⚠️ [RETRY] Xung đột / Deadlock, thử lại lần {retries} sau {wait_time:.2f}s")
                        time.sleep(wait_time)
                        continue
                    raise
            return func(*args, **kwargs)
        return wrapper
    return decorator
