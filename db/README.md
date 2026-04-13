# CƠ SỞ DỮ LIỆU - Cấu trúc Schema

## 1. Cấu trúc thư mục

```
db/
├── common/                     # Bảng dùng chung (nhân bản 3 site)
│   ├── 01_common_tables.sql
│   └── README.md
├── site_hadong/               # Site Hà Nội
│   ├── init/
│   │   └── 01_local_tables.sql
│   └── README.md
├── site_ngoctruc/            # Site Ngọc Trục
│   ├── init/
│   │   └── 01_local_tables.sql
│   └── README.md
└── site_hoalac/              # Site Hòa Lạc
    ├── init/
    │   └── 01_local_tables.sql
    └── README.md

sql/                          # Scripts bổ sung
├── indexes.sql               # Indexes
├── procedures/               # Stored procedures (Tuấn)
├── views/                   # Views tổng hợp (Tuấn)
├── fdw/                     # FDW configuration (Tuấn)
├── queries/                 # 5 truy vấn phân tán (Tuấn)
├── replication/             # Replication setup (Việt)
└── README.md
```

---

## 2. Phân loại bảng

### 2.1 BẢNG DÙNG CHUNG (Common)

Đặt trong `db/common/`. **Nhân bản toàn phần** tại cả 3 site qua Logical Replication.

| Bảng | Mô tả | Lý do nhân bản |
|------|-------|----------------|
| **CoSo** | Thông tin cơ sở đào tạo | Bảng nhỏ, ít cập nhật |
| **Khoa** | Thông tin khoa | Danh mục dùng chung |
| **HocPhan** | Danh mục học phần | Dùng chung toàn trường, đọc nhiều |
| **HocKy** | Thông tin học kỳ | Dùng chung toàn trường |
| **TienQuyet** | Quan hệ học phần tiên quyết | Cần kiểm tra ở mọi site |

### 2.2 BẢNG CỤC BỘ (Local)

Đặt trong `db/site_*/init/`. **Phân mảnh theo site**.

| Bảng | Kiểu phân mảnh | Mô tả |
|------|-----------------|--------|
| **SinhVien** | Ngang theo MaCoSo | SV thuộc cơ sở nào thì ở site đó |
| **GiangVien** | Ngang theo MaCoSo | GV thuộc cơ sở nào thì ở site đó |
| **PhongHoc** | Ngang theo MaCoSo | Phòng thuộc cơ sở nào thì ở site đó |
| **LopHocPhan** | Theo site MỞ LỚP | Lớp mở ở site nào thì ở site đó |
| **LichHoc** | Dẫn xuất từ LopHocPhan | Lịch theo lớp |
| **DangKy** | Theo site MỞ LỚP | Đăng ký vào lớp mở ở site nào thì ở site đó |
| **AuditLog** | Local | Log thao tác |
| **DangKyLog** | Local | Log đăng ký/hủy |

### 2.3 INDEXES

Đặt trong `sql/indexes.sql`. Chạy sau khi tạo schema.

---

## 3. Sơ đồ quan hệ

```
┌─────────────────────────────────────────────────────────────────────┐
│                    BẢNG DÙNG CHUNG (Common)                          │
│                                                                      │
│  ┌──────────────┐  ┌──────────────┐  ┌──────────────┐               │
│  │    CoSo      │  │    Khoa      │  │  HocPhan    │               │
│  └──────────────┘  └──────┬───────┘  └──────┬───────┘               │
│                           │                  │                       │
└───────────────────────────┼──────────────────┼───────────────────────┘
                            │                  │
                            ▼                  ▼
┌─────────────────────────────────────────────────────────────────────┐
│                        BẢNG CỤC BỘ (Local)                          │
│                                                                      │
│  ┌──────────────┐         ┌──────────────┐         ┌──────────────┐ │
│  │  GiangVien   │         │  SinhVien    │         │  HocKy      │ │
│  └──────┬───────┘         └──────┬───────┘         └──────────────┘ │
│         │                        │                                     │
│         │    ┌──────────────────┤                                     │
│         │    │                  │                                     │
│         ▼    ▼                  ▼                                     │
│  ┌──────────────┐         ┌──────────────┐                             │
│  │  PhongHoc    │         │ LopHocPhan  │◄──── GiangVien             │
│  └──────────────┘         └──────┬───────┘                             │
│                                 │                                     │
│                                 ▼                                     │
│                          ┌──────────────┐                             │
│                          │   LichHoc    │◄──── PhongHoc              │
│                          └──────┬───────┘                             │
│                                 │                                     │
│                                 ▼                                     │
│                          ┌──────────────┐                             │
│                          │   DangKy     │◄──── SinhVien              │
│                          └──────────────┘                             │
│                                                                      │
│  ┌──────────────┐         ┌──────────────┐                           │
│  │  AuditLog    │         │ DangKyLog    │                           │
│  └──────────────┘         └──────────────┘                           │
└─────────────────────────────────────────────────────────────────────┘
```

