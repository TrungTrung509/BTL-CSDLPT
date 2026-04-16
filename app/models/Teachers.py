import enum
from sqlalchemy import Column, String, Date, ForeignKey, Enum
from sqlalchemy.orm import relationship
from configs.db import Base
from enums.status import TeacherStatus

class Teacher(Base):
    __tablename__ = "giangvien"

    id = Column(String, primary_key=True, index=True)
    MaGV = Column(String, nullable=False, unique=True, index=True)
    Ho = Column(String, nullable=False)
    Ten = Column(String, nullable=False)
    HocVi = Column(String)
    HocHam = Column(String)
    Email = Column(String, unique=True)
    SoDienThoai = Column(String)
    MaCoSo = Column(String, nullable=False, index=True)
    MaKhoa = Column(String, index=True)
    TrangThai = Column(Enum(TeacherStatus), default=TeacherStatus.Active)
    NgayVaoLam = Column(Date)
    NgayTao = Column(Date)

    # Relationship with User (account)
    user_id = Column(String, ForeignKey("users.id"), unique=True)
    user = relationship("User")

    def __repr__(self):
        return f"<Teacher(MaGV='{self.MaGV}', Ho='{self.Ho}', Ten='{self.Ten}')>"
