# Câu hỏi vấn đáp: So sánh Tập trung và Phân tán

> **Nguồn gốc**: Phần trình bày benchmark trong đồ án BTL Cơ sở dữ liệu phân tán — "Hệ thống đăng ký học phần nhiều cơ sở"

---

## Câu 1: Vì sao nhóm em cần so sánh tập trung và phân tán?

**Trả lời**: Vì so sánh là phương pháp khoa học tiêu chuẩn để đánh giá hai giải pháp. Trong bài toán nhiều cơ sở, không nên chọn phân tán chỉ vì lý thuyết nói phân tán tốt hơn, mà cần có số liệu thực tế. Benchmark cho thấy truy vấn toàn trường trong mô hình tập trung nhanh hơn đáng kể (3.7-371 lần ở một số query), nhưng mô hình phân tán vẫn được chọn vì phù hợp với bài toán thực tế nhiều cơ sở, khả năng mở rộng, và tính sẵn sàng cao hơn.

---

## Câu 2: Phương án tập trung trong dự án được mô phỏng như thế nào?

**Trả lời**: Nhóm thêm một service PostgreSQL mới tên `postgres_centralized` vào `docker-compose.yml`, chạy port 5435 trên máy host, container `csdlpt_centralized`. Database này không dùng FDW, không dùng replication. Schema tập trung gom dữ liệu từ 3 site (HADONG, NGOCTRUC, HOALAC) bằng cách import common tables một lần từ HADONG, và local tables (SinhVien, LopHocPhan, DangKy...) từ cả 3 site, thêm cột `SourceSite` để truy vết nguồn gốc. `MaCoSo` được giữ nguyên từ dữ liệu gốc để phân biệt cơ sở.

---

## Câu 3: Phương án phân tán trong dự án được mô phỏng như thế nào?

**Trả lời**: Hệ thống gồm 3 PostgreSQL site trên 3 port khác nhau (5432 HADONG, 5433 NGOCTRUC, 5434 HOALAC). Mỗi site quản lý bảng local (SinhVien, LopHocPhan, DangKy...) riêng, với `MaCoSo` cố định tại mỗi site. Bảng common (CoSo, Khoa, HocPhan, HocKy...) được replicate sang tất cả các site qua logical replication. Tại site HADONG, FDW được cấu hình để truy vấn dữ liệu từ NGOCTRUC và HOALAC thông qua các foreign server. Views như `vw_sinhvien_toantruong`, `vw_lophocphan_toantruong` được tạo từ FDW để truy vấn toàn trường.

---

## Câu 4: Vì sao truy vấn local có thể nhanh hơn trong mô hình phân tán?

**Trả lời**: Vì dữ liệu local nằm trực tiếp tại site, không cần truyền qua mạng. Không phải filter theo `MaCoSo` trên toàn bộ dữ liệu 3 site. Mỗi site chỉ quản lý 1/N dữ liệu, giảm tải I/O trên disk và bộ đệm. Khi scale lên (100 cơ sở), truy vấn local tại phân tán chỉ đọc 1% dữ liệu trong khi tập trung đọc toàn bộ rồi filter.

---

## Câu 5: Vì sao truy vấn toàn trường thường chậm hơn trong mô hình phân tán?

**Trả lời**: Vì mỗi foreign table scan phải khởi tạo kết nối qua FDW, serialize query, gửi qua Docker bridge network đến container khác, thực thi tại remote site, nhận kết quả và deserialize. Kết quả từ 3 site được `Append` rồi mới `HashAggregate`. Từ benchmark Q2, tổng FDW overhead là ~15 ms, trong khi centralized trung bình 0.280 ms (3 lần chạy). Ngoài ra, PostgreSQL không biết distribution của dữ liệu remote nên query plan cho foreign scan có thể không tối ưu.

---

## Câu 6: FDW ảnh hưởng gì đến hiệu năng?

