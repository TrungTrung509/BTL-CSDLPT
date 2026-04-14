CREATE OR REPLACE VIEW vw_sinhvien_toantruong AS
SELECT * FROM public.sinhvien
UNION ALL
SELECT * FROM fdw_ngoctruc.sinhvien
UNION ALL
SELECT * FROM fdw_hoalac.sinhvien;

CREATE OR REPLACE VIEW vw_giangvien_toantruong AS
SELECT * FROM public.giangvien
UNION ALL
SELECT * FROM fdw_ngoctruc.giangvien
UNION ALL
SELECT * FROM fdw_hoalac.giangvien;

CREATE OR REPLACE VIEW vw_phonghoc_toantruong AS
SELECT * FROM public.phonghoc
UNION ALL
SELECT * FROM fdw_ngoctruc.phonghoc
UNION ALL
SELECT * FROM fdw_hoalac.phonghoc;

CREATE OR REPLACE VIEW vw_lophocphan_toantruong AS
SELECT * FROM public.lophocphan
UNION ALL
SELECT * FROM fdw_ngoctruc.lophocphan
UNION ALL
SELECT * FROM fdw_hoalac.lophocphan;

CREATE OR REPLACE VIEW vw_lichhoc_toantruong AS
SELECT * FROM public.lichhoc
UNION ALL
SELECT * FROM fdw_ngoctruc.lichhoc
UNION ALL
SELECT * FROM fdw_hoalac.lichhoc;

CREATE OR REPLACE VIEW vw_dangky_toantruong AS
SELECT * FROM public.dangky
UNION ALL
SELECT * FROM fdw_ngoctruc.dangky
UNION ALL
SELECT * FROM fdw_hoalac.dangky;
