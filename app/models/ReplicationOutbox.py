from datetime import datetime

from sqlalchemy import Column, DateTime, Integer, String, Text

from configs.db import Base


class ReplicationOutbox(Base):
    __tablename__ = "ReplicationOutbox"

    EventId = Column(Integer, primary_key=True, autoincrement=True, index=True)
    EntityType = Column(String(50), nullable=False)
    EntityId = Column(String(50), nullable=False, index=True)
    Operation = Column(String(20), nullable=False)
    Payload = Column(Text, nullable=False)
    SourceSite = Column(String(20), nullable=False)
    TargetSite = Column(String(20), nullable=False, index=True)
    Status = Column(String(20), nullable=False, default="PENDING", index=True)
    RetryCount = Column(Integer, nullable=False, default=0)
    LastError = Column(Text, nullable=True)
    CreatedAt = Column(DateTime, nullable=False, default=datetime.utcnow)
    UpdatedAt = Column(
        DateTime,
        nullable=False,
        default=datetime.utcnow,
        onupdate=datetime.utcnow,
    )
    ProcessedAt = Column(DateTime, nullable=True)