---

## 4. Mapping Site - Cơ sở

| Site | Container | Mã Cơ sở | Tên Cơ sở | Ghi chú |
|------|-----------|-----------|------------|---------|
| site_hadong | csdlpt_hadong | **HADONG** | Hà Nội | Site publisher |
| site_ngoctruc | csdlpt_ngoctruc | **NGOCTRUC** | Ngọc Trục | Subscriber |
| site_hoalac | csdlpt_hoalac | **HOALAC** | Hòa Lạc | Subscriber |

---

## 5. Thứ tự khởi tạo

### Tự động qua Docker Compose

Docker sẽ tự động chạy theo thứ tự:

```
1. /docker-entrypoint-initdb.d/00_common/         <- db/common/*.sql
2. /docker-entrypoint-initdb.d/01_site/           <- db/site_*/init/*.sql
```

### Thủ công

```bash
# Schema common
# ===== HADONG =====
Get-Content db/common/01_common_tables.sql | docker exec -i csdlpt_hadong psql -U csdlpt_user -d csdlpt_hadong
# ===== NGOCTRUC =====
Get-Content db/common/01_common_tables.sql | docker exec -i csdlpt_ngoctruc psql -U csdlpt_user -d csdlpt_ngoctruc
# ===== HOALAC =====
Get-Content db/common/01_common_tables.sql | docker exec -i csdlpt_hoalac psql -U csdlpt_user -d csdlpt_hoalac

# Schema local
Get-Content db/site_hadong/init/01_local_tables.sql | docker exec -i csdlpt_hadong psql -U csdlpt_user -d csdlpt_hadong


Get-Content db/site_ngoctruc/init/01_local_tables.sql | docker exec -i csdlpt_ngoctruc psql -U csdlpt_user -d csdlpt_ngoctruc


Get-Content db/site_hoalac/init/01_local_tables.sql | docker exec -i csdlpt_hoalac psql -U csdlpt_user -d csdlpt_hoalac
```

---

## 6. Kiểm tra sau khởi tạo

```sql
-- Xem tất cả bảng
SELECT table_name FROM information_schema.tables WHERE table_schema = 'public' ORDER BY table_name;

-- Kiểm tra bảng common
SELECT * FROM CoSo;
SELECT * FROM Khoa;
SELECT * FROM HocPhan;
SELECT * FROM HocKy;
SELECT * FROM TienQuyet;

-- Kiểm tra bảng local (HADONG)
SELECT * FROM SinhVien WHERE MaCoSo = 'HADONG';
SELECT * FROM GiangVien WHERE MaCoSo = 'HADONG';
SELECT * FROM PhongHoc WHERE MaCoSo = 'HADONG';
SELECT * FROM LopHocPhan WHERE MaCoSo = 'HADONG';

-- Kiểm tra indexes
SELECT indexname, tablename FROM pg_indexes WHERE schemaname = 'public';
```

---

## 7. Đếm bản ghi sau seed

```sql
-- Đếm tất cả các bảng
SELECT 'CoSo' as tbl, COUNT(*) as cnt FROM CoSo
UNION ALL SELECT 'Khoa', COUNT(*) FROM Khoa
UNION ALL SELECT 'HocPhan', COUNT(*) FROM HocPhan
UNION ALL SELECT 'HocKy', COUNT(*) FROM HocKy
UNION ALL SELECT 'TienQuyet', COUNT(*) FROM TienQuyet
UNION ALL SELECT 'SinhVien_HD', COUNT(*) FROM SinhVien WHERE MaCoSo = 'HADONG'
UNION ALL SELECT 'SinhVien_NT', COUNT(*) FROM SinhVien WHERE MaCoSo = 'NGOCTRUC'
UNION ALL SELECT 'SinhVien_HCM', COUNT(*) FROM SinhVien WHERE MaCoSo = 'HOALAC';
```

---

## 8. Lưu ý quan trọng

1. **Schema giống nhau** tại cả 3 site (trừ dữ liệu)
2. **CoSo, Khoa, HocPhan, HocKy, TienQuyet** là bảng dùng chung - cần replication
3. **SinhVien, GiangVien, PhongHoc** phân mảnh theo MaCoSo
4. **LopHocPhan, DangKy** phân mảnh theo site MỞ LỚP
5. **Indexes giống nhau** tại cả 3 site

---

## 9. Cấu hình Replication (Tuần 2)

Replication sẽ được cấu hình sau khi seed data hoàn tất. Xem `sql/replication/README.md`.

---

*Nguồn: Thiết kế từ CSDLPT.pdf - Phần IV, V*
