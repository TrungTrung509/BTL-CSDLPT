# README Nghiep Vu

Tai lieu nay mo ta nghiep vu cho de tai 3: he thong dang ky hoc phan nhieu co so. Phan duoi tap trung vao 4 module nen tang:

- quan ly hoc phan
- quan ly lop hoc phan
- quan ly phong hoc
- quan ly lich hoc

Quy uoc vai tro:

- `Admin`: dong vai tro Phong dao tao / quan tri dao tao
- `GiangVien`: giang vien phu trach lop hoc phan
- `SinhVien`: sinh vien tra cuu va dang ky hoc phan

Ve ban chat phan tan:

- `HocPhan`, `HocKy`, `Khoa`, `CoSo` la du lieu dung chung toan truong
- `LopHocPhan`, `PhongHoc`, `LichHoc` la du lieu cuc bo theo co so

## 1. Module Quan Ly Hoc Phan

### Tong quan

Day la module quan ly danh muc hoc phan dung chung cho toan truong. Hoc phan la du lieu nen de mo lop hoc phan o cac co so khac nhau. Hoc phan gan voi khoa phu trach, so tin chi, loai hoc phan, mo ta va trang thai su dung.

### Tinh nang: Tao hoc phan

Nghiep vu:

- Trong giao dien quan tri, neu nguoi dung co quyen quan ly hoc phan thi se hien thi tab `Quan ly hoc phan`.
- Trong trang quan ly hoc phan se hien thi danh sach hoc phan hien co cua toan truong duoi dang bang.
- Moi dong du lieu gom: Ma hoc phan, Ten hoc phan, Khoa phu trach, So tin chi, Loai hoc phan, Trang thai.
- Cuoi moi dong se co nut `Xem chi tiet`.
- Trong man hinh chi tiet se hien thi day du: Ma hoc phan, Ten hoc phan, Khoa phu trach, So tin chi, So tiet ly thuyet, So tiet thuc hanh, Loai hoc phan, Mo ta, Trang thai, Ngay tao.
- O goc phai cua trang quan ly se co nut `Tao hoc phan moi`.
- Khi nguoi dung click `Tao hoc phan moi`, he thong hien thi form nhap:
  - Ma hoc phan
  - Ten hoc phan
  - So tin chi
  - So tiet ly thuyet
  - So tiet thuc hanh
  - Loai hoc phan
  - Khoa phu trach
  - Mo ta
  - Trang thai
- Chi tiet phan quyen:
  - Chi `Admin` moi duoc tao hoc phan.
- Chi tiet validate:
  - Ma hoc phan la duy nhat trong toan he thong.
  - Ten hoc phan khong duoc de trong.
  - `MaKhoa` phai ton tai.
  - `SoTinChi` phai lon hon 0.
  - Tong so tiet khong duoc dong thoi bang 0.
  - `LoaiHocPhan` chi nhan `BatBuoc` hoac `TuChon`.
  - Trang thai ban dau thuong la `HoatDong`.

### Tinh nang: Cap nhat hoc phan

Nghiep vu:

- Trong man hinh chi tiet hoc phan, nguoi co quyen se thay nut `Chinh sua`.
- Khi click vao nut chinh sua, he thong cho phep sua cac thong tin:
  - Ten hoc phan
  - So tin chi
  - So tiet ly thuyet
  - So tiet thuc hanh
  - Loai hoc phan
  - Khoa phu trach
  - Mo ta
  - Trang thai
- Chi tiet phan quyen:
  - Chi `Admin` moi duoc chinh sua hoc phan.
- Chi tiet validate:
  - Khong cho sua ma hoc phan neu ma do da duoc dung lam khoa chinh nghiep vu.
  - Neu hoc phan da duoc mo lop o nhieu hoc ky thi nen han che sua cac thong tin mang tinh ban chat nhu so tin chi hoac khoa phu trach, hoac phai co xac nhan quan tri.
  - Neu hoc phan dang duoc dung de mo lop thi khong nen xoa cung, chi nen doi trang thai.

### Tinh nang: An / ngung su dung hoc phan

Nghiep vu:

- Hoc phan khong nhat thiet phai xoa khoi he thong khi khong con su dung.
- Nguoi quan tri co the chuyen trang thai hoc phan sang dang `NgungMo` hoac `KhongHoatDong` neu he thong muon tach ro hon.
- Khi hoc phan bi ngung su dung:
  - Khong duoc dung de mo lop hoc phan moi.
  - Van duoc phep xem lich su o cac hoc ky cu.
