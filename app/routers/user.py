from fastapi import APIRouter, Depends, status
from sqlalchemy.orm import Session
from typing import Union
from services.UserService import UserService
from models.Users import User
from schemas.User import (
    StudentCreate, 
    TeacherCreate, 
    StudentResponse, 
    TeacherResponse, 
    UserResponse,
    ChangePasswordRequest
)
from configs.db import get_db

router = APIRouter(
    prefix="/users",
    tags=["Users"]
)

@router.get("/me", response_model=Union[StudentResponse, TeacherResponse, UserResponse])
async def read_users_me(
    db: Session = Depends(get_db),
    current_user: User = Depends(UserService.get_current_user)
):
    return await UserService.get_user_profile(db, current_user)

@router.put("/change-password")
async def change_password(
    request: ChangePasswordRequest,
    db: Session = Depends(get_db),
    current_user: User = Depends(UserService.get_current_user)
):
    return await UserService.change_password(db, current_user, request)

@router.post("/students", response_model=StudentResponse, status_code=status.HTTP_201_CREATED)
async def create_student(
    student_in: StudentCreate,
    db: Session = Depends(get_db),
    current_user: User = Depends(UserService.get_current_active_user)
):
    return await UserService.create_student(db, student_in, current_user)

@router.post("/teachers", response_model=TeacherResponse, status_code=status.HTTP_201_CREATED)
async def create_teacher(
    teacher_in: TeacherCreate,
    db: Session = Depends(get_db),
    current_user: User = Depends(UserService.get_current_active_user)
):
    return await UserService.create_teacher(db, teacher_in, current_user)
