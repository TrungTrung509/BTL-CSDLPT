from pydantic import BaseModel
from typing import List, Optional
from datetime import datetime

class SectionSummary(BaseModel):
    MaLopHP: str
    TenLopHP: Optional[str]
    MaHP: str
    SiSoHienTai: int
    SiSoToiDa: int
    IsFull: bool

class ReportSummaryResponse(BaseModel):
    MaCoSo: Optional[str] = "GLOBAL"
    MaHocKy: Optional[str]
    TotalStudents: int  # Tổng số sinh viên duy nhất đã đăng ký
    TotalRegistrations: int  # Tổng số lượt đăng ký
    TotalSections: int  # Tổng số lớp học phần đang mở
    TotalCapacity: int  # Tổng số chỗ (SiSoToiDa)
    TotalEnrolledSlots: int  # Tổng số chỗ đã chiếm (SiSoHienTai)
    OccupancyRate: float  # Tỷ lệ lấp đầy (%)
    
    FullSectionsCount: int # Số lượng lớp đã đầy
    Sections: List[SectionSummary] = [] # Danh sách chi tiết lớp
