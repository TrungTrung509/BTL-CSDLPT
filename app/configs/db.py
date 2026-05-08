from fastapi import HTTPException, status
from sqlalchemy import create_engine
from sqlalchemy.ext.declarative import declarative_base
from sqlalchemy.orm import Session, sessionmaker

from configs.config import HADONG_URL, HOALAC_URL, NGOCTRUC_URL

# MAPPING ENGINES
engines = {
    "HADONG": create_engine(HADONG_URL),
    "HOALAC": create_engine(HOALAC_URL),
    "NGOCTRUC": create_engine(NGOCTRUC_URL),
}

# MAPPING SESSION MAKERS
SessionLocals = {
    site: sessionmaker(autocommit=False, autoflush=False, bind=engine, expire_on_commit=False)
    for site, engine in engines.items()
}

# MAPPING SESSION MAKERS - AUTOCOMMIT (dùng riêng cho audit log)
# Mỗi .add() + .flush() sẽ commit ngay vào DB, không phụ thuộc transaction chính.
# Đảm bảo log tồn tại dù transaction chính rollback.
LogSessionLocals = {
    site: sessionmaker(
        autocommit=False,
        autoflush=True,
        expire_on_commit=False,
        bind=engine.execution_options(isolation_level="AUTOCOMMIT"),
    )
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


def get_log_session(site: str) -> Session:
    """
    Trả về session ghi log độc lập (AUTOCOMMIT).
    Mọi INSERT vào session này commit ngay — không bị ảnh hưởng bởi
    rollback của transaction chính. Dùng cho bảng NhatKyThaoTac.
    """
    site = (site or "").upper()
    if site not in LogSessionLocals:
        raise ValueError(f"Site log không hợp lệ: {site}")
    return LogSessionLocals[site]()


def get_db():
    db = SessionLocals["HADONG"]()
    try:
        yield db
    finally:
        db.close()
