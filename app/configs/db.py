from fastapi import HTTPException, status
from sqlalchemy import create_engine # engine ket noi db
from sqlalchemy.ext.declarative import declarative_base # Lop goc Base cho cac model ke thua ORM
from sqlalchemy.orm import Session, sessionmaker # Session: quan ly ket noi db, sessionmaker: tao ra cac session moi tu engine

from configs.config import HADONG_URL, HOALAC_URL, NGOCTRUC_URL

# Cấu hình kết nối database với các tham số tối ưu cho failover và hiệu suất
ENGINE_KWARGS = {
    "pool_pre_ping": True,
}

# Đối với PostgreSQL, thêm tham số connect_timeout để nhanh chóng phát hiện khi cơ sở dữ liệu không phản hồi
POSTGRES_CONNECT_ARGS = {
    "connect_timeout": 3,
}


# Hàm tạo engine với cấu hình phù hợp cho từng loại database
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
# SessionLocals = {
#     "HADONG": sessionmaker(..., bind=engine_HADONG),
#     "HOALAC": sessionmaker(..., bind=engine_HOALAC),
#     "NGOCTRUC": sessionmaker(..., bind=engine_NGOCTRUC),
# }
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
    # khi gọi () tạo ra một session thật
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
    from services.FailoverService import FailoverService

    db = FailoverService.open_read_session(auto_failover=True)
    try:
        yield db
    finally:
        db.close()
