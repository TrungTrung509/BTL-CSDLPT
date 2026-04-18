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
from sqlalchemy.orm import Session
from schemas.Student import StudentResponse
from schemas.Teacher import TeacherResponse
from schemas.User import ChangePasswordRequest
from services.AuthService import AuthService
class UserService:
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
