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
        if DepartmentRepo.get_by_maKhoa(db, dept_in.maKhoa):
            raise HTTPException(status_code=400, detail="Department code (maKhoa) already exists")
        
        # 3. Create
        db_dept = Departments(
            id=str(uuid.uuid4()),
            maKhoa=dept_in.maKhoa,
            name=dept_in.name,
            description=dept_in.description
        )
        return DepartmentRepo.create(db, db_dept)
