import os
from dotenv import load_dotenv
from typing import Optional

load_dotenv()

# Danh sách các site trong hệ thống
SITES = {
    "HADONG": {
        "name": "Cơ sở Hà Nội",
        "db_url": os.getenv("DB_URL_HADONG", "postgresql://csdlpt_user:csdlpt_password@localhost:5432/csdlpt_hadong")
    },
    "NGOCTRUC": {
        "name": "Cơ sở Ngọc Trục",
        "db_url": os.getenv("DB_URL_NGOCTRUC", "postgresql://csdlpt_user:csdlpt_password@localhost:5432/csdlpt_ngoctruc")
    },
    "HOALAC": {
        "name": "Cơ sở Hòa Lạc",
        "db_url": os.getenv("DB_URL_HOALAC", "postgresql://csdlpt_user:csdlpt_password@localhost:5432/csdlpt_hoalac")
    }
}

# Common write site - nơi ghi dữ liệu dùng chung (CoSo, Khoa, HocPhan)
COMMON_WRITE_SITE = os.getenv("COMMON_WRITE_SITE", "HADONG")

def get_site_db_url(ma_co_so: str) -> Optional[str]:
    """Lấy DB URL của site dựa trên MaCoSo"""
    site = SITES.get(ma_co_so.upper())
    if site:
        return site["db_url"]
    return None

def get_site_config(ma_co_so: str) -> Optional[dict]:
    """Lấy config của site dựa trên MaCoSo"""
    return SITES.get(ma_co_so.upper())

def get_all_sites() -> dict:
    """Lấy danh sách tất cả sites"""
    return SITES

def get_common_write_site_db_url() -> str:
    """Lấy DB URL của common write site"""
    return SITES[COMMON_WRITE_SITE]["db_url"]
