import enum
from sqlalchemy import Column, String, Date, ForeignKey, Enum
from sqlalchemy.orm import relationship
from configs.db import Base
from enums.gender import Genders
from enums.status import StudentStatus

class Student(Base):
    __tablename__ = "sinhvien"

    id = Column(String, primary_key=True, index=True)
    MaSV = Column(String, nullable=False, unique=True, index=True)
    Ho = Column(String, nullable=False)
    Ten = Column(String, nullable=False)
    NgaySinh = Column(Date, nullable=False)
    GioiTinh = Column(Enum(Genders), nullable=False)
    Email = Column(String, unique=True)
    SoDienThoai = Column(String)
    DiaChi = Column(String)
    MaCoSo = Column(String, nullable=False, index=True)
    MaKhoa = Column(String, index=True)
    TrangThai = Column(Enum(StudentStatus), default=StudentStatus.Active)
    NgayNhapHoc = Column(Date)
    NgayTao = Column(Date)

    # Relationship with User (account)
    user_id = Column(String, ForeignKey("users.id"), unique=True)
    user = relationship("User", back_populates="student")

    # Relationships with Campus and Department (reference tables)
    # Note: These use MaCoSo/MaKhoa for distributed DB pattern
    # For distributed setup, this can be managed via site-specific queries

    def __repr__(self):
        return f"<Student(MaSV='{self.MaSV}', Ho='{self.Ho}', Ten='{self.Ten}')>"