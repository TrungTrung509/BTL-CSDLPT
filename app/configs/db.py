from fastapi import HTTPException, status
from sqlalchemy import create_engine
from sqlalchemy.ext.declarative import declarative_base
from sqlalchemy.orm import Session, sessionmaker

from configs.config import HADONG_URL, HOALAC_URL, NGOCTRUC_URL

# MAPPING ENGINES
engines = {
    "HADONG": create_engine(HADONG_URL, echo=True),
    "HOALAC": create_engine(HOALAC_URL, echo=True),
    "NGOCTRUC": create_engine(NGOCTRUC_URL, echo=True),
}

# MAPPING SESSION MAKERS
SessionLocals = {
    site: sessionmaker(autocommit=False, autoflush=False, bind=engine, expire_on_commit=False)
    for site, engine in engines.items()
}

Base = declarative_base()


def open_db_by_branch(branch_id: str) -> Session:
    branch_id = (branch_id or "").upper()

    if branch_id not in SessionLocals:
        raise HTTPException(
            status_code=status.HTTP_400_BAD_REQUEST,
            detail=f"MaCoSo khong hop le: {branch_id}",
        )

    return SessionLocals[branch_id]()


def get_db():
    db = SessionLocals["HADONG"]()
    try:
        yield db
    finally:
        db.close()
