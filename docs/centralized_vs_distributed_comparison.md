# So sánh phương án Cơ sở dữ liệu Tập trung và Phân tán

> **Mục đích**: So sánh hiệu năng truy vấn giữa mô hình tập trung (centralized) và phân tán (distributed) trong hệ thống đăng ký học phần nhiều cơ sở.
>
> **Thời điểm benchmark**: 2026-05-13 10:15:00
>
> **Môi trường**: Docker containers trên máy cục bộ (PostgreSQL 15 Alpine)
>
> **Dataset**: 3 cơ sở (HADONG, NGOCTRUC, HOALAC), mỗi site 10 SinhVien, 10 LopHocPhan, 15 LichHoc. Tổng centralized: 30 SinhVien, 30 LopHocPhan, 45 LichHoc, rất ít bản ghi DangKy (khoảng 2 trong lần benchmark). Dataset nhỏ, chỉ phù hợp để phân tích xu hướng kiến trúc.

---

## 1. Mục tiêu so sánh

Việc so sánh tập trung và phân tán nhằm đánh giá:

1. **Truy vấn local**: Truy vấn dữ liệu thuộc cơ sở hiện tại — mô hình phân tán có lợi vì dữ liệu nằm đúng site.
2. **Truy vấn toàn trường**: Truy vấn gom dữ liệu từ nhiều cơ sở — mô hình tập trung có lợi vì không cần truyền qua mạng.
3. **Chi phí FDW**: Truy vấn phân tán phải qua Foreign Data Wrapper để lấy dữ liệu từ site khác.
4. **Khả năng mở rộng**: Khi thêm cơ sở mới, mô hình nào dễ mở rộng hơn.
5. **Tính sẵn sàng**: Khi một site/cơ sở gặp sự cố, hệ thống còn hoạt động không.

---

## 2. Mô hình Tập trung

### Kiến trúc

```
┌─────────────────────────────────────┐
│     PostgreSQL Centralized          │
│     (csdlpt_centralized)          │
│     Port: 5435                    │
│     Container: csdlpt_centralized  │
│                                     │
│  ┌─────────────────────────────┐  │
│  │    COMMON TABLES            │  │
│  │  CoSo, Khoa, HocPhan,     │  │
│  │  HocKy, TienQuyet, users  │  │
│  └─────────────────────────────┘  │
│                                     │
│  ┌─────────────────────────────┐  │
│  │    LOCAL TABLES (merged)   │  │
│  │  SinhVien [+SourceSite]   │  │
│  │  GiangVien [+SourceSite]  │  │
│  │  LopHocPhan [+SourceSite] │  │
│  │  DangKy [+SourceSite]      │  │
│  │  ...                      │  │
│  └─────────────────────────────┘  │
└─────────────────────────────────────┘
```

### Đặc điểm

- **Một PostgreSQL duy nhất** chứa toàn bộ dữ liệu của 3 cơ sở.
- Port `5435`, database `csdlpt_centralized`.
- `MaCoSo` dùng để phân biệt cơ sở trong dữ liệu local.
- **Không dùng FDW** — không có truy vấn cross-site qua mạng.
- **Không dùng replication** — dữ liệu common không cần sync.
- Thêm cột `SourceSite` cho bảng local để truy vết nguồn gốc.

---

## 3. Mô hình Phân tán

### Kiến trúc

```
  HADONG (5432)          NGOCTRUC (5433)         HOALAC (5434)
┌────────────────┐    ┌────────────────┐    ┌────────────────┐
│ Local tables   │    │ Local tables   │    │ Local tables   │
│ SinhVien      │    │ SinhVien       │    │ SinhVien       │
│ LopHocPhan    │    │ LopHocPhan     │    │ LopHocPhan     │
│ DangKy        │    │ DangKy         │    │ DangKy         │
│ ...           │    │ ...            │    │ ...            │
└───────┬────────┘    └────────────────┘    └────────────────┘
        │
        │  FDW (HADONG)
        │  ngoctruc_server ──► NGOCTRUC
        │  hoalac_server  ──► HOALAC
        ▼
┌─────────────────────────────────────────┐
│ Foreign Tables / vw_*_toantruong views  │
│ (query toàn trường từ HADONG)          │
└─────────────────────────────────────────┘

Common tables (CoSo, Khoa, HocPhan, ...)
REPLICATED tại mỗi site
```

