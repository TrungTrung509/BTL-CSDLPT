import uuid
from fastapi import HTTPException, status, Depends
from sqlalchemy.orm import Session

from configs.config import oauth2_scheme
from services.AuthService import AuthService
from repositories.UserRepo import UserRepo
from repositories.StudentRepo import StudentRepo
from repositories.TeacherRepo import TeacherRepo
from models.Users import User
from models.Students import Student
from models.Teachers import Teacher
from schemas.User import StudentCreate, TeacherCreate, ChangePasswordRequest
from enums.user_role import UserRole
from configs.db import get_db

class UserService:
    @staticmethod
    def get_current_user(token: str = Depends(oauth2_scheme), db: Session = Depends(get_db)) -> User:
        token_data = AuthService.verify_token(token)
        user = UserRepo.get_by_username(db, token_data.username)
        
        if user is None:
            raise HTTPException(
                status_code=status.HTTP_401_UNAUTHORIZED,
                detail="User not found",
                headers={"WWW-Authenticate": "Bearer"},
            )
        return user

    @staticmethod
    def get_current_active_user(current_user: User = Depends(get_current_user)) -> User:
        if current_user.status != "Active":
            raise HTTPException(status_code=status.HTTP_400_BAD_REQUEST, detail="Inactive user")
        return current_user

    @staticmethod
    async def create_student(db: Session, student_in: StudentCreate, current_user: User) -> Student:
        if current_user.role != UserRole.Admin:
            raise HTTPException(
                status_code=status.HTTP_403_FORBIDDEN,
                detail="Only Admin can create students"
            )

        username_and_pwd = student_in.maSV

        if UserRepo.get_by_username(db, username_and_pwd):
            raise HTTPException(status_code=400, detail=f"Username '{username_and_pwd}' already exists")
        
        if StudentRepo.get_by_maSV(db, student_in.maSV):
            raise HTTPException(status_code=400, detail="Student ID (maSV) already exists")

        user_id = str(uuid.uuid4())
        hashed_password = AuthService.get_password_hash(username_and_pwd)
        
        db_user = User(
            id=user_id,
            username=username_and_pwd,
            password_hash=hashed_password,
            role=UserRole.Student,
            email=student_in.email,
            name=student_in.name,
            phone=student_in.phone,
            date_of_birth=student_in.date_of_birth,
            status=student_in.status
        )
        UserRepo.create(db, db_user)

        db_student = Student(
            id=user_id,
            maSV=student_in.maSV,
            gender=student_in.gender,
            student_status=student_in.student_status,
            user_id=user_id,
            branch_id=student_in.branch_id,
            department_id=student_in.department_id
        )
        return StudentRepo.create(db, db_student)

    @staticmethod
    async def create_teacher(db: Session, teacher_in: TeacherCreate, current_user: User) -> Teacher:
        if current_user.role != UserRole.Admin:
            raise HTTPException(
                status_code=status.HTTP_403_FORBIDDEN,
                detail="Only Admin can create teachers"
            )

        username_and_pwd = teacher_in.maGV

        if UserRepo.get_by_username(db, username_and_pwd):
            raise HTTPException(status_code=400, detail=f"Username '{username_and_pwd}' already exists")
        
        if TeacherRepo.get_by_maGV(db, teacher_in.maGV):
            raise HTTPException(status_code=400, detail="Teacher ID (maGV) already exists")

        user_id = str(uuid.uuid4())
        hashed_password = AuthService.get_password_hash(username_and_pwd)
        
        db_user = User(
            id=user_id,
            username=username_and_pwd,
            password_hash=hashed_password,
            role=UserRole.Teacher,
            email=teacher_in.email,
            name=teacher_in.name,
            phone=teacher_in.phone,
            date_of_birth=teacher_in.date_of_birth,
            status=teacher_in.status
        )
        UserRepo.create(db, db_user)

        db_teacher = Teacher(
            id=user_id,
            maGV=teacher_in.maGV,
            degree=teacher_in.degree,
            teacher_status=teacher_in.teacher_status,
            user_id=user_id,
            branch_id=teacher_in.branch_id,
            department_id=teacher_in.department_id
        )
        return TeacherRepo.create(db, db_teacher)

    @staticmethod
    async def get_user_profile(db: Session, user: User):
        if user.role == UserRole.Student:
            profile = StudentRepo.get_by_id(db, user.id)
            if profile: return profile
        elif user.role == UserRole.Teacher:
            profile = TeacherRepo.get_by_id(db, user.id)
            if profile: return profile
        
        return user

    @staticmethod
    async def change_password(db: Session, user: User, request: ChangePasswordRequest):
        if not AuthService.verify_password(request.old_password, user.password_hash):
            raise HTTPException(
                status_code=status.HTTP_400_BAD_REQUEST,
                detail="Mật khẩu cũ không chính xác"
            )
        
        user.password_hash = AuthService.get_password_hash(request.new_password)
        return UserRepo.update(db, user)