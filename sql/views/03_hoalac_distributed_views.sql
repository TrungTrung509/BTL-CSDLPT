CREATE OR REPLACE VIEW vw_sinhvien_toantruong AS
SELECT * FROM public.sinhvien
UNION ALL
SELECT * FROM fdw_hadong.sinhvien
UNION ALL
SELECT * FROM fdw_ngoctruc.sinhvien;

CREATE OR REPLACE VIEW vw_giangvien_toantruong AS
SELECT * FROM public.giangvien
UNION ALL
SELECT * FROM fdw_hadong.giangvien
UNION ALL
SELECT * FROM fdw_ngoctruc.giangvien;

CREATE OR REPLACE VIEW vw_phonghoc_toantruong AS
SELECT * FROM public.phonghoc
UNION ALL
SELECT * FROM fdw_hadong.phonghoc
UNION ALL
SELECT * FROM fdw_ngoctruc.phonghoc;

CREATE OR REPLACE VIEW vw_lophocphan_toantruong AS
SELECT * FROM public.lophocphan
UNION ALL
SELECT * FROM fdw_hadong.lophocphan
UNION ALL
SELECT * FROM fdw_ngoctruc.lophocphan;

CREATE OR REPLACE VIEW vw_lichhoc_toantruong AS
SELECT * FROM public.lichhoc
UNION ALL
SELECT * FROM fdw_hadong.lichhoc
UNION ALL
SELECT * FROM fdw_ngoctruc.lichhoc;

CREATE OR REPLACE VIEW vw_dangky_toantruong AS
SELECT * FROM public.dangky
UNION ALL
SELECT * FROM fdw_hadong.dangky
UNION ALL
SELECT * FROM fdw_ngoctruc.dangky;