### Đặc điểm

- **3 PostgreSQL site**, mỗi site tự quản dữ liệu local.
- Common tables **nhân bản** tại mỗi site.
- FDW + `vw_*_toantruong` views dùng cho truy vấn toàn trường.
- `MaCoSo` là thuộc tính cố hữu của mỗi site.

---

## 4. Bảng so sánh kiến trúc

| Tiêu chí | Tập trung | Phân tán |
|---|---|
| **Cấu trúc lưu trữ** | 1 database, tất cả dữ liệu gom chung | 3 database, dữ liệu phân mảnh theo cơ sở |
| **Truy vấn local** | Tìm kiếm trên toàn bộ, lọc `MaCoSo` | Truy vấn trực tiếp tại site, không cần lọc |
| **Truy vấn toàn trường** | JOIN trong 1 DB, nhanh | Cần FDW, `Append` + `Foreign Scan`, chậm hơn |
| **Giao dịch đăng ký** | ACID toàn cục, đơn giản | Cần 3PC/transaction coordination/advisory lock/SELECT FOR UPDATE nếu cross-site, phức tạp hơn |
| **Giao dịch chéo cơ sở** | Không vấn đề (1 DB) | Rất phức tạp, cần coordination |
| **Tính sẵn sàng** | Single point of failure | Cao hơn, các nghiệp vụ local tại site còn sống vẫn có thể tiếp tục, nhưng truy vấn toàn trường hoặc giao dịch chéo site liên quan site lỗi sẽ bị ảnh hưởng |
| **Khả năng chịu lỗi** | Phụ thuộc vào 1 server | Tốt hơn, site độc lập |
| **Khả năng mở rộng** | Thêm site cần migrate dữ liệu về 1 DB | Dễ mở rộng, thêm site mới độc lập |
| **Độ phức tạp triển khai** | Đơn giản | Phức tạp (FDW, replication, transaction coordination) |
| **Phù hợp bài toán nhiều cơ sở** | Không tự nhiên | Tự nhiên, mỗi cơ sở tự quản |

---

## 5. Kịch bản Benchmark (7 cặp query)

### QUERY 1 — Danh sách lớp học phần theo cơ sở HADONG

**Mục tiêu**: So sánh truy vấn local tại một cơ sở.

**Query tập trung**:
```sql
SELECT lhp."MaLopHP", lhp."MaHP", lhp."MaGV", lhp."SiSoToiDa", lhp."MaHocKy",
       hp."TenHP", hp."SoTCLyThuyet", hp."SoTCTH"
FROM "LopHocPhan" lhp
JOIN "HocPhan" hp ON lhp."MaHP" = hp."MaHP"
WHERE lhp."MaCoSo" = 'HADONG'
ORDER BY lhp."MaLopHP";
```

**Query phân tán**: Truy vấn trực tiếp bảng `LopHocPhan` tại site HADONG (đã có sẵn dữ liệu local).

**Dữ liệu**: 10 LopHocPhan tại HADONG.

**Kết quả**:

|  | Tập trung | Phân tán |
|---|---|---|
| Execution Time (avg 3 runs) | **1.325 ms** | **0.669 ms** |
| Planning Time | 11.129 ms | 7.666 ms |
| Buffers | shared hit=25 | shared hit=25 |
| Ghi chú | Index Scan trên idx_lophocphan_macoso | Index Scan trên idx_lophocphan_macoso |
| Foreign Scan | Không | Không |

**Nhận xét**: Đây là truy vấn local, dữ liệu đã nằm sẵn tại site. Phân tán nhanh hơn  (0.669 ms vs 1.325 ms, trung bình 3 lần chạy). Tập trung phải lọc `WHERE MaCoSo = 'HADONG'` trên toàn bộ 30 rows, trong khi phân tán chỉ đọc 10 rows local. Với dữ liệu lớn hơn, lợi thế này sẽ rõ rệt hơn.

---

### QUERY 2 — Thống kê số sinh viên theo từng cơ sở

**Mục tiêu**: So sánh truy vấn aggregate toàn trường.

