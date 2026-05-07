

# 1. Module Tài khoản / Đăng nhập

## Nghiệp vụ nên thêm

### 1. Đăng nhập theo tài khoản dùng chung

* Người dùng đăng nhập qua bảng `users`
* Sau khi đăng nhập, hệ thống trả:

  * `access_token`
  * `refresh_token`
* Dựa vào `MaCoSo` trong `access_token`, hệ thống biết user thuộc site nào để route query

### 2. Xem hồ sơ người dùng hiện tại

* API `GET /auth/me`
* Trả thông tin account + thông tin domain tương ứng:

  * nếu role là sinh viên thì trả thêm hồ sơ sinh viên
  * nếu role là giảng viên thì trả thêm hồ sơ giảng viên
  * nếu role là admin thì trả thông tin quản trị

### 3. Đổi mật khẩu

* user nhập mật khẩu cũ và mật khẩu mới
* kiểm tra mật khẩu cũ đúng mới cho đổi

### 4. Khóa / mở khóa tài khoản

* admin có thể chuyển `status` của user
* khi tài khoản bị khóa thì không đăng nhập được

# 2. Module Cơ sở đào tạo

## Nghiệp vụ nên thêm

### 1. Chỉ cho phép một số tài khoản quản lý cơ sở
* 1 admin
* admin toàn trường được tạo/sửa `CoSo` (??)
* admin cơ sở chỉ được xem cơ sở của mình (??)

### 2. Xem tổng quan theo từng cơ sở

* mỗi cơ sở hiển thị nhanh:

  * số sinh viên
  * số giảng viên
  * số lớp học phần đang mở
  * số phòng học đang hoạt động

### 3. Bật / tắt trạng thái cơ sở

* ví dụ thêm trạng thái:

  * `HoatDong`
  * `TamNgung`
* nếu cơ sở tạm ngừng thì không mở lớp mới, không cho đki học phần,..


# 3. Module Sinh viên

## Nghiệp vụ nên thêm

### 1. Kích hoạt / bảo lưu / thôi học

* thay đổi `TrangThaiSinhVien`
* nếu sinh viên `BaoLuu` hoặc `ThoiHoc` thì không được đăng ký học phần

### 2. Xem tiến độ học tập cơ bản

* tổng số học phần đã đăng ký
* tổng số tín chỉ đã đăng ký trong kỳ
* số học phần còn thiếu tiên quyết(??)

### 3. Xem lịch học cá nhân

* gom lịch học từ các lớp đã đăng ký
* hiển thị theo thứ trong tuần / tiết học
* hiển thị tkb theo học kỳ

### 4. Tra cứu đăng ký theo học kỳ

* sinh viên xem mình đã đăng ký gì trong từng học kỳ(học phần nào,bao nhiêu tín chỉ?)

## Cách triển khai

* thêm endpoint:

  * `GET /students/{id}/schedule`
  * `GET /students/{id}/enrollments`
  * `GET /students/{id}/summary`
* dùng join giữa `DangKy`, `LopHocPhan`, `LichHoc`, `HocPhan`

---

# 4. Module Giảng viên

## Nghiệp vụ nên thêm

### 1. Xem danh sách lớp đang phụ trách

* giảng viên xem toàn bộ lớp mình dạy trong học kỳ

### 2. Xem lịch dạy cá nhân

* tương tự sinh viên nhưng theo `MaGV`

### 3. Xem danh sách sinh viên của lớp

* giảng viên chọn lớp và xem danh sách sinh viên đã đăng ký

### 4. Kiểm tra xung đột lịch dạy

* khi phân công giảng viên cho lớp mới,kiểm tra để cảnh báo nếu trùng lịch (gán lịch + validate)

## Cách triển khai

* thêm endpoint:

  * `GET /lecturers/{id}/sections`
  * `GET /lecturers/{id}/schedule`
  * `GET /course-sections/{id}/students`

---

# 5. Module Học phần

## Nghiệp vụ nên thêm

### 1. Quản lý học phần tiên quyết

* thêm / xóa / xem danh sách tiên quyết
* hiển thị rõ quan hệ giữa học phần chính và học phần tiên quyết

### 2. Tìm kiếm học phần

* tìm theo:

  * mã học phần
  * tên học phần
  * khoa


### 3. Xem những học phần nào được mở trong học kỳ nào