- Chi tiet phan quyen:
  - Chi `Admin` duoc doi trang thai.
- Chi tiet validate:
  - Neu da co lop hoc phan dang mo trong hoc ky hien tai thi khong nen cho ngung ngay, hoac phai buoc dong/huy toan bo lop lien quan truoc.

### Tinh nang: Xem danh sach / xem chi tiet hoc phan

Nghiep vu:

- `Admin`, `GiangVien`, `SinhVien` deu duoc xem danh sach hoc phan.
- Danh sach co the hien thi toan bo hoac theo bo loc:
  - Khoa phu trach
  - Loai hoc phan
  - Trang thai
- Muc dich nghiep vu:
  - `Admin` dung de quan tri danh muc
  - `GiangVien` dung de tra cuu mon minh giang day
  - `SinhVien` dung de xem danh muc mon hoc cua toan truong
- Luu y nghiep vu:
  - Khong nen chan cung kieu “sinh vien khoa nao chi duoc xem hoc phan khoa do”.
  - `MaKhoa` o hoc phan nen hieu la khoa phu trach hoc phan, khong phai khoa duy nhat duoc hoc hoc phan do.

### Tinh nang: Xoa hoc phan

Nghiep vu:

- He thong co the co nut `Xoa`, nhung ve thuc te nen xem day la thao tac han che.
- Chi duoc xoa khi hoc phan chua tung duoc dung de mo lop hoc phan, chua tham gia bang tien quyet, va chua co du lieu lich su lien quan.
- Neu da co du lieu phat sinh thi nen doi trang thai thay vi xoa cung.

## 2. Module Quan Ly Lop Hoc Phan

### Tong quan

Day la module quan ly viec mo lop hoc phan thuc te tai tung co so trong tung hoc ky. Mot hoc phan co the duoc mo thanh nhieu lop o nhieu co so khac nhau. Lop hoc phan gan voi giang vien phu trach, si so toi da, trang thai lop, lich hoc va danh sach dang ky.

### Tinh nang: Tao lop hoc phan / mo lop hoc phan

Nghiep vu:

- Trong giao dien quan tri se co tab `Quan ly lop hoc phan`.
- Trang quan ly lop hoc phan hien thi danh sach cac lop da mo trong hoc ky hien tai hoac theo hoc ky duoc chon.
- Moi dong gom: Ma lop hoc phan, Hoc phan, Hoc ky, Co so mo lop, Giang vien, Si so toi da, Si so hien tai, Trang thai lop.
- Co nut `Mo lop hoc phan moi`.
- Khi click vao `Mo lop hoc phan moi`, he thong hien thi form gom:
  - Ma lop hoc phan
  - Hoc phan
  - Hoc ky
  - Co so mo lop
  - Giang vien phu trach
  - Ten lop hoc phan
  - Si so toi da
  - Hinh thuc hoc
  - Trang thai lop
- Chi tiet phan quyen:
  - Chi `Admin` moi duoc mo lop hoc phan.
- Chi tiet validate:
  - Ma lop hoc phan la duy nhat.
  - Hoc phan phai ton tai va dang hoat dong.
  - Hoc ky phai ton tai va chua ket thuc.
  - Giang vien phai ton tai, dang cong tac.
  - Neu giu dung rule hien tai thi giang vien phai cung co so voi lop.
  - `SiSoToiDa > 0`.
  - `HinhThucHoc` chi duoc la `Offline`, `Online`, `Hybrid`.
  - `TrangThaiLop` chi duoc la `Mo`, `Dong`, `Huy`.

### Tinh nang: Xem chi tiet lop hoc phan

Nghiep vu:

- Khi nguoi dung click `Xem chi tiet`, he thong hien thi:
  - Thong tin hoc phan
  - Thong tin hoc ky
  - Co so mo lop
  - Giang vien phu trach
  - Si so toi da
  - Si so hien tai
  - So cho con lai
  - Hinh thuc hoc
  - Trang thai lop
  - Danh sach lich hoc
  - Danh sach sinh vien dang ky
- Chi tiet phan quyen:
  - `Admin` xem toan bo
  - `GiangVien` xem duoc lop minh phu trach
  - `SinhVien` xem duoc thong tin lop dang mo phuc vu dang ky

### Tinh nang: Cap nhat lop hoc phan

Nghiep vu:

- Trong trang chi tiet lop hoc phan se co nut `Chinh sua`.
- Cac thong tin cho phep chinh sua:
  - Giang vien phu trach
  - Ten lop hoc phan
  - Si so toi da
  - Hinh thuc hoc
  - Trang thai lop
