import uuid
from datetime import date

from fastapi import HTTPException, status

from configs.db import SessionLocals
from enums.status import UserStatus
from enums.user_role import UserRole
from models.Students import Student
from models.Teachers import Teacher
from models.Users import User
from repositories.StudentRepo import StudentRepo
from repositories.TeacherRepo import TeacherRepo
from repositories.UserRepo import UserRepo
from schemas.User import (
    ChangePasswordRequest,
    StudentCreate,
    StudentResponse,
    TeacherCreate,
    TeacherResponse,
)
from services.AuthService import AuthService


class UserService:
    @staticmethod
    async def create_student(student_in: StudentCreate, current_user: User) -> StudentResponse:
        if current_user.role != UserRole.Admin:
            raise HTTPException(status_code=status.HTTP_403_FORBIDDEN, detail="Only Admin can create students")

        sessions = {site: session_factory() for site, session_factory in SessionLocals.items()}

        try:
            if UserRepo.get_by_username(sessions["HADONG"], student_in.MaSV):
                raise HTTPException(status_code=400, detail=f"Username '{student_in.MaSV}' already exists")

            email_to_check = student_in.email
            if email_to_check and email_to_check.lower() == "string":
                email_to_check = None

            if email_to_check and UserRepo.get_by_email(sessions["HADONG"], email_to_check):
                raise HTTPException(status_code=400, detail=f"Email '{email_to_check}' is already in use")

            db_local = sessions.get(student_in.MaCoSo)
            if not db_local:
                raise HTTPException(status_code=400, detail=f"Invalid MaCoSo: {student_in.MaCoSo}")

            if StudentRepo.get_by_MaSV(db_local, student_in.MaSV):
                raise HTTPException(status_code=400, detail="Student ID (MaSV) already exists")

            user_id = str(uuid.uuid4())
            hashed_password = AuthService.get_password_hash(student_in.MaSV)

            db_user_data = {
                "userId": user_id,
                "username": student_in.MaSV,
                "password": hashed_password,
                "role": UserRole.SinhVien,
                "email": email_to_check,
                "MaCoSo": student_in.MaCoSo,
                "status": UserStatus.Active,
            }

            for session in sessions.values():
                session.add(User(**db_user_data))

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
                NgayNhapHoc=date.today(),
            )
            db_local.add(db_student)

            for session in sessions.values():
                session.commit()

            db_local.refresh(db_student)
            return StudentResponse.model_validate(db_student)

        except Exception as e:
            for session in sessions.values():
                session.rollback()

            from sqlalchemy.exc import IntegrityError

            if isinstance(e, IntegrityError):
                raise HTTPException(status_code=400, detail=f"Database integrity error: {str(e.orig)}")
            if isinstance(e, HTTPException):
                raise e
            raise HTTPException(status_code=500, detail=f"Distributed write failed: {str(e)}")
        finally:
            for session in sessions.values():
                session.close()

    @staticmethod
    async def create_teacher(teacher_in: TeacherCreate, current_user: User) -> TeacherResponse:
        if current_user.role != UserRole.Admin:
            raise HTTPException(status_code=status.HTTP_403_FORBIDDEN, detail="Only Admin can create teachers")

        sessions = {site: session_factory() for site, session_factory in SessionLocals.items()}

        try:
            if UserRepo.get_by_username(sessions["HADONG"], teacher_in.MaGV):
                raise HTTPException(status_code=400, detail=f"Username '{teacher_in.MaGV}' already exists")

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

            db_user_data = {
                "userId": user_id,
                "username": teacher_in.MaGV,
                "password": hashed_password,
                "role": UserRole.GiangVien,
                "email": email_to_check,
                "MaCoSo": teacher_in.MaCoSo,
                "status": UserStatus.Active,
            }

            for session in sessions.values():
                session.add(User(**db_user_data))

            db_teacher = Teacher(
                MaGV=teacher_in.MaGV,
                userId=user_id,
                Ho=teacher_in.Ho,
                Ten=teacher_in.Ten,
                NgaySinh=teacher_in.NgaySinh,
                GioiTinh=teacher_in.GioiTinh,
                SDT=teacher_in.SDT,
                DiaChi=teacher_in.DiaChi,
                HocVi=teacher_in.HocVi,
                HocHam=teacher_in.HocHam,
                TrangThai=teacher_in.TrangThai,
                MaCoSo=teacher_in.MaCoSo,
                MaKhoa=teacher_in.MaKhoa,
                NgayVaoLam=date.today(),
            )
            db_local.add(db_teacher)

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
            if isinstance(e, HTTPException):
                raise e
            raise HTTPException(status_code=500, detail=f"Distributed write failed: {str(e)}")
        finally:
            for session in sessions.values():
                session.close()

    @staticmethod
    async def get_user_profile(user: User):
        db_site = SessionLocals[user.MaCoSo]()
        try:
            if user.role == UserRole.SinhVien:
                profile = StudentRepo.get_by_userId(db_site, user.userId)
                if profile:
                    return StudentResponse.model_validate(profile)
            elif user.role == UserRole.GiangVien:
                profile = TeacherRepo.get_by_userId(db_site, user.userId)
                if profile:
                    return TeacherResponse.model_validate(profile)
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
                    detail="Mat khau cu khong chinh xac",
                )

            new_hashed_password = AuthService.get_password_hash(request.new_password)

            for session in sessions.values():
                db_user = UserRepo.get_by_id(session, user.userId)
                if db_user:
                    db_user.password = new_hashed_password
                    session.commit()

            return {"message": "Password changed successfully across all sites"}
        except Exception as e:
            for session in sessions.values():
                session.rollback()
            if isinstance(e, HTTPException):
                raise e
            raise HTTPException(status_code=500, detail=f"Distributed update failed: {str(e)}")
        finally:
            for session in sessions.values():
                session.close()
