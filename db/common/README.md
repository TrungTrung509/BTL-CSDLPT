# COMMON - Bảng dùng chung toàn trường

## Mục đích

Thư mục `common/` chứa SQL tạo **bảng dùng chung toàn trường**, được **nhân bản toàn phần** tại cả 3 site thông qua Logical Replication.

## Các bảng trong thư mục này

| File | Bảng | Mô tả |
|------|------|-------|
| `01_common_tables.sql` | **CoSo** | Thông tin cơ sở đào tạo |
| `01_common_tables.sql` | **Khoa** | Thông tin khoa đào tạo |
| `01_common_tables.sql` | **HocPhan** | Danh mục học phần |
| `01_common_tables.sql` | **HocKy** | Thông tin học kỳ |
| `01_common_tables.sql` | **TienQuyet** | Quan hệ học phần tiên quyết |

## Đặc điểm quan trọng

1. **Nhân bản toàn phần**: Cùng một bảng tồn tại tại cả 3 site với dữ liệu giống hệt nhau
2. **Đồng bộ qua Replication**: Dữ liệu được đồng bộ thông qua PostgreSQL Logical Replication
3. **Ít cập nhật, đọc nhiều**: Đây là dữ liệu danh mục, thường chỉ đọc và ít khi thay đổi
4. **Cần thiết tại mọi site**: Mọi thao tác (mở lớp, đăng ký) đều cần tra cứu các bảng này

## Thứ tự chạy

**QUAN TRỌNG**: Các script trong thư mục này phải chạy **TRƯỚC** script bảng cục bộ của từng site.

Thứ tự khởi tạo:
```
1. docker-entrypoint-initdb.d/00_common/    <- Bảng dùng chung
2. docker-entrypoint-initdb.d/01_site/      <- Bảng cục bộ
```

## Mapping với nghiệp vụ PDF

| Bảng | Kiểu phân mảnh | Lý do |
|------|---------------|-------|
| CoSo | Nhân bản toàn phần | Bảng nhỏ, ít cập nhật, tất cả site đều cần |
| Khoa | Nhân bản toàn phần | Danh mục nhỏ, dùng chung trong báo cáo |
| HocPhan | Nhân bản toàn phần | Dùng chung toàn trường, đọc nhiều, cập nhật ít |
| HocKy | Nhân bản toàn phần | Dùng chung toàn trường, nhỏ |
| TienQuyet | Nhân bản toàn phần | Luật học thuật chung, cần kiểm tra ở mọi site |

## Cách nạp thủ công

```bash
# Nạp bảng common vào site HADONG
docker exec -i csdlpt_hadong psql -U csdlpt_user -d csdlpt_hadong < db/common/01_common_tables.sql

# Nạp bảng common vào site NGOCTRUC
docker exec -i csdlpt_ngoctruc psql -U csdlpt_user -d csdlpt_ngoctruc < db/common/01_common_tables.sql

# Nạp bảng common vào site HOALAC
docker exec -i csdlpt_hoalac psql -U csdlpt_user -d csdlpt_hoalac < db/common/01_common_tables.sql
```

## Cách kiểm tra bảng đã tạo

```sql
-- Tại bất kỳ site nào
SELECT table_name FROM information_schema.tables WHERE table_schema = 'public';

-- Kiểm tra dữ liệu
SELECT * FROM CoSo;
SELECT * FROM Khoa;
SELECT * FROM HocPhan;
SELECT * FROM HocKy;
SELECT * FROM TienQuyet;
```

## Lưu ý khi sửa đổi

1. **Chỉ sửa tại site publisher** (site HADONG) - các site subscriber sẽ tự động nhận qua replication
2. **Thêm cột mới**: Cần ALTER TABLE tại tất cả các site hoặc sau khi replication được cấu hình
3. **Thêm bảng mới**: Tạo script mới và chạy tại tất cả các site

---

*Nguồn: Thiết kế từ CSDLPT.pdf - Phần IV, V*
