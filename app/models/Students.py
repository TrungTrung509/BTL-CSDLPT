import enum
from sqlalchemy import Column, String, ForeignKey, Enum
from sqlalchemy.orm import relationship
from sqlalchemy.ext.associationproxy import association_proxy

from configs.db import Base
from enums.gender import Genders
from enums.status import StudentStatus

class Student(Base):
    __tablename__ = "students"
    id = Column(String, primary_key=True, index=True)
    maSV = Column(String, nullable=False, unique=True)
    gender = Column(Enum(Genders), nullable=False)
    student_status = Column(Enum(StudentStatus), nullable=False)
    user_id = Column(String, ForeignKey("users.id"), unique=True)
    user = relationship("User")
    branch_id = Column(String, ForeignKey("branches.id"))
    branch = relationship("Branch")
    department_id = Column(String, ForeignKey("departments.id"))
    department = relationship("Departments")

    # Proxies to User model
    username = association_proxy("user", "username")
    email = association_proxy("user", "email")
    name = association_proxy("user", "name")
    phone = association_proxy("user", "phone")
    date_of_birth = association_proxy("user", "date_of_birth")
    status = association_proxy("user", "status")
    role = association_proxy("user", "role")