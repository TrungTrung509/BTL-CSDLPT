from sqlalchemy import Column, String, Date

from configs.db import Base


class Departments(Base):
    __tablename__ = 'Khoa'
    MaKhoa = Column(String, primary_key=True, index=True)
    TenKhoa = Column(String, nullable=False, unique=True)
    MoTa = Column(String, nullable=True)
    NgayThanhLap = Column(Date)
    TrangThai = Column(String, default='HoatDong')