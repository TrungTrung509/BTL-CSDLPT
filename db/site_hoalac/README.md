# SITE HOALAC - Hòa Lạc

## Mục đích

Thư mục `site_hoalac/` chứa SQL tạo **bảng cục bộ** của site Hòa Lạc.

## Mapping với hệ thống

| Site | Container | Mã Cơ sở | Mô tả |
|------|-----------|-----------|--------|
| site_hoalac | csdlpt_hoalac | **HOALAC** | Cơ sở Hòa Lạc |

## Các bảng trong thư mục này

| File | Bảng | Kiểu phân mảnh | Mô tả |
|------|------|-----------------|--------|
| `01_local_tables.sql` | **SinhVien** | Ngang theo MaCoSo='HOALAC' | Sinh viên cơ sở Hòa Lạc |
| `01_local_tables.sql` | **GiangVien** | Ngang theo MaCoSo='HOALAC' | Giảng viên cơ sở Hòa Lạc |
| `01_local_tables.sql` | **PhongHoc** | Ngang theo MaCoSo='HOALAC' | Phòng học cơ sở Hòa Lạc |
| `01_local_tables.sql` | **LopHocPhan** | Theo site MỞ LỚP='HOALAC' | Lớp học phần mở tại Hòa Lạc |
| `01_local_tables.sql` | **LichHoc** | Dẫn xuất từ LopHocPhan | Lịch học tại Hòa Lạc |
| `01_local_tables.sql` | **DangKy** | Theo site MỞ LỚP='HOALAC' | Đăng ký của lớp mở tại Hòa Lạc |
| `01_local_tables.sql` | **AuditLog** | Local | Log tổng hợp |
| `01_local_tables.sql` | **DangKyLog** | Local | Log đăng ký/hủy |

## Thứ tự chạy

```
1. db/common/01_common_tables.sql         <- Bảng dùng chung
2. db/site_hoalac/init/01_local_tables.sql <- Bảng cục bộ HOALAC
```

## Cách nạp thủ công

```bash
# Nạp bảng cục bộ vào site HOALAC
docker exec -i csdlpt_hoalac psql -U csdlpt_user -d csdlpt_hoalac < db/site_hoalac/init/01_local_tables.sql
```

## Cách kiểm tra

```sql
-- Xem tất cả bảng
SELECT table_name FROM information_schema.tables WHERE table_schema = 'public';

-- Kiểm tra dữ liệu local
SELECT * FROM SinhVien WHERE MaCoSo = 'HOALAC';
SELECT * FROM GiangVien WHERE MaCoSo = 'HOALAC';
SELECT * FROM PhongHoc WHERE MaCoSo = 'HOALAC';
SELECT * FROM LopHocPhan WHERE MaCoSo = 'HOALAC';
```

---

*Nguồn: Thiết kế từ CSDLPT.pdf - Phần IV, V*