- Chi tiet phan quyen:
  - Chi `Admin` moi duoc cap nhat.
- Chi tiet validate:
  - Khong duoc giam `SiSoToiDa` xuong nho hon so sinh vien da dang ky thuc te.
  - Neu da co lich hoc thi moi phong dang dung van phai du cho cho si so moi.
  - Neu doi giang vien, phai kiem tra giang vien moi khong bi trung lich.
  - Khong nen cho sua `HocPhan`, `HocKy`, `MaCoSo` khi da co dang ky.

### Tinh nang: Dong lop / huy lop hoc phan

Nghiep vu:

- `Dong` nghia la ngung nhan dang ky moi nhung lop van ton tai va co the tiep tuc giang day.
- `Huy` nghia la huy mo lop, khong cho dang ky va khong cho xep lich moi.
- Chi tiet phan quyen:
  - Chi `Admin` thuc hien.
- Chi tiet validate:
  - Neu lop da co dang ky thi khi huy lop can co co che xu ly cac dang ky lien quan.
  - Neu lop da co lich hoc thi can canh bao anh huong truoc khi huy.
  - Lop `Huy` khong duoc phep co them lich hoc hoac dang ky moi.

### Tinh nang: Xoa lop hoc phan

Nghiep vu:

- Thao tac xoa cung chi nen ap dung khi lop chua phat sinh dang ky.
- Neu lop da co du lieu dang ky thi chi nen doi trang thai.
- Chi tiet phan quyen:
  - Chi `Admin`.
- Chi tiet validate:
  - Khong duoc xoa neu da co du lieu dang ky.
  - Neu xoa thi lich hoc cua lop co the bi xoa theo.

### Tinh nang: Xem danh sach sinh vien dang ky cua lop

Nghiep vu:

- Trong man hinh chi tiet lop hoc phan co khu vuc danh sach dang ky.
- Moi dong hien thi:
  - Ma sinh vien
  - Ho va ten
  - Thoi gian dang ky
  - Trang thai dang ky
  - Ghi chu
- Chi tiet phan quyen:
  - `Admin` xem tat ca
  - `GiangVien` chi xem lop minh phu trach

## 3. Module Quan Ly Phong Hoc

### Tong quan

Day la module quan ly thong tin phong hoc theo tung co so. Phong hoc la tai nguyen cuc bo cua tung site va duoc dung de xep lich cho cac lop hoc phan mo tai chinh co so do.

### Tinh nang: Tao phong hoc

Nghiep vu:

- Trong giao dien quan tri se co tab `Quan ly phong hoc`.
- Danh sach phong hoc duoc hien thi theo tung co so.
- Co nut `Tao phong hoc moi`.
- Form nhap gom:
  - Ma phong
  - Ten phong
  - Toa nha
  - Tang
  - Suc chua
  - Loai phong
  - Co so
  - Trang thai
- Chi tiet phan quyen:
  - Chi `Admin`.
- Chi tiet validate:
  - Ma phong la duy nhat trong co so hoac toan he thong theo quy uoc dat ma.
  - `SucChua > 0`.
  - `LoaiPhong` chi duoc la `LyThuyet`, `MayTinh`, `ThiNghiem`, `HoiTruong`.
  - `MaCoSo` phai la co so hop le.
  - `TrangThai` chi duoc la `HoatDong`, `BaoTri`, `NgungSuDung`.

### Tinh nang: Cap nhat phong hoc

Nghiep vu:

- Nguoi quan tri duoc chinh sua:
  - Ten phong
  - Toa nha
  - Tang
  - Suc chua
  - Loai phong
  - Trang thai
- Chi tiet phan quyen:
  - Chi `Admin`.
- Chi tiet validate:
  - Khong duoc giam suc chua xuong nho hon si so cua cac lop dang duoc xep trong phong do.
  - Neu phong dang co lich hoc thi viec chuyen sang `BaoTri` hoac `NgungSuDung` can duoc kiem tra truoc.
  - Khong nen cho doi `MaCoSo` cua phong khi da co lich hoc gan vao.

### Tinh nang: Xem danh sach / xem chi tiet phong hoc

Nghiep vu:

- `Admin`, `GiangVien`, `SinhVien` co the xem danh sach phong neu he thong muon minh bach thong tin tai nguyen.
- Trong thuc te co the chi cho `Admin` va `GiangVien` xem chi tiet day du, con `SinhVien` chu yeu thay ten phong trong lich hoc.
- Thong tin chi tiet gom:
  - Ma phong
  - Ten phong
  - Toa nha
  - Tang
  - Suc chua
  - Loai phong
  - Co so
  - Trang thai

