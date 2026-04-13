# BTL-CSDLPT

He thong CSDL phan tan cho bai toan dang ky hoc phan nhieu co so.

Repo nay hien tai chay tot phan:

- Docker infrastructure
- 3 site PostgreSQL
- Redis
- Elasticsearch + Kibana
- Schema SQL
- Seed du lieu mau

Repo nay chua co backend/API hoan chinh trong `app/`, vi cac file Python chinh van dang rong. Nghia la ban co the dung va demo phan CSDL, nhung chua co web/API de chay.

## 1. Cau truc thu muc

```text
BTL-CSDLPT/
|-- docker/                 # docker-compose, bien moi truong
|-- db/                     # schema common va schema local tung site
|-- sql/                    # index va script SQL bo sung
|-- seeds/                  # script sinh seed + file SQL seed da sinh
|-- infra/scripts/          # script seed ho tro chay
`-- app/                    # khung ung dung, chua hoan thien
```

## 2. Dieu kien can truoc khi chay

- Docker Desktop da cai va dang chay
- PowerShell tren Windows
- pgAdmin neu muon xem bang/giao dien

Khuyen nghi:

- Dung PowerShell thay vi Git Bash de chay cac lenh trong README nay
- Neu may da co PostgreSQL local dang dung port `5432`, repo da doi `HADONG` sang port `5435` de tranh xung dot

## 3. Thong tin ket noi mac dinh

Doc tu `docker/.env`:

- `HADONG`: host `localhost`, port `5435`, db `csdlpt_hadong`
- `NGOCTRUC`: host `localhost`, port `5433`, db `csdlpt_ngoctruc`
- `HOALAC`: host `localhost`, port `5434`, db `csdlpt_hoalac`
- user: `csdlpt_user`
- password: `csdlpt_pass`

## 4. Chay du an tu dau

Mo PowerShell tai thu muc goc repo:

```powershell
cd d:\CSDLPT\BTL-CSDLPT
```

### Buoc 1: Khoi dong Docker services

```powershell
docker compose -f docker\docker-compose.yml up -d
```

Kiem tra container:

```powershell
docker compose -f docker\docker-compose.yml ps
```

Ban can thay cac container:

- `csdlpt_hadong`
- `csdlpt_ngoctruc`
- `csdlpt_hoalac`
- `csdlpt_redis`
- `csdlpt_elasticsearch`
- `csdlpt_kibana`

### Buoc 2: Kiem tra bang da duoc tao

Schema duoc tao tu dong khi PostgreSQL khoi tao volume moi.

Kiem tra nhanh:

```powershell
docker exec csdlpt_hadong psql -U csdlpt_user -d csdlpt_hadong -c "\dt"
```

Neu thay cac bang nhu `coso`, `khoa`, `hocphan`, `sinhvien`, `dangky`... thi schema da tao thanh cong.

### Buoc 3: Seed du lieu

Repo da co script seed UTF-8 an toan de tranh loi tieng Viet:

```powershell
powershell -ExecutionPolicy Bypass -File .\infra\scripts\seed.ps1
```

Lenh nay seed tat ca 3 site:

- `hadong`
- `ngoctruc`
- `hoalac`

Neu chi muon seed 1 site:

```powershell
powershell -ExecutionPolicy Bypass -File .\infra\scripts\seed.ps1 -Site hadong
powershell -ExecutionPolicy Bypass -File .\infra\scripts\seed.ps1 -Site ngoctruc
powershell -ExecutionPolicy Bypass -File .\infra\scripts\seed.ps1 -Site hoalac
```

### Buoc 4: Kiem tra du lieu sau khi seed

```powershell
docker exec csdlpt_hadong psql -U csdlpt_user -d csdlpt_hadong -c "SELECT COUNT(*) FROM CoSo;"
docker exec csdlpt_hadong psql -U csdlpt_user -d csdlpt_hadong -c "SELECT COUNT(*) FROM SinhVien;"
docker exec csdlpt_hadong psql -U csdlpt_user -d csdlpt_hadong -c "SELECT COUNT(*) FROM LopHocPhan;"
```

Ky vong gan dung:

- `CoSo`: 3
- `Khoa`: 4
- `HocPhan`: 20
- `HocKy`: 3
- `SinhVien`: 20 mỗi site
- `GiangVien`: 5 mỗi site
- `PhongHoc`: 6 mỗi site
- `LopHocPhan`: 8-10 mỗi site

## 5. Ket noi bang pgAdmin

Tao 3 server moi trong pgAdmin:

### HADONG

- Host: `localhost`
- Port: `5435`
- Database: `csdlpt_hadong`
- Username: `csdlpt_user`
- Password: `csdlpt_pass`

### NGOCTRUC

- Host: `localhost`
- Port: `5433`
- Database: `csdlpt_ngoctruc`
- Username: `csdlpt_user`
- Password: `csdlpt_pass`

### HOALAC

- Host: `localhost`
- Port: `5434`
- Database: `csdlpt_hoalac`
- Username: `csdlpt_user`
- Password: `csdlpt_pass`

Duong dan xem bang trong pgAdmin:

```text
Servers
`-- CSDLPT HADONG
    `-- Databases
        `-- csdlpt_hadong
            `-- Schemas
                `-- public
                    `-- Tables
