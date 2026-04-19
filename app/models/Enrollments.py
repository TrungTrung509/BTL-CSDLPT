from datetime import datetime

from sqlalchemy import Column, DateTime, ForeignKey, Integer, String, UniqueConstraint, Enum
from configs.db import Base
from enums.status import EnrollmentStatus


class Enrollment(Base):
    __tablename__ = "DangKy"
    __table_args__ = (UniqueConstraint("MaSV", "MaHP", "MaHocKy", name="uq_dk_sv_hp_hk"),)

    MaDangKy = Column(Integer, primary_key=True, index=True, autoincrement=True)
    MaSV = Column(String, ForeignKey("SinhVien.MaSV"), nullable=False)
    MaLopHP = Column(String, ForeignKey("LopHocPhan.MaLopHP"), nullable=False)
    MaHP = Column(String, ForeignKey("HocPhan.MaHP"), nullable=False)
    MaHocKy = Column(String, ForeignKey("HocKy.MaHocKy"), nullable=False)
    MaLich = Column(String, ForeignKey("LichHoc.MaLich"), nullable=False)
    NgayDangKy = Column(DateTime, default=datetime.utcnow, nullable=False)
    TrangThaiDangKy = Column(Enum(EnrollmentStatus), nullable=False, default=EnrollmentStatus.DaDangKy)
    LanDangKy = Column(Integer, nullable=False, default=1)
    GhiChu = Column(String, nullable=True)
