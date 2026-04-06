# SITE HADONG - Hà Nội

## Mục đích

Thư mục `site_hadong/` chứa SQL tạo **bảng cục bộ** của site Hà Nội.

## Mapping với hệ thống

| Site | Container | Mã Cơ sở | Mô tả |
|------|-----------|-----------|--------|
| site_hadong | csdlpt_hadong | **HADONG** | Cơ sở Hà Nội |

## Các bảng trong thư mục này

| File | Bảng | Kiểu phân mảnh | Mô tả |
|------|------|-----------------|--------|
| `01_local_tables.sql` | **SinhVien** | Ngang theo MaCoSo='HADONG' | Sinh viên cơ sở Hà Nội |
| `01_local_tables.sql` | **GiangVien** | Ngang theo MaCoSo='HADONG' | Giảng viên cơ sở Hà Nội |
| `01_local_tables.sql` | **PhongHoc** | Ngang theo MaCoSo='HADONG' | Phòng học cơ sở Hà Nội |
| `01_local_tables.sql` | **LopHocPhan** | Theo site MỞ LỚP='HADONG' | Lớp học phần mở tại Hà Nội |
| `01_local_tables.sql` | **LichHoc** | Dẫn xuất từ LopHocPhan | Lịch học tại Hà Nội |
| `01_local_tables.sql` | **DangKy** | Theo site MỞ LỚP='HADONG' | Đăng ký của lớp mở tại Hà Nội |
| `01_local_tables.sql` | **AuditLog** | Local | Log tổng hợp |
| `01_local_tables.sql` | **DangKyLog** | Local | Log đăng ký/hủy |

## Đặc điểm phân mảnh

### SinhVien, GiangVien, PhongHoc
- Phân mảnh ngang theo `MaCoSo = 'HADONG'`
- Sinh viên/GV/Phòng thuộc cơ sở Hà Nội được quản lý tại đây

### LopHocPhan
- Phân mảnh theo **cơ sở MỞ LỚP** chứ không phải cơ sở quản lý GV
- Lớp mở tại Hà Nội có `MaCoSo = 'HADONG'`

### DangKy
- Phân mảnh theo **cơ sở MỞ LỚP HỌC PHẦN**
- Đăng ký của SV vào lớp mở tại Hà Nội nằm tại HADONG
- SV có thể đăng ký từ site khác nhưng đăng ký vẫn nằm ở site mở lớp

## Thứ tự chạy

```
1. db/common/01_common_tables.sql       <- Bảng dùng chung (CoSo, Khoa, HocPhan, HocKy, TienQuyet)
2. db/site_hadong/init/01_local_tables.sql  <- Bảng cục bộ HADONG
```

## Cách nạp thủ công

```powershell
# Nạp bảng cục bộ vào site HADONG
Get-Content db/site_hadong/init/01_local_tables.sql | docker exec -i csdlpt_hadong psql -U csdlpt_user -d csdlpt_hadong
```

## Cách kiểm tra

```sql
-- Xem tất cả bảng
SELECT table_name FROM information_schema.tables WHERE table_schema = 'public';

-- Kiểm tra dữ liệu local
SELECT * FROM SinhVien WHERE MaCoSo = 'HADONG';
SELECT * FROM GiangVien WHERE MaCoSo = 'HADONG';
SELECT * FROM PhongHoc WHERE MaCoSo = 'HADONG';
SELECT * FROM LopHocPhan WHERE MaCoSo = 'HADONG';

-- Đếm số bản ghi
SELECT 'SinhVien' as table_name, COUNT(*) as count FROM SinhVien WHERE MaCoSo = 'HADONG'
UNION ALL
SELECT 'GiangVien', COUNT(*) FROM GiangVien WHERE MaCoSo = 'HADONG'
UNION ALL
SELECT 'PhongHoc', COUNT(*) FROM PhongHoc WHERE MaCoSo = 'HADONG'
UNION ALL
SELECT 'LopHocPhan', COUNT(*) FROM LopHocPhan WHERE MaCoSo = 'HADONG';
```

## Lưu ý quan trọng

1. **Schema giống nhau** cho cả 3 site (SinhVien, GiangVien, PhongHoc, LopHocPhan, LichHoc, DangKy)
2. **Dữ liệu khác nhau**: Mỗi site chỉ chứa dữ liệu của cơ sở mình
3. **FK tới bảng common**: Các bảng local có FK tới CoSo, Khoa, HocPhan, HocKy (các bảng dùng chung)

---

*Nguồn: Thiết kế từ CSDLPT.pdf - Phần IV, V*