* từ học phần có thể xem tất cả lớp học phần đang mở

### 4. Vô hiệu hóa học phần

* không xóa cứng học phần
* chỉ chuyển trạng thái không cho mở lớp mới

## Cách triển khai

* endpoint:

  * `GET /courses/{id}/prerequisites`
  * `POST /courses/{id}/prerequisites`
  * `GET /courses/{id}/sections`


---

# 6. Module Lớp học phần

## Nghiệp vụ nên thêm

### 1. Mở lớp học phần theo học kỳ

* chọn học phần, học kỳ, cơ sở, giảng viên, sĩ số tối đa

### 2. Đóng lớp / hủy lớp

* lớp đang mở có thể chuyển sang:

  * `Mo`
  * `Dong`
  * `Huy`

### 3. Cảnh báo lớp gần đầy

* ví dụ khi sĩ số đạt 80% thì gắn cờ `GanDay`

### 4. Xem tỷ lệ lấp đầy lớp

* hiển thị:

  * sĩ số tối đa
  * sĩ số hiện tại
  * phần trăm lấp đầy

## Cách triển khai

* thêm endpoint:

  * `GET /course-sections/{id}/capacity`
  * `GET /course-sections?status=Mo`
  * `PATCH /course-sections/{id}/status`

---

# 7. Module Phòng học và Lịch học

## Nghiệp vụ nên thêm

### 1. Kiểm tra trùng phòng khi tạo lịch

* không cho 2 lớp dùng cùng phòng, cùng thời điểm

### 2. Kiểm tra sức chứa phòng

* phòng phải đủ chỗ cho sĩ số lớp

### 3. Xem lịch sử dụng phòng

* mỗi phòng có lịch riêng theo tuần

### 4. Xem lịch học của lớp

* lớp học phần có thể có nhiều buổi
* học được bao nhiêu % của thời lượng học
* hiển thị đầy đủ theo thứ, tiết, phòng

## Cách triển khai

* khi tạo `LichHoc`, validate:

  * phòng không trùng
  * giảng viên không trùng lịch
  * phòng đủ sức chứa

---

# 8. Module Đăng ký học phần


### 1. Kiểm tra điều kiện trước khi đăng ký

Trước khi bấm đăng ký, hệ thống kiểm tra:

* sinh viên còn hoạt động không
* lớp có đang mở không
* lớp còn chỗ không
* đã đăng ký lớp này chưa
* có trùng lịch không
* có đủ tiên quyết không
* có vượt số tín chỉ tối đa trong kỳ không

### 2. Đăng ký chéo cơ sở

* sinh viên ở cơ sở A được đăng ký lớp mở ở cơ sở B
* nhưng transaction phải chạy ở site mở (thao tác ghi dữ liệu đăng ký phải thực hiện ở database/site của cơ sở B.)

### 3. Đăng ký nhiều lớp trong một lần (?????)

* cho phép gửi danh sách lớp
* hệ thống kiểm tra từng lớp và trả danh sách thành công/thất bại

### 4. Danh sách chờ khi lớp đầy

* nếu lớp đầy, sinh viên có thể vào waitlist (?)
#### Cách triển khai mức cơ bản


* `Tạo bảng Waitlist`

Mỗi dòng thể hiện một sinh viên đang chờ một lớp học phần.

Các cột nên có:

`MaSV`
`MaLopHP`
`NgayThamGiaCho`
`TrangThaiWaitlist (như DangCho, DaNhanCho, DaHuy)`
`có thể thêm ThuTuUuTien`

* Khóa hợp lý:

unique theo `MaSV + MaLopHP` để một sinh viên không vào chờ 2 lần cho cùng một lớp
* Khi sinh viên đăng ký lớp đã đầy

Luồng nghiệp vụ:

* kiểm tra lớp có đang mở không
* kiểm tra sinh viên đã đăng ký lớp này chưa
* kiểm tra sinh viên đã có trong waitlist chưa
* nếu lớp đầy thì không insert vào DangKy
* thay vào đó insert vào Waitlist

Kết quả trả về có thể là:

Đăng ký lớp không thành công vì lớp đã đầy
Sinh viên đã được đưa vào danh sách chờ
3. Khi có người hủy đăng ký

Luồng nghiệp vụ:

