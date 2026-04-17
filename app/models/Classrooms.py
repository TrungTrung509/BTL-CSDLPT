from datetime import datetime

from sqlalchemy import Column, DateTime, ForeignKey, Integer, String

from configs.db import Base


class Classroom(Base):
    __tablename__ = "PhongHoc"

    MaPhong = Column(String, primary_key=True, index=True)
    TenPhong = Column(String, nullable=False)
    ToaNha = Column(String, nullable=True)
    Tang = Column(Integer, nullable=True)
    SucChua = Column(Integer, nullable=False)
    LoaiPhong = Column(String, nullable=False, default="LyThuyet")
    MaCoSo = Column(String, ForeignKey("CoSo.MaCoSo"), nullable=False)
    TrangThai = Column(String, nullable=False, default="HoatDong")
    NgayTao = Column(DateTime, default=datetime.utcnow, nullable=False)
