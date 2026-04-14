from sqlalchemy import create_engine
from sqlalchemy.orm import sessionmaker
from sqlalchemy.ext.declarative import declarative_base
import os
from configs.config import HADONG_URL, HOALAC_URL, NGOCTRUC_URL

# MAPPING ENGINES
engines = {
    "HADONG": create_engine(HADONG_URL),
    "HOALAC": create_engine(HOALAC_URL),
    "NGOCTRUC": create_engine(NGOCTRUC_URL),
}

# MAPPING SESSION MAKERS
SessionLocals = {
    k: sessionmaker(autocommit=False, autoflush=False, bind=v, expire_on_commit=False)
    for k, v in engines.items()
}

Base = declarative_base()

def get_db(branch_id: str = "HADONG"):
    """
    Hàm lấy session database dựa trên mã cơ sở.
    Mặc định là HADONG (Publisher).
    """
    if branch_id not in SessionLocals:
        # Fallback to default if branch_id is invalid
        branch_id = "HADONG"
        
    db = SessionLocals[branch_id]()
    try:
        yield db
    finally:
        db.close()