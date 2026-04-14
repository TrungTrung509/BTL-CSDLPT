import uuid
from fastapi import HTTPException, status
from sqlalchemy.orm import Session

from models.Users import User
from models.Departments import Departments
from schemas.Department import DepartmentCreate
from repositories.DepartmentRepo import DepartmentRepo
from enums.user_role import UserRole

class DepartmentService:
    @staticmethod
    async def create_department(db: Session, dept_in: DepartmentCreate, current_user: User) -> Departments:
        # 1. Admin Check
        if current_user.role != UserRole.Admin:
            raise HTTPException(
                status_code=status.HTTP_403_FORBIDDEN,
                detail="Only Admin can create departments"
            )

        # 2. Duplicate Check
        if DepartmentRepo.get_by_MaKhoa(db, dept_in.MaKhoa):
            raise HTTPException(status_code=400, detail="Department code (MaKhoa) already exists")
        
        # 3. Create
        db_dept = Departments(
            MaKhoa=dept_in.MaKhoa,
            TenKhoa=dept_in.TenKhoa,
            MoTa=dept_in.MoTa,
            NgayThanhLap=dept_in.NgayThanhLap,
            TrangThai=dept_in.TrangThai
        )
        return DepartmentRepo.create(db, db_dept)