**Query tập trung**:
```sql
SELECT "MaCoSo", COUNT(*) AS "TongSinhVien"
FROM "SinhVien"
GROUP BY "MaCoSo";
```

**Query phân tán**: Dùng `vw_sinhvien_toantruong` (FDW append 3 site).

**Dữ liệu**: Tổng 30 SinhVien (10 mỗi site).

**Kết quả**:

|  | Tập trung | Phân tán |
|---|---|---|
| Execution Time (avg 3 runs) | **0.280 ms** | **103.909 ms** |
| Planning Time | 3.663 ms | 5.178 ms |
| Ghi chú | Seq Scan trên bảng 30 rows | Append + 2 Foreign Scan + HashAggregate |
| Foreign Scan | Không | Có (2 remote sites) |

**Nhận xét**: Mô hình phân tán **chậm hơn ~371 lần** ở query này. Lý do: PostgreSQL phải thực hiện `HashAggregate` trên kết quả `Append` từ 3 site qua FDW. Chi phí network qua Docker bridge + FDW wrapper rất lớn so với một `Seq Scan` trên 30 rows. Đây là điểm yếu rõ ràng của mô hình phân tán khi aggregate toàn trường.

---

### QUERY 3 — Thống kê số lớp học phần theo cơ sở (toàn trường)

**Mục tiêu**: So sánh aggregate toàn trường trên bảng LopHocPhan (đếm số lớp học phần theo MaCoSo).

**Query tập trung**:
```sql
SELECT "MaCoSo", COUNT(*) AS "TongLopHP"
FROM "LopHocPhan"
GROUP BY "MaCoSo";
```

**Query phân tán**: Dùng `vw_lophocphan_toantruong` (FDW append 3 site).

**Dữ liệu**: 30 LopHocPhan toàn trường (10 mỗi site).

**Kết quả**:

|  | Tập trung | Phân tán |
|---|---|---|
| Execution Time (avg 3 runs) | **4.804 ms** | **17.598 ms** |
| Planning Time | 2.125 ms | 1.699 ms |
| Ghi chú | Seq Scan 30 rows | Append + 2 Foreign Scan |
| Foreign Scan | Không | Có |

**Nhận xét**: Phân tán chậm hơn ~3.7 lần. Mặc dù kết quả trả về giống nhau (3 groups, mỗi group 10 rows), chi phí FDW/foreign scan khiến distributed chậm đáng kể. Chênh lệch có thể giảm tương đối khi dữ liệu lớn hơn.

---

### QUERY 4 — Danh sách sinh viên đăng ký chéo cơ sở

**Mục tiêu**: So sánh join nhiều bảng với dữ liệu cross-site.

**Query tập trung**: JOIN `DangKy`, `SinhVien`, `LopHocPhan` trong 1 DB với điều kiện `MaCoSo` khác nhau.

**Query phân tán**: JOIN qua `vw_dangky_toantruong`, `vw_sinhvien_toantruong`, `vw_lophocphan_toantruong`.

**Dữ liệu**: Tổng 2 bản ghi DangKy (2 đăng ký nhưng không có đăng ký chéo cơ sở trong dataset hiện tại — tất cả 2 bản ghi đều cùng cơ sở với LHP được đăng ký).

**Kết quả**:

|  | Tập trung | Phân tán |
|---|---|---|
| Execution Time (avg 3 runs) | **1.402 ms** | **39.523 ms** |
| Planning Time | 5.063 ms | 10.184 ms |
| Ghi chú | Hash Join local | Merge Append + Nested Loop + Materialize |
| Foreign Scan | Không | Có (3 tables × 2 remote sites) |
| Kết quả trả về | rows=0 (không có cross-site) | rows=0 (không có cross-site) |

**Nhận xét**: Phân tán chậm hơn ~28 lần. Cả hai mô hình đều trả về 0 dòng (không có đăng ký chéo cơ sở trong dataset hiện tại), nhưng distributed phải thực hiện `Merge Append` + `Materialize` + `Nested Loop` qua 3 foreign tables × 2 remote sites, tốn chi phí rất lớn. Đặc biệt với các join phức tạp qua nhiều bảng, chi phí FDW nhân lên nhanh.

