from sqlalchemy import Column, String, ForeignKey, UniqueConstraint
from configs.db import Base

class Prerequisite(Base):
    __tablename__ = "DieuKienTienQuyet"

    MaHP = Column(String, ForeignKey("HocPhan.MaHP"), primary_key=True)
    MaHP_TienQuyet = Column(String, ForeignKey("HocPhan.MaHP"), primary_key=True)

    __table_args__ = (
        UniqueConstraint("MaHP", "MaHP_TienQuyet", name="uq_tienquyet_mahp"),
    )

    def __repr__(self):
        return f"<Prerequisite(MaHP='{self.MaHP}', MaHP_TienQuyet='{self.MaHP_TienQuyet}')>"
