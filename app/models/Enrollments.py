from datetime import datetime

from sqlalchemy import Column, DateTime, ForeignKey, Integer, String, UniqueConstraint

from configs.db import Base


class Enrollment(Base):
    __tablename__ = "DangKy"
    __table_args__ = (UniqueConstraint("MaSV", "MaLopHP", name="uq_dk_sv_lophp"),)

    MaDangKy = Column(Integer, primary_key=True, index=True, autoincrement=True)
    MaSV = Column(String, ForeignKey("SinhVien.MaSV"), nullable=False)
    MaLopHP = Column(String, ForeignKey("LopHocPhan.MaLopHP"), nullable=False)
    NgayDangKy = Column(DateTime, default=datetime.utcnow, nullable=False)
    TrangThaiDangKy = Column(String, nullable=False, default="DaDangKy")
    LanDangKy = Column(Integer, nullable=False, default=1)
    GhiChu = Column(String, nullable=True)