**Trả lời**: FDW là cầu nối giữa các site, nhưng gây overhead đáng kể:
- **Connection overhead**: Mỗi foreign scan tốn ~8-9 ms để thiết lập kết nối và nhận kết quả (từ benchmark Q2).
- **Serialization/deserialization**: Dữ liệu phải chuyển đổi qua pg_dump protocol.
- **No statistics**: PostgreSQL không có statistics cho dữ liệu remote, nên query planner ước lượng cost cố định (100.00) thay vì dựa trên dữ liệu thực.
- **Append overhead**: Kết quả từ local + N foreign scans phải được `Append` trước khi aggregate.

---

## Câu 7: Nếu mô hình tập trung nhanh hơn ở một số query thì vì sao vẫn chọn phân tán?

**Trả lời**: Vì hiệu năng không phải tiêu chí duy nhất để chọn kiến trúc. Dự án phân tán được chọn vì:
1. **Phù hợp bài toán thực tế**: Mỗi cơ sở đại học tự quản dữ liệu, không phụ thuộc DB trung tâm.
2. **Khả năng mở rộng**: Thêm cơ sở mới không cần thay đổi DB trung tâm.
3. **Tính sẵn sàng**: 1 site chết không ảnh hưởng nghiệp vụ local tại site còn sống. Tập trung có single point of failure.
4. **Yêu cầu môn học**: Đồ án minh chứng kiến thức CSDL phân tán (FDW, replication, fragmentation).

Đây là trade-off có chủ đích: chấp nhận truy vấn toàn trường chậm hơn để đổi lấy khả năng mở rộng và tính sẵn sàng.

---

## Câu 8: Dữ liệu nào trong mô hình phân tán được nhân bản (replicated)?

**Trả lời**: Các bảng **common/replicated** gồm:
- `CoSo` — thông tin cơ sở
- `Khoa` — thông tin khoa
- `HocPhan` — danh mục học phần
- `HocKy` — danh mục học kỳ
- `TienQuyet` — quan hệ tiên quyết giữa học phần
- `users` — tài khoản người dùng

Các bảng này được replicate sang cả 3 site qua **logical replication** (publication/subscription). Mỗi site đều có bản copy giống nhau, đảm bảo tính nhất quán khi truy vấn local có JOIN với bảng replicated.

---

## Câu 9: Dữ liệu nào được phân mảnh (fragmented)?

**Trả lời**: Các bảng **local** được phân mảnh ngang theo cơ sở:
- `SinhVien` — mỗi site chỉ chứa sinh viên thuộc cơ sở mình
- `GiangVien` — mỗi site chỉ chứa giảng viên thuộc cơ sở mình
- `PhongHoc` — mỗi site chỉ chứa phòng học thuộc cơ sở mình
- `LopHocPhan` — mỗi site chỉ chứa lớp học phần mở tại cơ sở mình
- `LichHoc` — mỗi site chỉ chứa lịch học của LHP thuộc cơ sở mình
- `DangKy` — mỗi site chỉ chứa đăng ký của SV thuộc cơ sở mình

Fragmentation key là `MaCoSo`. Mỗi site có đúng dữ liệu local của mình, `MaCoSo` = site ID.

---

## Câu 10: Nếu site HADONG lỗi thì mô hình phân tán bị ảnh hưởng thế nào?

**Trả lời**: Các site NGOCTRUC và HOALAC **vẫn hoạt động bình thường** vì chúng độc lập. Sinh viên tại NGOCTRUC và HOALAC vẫn đăng ký học phần được. Tuy nhiên, truy vấn toàn trường từ NGOCTRUC hoặc HOALAC sẽ bị ảnh hưởng nếu chúng cũng dùng FDW. Bảng replicated vẫn có dữ liệu cũ (trước khi HADONG chết) tại 2 site còn lại. Đăng ký chéo cơ sở từ NGOCTRUC/HOALAC sang HADONG sẽ không thực hiện được. FDW server của HADONG không còn available.

---

## Câu 11: Nếu database tập trung lỗi thì chuyện gì xảy ra?

**Trả lời**: **Toàn bộ hệ thống ngừng hoạt động**. Không có site nào có thể truy vấn, đăng ký, hay thao tác dữ liệu. Đây là **single point of failure** — điểm yếu lớn nhất của mô hình tập trung. Ngoài ra, khi dữ liệu tập trung quá lớn, single server PostgreSQL có thể trở thành bottleneck về I/O và CPU.

---