---

### QUERY 5 — Học phần có nhiều sinh viên đăng ký nhất toàn trường

**Mục tiêu**: So sánh aggregate + join toàn trường.

**Query tập trung**: JOIN `DangKy`, `LopHocPhan`, `HocPhan`, GROUP BY theo `MaHP`.

**Query phân tán**: Tương tự nhưng dùng `vw_dangky_toantruong` và `vw_lophocphan_toantruong`.

**Dữ liệu**: 2 DangKy, 30 LopHocPhan.

**Kết quả**:

|  | Tập trung | Phân tán |
|---|---|---|
| Execution Time (avg 3 runs) | **5.317 ms** | **32.999 ms** |
| Planning Time | 1.136 ms | 9.347 ms |
| Ghi chú | Nested Loop + Index Scan | Hash Join + Append + 2 Foreign Scan |
| Foreign Scan | Không | Có |

**Nhận xét**: Phân tán chậm hơn ~6.2 lần. Mặc dù kết quả trả về đúng (top HocPhan theo số đăng ký), chi phí FDW cho mỗi table trong join rất lớn. Mô hình tập trung chỉ cần index scan + nested loop trong 1 database.

---

### QUERY 6 — Sĩ số từng lớp học phần tại HADONG

**Mục tiêu**: So sánh truy vấn local kết hợp aggregate.

**Query tập trung**:
```sql
SELECT lhp."MaLopHP", lhp."SiSoToiDa", COUNT(dk."MaDangKy") AS "SiSoHienTai"
FROM "LopHocPhan" lhp
LEFT JOIN "DangKy" dk ON lhp."MaLopHP" = dk."MaLopHP"
WHERE lhp."MaCoSo" = 'HADONG'
GROUP BY lhp."MaLopHP", lhp."SiSoToiDa";
```

**Query phân tán**: Truy vấn tại HADONG site (dữ liệu local).

**Dữ liệu**: 10 LopHocPhan tại HADONG.

**Kết quả**:

|  | Tập trung | Phân tán |
|---|---|---|
| Execution Time (avg 3 runs) | **0.510 ms** | **0.542 ms** |
| Planning Time | 0.454 ms | 0.802 ms |
| Ghi chú | Nested Loop Left Join | Merge Left Join + Index Scan |

**Nhận xét**: Phân tán **chậm hơn nhẹ** (0.542 ms vs 0.510 ms). Đây là trường hợp cả hai gần như bằng nhau — cả hai đều là local query tại HADONG. Tập trung phải lọc `MaCoSo = 'HADONG'` trên toàn bộ dữ liệu, phân tán đọc trực tiếp local. Chênh lệch ~0.03 ms là không đáng kể.

---

### QUERY 7 — Thống kê đăng ký theo học kỳ

**Mục tiêu**: So sánh truy vấn toàn trường với nhiều join.

**Query tập trung**: JOIN `HocKy`, `LopHocPhan`, `DangKy` để thống kê theo học kỳ.

**Query phân tán**: Tương tự nhưng dùng `vw_lophocphan_toantruong` và `vw_dangky_toantruong`.

**Dữ liệu**: 8 học kỳ, 30 LopHocPhan, 2 đăng ký.

**Kết quả**:

|  | Tập trung | Phân tán |
|---|---|---|
| Execution Time (avg 3 runs) | **5.107 ms** | **13.869 ms** |
| Planning Time | 4.781 ms | 3.606 ms |
| Ghi chú | Hash Left Join + Seq Scan | Hash Left Join + Append + 2 Foreign Scan |
| Foreign Scan | Không | Có |

**Nhận xét**: Phân tán chậm hơn ~2.7 lần. `HocKy` là bảng replicated (không cần FDW), nhưng `LopHocPhan` và `DangKy` cần FDW nên chi phí vẫn cao hơn đáng kể.

---

## 6. Bảng tổng hợp kết quả Benchmark

> **Lưu ý quan trọng**: Dataset hiện tại rất nhỏ (30 SinhVien, 30 LopHocPhan, rất ít DangKy toàn trường). Kết quả này chỉ dùng để phân tích xu hướng kiến trúc, **không phải kết luận hiệu năng tuyệt đối**. Ở scale lớn (hàng nghìn/billions rows), kết quả và chênh lệch có thể thay đổi.

