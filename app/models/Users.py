from sqlalchemy import Column, String, Enum
from configs.db import Base
from enums.user_role import UserRole
from enums.status import UserStatus

class User(Base):
    __tablename__ = "users"

    userId = Column(String, primary_key=True, index=True)
    username = Column(String, unique=True, nullable=False)
    password = Column(String, nullable=False)
    role = Column(Enum(UserRole), nullable=False)
    email = Column(String, nullable=True)
    MaCoSo = Column(String, nullable=False)
    status = Column(Enum(UserStatus), default=UserStatus.Active)