## Câu 12: Mô hình nào dễ mở rộng hơn khi thêm cơ sở mới?

**Trả lời**: **Phân tán dễ mở rộng hơn nhiều**. Khi thêm cơ sở mới (ví dụ BINHTHANH):
- **Phân tán**: Tạo container PostgreSQL mới với dữ liệu local, cấu hình FDW tại HADONG để connect, setup publication để replicate common tables. Không cần thay đổi database hiện tại.
- **Tập trung**: Phải migrate dữ liệu local của cơ sở mới vào database trung tâm, tăng tải I/O/CPU trên server đó, cập nhật tất cả application code.

Mô hình phân tán có tính **horizontal scalability** tự nhiên.

---

## Câu 13: Mô hình nào dễ triển khai hơn?

**Trả lời**: **Tập trung dễ triển khai hơn đáng kể**. Chỉ cần 1 PostgreSQL, không cần cấu hình FDW, không cần replication, không cần 3PC/transaction coordination. Schema đơn giản, không có khái niệm fragmentation hay source tracking. Benchmark cũng cho thấy tập trung đơn giản mà nhanh hơn ở hầu hết query. Tuy nhiên, "dễ triển khai" không đồng nghĩa với "phù hợp". Bài toán nhiều cơ sở đòi hỏi mô hình phân tán dù phức tạp hơn.

---

## Câu 14: Mô hình nào phù hợp hơn với bài toán trường nhiều cơ sở?

**Trả lời**: **Phân tán phù hợp hơn** vì:
1. Mỗi cơ sở có quyền tự quản dữ liệu local, không phụ thuộc DB trung tâm.
2. Dữ liệu local (sinh viên, lớp học phần, đăng ký) gắn liền với cơ sở — phân mảnh tự nhiên.
3. Khi cơ sở mở rộng, chỉ cần thêm site mới, không cần nâng cấp server trung tâm.
4. Mỗi cơ sở có thể hoạt động độc lập khi các cơ sở khác gặp sự cố.
5. Đáp ứng yêu cầu thực tế của trường đại học nhiều cơ sở (VNU, các trường đại học lớn).

---

## Câu 15: Hạn chế của benchmark hiện tại là gì?

**Trả lời**: Dataset nhỏ (~30 sinh viên, 30 LHP, 2 đăng ký toàn trường) nên:
1. Chênh lệch thời gian có thể chưa phản ánh đúng xu hướng ở scale lớn (hàng nghìn/billions rows).
2. FDW overhead chiếm tỷ trọng lớn trong tổng thời gian ở dataset nhỏ, nhưng sẽ giảm tương đối khi dữ liệu lớn hơn.
3. Không benchmark được write operations (INSERT/UPDATE/DELETE) — đặc biệt quan trọng cho transaction cross-site.
4. Không benchmark được replication lag — thời gian sync dữ liệu common giữa các site.
5. Không benchmark được failover — khi 1 site chết, hệ thống phân tán phản ứng thế nào.
6. Không benchmark được connection pooling (PgBouncer) — có thể giảm FDW overhead.

Benchmark này đóng vai trò **baseline tham khảo**, không phải đánh giá definitive.

---

## Lưu ý khi trả lời vấn đáp

1. **Nói đúng những gì code có**: Chỉ nói về FDW nếu đã verify FDW được setup. Chỉ nói về replication nếu đã verify replication đang chạy.
2. **Dùng số liệu cụ thể từ benchmark**: "Query thống kê sinh viên toàn trường: centralized trung bình 0.280 ms (3 lần chạy), distributed trung bình 103.909 ms" — đây là số thật từ EXPLAIN ANALYZE.
3. **Giải thích trade-off**: Không nói "phân tán luôn tốt hơn" hay "tập trung luôn tốt hơn". Nói rõ từng trường hợp.
4. **Nói rõ đây là mô phỏng**: Các container chạy trên cùng máy, không có network thực giữa các site. Trong thực tế, khoảng cách địa lý sẽ khiến FDW overhead lớn hơn nhiều.
5. **Sẵn sàng giải thích code**: Nếu được hỏi, sẵn sàng cho thấy script setup, query benchmark, kết quả EXPLAIN ANALYZE.
