from sqlalchemy import Column, String, ForeignKey, Enum, Date, DateTime
from sqlalchemy.orm import relationship
from sqlalchemy.ext.associationproxy import association_proxy
from datetime import datetime

from configs.db import Base
from enums.status import TeacherStatus
from enums.gender import Genders

class Teacher(Base):
    __tablename__ = "GiangVien"
    MaGV = Column(String, primary_key=True, index=True)
    userId = Column(String, ForeignKey("users.userId"), unique=True)
    Ho = Column(String, nullable=False)
    Ten = Column(String, nullable=False)
    NgaySinh = Column(Date)
    GioiTinh = Column(Enum(Genders), default=Genders.Khac)
    SDT = Column(String)
    DiaChi = Column(String)
    HocVi = Column(String, nullable=True)
    HocHam = Column(String, nullable=True)
    MaCoSo = Column(String, ForeignKey("CoSo.MaCoSo"), default="HADONG")
    MaKhoa = Column(String, ForeignKey("Khoa.MaKhoa"))
    TrangThai = Column(Enum(TeacherStatus), default=TeacherStatus.DangCongTac)
    NgayVaoLam = Column(Date)
    NgayTao = Column(DateTime, default=datetime.utcnow)

    user = relationship("User")
    # branch = relationship("Branch")
    # department = relationship("Departments")

    # Remaining Proxies to User model
    username = association_proxy("user", "username")
    email = association_proxy("user", "email")
    status = association_proxy("user", "status")
    role = association_proxy("user", "role")
