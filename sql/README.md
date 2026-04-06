# SQL - Scripts Database

## Mục đích

Thư mục `sql/` chứa các script SQL bổ sung sau khi đã tạo schema.

## Các file trong thư mục này

| File | Mô tả | Ai phụ trách |
|------|--------|--------------|
| `indexes.sql` | Indexes cho tất cả các bảng | Việt |
| `procedures/*.sql` | Stored procedures (đăng ký, hủy) | Tuấn |
| `views/*.sql` | View tổng hợp toàn trường | Tuấn |
| `fdw/*.sql` | Cấu hình postgres_fdw | Tuấn |
| `queries/*.sql` | 5 truy vấn phân tán | Tuấn |
| `replication/*.sql` | Cấu hình replication | Việt |

## Indexes - indexes.sql

Script này tạo các index để tối ưu truy vấn.

### Các loại index

1. **Index cho JOIN**: Hỗ trợ join giữa các bảng qua FK
2. **Index cho phân mảnh**: Theo MaCoSo để tận dụng phân mảnh
3. **Index cho kiểm tra nghiệp vụ**:
   - Trùng lịch học (phòng + thứ + tiết)
   - Trùng đăng ký (SV + Lớp HP)
   - Kiểm tra sĩ số

### Cách chạy

```bash
# Chạy indexes cho tất cả site
#HADONG
Get-Content sql/indexes.sql | docker exec -i csdlpt_hadong psql -U csdlpt_user -d csdlpt_hadong

# NGOCTRUC
Get-Content sql/indexes.sql | docker exec -i csdlpt_ngoctruc psql -U csdlpt_user -d csdlpt_ngoctruc

# HOALAC
Get-Content sql/indexes.sql | docker exec -i csdlpt_hoalac psql -U csdlpt_user -d csdlpt_hoalac
```

```

### Kiểm tra indexes

```sql
-- Xem tất cả indexes
SELECT indexname, tablename FROM pg_indexes WHERE schemaname = 'public';

-- Kiểm tra index cụ thể
SELECT indexname, indexdef FROM pg_indexes WHERE tablename = 'DangKy';
```

## Các thư mục con

### sql/procedures/

Chứa stored procedures cho nghiệp vụ đăng ký/hủy học phần.

### sql/views/

Chứa view tổng hợp dữ liệu từ nhiều site qua FDW.

### sql/fdw/

Chứa script cấu hình postgres_fdw để truy vấn liên site.

### sql/queries/

Chứa 5 truy vấn phân tán theo yêu cầu đồ án.

### sql/replication/

Chứa script cấu hình Logical Replication cho bảng dùng chung.

---

*Lưu ý: Các thư mục con sẽ được tạo và cập nhật bởi Tuấn (procedures, views, fdw, queries) và Việt (replication)*
