# FDW setup

Thu muc nay chua cau hinh `postgres_fdw` cho ca 3 site.

- `01_hadong_fdw.sql`: HADONG ket noi NGOCTRUC va HOALAC
- `02_ngoctruc_fdw.sql`: NGOCTRUC ket noi HADONG va HOALAC
- `03_hoalac_fdw.sql`: HOALAC ket noi HADONG va NGOCTRUC

Moi script se:

1. Bat `postgres_fdw`
2. Tao schema `fdw_*` cho site tu xa
3. Tao `SERVER` va `USER MAPPING`
4. `IMPORT FOREIGN SCHEMA` cho cac bang local can truy van lien site:
   - `sinhvien`
   - `giangvien`
   - `phonghoc`
   - `lophocphan`
   - `lichhoc`
   - `dangky`

Luu y:

- Khong mount truc tiep cac file nay vao `docker-entrypoint-initdb.d/`
- Repo dung container bootstrap `csdlpt_fdw_setup` de chay sau khi ca 3 PostgreSQL healthy
