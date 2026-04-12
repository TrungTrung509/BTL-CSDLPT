import enum
from sqlalchemy import Column, String, ForeignKey, Enum
from sqlalchemy.orm import relationship
from sqlalchemy.ext.associationproxy import association_proxy

from configs.db import Base
from enums.status import TeacherStatus

class Teacher(Base):
    __tablename__ = "teachers"
    id = Column(String, primary_key=True, index=True)
    maGV = Column(String, nullable=False, unique=True)
    degree = Column(String, nullable=False)
    teacher_status = Column(Enum(TeacherStatus), nullable=False)
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
