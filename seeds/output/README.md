# SEEDS OUTPUT - Dữ liệu đã sinh ra

## Mục đích

Thư mục này chứa **dữ liệu mẫu đã sinh ra** từ script `generate_data.py`.

## Cấu trúc

```
output/
├── common/                     # Dữ liệu DÙNG CHUNG (nhân bản cả 3 site)
│   └── 001_common_data.sql   # CoSo, Khoa, HocPhan, HocKy, TienQuyet
│
├── site_hadong/               # Dữ liệu cục bộ SITE HÀ NỘI
│   └── 001_site_data.sql     # SinhVien, GiangVien, PhongHoc, LopHocPhan, LichHoc
│
├── site_ngoctruc/            # Dữ liệu cục bộ SITE Ngọc Trục
│   └── 001_site_data.sql
│
└── site_hoalac/              # Dữ liệu cục bộ SITE HÒA LẠC
    └── 001_site_data.sql
```

## Dữ liệu dùng chung (common)

File: `output/common/001_common_data.sql`

Chạy **TRƯỚC** khi chạy data site tại mỗi site.

### Nội dung

| Bảng | Số bản ghi | Mô tả |
|------|------------|--------|
| CoSo | 3 | HADONG, NGOCTRUC, HOALAC |
| Khoa | 4 | CNTT, ATTT, VT, KT |
| HocPhan | 20 | Các học phần cơ bản |
| HocKy | 3 | HK20251, HK20252, HK20261 |
| TienQuyet | 11 | Ràng buộc tiên quyết |

## Dữ liệu site (mỗi site)

File: `output/site_*/001_site_data.sql`

Chạy **SAU** khi đã tạo schema local.

### Nội dung

| Bảng | Số bản ghi | Mô tả |
|------|------------|--------|
| SinhVien | 120 | SV thuộc site đó |
| GiangVien | 30 | GV thuộc site đó |
| PhongHoc | 20 | Phòng thuộc site đó |
| LopHocPhan | 25 | Lớp mở tại site đó |
| LichHoc | ~75 | Lịch học của lớp |

### Lớp test race condition

5 lớp đầu tiên có `SiSoToiDa = 10, 12, hoặc 15` để test concurrent registration.

## Cách nạp dữ liệu

### Quan trọng: Thứ tự phải đúng!

```
1. db/common/01_common_tables.sql          <- Schema CHUNG
2. output/common/001_common_data.sql       <- Data CHUNG
3. db/site_*/init/01_local_tables.sql     <- Schema LOCAL
4. output/site_*/001_site_data.sql         <- Data LOCAL
5. sql/indexes.sql                         <- Indexes
```

### Ví dụ: Import cho site HADONG

```powershell
# Schema CHUNG
Get-Content db/common/01_common_tables.sql | docker exec -i csdlpt_hadong psql -U csdlpt_user -d csdlpt_hadong
Get-Content db/common/01_common_tables.sql | docker exec -i csdlpt_ngoctruc psql -U csdlpt_user -d csdlpt_ngoctruc  
Get-Content db/common/01_common_tables.sql | docker exec -i csdlpt_hoalac psql -U csdlpt_user -d csdlpt_hoalac
# Schema LOCAL
Get-Content db/site_hadong/init/01_local_tables.sql | docker exec -i csdlpt_hadong psql -U csdlpt_user -d csdlpt_hadong


# Data CHUNG
Get-Content seeds/output/common/001_common_data.sql | docker exec -i csdlpt_hadong psql -U csdlpt_user -d csdlpt_hadong
Get-Content seeds/output/common/001_common_data.sql | docker exec -i csdlpt_ngoctruc psql -U csdlpt_user -d csdlpt_ngoctruc  
Get-Content seeds/output/common/001_common_data.sql | docker exec -i csdlpt_hoalac psql -U csdlpt_user -d csdlpt_hoalac


# Data LOCAL
Get-Content seeds/output/site_hadong/001_site_data.sql | docker exec -i csdlpt_hadong psql -U csdlpt_user -d csdlpt_hadong
Get-Content seeds/output/site_hadong/001_site_data.sql | docker exec -i csdlpt_ngoctruc psql -U csdlpt_user -d csdlpt_ngoctruc
Get-Content seeds/output/site_hadong/001_site_data.sql | docker exec -i csdlpt_hoalac psql -U csdlpt_user -d csdlpt_hoalac

# Indexes
Get-Content sql/indexes.sql | docker exec -i csdlpt_hadong psql -U csdlpt_user -d csdlpt_hadong
```

### Tương tự cho site khác

Thay `hadong` bằng `ngoctruc` hoặc `hoalac`.

## Kiểm tra sau nạp

```sql
-- Xem dữ liệu CHUNG
SELECT * FROM CoSo;
SELECT * FROM Khoa LIMIT 5;
SELECT * FROM HocPhan LIMIT 5;
SELECT * FROM HocKy;

-- Xem dữ liệu theo SITE
SELECT MaCoSo, COUNT(*) FROM SinhVien GROUP BY MaCoSo;
SELECT MaCoSo, COUNT(*) FROM GiangVien GROUP BY MaCoSo;
SELECT MaCoSo, COUNT(*) FROM PhongHoc GROUP BY MaCoSo;
SELECT MaCoSo, COUNT(*) FROM LopHocPhan GROUP BY MaCoSo;

-- Xem lớp có sức chứa NHỎ (test concurrent)
SELECT MaLopHP, MaHP, SiSoToiDa, SiSoHienTai 
FROM LopHocPhan 
WHERE SiSoToiDa <= 15 
ORDER BY MaCoSo, MaLopHP;
```

## Regenerate

Nếu cần sinh lại dữ liệu:

```bash
cd seeds
rm -rf output/*
python generate_data.py
```

## Lưu ý

1. **KHÔNG chạy data site trước data common** - sẽ lỗi FK
2. **MaCoSo trong data site LUÔN đúng site**: SinhVien/GV/Phong/Lớp thuộc site nào thì có MaCoSo của site đó
3. **Data common giống nhau** cho cả 3 site (để sau replication đồng bộ)

---

*Sinh tự động bởi `generate_data.py`*
