from datetime import datetime
from sqlalchemy import Column, DateTime, ForeignKey, Integer, String, Enum
from configs.db import Base
from enums.status import EnrollmentAction, LogStatus

class EnrollmentLog(Base):
    __tablename__ = "DangKy_Log"

    LogId = Column(Integer, primary_key=True, index=True, autoincrement=True)
    userId = Column(String, ForeignKey("users.userId"), nullable=False)
    MaLopHP = Column(String, nullable=False)
    MaHP = Column(String, nullable=False)
    Action = Column(Enum(EnrollmentAction), nullable=False)
    TargetSite = Column(String, nullable=False) # Cơ sở nơi thực hiện đăng ký
    Status = Column(Enum(LogStatus), default=LogStatus.SUCCESS)
    Message = Column(String, nullable=True) # Lý do nếu thất bại
    Timestamp = Column(DateTime, default=datetime.utcnow, nullable=False)
    