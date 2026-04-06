# SEEDS - Dữ liệu mẫu

## Mục đích

Thư mục `seeds/` chứa script Python để **sinh dữ liệu mẫu** cho hệ thống Cơ sở dữ liệu phân tán.

## Cấu trúc thư mục

```
seeds/
├── generate_data.py           # Script sinh dữ liệu
├── output/                   # Thư mục chứa dữ liệu sinh ra
│   ├── common/              # Dữ liệu dùng chung
│   │   └── 001_common_data.sql
│   ├── site_hadong/         # Dữ liệu site Hà Nội
│   │   └── 001_site_data.sql
│   ├── site_ngoctruc/       # Dữ liệu site Ngọc Trục
│   │   └── 001_site_data.sql
│   └── site_hoalac/         # Dữ liệu site Hòa Lạc
│       └── 001_site_data.sql
└── README.md (file này)
```

## Yêu cầu

### Python dependencies

```bash
pip install faker
```

Hoặc cài qua requirements.txt (nếu có):

```bash
pip install -r requirements.txt
```

## Cách chạy

### Sinh dữ liệu

```bash
cd seeds
python generate_data.py
```

### Tùy chỉnh số lượng

Mở file `generate_data.py` và chỉnh sửa `DEFAULT_COUNTS`:

```python
DEFAULT_COUNTS = {
    'sinh_vien': 120,       # 120 SV mỗi site
    'giang_vien': 30,       # 30 GV mỗi site
    'phong_hoc': 20,        # 20 phòng mỗi site
    'lop_hoc_phan': 25,     # 25 lớp HP mỗi site
    'lich_hoc': 3,          # 3 buổi/lớp HP
}
```

### Lớp test race condition

Script sẽ tự động tạo **5 lớp đầu tiên** với sức chứa nhỏ (10-15) để test concurrent registration:

```python
SMALL_CLASS_SIZES = [10, 12, 15]
```

## Dữ liệu sinh ra

### Dữ liệu chung (common)

| Bảng | Số bản ghi | Mô tả |
|------|------------|--------|
| CoSo | 3 | 3 cơ sở: HADONG, NGOCTRUC, HOALAC |
| Khoa | 4 | CNTT, ATTT, VT, KT |
| HocPhan | 20 | Các học phần |
| HocKy | 3 | HK20251, HK20252, HK20261 |
| TienQuyet | 11 | Ràng buộc tiên quyết |

### Dữ liệu theo site (mỗi site)

| Bảng | Số bản ghi | Mô tả |
|------|------------|--------|
| SinhVien | 120 | Sinh viên |
| GiangVien | 30 | Giảng viên |
| PhongHoc | 20 | Phòng học |
| LopHocPhan | 25 | Lớp học phần (5 lớp đầu sức chứa nhỏ) |
| LichHoc | ~75 | Lịch học (3/lớp) |

## Thứ tự import vào database

### Quan trọng: Thứ tự phải đúng!

```
1. db/common/01_common_tables.sql          <- Tạo bảng CHUNG (CoSo, Khoa, HocPhan, HocKy, TienQuyet)
2. seeds/output/common/001_common_data.sql  <- Nạp dữ liệu CHUNG
3. db/site_*/init/01_local_tables.sql     <- Tạo bảng LOCAL (SinhVien, GiangVien, ...)
4. seeds/output/site_*/001_site_data.sql   <- Nạp dữ liệu LOCAL
5. sql/indexes.sql                         <- Tạo indexes
```

### Import vào HADONG

```bash
# 1. Schema common
docker exec -i csdlpt_hadong psql -U csdlpt_user -d csdlpt_hadong < db/common/01_common_tables.sql

# 2. Data common
docker exec -i csdlpt_hadong psql -U csdlpt_user -d csdlpt_hadong < seeds/output/common/001_common_data.sql

# 3. Schema local
docker exec -i csdlpt_hadong psql -U csdlpt_user -d csdlpt_hadong < db/site_hadong/init/01_local_tables.sql

# 4. Data local
docker exec -i csdlpt_hadong psql -U csdlpt_user -d csdlpt_hadong < seeds/output/site_hadong/001_site_data.sql

# 5. Indexes
docker exec -i csdlpt_hadong psql -U csdlpt_user -d csdlpt_hadong < sql/indexes.sql
```