| STT | Nghiệp vụ | Tập trung (ms) | Phân tán (ms) | FDW? | Nhanh hơn |
|-----|-----------|---------------:|--------------:|------|-----------|
| 1 | Danh sách LHP theo cơ sở HADONG | 1.325 | 0.669 | Không | **Phân tán** (local) |
| 2 | Thống kê SV theo cơ sở | 0.280 | 103.909 | Có | **Tập trung** (~371x) |
| 3 | Tỷ lệ lấp đầy lớp học phần | 4.804 | 17.598 | Có | **Tập trung** (~3.7x) |
| 4 | Danh sách đăng ký chéo cơ sở | 1.402 | 39.523 | Có | **Tập trung** (~28x) |
| 5 | HP nhiều SV đăng ký nhất | 5.317 | 32.999 | Có | **Tập trung** (~6.2x) |
| 6 | Sĩ số LHP tại HADONG | 0.510 | 0.542 | Không | **Tập trung** (nhẹ) |
| 7 | Thống kê đăng ký theo HK | 5.107 | 13.869 | Có | **Tập trung** (~2.7x) |

**Tổng kết**: Các truy vấn toàn trường cho thấy mô hình tập trung nhanh hơn rõ rệt do không phải trả chi phí FDW. Với truy vấn local, hai mô hình gần như tương đương: Q1 phân tán nhanh hơn trong lần đo này, còn Q6 tập trung nhanh hơn rất nhẹ.

---

## 7. Phân tích kết quả

### 7.1. Truy vấn local

Truy vấn Q1 và Q6 (local data) cho thấy cả hai mô hình có thời gian tương đương hoặc phân tán nhẹ hơn ở scale nhỏ. Trong thực tế, mô hình phân tán có lợi hơn cho truy vấn local vì:
- Dữ liệu nằm tại site, không cần truyền qua mạng.
- Không phải filter `MaCoSo` trên toàn bộ dữ liệu.
- Mỗi site chỉ quản lý dữ liệu của mình, giảm tải I/O.

### 7.2. Truy vấn toàn trường

Truy vấn Q2, Q3, Q4, Q5, Q7 (global aggregate/join) cho thấy mô hình tập trung **áp đảo** về hiệu năng. Lý do chính:

1. **FDW overhead**: Mỗi foreign table scan phải khởi tạo kết nối, serialize query, gửi qua Docker bridge network, nhận kết quả, deserialize. Chi phí này rất lớn so với `Seq Scan` nội bộ.
2. **Append + Foreign Scan**: Khi query qua view toàn trường (ví dụ `vw_sinhvien_toantruong`), PostgreSQL thực hiện `Append` kết quả từ local + 2 foreign scans. Điều này tạo thêm overhead cho `HashAggregate`.
3. **Network latency**: Dù cùng Docker network, network I/O qua container vẫn chậm hơn memory/in-process access.

### 7.3. Chi phí FDW cụ thể

Từ kết quả Q2: foreign scan từ NGOCTRUC và HOALAC mỗi scan tốn ~7-8 ms để lấy 10 rows. Tổng FDW overhead cho truy vấn này là ~15 ms, trong khi toàn bộ centralized query chỉ tốn 0.280 ms (trung bình 3 lần chạy).

### 7.4. Single Point of Failure

Mô hình tập trung có nguy cơ lớn: nếu database tập trung bị chết, **toàn bộ hệ thống ngừng hoạt động**. Mô hình phân tán có khả năng chịu lỗi tốt hơn — nếu 1 site chết, các nghiệp vụ local tại site còn sống vẫn có thể tiếp tục, nhưng truy vấn toàn trường hoặc giao dịch chéo site liên quan đến site lỗi sẽ bị ảnh hưởng.

### 7.5. Mở rộng

Mô hình tập trung có giới hạn về khả năng mở rộng: khi thêm cơ sở mới, phải migrate dữ liệu vào 1 DB, tăng tải trên 1 server. Mô hình phân tán dễ mở rộng hơn — chỉ cần thêm 1 site mới với dữ liệu local.

### 7.6. Dữ liệu nhỏ

