from sqlalchemy import Column, String

from configs.db import Base


class Branch(Base):
    __tablename__ = 'branches'
    id = Column(String, primary_key=True,index=True)
    MaCoSo= Column(String, nullable=False,unique=True)
    name = Column(String,nullable=False,unique=True)
    address = Column(String,nullable=False)
    phone = Column(String,nullable=False)
    email = Column(String,nullable=False)