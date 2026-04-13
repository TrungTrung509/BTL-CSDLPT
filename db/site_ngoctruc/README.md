# SITE NGOCTRUC - Ngọc Trục

## Mục đích

Thư mục `site_ngoctruc/` chứa SQL tạo **bảng cục bộ** của site Ngọc Trục.

## Mapping với hệ thống

| Site | Container | Mã Cơ sở | Mô tả |
|------|-----------|-----------|--------|
| site_ngoctruc | csdlpt_ngoctruc | **NGOCTRUC** | Cơ sở Ngọc Trục |

## Các bảng trong thư mục này

| File | Bảng | Kiểu phân mảnh | Mô tả |
|------|------|-----------------|--------|
| `01_local_tables.sql` | **SinhVien** | Ngang theo MaCoSo='NGOCTRUC' | Sinh viên cơ sở Ngọc Trục |
| `01_local_tables.sql` | **GiangVien** | Ngang theo MaCoSo='NGOCTRUC' | Giảng viên cơ sở Ngọc Trục |
| `01_local_tables.sql` | **PhongHoc** | Ngang theo MaCoSo='NGOCTRUC' | Phòng học cơ sở Ngọc Trục |
| `01_local_tables.sql` | **LopHocPhan** | Theo site MỞ LỚP='NGOCTRUC' | Lớp học phần mở tại Ngọc Trục |
| `01_local_tables.sql` | **LichHoc** | Dẫn xuất từ LopHocPhan | Lịch học tại Ngọc Trục |
| `01_local_tables.sql` | **DangKy** | Theo site MỞ LỚP='NGOCTRUC' | Đăng ký của lớp mở tại Ngọc Trục |
| `01_local_tables.sql` | **AuditLog** | Local | Log tổng hợp |
| `01_local_tables.sql` | **DangKyLog** | Local | Log đăng ký/hủy |

## Thứ tự chạy

```
1. db/common/01_common_tables.sql          <- Bảng dùng chung
2. db/site_ngoctruc/init/01_local_tables.sql <- Bảng cục bộ NGOCTRUC
```

## Cách nạp thủ công

```powershell
# Nạp bảng cục bộ vào site NGOCTRUC
Get-Content db/site_ngoctruc/init/01_local_tables.sql | docker exec -i csdlpt_ngoctruc psql -U csdlpt_user -d csdlpt_ngoctruc
```

## Cách kiểm tra

```sql
-- Xem tất cả bảng
SELECT table_name FROM information_schema.tables WHERE table_schema = 'public';

-- Kiểm tra dữ liệu local
SELECT * FROM SinhVien WHERE MaCoSo = 'NGOCTRUC';
SELECT * FROM GiangVien WHERE MaCoSo = 'NGOCTRUC';
SELECT * FROM PhongHoc WHERE MaCoSo = 'NGOCTRUC';
SELECT * FROM LopHocPhan WHERE MaCoSo = 'NGOCTRUC';
```

---

*Nguồn: Thiết kế từ CSDLPT.pdf - Phần IV, V*