giảm sĩ số lớp
kiểm tra lớp đó có ai trong Waitlist không
lấy người đứng đầu danh sách chờ theo NgayThamGiaCho hoặc ThuTuUuTien
chuyển người đó từ Waitlist sang DangKy
tăng lại sĩ số lớp
cập nhật trạng thái waitlist thành DaNhanCho

Nếu muốn làm an toàn hơn thì bước này nên chạy trong một transaction để tránh lỗi tranh chấp dữ liệu.

4. API cơ bản nên có

Có thể thêm các API như:

POST /waitlist/join
cho sinh viên vào danh sách chờ
DELETE /waitlist/leave
cho sinh viên rời danh sách chờ
GET /waitlist/me
xem các lớp mình đang chờ
GET /waitlist/class/{maLopHP}
admin xem danh sách chờ của một lớp
POST /waitlist/process/{maLopHP}
xử lý danh sách chờ khi có chỗ trống

## Cách triển khai

* procedure `sp_register_course`
* có endpoint kiểm tra eligibility trước
* có endpoint đăng ký thật sự
* có log đăng ký thành công/thất bại

---

# 9. Module Hủy đăng ký

## Nghiệp vụ nên thêm

### 1. Chỉ được hủy trong thời gian cho phép

* ví dụ chỉ cho hủy trước ngày X

### 2. Khi hủy thì trả lại chỗ cho lớp

* cập nhật lại sĩ số hiện tại

### 3. Ghi nhật ký hủy đăng ký

* lưu:

  * sinh viên nào
  * lớp nào
  * thời gian nào
  * lý do hủy

### 4. Nếu có waitlist thì đẩy người đầu tiên vào chỗ trống

* đây là mở rộng đẹp nếu bạn làm thêm waitlist

## Cách triển khai

* procedure `sp_cancel_course`
* update `DangKy`
* update `LopHocPhan`
* insert `DangKyLog` hoặc `AuditLog`

---

# 10. Module Tra cứu kết quả đăng ký

## Nghiệp vụ nên thêm

### 1. Tra cứu theo sinh viên

* tất cả lớp đã đăng ký
* theo học kỳ
* theo trạng thái(dki thanh cong,that bai)

### 2. Tra cứu theo lớp

* danh sách sinh viên đã đăng ký lớp đó

### 3. Tra cứu theo học kỳ

* mỗi học kỳ có bao nhiêu lượt đăng ký

### 4. Xem chi tiết một lượt đăng ký

* hiển thị:

  * học phần
  * lớp học phần
  * giảng viên
  * lịch học
  * trạng thái đăng ký



# 11. Module Thống kê

## Nghiệp vụ nên thêm

### 1. Thống kê theo cơ sở

* số sinh viên
* số giảng viên
* số lớp mở
* số lượt đăng ký

### 2. Thống kê toàn trường

* tổng số lớp
* tổng số lượt đăng ký
* lớp nào đông nhất
* cơ sở nào nhiều lớp nhất

### 3. Thống kê lớp gần đầy
- Thống kê lớp học phần mở gần đân

### 4. Thống kê theo khoa

* số học phần
* số lớp mở
* số lượt đăng ký theo khoa

## Cách triển khai

* dùng view tổng hợp `vw_*`
* hoặc query phân tán qua FDW


---

# 12. Module Search

## Nghiệp vụ nên thêm

### 1. Search học phần theo tên/mã

### 2. Search lớp học phần theo:

* học phần
* cơ sở
* giảng viên
* thứ/ca học

### 3. Gợi ý khi gõ từ khóa

* autocomplete cho tên học phần

### 4. Tìm lớp còn chỗ

* filter chỉ hiện lớp chưa đầy

## Cách triển khai

* nếu muốn đơn giản: SQL LIKE
* nếu muốn đẹp hơn: Elasticsearch

---

# 13. Module Log / Audit

## Nghiệp vụ nên thêm

### 1. Nhật ký đăng ký học phần

* ghi từng lần đăng ký
* thành công hay thất bại
* lý do thất bại

### 2. Nhật ký hủy đăng ký

### 3. Nhật ký thao tác admin

* tạo sinh viên
* mở lớp
* đổi trạng thái lớp
* khóa user



## Cách triển khai

* bảng `DangKyLog`
* bảng `AuditLog`
* endpoint xem log cho admin

---