### Import vào NGOCTRUC và HOALAC

Tương tự, thay `hadong` bằng `ngoctruc` hoặc `hoalac`.

### Import nhanh bằng script

```bash
# Chạy tất cả cho một site
docker exec -i csdlpt_hadong psql -U csdlpt_user -d csdlpt_hadong < db/common/01_common_tables.sql
docker exec -i csdlpt_hadong psql -U csdlpt_user -d csdlpt_hadong < seeds/output/common/001_common_data.sql
docker exec -i csdlpt_hadong psql -U csdlpt_user -d csdlpt_hadong < db/site_hadong/init/01_local_tables.sql
docker exec -i csdlpt_hadong psql -U csdlpt_user -d csdlpt_hadong < seeds/output/site_hadong/001_site_data.sql
docker exec -i csdlpt_hadong psql -U csdlpt_user -d csdlpt_hadong < sql/indexes.sql
```

## Kiểm tra sau khi import

```sql
-- Đếm bản ghi
SELECT 'CoSo' as tbl, COUNT(*) as cnt FROM CoSo
UNION ALL SELECT 'Khoa', COUNT(*) FROM Khoa
UNION ALL SELECT 'HocPhan', COUNT(*) FROM HocPhan
UNION ALL SELECT 'HocKy', COUNT(*) FROM HocKy
UNION ALL SELECT 'TienQuyet', COUNT(*) FROM TienQuyet
UNION ALL SELECT 'SinhVien', COUNT(*) FROM SinhVien
UNION ALL SELECT 'GiangVien', COUNT(*) FROM GiangVien
UNION ALL SELECT 'PhongHoc', COUNT(*) FROM PhongHoc
UNION ALL SELECT 'LopHocPhan', COUNT(*) FROM LopHocPhan
UNION ALL SELECT 'LichHoc', COUNT(*) FROM LichHoc;

-- Kiểm tra lớp có sức chứa nhỏ (để test race)
SELECT MaLopHP, SiSoToiDa, SiSoHienTai 
FROM LopHocPhan 
WHERE SiSoToiDa <= 15 
ORDER BY SiSoToiDa;

-- Kiểm tra dữ liệu đúng site
SELECT MaCoSo, COUNT(*) as cnt 
FROM SinhVien 
GROUP BY MaCoSo;

SELECT MaCoSo, COUNT(*) as cnt 
FROM GiangVien 
GROUP BY MaCoSo;

SELECT MaCoSo, COUNT(*) as cnt 
FROM PhongHoc 
GROUP BY MaCoSo;

SELECT MaCoSo, COUNT(*) as cnt 
FROM LopHocPhan 
GROUP BY MaCoSo;
```

## Test case có sẵn

### 1. Test đăng ký bình thường
- SV HADONG đăng ký lớp CS1001-HADONG-01 (sức chứa đủ lớn)

### 2. Test đăng ký chéo cơ sở
- SV NGOCTRUC đăng ký lớp CS1001-HADONG-01 (lớp mở ở site khác)

### 3. Test lớp đầy
- SV đăng ký vào lớp có SiSoHienTai = SiSoToiDa

### 4. Test trùng lịch
- SV đăng ký 2 lớp cùng thứ + tiết

### 5. Test tiên quyết
- SV đăng ký CS1003 khi chưa đăng ký CS1001

## Regenerate data

```bash
# Xóa data cũ
rm -rf seeds/output/*

# Sinh lại
python generate_data.py
```

## Lưu ý

1. **Data chung sinh 1 lần** cho cả 3 site (CoSo, Khoa, HocPhan, HocKy, TienQuyet)
2. **Data site sinh riêng** cho từng site (SinhVien, GiangVien, PhongHoc, LopHocPhan, LichHoc)
3. **MaCoSo trong data local luôn đúng site**: SV/GV/PHÒNG/HỌC PHẦN thuộc site nào thì có MaCoSo của site đó
4. **5 lớp đầu có sức chứa nhỏ** (10-15) để test concurrent
