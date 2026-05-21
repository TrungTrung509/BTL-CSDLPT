# Database Tập Trung - CSDLPT

## Mục đích

Database tập trung `csdlpt_centralized` được tạo để phục vụ benchmark so sánh hiệu năng giữa mô hình CSDL tập trung và phân tán.

## Kết nối

- **Container**: `csdlpt_centralized`
- **Host Port**: `5435`
- **Database**: `csdlpt_centralized`
- **User**: `csdlpt_user`
- **Password**: `csdlpt_pass`
- **Network**: `csdlpt_network` (cùng network với 3 site phân tán)

## Cấu trúc Schema

Schema gom dữ liệu từ 3 site (HADONG, NGOCTRUC, HOALAC) vào một database duy nhất.

### Bảng Common (dùng chung)

| Bảng | Mô tả |
|-------|--------|
| `CoSo` | Thông tin cơ sở |
| `users` | Người dùng hệ thống |
| `Khoa` | Khoa đào tạo |
| `HocPhan` | Danh mục học phần |
| `HocKy` | Học kỳ |
| `TienQuyet` | Quan hệ học phần tiên quyết |

### Bảng Local (gom từ 3 site + SourceSite)

| Bảng | Mô tả | SourceSite |
|-------|--------|------------|
| `SinhVien` | Sinh viên | HADONG/NGOCTRUC/HOALAC |
| `GiangVien` | Giảng viên | HADONG/NGOCTRUC/HOALAC |
| `PhongHoc` | Phòng học | HADONG/NGOCTRUC/HOALAC |
| `LopHocPhan` | Lớp học phần | HADONG/NGOCTRUC/HOALAC |
| `LichHoc` | Lịch học | HADONG/NGOCTRUC/HOALAC |
| `DangKy` | Đăng ký học phần | HADONG/NGOCTRUC/HOALAC |
| `AuditLog` | Log tổng hợp | HADONG/NGOCTRUC/HOALAC |
| `DangKyLog` | Log đăng ký/hủy | HADONG/NGOCTRUC/HOALAC |

### Bảng Transaction/Log

| Bảng | Mô tả |
|-------|--------|
| `DangKy_3PC` | Giao dịch 3PC đăng ký |
| `DangKy_Log` | Log giao dịch cross-site |
| `NhatKyThaoTac` | Nhật ký thao tác |
| `ReplicationOutbox` | Outbox cho replication |
| `SiteStatus` | Trạng thái các site |

## Điểm khác biệt so với schema phân tán

1. **DangKy**: Dùng `BIGSERIAL` thay vì `SERIAL` để tránh trùng khi gom từ 3 site.
2. **Thêm cột `SourceSite`**: Tất cả bảng local đều có cột `SourceSite` để biết bản ghi đến từ site nào.
3. **Thêm cột `OriginalMaDangKy`**: Trong bảng `DangKy`, lưu lại `MaDangKy` gốc tại site nguồn.
4. **Không có FDW/Replication**: Database tập trung không dùng FDW hay logical replication.
5. **`MaCoSo` tự nhiên**: Không có default cứng `MaCoSo`, giá trị lấy từ dữ liệu import.

## Cách sử dụng

```bash
# Bật database tập trung
docker compose -f docker/docker-compose.yml up -d postgres_centralized

# Setup schema và import dữ liệu
powershell -ExecutionPolicy Bypass -File scripts/setup_centralized_db.ps1

# Chạy benchmark
powershell -ExecutionPolicy Bypass -File scripts/run_centralized_vs_distributed_benchmark.ps1

# Kiểm tra counts
powershell -ExecutionPolicy Bypass -File scripts/check_centralized_counts.ps1
```

## Lưu ý

- Database tập trung **không ảnh hưởng** đến 3 site phân tán.
- Dữ liệu trong centralized là snapshot tại thời điểm import.
- Cần chạy lại import nếu muốn sync dữ liệu mới nhất.