```

## 6. Reset sach va chay lai tu dau

Neu da seed loi, loi tieng Viet, hoac muon tao lai DB tu dau:

```powershell
docker compose -f docker\docker-compose.yml down -v
docker compose -f docker\docker-compose.yml up -d
powershell -ExecutionPolicy Bypass -File .\infra\scripts\seed.ps1
```

`down -v` se:

- dung container
- xoa container
- xoa volume du lieu cua project nay

Sau do PostgreSQL se khoi tao schema lai tu dau khi `up -d`.

## 7. Mot so cau SQL kiem tra nhanh

### Liet ke bang

```sql
SELECT table_name
FROM information_schema.tables
WHERE table_schema = 'public'
ORDER BY table_name;
```

### Kiem tra du lieu co so

```sql
SELECT * FROM CoSo;
```

### Dem so sinh vien theo site

```sql
SELECT MaCoSo, COUNT(*)
FROM SinhVien
GROUP BY MaCoSo
ORDER BY MaCoSo;
```

### Tim cac lop co si so nho de test concurrent

```sql
SELECT MaLopHP, SiSoToiDa, SiSoHienTai
FROM LopHocPhan
WHERE SiSoToiDa <= 15
ORDER BY SiSoToiDa, MaLopHP;
```

## 8. Loi thuong gap

### 1. Khong thay bang sau khi `up -d`

Neu khong thay bang, thu:

```powershell
docker compose -f docker\docker-compose.yml down -v
docker compose -f docker\docker-compose.yml up -d
```

Nguyen nhan pho bien:

- volume cu khien PostgreSQL khong chay lai init script
- ban chua refresh trong pgAdmin

### 2. Seed xong bi vo tieng Viet

Khong dung `Get-Content ... | docker exec ... psql` nua.

Hay dung:

```powershell
powershell -ExecutionPolicy Bypass -File .\infra\scripts\seed.ps1
```

Script nay copy file SQL vao container va chay `psql -f` ben trong container voi `PGCLIENTENCODING=UTF8`.

### 3. Git Bash bao `Get-Content: command not found`

Do `Get-Content` la lenh PowerShell, khong phai Bash.

Cach don gian nhat:

- mo PowerShell
- chay lai cac lenh trong README nay

### 4. Khong ket noi duoc pgAdmin vao Docker PostgreSQL

Kiem tra:

```powershell
docker compose -f docker\docker-compose.yml ps
```

Va dung dung port:

- `5435` cho `HADONG`
- `5433` cho `NGOCTRUC`
- `5434` cho `HOALAC`

## 9. Script hien co

- `infra/scripts/seed.ps1`: seed UTF-8 an toan cho 1 hoac tat ca site

## 10. Trang thai hien tai cua repo

Da hoan thanh:

- Docker compose cho ha tang
- Schema SQL
- Seed data
- Chay va kiem tra tren PostgreSQL/pgAdmin

Chua hoan thanh:

- API/backend trong `app/`
- luong ung dung hoan chinh cho nguoi dung cuoi

Neu muc tieu la demo do an CSDL phan tan, phan hien tai da du de:

- dung 3 site PostgreSQL
- tao schema
- seed du lieu
- demo truy van va kiem tra du lieu