Dataset hiện tại rất nhỏ (30 SinhVien, 30 LopHocPhan, rất ít DangKy toàn trường). Ở scale lớn hơn (hàng nghìn/billions rows), xu hướng vẫn giữ nguyên nhưng chênh lệch có thể thu hẹp hoặc thay đổi:
- Local query phân tán có thể nhanh hơn đáng kể khi dữ liệu local chỉ chiếm 1/N.
- Global query tập trung vẫn nhanh hơn nhưng centralized DB có thể trở thành bottleneck khi tải cao.

---

## 8. Kết luận lựa chọn

### 8.1. Về hiệu năng

Dựa trên benchmark, mô hình tập trung **nhanh hơn** ở hầu hết kịch bản truy vấn (5/7), đặc biệt là truy vấn toàn trường. Nếu chỉ xét hiệu năng thuần túy, tập trung là lựa chọn tốt hơn.

### 8.2. Về kiến trúc và yêu cầu môn học

Tuy nhiên, dự án **chọn mô hình phân tán** làm mô hình chính vì:

1. **Phù hợp bài toán thực tế**: Trường đại học nhiều cơ sở cần mỗi cơ sở tự quản dữ liệu của mình, không phụ thuộc vào 1 database trung tâm.
2. **Khả năng mở rộng**: Thêm cơ sở mới chỉ cần thêm 1 site độc lập, không cần thay đổi cấu trúc DB hiện tại.
3. **Tính sẵn sàng**: 1 site chết không ảnh hưởng nghiệp vụ local tại site còn sống. Tập trung có single point of failure.
4. **Quyền tự quản dữ liệu**: Mỗi cơ sở có toàn quyền quản lý dữ liệu local của mình (SinhVien, LopHocPhan, DangKy).
5. **Replication đảm bảo nhất quán cho common tables**: Các bảng dùng chung (CoSo, Khoa, HocPhan) được replicate đảm bảo tính nhất quán.
6. **Yêu cầu môn Cơ sở dữ liệu phân tán**: Dự án minh chứng kiến thức về FDW, logical replication, 3PC/transaction coordination, data fragmentation.

### 8.3. Benchmark này có ý nghĩa gì?

Kết quả benchmark **không phủ nhận** mô hình phân tán. Nó cho thấy:

- Truy vấn toàn trường chậm hơn đáng kể trong mô hình phân tán, nhưng đây là trade-off chấp nhận được để đổi lấy khả năng mở rộng và tính sẵn sàng.
- Với dataset nhỏ, centralized nhanh hơn rõ rệt. Với dataset lớn, centralized có thể gặp bottleneck I/O, trong khi phân tán phân tải.
- Mô hình tập trung được dùng làm **baseline** để đối chứng — đây là phương pháp đánh giá khoa học tiêu chuẩn.

### 8.4. Cải tiến tiềm năng cho mô hình phân tán

- **Materialized views**: Tạo materialized view cho các truy vấn toàn trường thường dùng, refresh định kỳ.
- **Connection pooling**: Dùng PgBouncer để giảm FDW connection overhead.
- **Partitioning**: Partition bảng lớn tại site trung tâm để cải thiện query plan.
- **Caching**: Cache kết quả truy vấn toàn trường tại application layer.

---

## 9. File benchmark

| File | Mô tả |
|------|-------|
| `sql/benchmark/centralized_queries.sql` | 7 query cho centralized DB |
| `sql/benchmark/distributed_queries.sql` | 7 query cho distributed DB (HADONG + FDW) |
| `docs/benchmark/benchmark_results_*.md` | Raw output EXPLAIN ANALYZE |

---

## 10. Cách chạy lại benchmark

```powershell
# 1. Đảm bảo tất cả container đang chạy
docker compose -f docker/docker-compose.yml ps

# 2. Setup centralized DB (nếu chưa có)
powershell -ExecutionPolicy Bypass -File scripts/setup_centralized_db.ps1

# 3. Chạy benchmark
powershell -ExecutionPolicy Bypass -File scripts/run_centralized_vs_distributed_benchmark.ps1

# 4. Kết quả nằm trong docs/benchmark/benchmark_results_TIMESTAMP.md
```
