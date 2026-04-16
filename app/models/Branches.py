from sqlalchemy import Column, String, Date
from configs.db import Base

class Branch(Base):
    __tablename__ = 'coso'

    id = Column(String, primary_key=True, index=True)
    MaCoSo = Column(String, nullable=False, unique=True, index=True)
    TenCoSo = Column(String, nullable=False)
    DiaChi = Column(String)
    Email = Column(String)
    SoDienThoai = Column(String)
    NgayTao = Column(Date)

    def __repr__(self):
        return f"<Branch(MaCoSo='{self.MaCoSo}', TenCoSo='{self.TenCoSo}')>"