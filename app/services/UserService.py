import uuid
from datetime import date
from fastapi import HTTPException, status, Depends
from configs.config import oauth2_scheme
from services.AuthService import AuthService
from repositories.UserRepo import UserRepo
from repositories.StudentRepo import StudentRepo
from repositories.TeacherRepo import TeacherRepo
from models.Users import User
from models.Students import Student
from models.Teachers import Teacher
from schemas.User import StudentCreate, TeacherCreate, ChangePasswordRequest, StudentResponse, TeacherResponse
from enums.user_role import UserRole
from enums.status import UserStatus
from configs.db import get_db
from configs.db import SessionLocals
class UserService:
    @staticmethod
    def get_current_user(token: str = Depends(oauth2_scheme)) -> User:
        """
        Lấy thông tin User hiện tại. 
        Lưu ý: Vì bảng users được nhân bản, ta có thể check ở bất kỳ Site nào.
        Mặc định dùng Hà Đông để tra cứu.
        """
        token_data = AuthService.verify_token(token)
        # Bắt đầu session tạm tại Hà Đông để xác thực user
        db = SessionLocals["HADONG"]()
        try:
            user = UserRepo.get_by_username(db, token_data.username)
            if user is None:
                raise HTTPException(
                    status_code=status.HTTP_401_UNAUTHORIZED,
                    detail="User not found",
                    headers={"WWW-Authenticate": "Bearer"},
                )
            return user
        finally:
            db.close()

    @staticmethod
    async def create_student(student_in: StudentCreate, current_user: User) -> StudentResponse:
        if current_user.role != UserRole.Admin:
            raise HTTPException(status_code=status.HTTP_403_FORBIDDEN, detail="Only Admin can create students")

        sessions = {site: session_factory() for site, session_factory in SessionLocals.items()}
        
        try:
            # 1. Kiểm tra tồn tại (Chỉ cần check tại HADONG)
            if UserRepo.get_by_username(sessions["HADONG"], student_in.MaSV):
                raise HTTPException(status_code=400, detail=f"Username '{student_in.MaSV}' already exists")
            
            # Kiểm tra Email duy nhất (nếu có email)
            email_to_check = student_in.email
            if email_to_check and email_to_check.lower() == "string": # Xử lý Swagger default
                email_to_check = None
                
            if email_to_check and UserRepo.get_by_email(sessions["HADONG"], email_to_check):
                raise HTTPException(status_code=400, detail=f"Email '{email_to_check}' is already in use")

            # 2. Kiểm tra tồn tại ở Local (Bảng hồ sơ)
            db_local = sessions.get(student_in.MaCoSo)
            if not db_local:
                raise HTTPException(status_code=400, detail=f"Invalid MaCoSo: {student_in.MaCoSo}")
                
            if StudentRepo.get_by_MaSV(db_local, student_in.MaSV):
                raise HTTPException(status_code=400, detail="Student ID (MaSV) already exists")

            user_id = str(uuid.uuid4())
            hashed_password = AuthService.get_password_hash(student_in.MaSV)
            
            # 3. Tạo User tại TẤT CẢ các site (Replication)
            db_user_data = {
                "userId": user_id,
                "username": student_in.MaSV,
                "password": hashed_password,
                "role": UserRole.SinhVien,
                "email": email_to_check,
                "MaCoSo": student_in.MaCoSo,
                "status": UserStatus.Active
            }
            
            # Lưu user vào 3 DB
            for site_name, session in sessions.items():
                new_user = User(**db_user_data)
                session.add(new_user)

            # 4. Tạo Hồ sơ tại DB Local duy nhất (Sharding)
            db_student = Student(
                MaSV=student_in.MaSV,
                userId=user_id,
                Ho=student_in.Ho,
                Ten=student_in.Ten,
                NgaySinh=student_in.NgaySinh,
                GioiTinh=student_in.GioiTinh,
                SDT=student_in.SDT,
                DiaChi=student_in.DiaChi,
                TrangThai=student_in.TrangThai,
                MaCoSo=student_in.MaCoSo,
                MaKhoa=student_in.MaKhoa,
                NgayNhapHoc=date.today()
            )
            db_local.add(db_student)

            # 5. Commit tất cả các site
            for session in sessions.values():
                session.commit()
            
            # Refresh để lấy dữ liệu đã save (từ site local)
            db_local.refresh(db_student)
            
            # Chuyển đổi sang Response Schema ngay khi session còn mở (tránh lazy load error)
            return StudentResponse.model_validate(db_student)

        except Exception as e:
            # Rollback tất cả nếu có bất kỳ lỗi nào xảy ra
            for session in sessions.values():
                session.rollback()
            
            from sqlalchemy.exc import IntegrityError
            if isinstance(e, IntegrityError):
                raise HTTPException(status_code=400, detail=f"Database integrity error: {str(e.orig)}")
            if isinstance(e, HTTPException): raise e
            raise HTTPException(status_code=500, detail=f"Distributed write failed: {str(e)}")
        finally:
            for session in sessions.values():
                session.close()

    @staticmethod
    async def create_teacher(teacher_in: TeacherCreate, current_user: User) -> TeacherResponse:
        if current_user.role != UserRole.Admin:
            raise HTTPException(status_code=status.HTTP_403_FORBIDDEN, detail="Only Admin can create teachers")

        from configs.db import SessionLocals
        sessions = {site: session_factory() for site, session_factory in SessionLocals.items()}

        try:
            # 1. Kiểm tra tồn tại
            if UserRepo.get_by_username(sessions["HADONG"], teacher_in.MaGV):
                raise HTTPException(status_code=400, detail=f"Username '{teacher_in.MaGV}' already exists")
            
            # Kiểm tra Email duy nhất
            email_to_check = teacher_in.email
            if email_to_check and email_to_check.lower() == "string":
                email_to_check = None

            if email_to_check and UserRepo.get_by_email(sessions["HADONG"], email_to_check):
                raise HTTPException(status_code=400, detail=f"Email '{email_to_check}' is already in use")

            db_local = sessions.get(teacher_in.MaCoSo)
            if not db_local:
                raise HTTPException(status_code=400, detail=f"Invalid MaCoSo: {teacher_in.MaCoSo}")

            if TeacherRepo.get_by_MaGV(db_local, teacher_in.MaGV):
                raise HTTPException(status_code=400, detail="Teacher ID (MaGV) already exists")

            user_id = str(uuid.uuid4())
            hashed_password = AuthService.get_password_hash(teacher_in.MaGV)
            
            # 3. Tạo User tại TẤT CẢ các site (Replication)
            db_user_data = {
                "userId": user_id,
                "username": teacher_in.MaGV,
                "password": hashed_password,
                "role": UserRole.GiangVien,
                "email": email_to_check,
                "MaCoSo": teacher_in.MaCoSo,
                "status": UserStatus.Active
            }
            
            for session in sessions.values():
                new_user = User(**db_user_data)
                session.add(new_user)

            # 4. Tạo Hồ sơ tại DB Local (Sharding)
            db_teacher = Teacher(
                MaGV=teacher_in.MaGV,
                userId=user_id,
                Ho=teacher_in.Ho,
                Ten=teacher_in.Ten,
                # email không phải là cột thực tế trong bảng GiangVien
                NgaySinh=teacher_in.NgaySinh,
                GioiTinh=teacher_in.GioiTinh,
                SDT=teacher_in.SDT,
                DiaChi=teacher_in.DiaChi,
                HocVi=teacher_in.HocVi,
                HocHam=teacher_in.HocHam,
                TrangThai=teacher_in.TrangThai,
                MaCoSo=teacher_in.MaCoSo,
                MaKhoa=teacher_in.MaKhoa,
                NgayVaoLam=date.today()
            )
            db_local.add(db_teacher)

            # 5. Commit tất cả
            for session in sessions.values():
                session.commit()
            
            db_local.refresh(db_teacher)
            return TeacherResponse.model_validate(db_teacher)

        except Exception as e:
            for session in sessions.values():
                session.rollback()
            
            from sqlalchemy.exc import IntegrityError
            if isinstance(e, IntegrityError):
                raise HTTPException(status_code=400, detail=f"Database integrity error: {str(e.orig)}")
            if isinstance(e, HTTPException): raise e
            raise HTTPException(status_code=500, detail=f"Distributed write failed: {str(e)}")
        finally:
            for session in sessions.values():
                session.close()

    @staticmethod
    def get_current_active_user(current_user: User = Depends(get_current_user)) -> User:
        from enums.status import UserStatus
        if current_user.status != UserStatus.Active:
            raise HTTPException(status_code=status.HTTP_400_BAD_REQUEST, detail="Inactive user")
        return current_user

    @staticmethod
    async def get_user_profile(user: User):
        """Lấy profile đầy đủ của User từ đúng site mà user trực thuộc"""
        db_site = SessionLocals[user.MaCoSo]()
        try:
            if user.role == UserRole.SinhVien:
                profile = StudentRepo.get_by_userId(db_site, user.userId)
                if profile: return StudentResponse.model_validate(profile)
            elif user.role == UserRole.GiangVien:
                profile = TeacherRepo.get_by_userId(db_site, user.userId)
                if profile: return TeacherResponse.model_validate(profile)
            return user
        finally:
            db_site.close()

    @staticmethod
    async def change_password(user: User, request: ChangePasswordRequest):
        sessions = {site: Session() for site, Session in SessionLocals.items()}
        
        try:
            if not AuthService.verify_password(request.old_password, user.password):
                raise HTTPException(
                    status_code=status.HTTP_400_BAD_REQUEST,
                    detail="Mật khẩu cũ không chính xác"
                )
            
            new_hashed_password = AuthService.get_password_hash(request.new_password)
            
            # Cập nhật ở tất cả các site
            for session in sessions.values():
                db_user = UserRepo.get_by_id(session, user.userId)
                if db_user:
                    db_user.password = new_hashed_password
                    session.commit()
            
            return {"message": "Password changed successfully across all sites"}
        except Exception as e:
            for session in sessions.values():
                session.rollback()
            if isinstance(e, HTTPException): raise e
            raise HTTPException(status_code=500, detail=f"Distributed update failed: {str(e)}")
        finally:
            for session in sessions.values():
                session.close()