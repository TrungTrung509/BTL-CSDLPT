from fastapi import HTTPException, status
from sqlalchemy import create_engine
from sqlalchemy.ext.declarative import declarative_base
from sqlalchemy.orm import Session, sessionmaker

from configs.config import HADONG_URL, HOALAC_URL, NGOCTRUC_URL

ENGINE_KWARGS = {
    "pool_pre_ping": True,
}

POSTGRES_CONNECT_ARGS = {
    "connect_timeout": 3,
}


def _create_site_engine(db_url: str):
    if db_url.startswith("postgresql"):
        return create_engine(db_url, connect_args=POSTGRES_CONNECT_ARGS, **ENGINE_KWARGS)
    return create_engine(db_url, **ENGINE_KWARGS)


# MAPPING ENGINES
engines = {
    "HADONG": _create_site_engine(HADONG_URL),
    "HOALAC": _create_site_engine(HOALAC_URL),
    "NGOCTRUC": _create_site_engine(NGOCTRUC_URL),
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
    from services.FailoverService import FailoverService

    db = FailoverService.open_read_session(auto_failover=True)
    try:
        yield db
    finally:
        db.close()
