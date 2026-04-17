from sqlalchemy import Column, String, Date

from configs.db import Base

class Branch(Base):
    # Viet
    __tablename__ = 'CoSo'

    MaCoSo = Column(String, primary_key=True, index=True)
    TenCoSo = Column(String, nullable=False)
    DiaChi = Column(String, nullable=True)
    SoDienThoai = Column(String, nullable=True)
    Email = Column(String, nullable=True)
    NgayThanhLap = Column(Date, nullable=True)
    TrangThai = Column(String, nullable=True)
    def __repr__(self):
        return f"<Branch(MaCoSo='{self.MaCoSo}', TenCoSo='{self.TenCoSo}')>"
    # Trung
    # __tablename__ = 'CoSo'
    # MaCoSo = Column(String, primary_key=True, index=True)
    # TenCoSo = Column(String, nullable=False, unique=True)
    # DiaChi = Column(String, nullable=False)
    # SoDienThoai = Column(String, nullable=True)
    # Email = Column(String, nullable=True)
    # NgayThanhLap = Column(Date)
    # TrangThai = Column(String, default='HoatDong')
