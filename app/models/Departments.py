from sqlalchemy import Column, String

from configs.db import Base


class Departments(Base):
    __tablename__ = 'departments'
    id = Column(String, primary_key=True,index=True)
    name = Column(String,nullable=False)
    maKhoa = Column(String,nullable=False,unique=True)
    description = Column(String,nullable=False)