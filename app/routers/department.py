from fastapi import APIRouter, Depends, status
from sqlalchemy.orm import Session

from configs.db import get_db
from schemas.Department import DepartmentCreate, DepartmentResponse
from services.DepartmentService import DepartmentService
from services.UserService import UserService
from models.Users import User

router = APIRouter(
    prefix="/departments",
    tags=["Departments"]
)

@router.post("/", response_model=DepartmentResponse, status_code=status.HTTP_201_CREATED)
async def create_department(
    dept_in: DepartmentCreate,
    db: Session = Depends(get_db),
    current_user: User = Depends(UserService.get_current_active_user)
):
    return await DepartmentService.create_department(db, dept_in, current_user)
