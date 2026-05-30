import sys
import os
import threading
from sqlalchemy import text

sys.path.insert(0, os.path.abspath(os.path.join(os.path.dirname(__file__), '..', 'app')))

from configs.db import SessionLocals
from services.EnrollmentService import EnrollmentService
from services.AuthService import AuthService
from schemas.Enrollment import EnrollmentCreate

# Hai sinh viên cố định cho demo — username & password đều là MaSV
DEMO_MA_SV = ["SVHD26CNTT001", "SVHD26CNTT002"]

def login(ma_sv: str):
    """Lấy user object từ DB theo MaSV (username = MaSV)."""
    user = AuthService._find_user_by_username(ma_sv)
    if not user:
        raise Exception(f"Không tìm thấy tài khoản: {ma_sv}")
    return user

def reset_database(class_code, user_ids):
    """Reset sĩ số lớp về 49/50 và xóa bản ghi đăng ký cũ của 2 sinh viên."""
    with SessionLocals['HOALAC']() as session:
        session.execute(
            text('UPDATE "LopHocPhan" SET "SiSoHienTai" = 49, "SiSoToiDa" = 50 WHERE "MaLopHP" = :c'),
            {"c": class_code}
        )
        session.commit()

    params = {"ids": user_ids, "c": class_code}
    for session_factory in SessionLocals.values():
        with session_factory() as session:
            session.execute(text('DELETE FROM "DangKy" WHERE "userId" = ANY(:ids) AND "MaLopHP" = :c'), params)
            session.commit()

def register_thread(user, class_code):
    """Luồng đăng ký cho 1 sinh viên qua cơ chế 3PC + Locks."""
    try:
        EnrollmentService.register(user, EnrollmentCreate(MaLopHP=class_code))
    except Exception:
        pass

def main():
    try:
        # 1. Đăng nhập 2 sinh viên
        users = [login(ma_sv) for ma_sv in DEMO_MA_SV]

        # 2. Lấy lớp học phần mẫu ở HOALAC
        with SessionLocals['HOALAC']() as session:
            row = session.execute(
                text('SELECT "MaLopHP" FROM "LopHocPhan" WHERE "MaCoSo" = \'HOALAC\' LIMIT 1')
            ).fetchone()
        if not row:
            raise Exception("Không tìm thấy lớp học phần ở HOALAC")
        class_code = row[0]

        # 3. Reset DB về trạng thái ban đầu (49/50)
        reset_database(class_code, [u.userId for u in users])

        # 4. Chạy 2 luồng đăng ký đồng thời
        threads = [threading.Thread(target=register_thread, args=(u, class_code)) for u in users]
        for t in threads: t.start()
        for t in threads: t.join()

    except Exception as e:
        print(f"Lỗi: {e}")

if __name__ == '__main__':
    main()