### Tinh nang: Xoa phong hoc

Nghiep vu:

- Chi duoc xoa khi phong chua tung hoac hien khong con duoc su dung trong lich hoc.
- Neu phong da co du lieu lien quan, nen uu tien doi trang thai `NgungSuDung`.
- Chi tiet phan quyen:
  - Chi `Admin`.
- Chi tiet validate:
  - Khong duoc xoa neu phong dang co lich hoc.
  - Neu phong dang duoc dung cho lop o hoc ky hien tai thi phai chan xoa.

## 4. Module Quan Ly Lich Hoc

### Tong quan

Day la module quan ly lich hoc cua tung lop hoc phan. Lich hoc la du lieu dan xuat tu lop hoc phan, tuc la luon phai gan voi mot lop hoc phan cu the. Mot lop co the co nhieu dong lich hoc khac nhau.

### Tinh nang: Tao lich hoc cho lop hoc phan

Nghiep vu:

- Trong man hinh chi tiet lop hoc phan se co khu vuc `Lich hoc`.
- Nguoi quan tri co the bam `Them lich hoc`.
- Form nhap gom:
  - Ma lich
  - Phong hoc
  - Thu trong tuan
  - Tiet bat dau
  - So tiet
  - Ngay bat dau
  - Ngay ket thuc
  - Ghi chu
- Chi tiet phan quyen:
  - Chi `Admin`.
- Chi tiet validate:
  - Phong hoc phai thuoc cung co so voi lop hoc phan.
  - Phong phai dang hoat dong.
  - Suc chua phong phai du cho si so toi da cua lop.
  - `ThuTrongTuan` phai hop le.
  - `TietBatDau + SoTiet - 1` khong duoc vuot qua so tiet toi da trong ngay.
  - Khoang thoi gian lich hoc phai nam trong hoc ky.
  - Lop bi `Huy` thi khong duoc xep lich.
  - Khong duoc trung phong voi lop khac cung khung thoi gian.
  - Khong duoc trung giang vien voi lop khac cung khung thoi gian.
  - Khong duoc tu chong lich trong cung mot lop.

### Tinh nang: Cap nhat lich hoc

Nghiep vu:

- Trong danh sach lich hoc cua lop, moi lich co nut `Chinh sua`.
- Nguoi quan tri duoc doi:
  - Phong
  - Thu
  - Tiet bat dau
  - So tiet
  - Ngay bat dau
  - Ngay ket thuc
  - Ghi chu
- Chi tiet phan quyen:
  - Chi `Admin`.
- Chi tiet validate:
  - Cac rule validate giong khi tao moi.
  - Khi sua, he thong phai bo qua chinh ban ghi lich hien tai de tranh bao trung voi chinh no.

### Tinh nang: Xoa lich hoc

Nghiep vu:

- Trong danh sach lich hoc cua lop co nut `Xoa`.
- Khi xoa lich, he thong yeu cau nguoi dung xac nhan.
- Chi tiet phan quyen:
  - Chi `Admin`.
- Chi tiet validate:
  - Neu hoc ky da bat dau hoac lop dang dien ra, co the can gioi han viec xoa lich de tranh lam sai lech du lieu van hanh.
  - Neu la xoa lich cuoi cung cua lop dang mo, he thong nen canh bao vi lop se khong con thoi khoa bieu.

### Tinh nang: Xem lich hoc

Nghiep vu:

- Nguoi dung co the xem lich hoc theo 3 dang:
  - Theo lop hoc phan
  - Theo giang vien
  - Theo co so
- Chi tiet phan quyen:
  - `Admin` xem tat ca
  - `GiangVien` xem lich giang day cua minh
  - `SinhVien` xem lich cua cac lop minh quan tam hoac da dang ky

## 5. Tom Tat Theo Tinh Than De Tai 3

- `Quan ly hoc phan` la quan ly danh muc dung chung toan truong.
- `Quan ly lop hoc phan` la quan ly phien ban mo thuc te cua hoc phan tai tung co so.
- `Quan ly phong hoc` la quan ly tai nguyen cuc bo cua tung co so.
- `Quan ly lich hoc` la quan ly thoi khoa bieu gan truc tiep voi lop hoc phan.
- Bon module nay la phan nen. Phan “dung chat de tai 3” tiep theo se la:
  - dang ky hoc phan
  - huy dang ky
  - xu ly dong thoi khi het cho
  - thong ke toan truong
