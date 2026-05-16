# Benchmark Results: Centralized vs Distributed
Generated: 2026-05-13 10:15:00

## ENVIRONMENT

- **Centralized DB**: csdlpt_centralized (port 5435)
- **Distributed Sites**: csdlpt_hadong (5432), csdlpt_ngoctruc (5433), csdlpt_hoalac (5434)
- **Note**: FDW setup at HADONG site connects to NGOCTRUC and HOALAC
- **Note**: Benchmark run 3 times; reported times are averages

---

## CENTRALIZED MODEL RESULTS (port 5435)

Data: SinhVien=30, LopHocPhan=30, LichHoc=45, DangKy~2 (very few DangKy records, ~2 in benchmark run)

### Round 1 - Execution Times
| Q | Exec Time (ms) |
|---|---------------|
| Q1 | 1.902 |
| Q2 | 0.269 |
| Q3 | 0.241 |
| Q4 | 1.235 |
| Q5 | 2.322 |
| Q6 | 0.605 |
| Q7 | 3.589 |

### Round 2 - Execution Times
| Q | Exec Time (ms) |
|---|---------------|
| Q1 | 1.297 |
| Q2 | 0.335 |
| Q3 | 13.528 |
| Q4 | 1.705 |
| Q5 | 12.576 |
| Q6 | 0.486 |
| Q7 | 7.779 |

### Round 3 - Execution Times
| Q | Exec Time (ms) |
|---|---------------|
| Q1 | 0.724 |
| Q2 | 0.235 |
| Q3 | 0.644 |
| Q4 | 1.265 |
| Q5 | 1.054 |
| Q6 | 0.438 |
| Q7 | 3.954 |

### Average Execution Time (ms) - Centralized
| Q | R1 | R2 | R3 | **Avg** |
|---|----|----|----|---------|
| Q1 | 1.902 | 1.297 | 0.724 | **1.325** |
| Q2 | 0.269 | 0.335 | 0.235 | **0.280** |
| Q3 | 0.241 | 13.528 | 0.644 | **4.804** |
| Q4 | 1.235 | 1.705 | 1.265 | **1.402** |
| Q5 | 2.322 | 12.576 | 1.054 | **5.317** |
| Q6 | 0.605 | 0.486 | 0.438 | **0.510** |
| Q7 | 3.589 | 7.779 | 3.954 | **5.107** |

---

## DISTRIBUTED MODEL RESULTS (HADONG site with FDW)

Data: Same as centralized (3 sites queried via FDW)

### Round 1 - Execution Times
| Q | Exec Time (ms) |
|---|---------------|
| Q1 | 0.915 |
| Q2 | 95.305 |
| Q3 | 13.977 |
| Q4 | 29.551 |
| Q5 | 29.285 |
| Q6 | 0.662 |
| Q7 | 12.011 |

### Round 2 - Execution Times
| Q | Exec Time (ms) |
|---|---------------|
| Q1 | 0.694 |
| Q2 | 145.539 |
| Q3 | 23.957 |
| Q4 | 59.152 |
| Q5 | 45.629 |
| Q6 | 0.511 |
| Q7 | 16.344 |

### Round 3 - Execution Times
| Q | Exec Time (ms) |
|---|---------------|
| Q1 | 0.397 |
| Q2 | 70.883 |
| Q3 | 14.859 |
| Q4 | 29.865 |
| Q5 | 24.083 |
| Q6 | 0.453 |
| Q7 | 13.251 |

### Average Execution Time (ms) - Distributed
| Q | R1 | R2 | R3 | **Avg** |
|---|----|----|----|---------|
| Q1 | 0.915 | 0.694 | 0.397 | **0.669** |
| Q2 | 95.305 | 145.539 | 70.883 | **103.909** |
| Q3 | 13.977 | 23.957 | 14.859 | **17.598** |
| Q4 | 29.551 | 59.152 | 29.865 | **39.523** |
| Q5 | 29.285 | 45.629 | 24.083 | **32.999** |
| Q6 | 0.662 | 0.511 | 0.453 | **0.542** |
| Q7 | 12.011 | 16.344 | 13.251 | **13.869** |

---

## SUMMARY TABLE

| STT | Query | Centralized Avg (ms) | Distributed Avg (ms) | FDW? | Nhanh hơn |
|-----|-------|---------------------:|---------------------:|------|-----------|
| Q1 | Danh sách LHP theo cơ sở HADONG (local) | 1.325 | 0.669 | Không | **Distributed** |
| Q2 | Thống kê sinh viên theo cơ sở (global) | 0.280 | 103.909 | Có | **Centralized** (~371x) |
| Q3 | Thống kê số lớp học phần theo cơ sở (global) | 4.804 | 17.598 | Có | **Centralized** (~3.7x) |
| Q4 | Danh sách đăng ký chéo cơ sở (global join) | 1.402 | 39.523 | Có | **Centralized** (~28x) |
| Q5 | HP nhiều SV đăng ký nhất toàn trường (global) | 5.317 | 32.999 | Có | **Centralized** (~6.2x) |
| Q6 | Sĩ số LHP tại HADONG (local) | 0.510 | 0.542 | Không | **Centralized** (nhẹ) |
| Q7 | Thống kê đăng ký theo học kỳ (global) | 5.107 | 13.869 | Có | **Centralized** (~2.7x) |

**Tổng kết**: 5/7 query tập trung nhanh hơn, 2/7 phân tán nhẹ hơn (Q1, Q6 - cả hai đều là local queries).

---

## RAW EXPLAIN ANALYZE OUTPUT (Round 3 - Latest)

### CENTRALIZED (port 5435)

**Q1:**
```
                                                                      QUERY PLAN
 Sort  (cost=16.59..16.60 rows=1 width=600) (actual time=0.495..0.497 rows=10 loops=1)
   Sort Key: lhp."MaLopHP"
   Sort Method: quicksort  Memory: 25kB
   Buffers: shared hit=25
   ->  Nested Loop  (cost=0.28..16.58 rows=1 width=600) (actual time=0.246..0.299 rows=10 loops=1)
         Buffers: shared hit=22
         ->  Index Scan using idx_lophocphan_macoso on "LopHocPhan" lhp  (cost=0.14..8.16 rows=1 width=182) (actual time=0.107..0.115 rows=10 loops=1)
               Index Cond: (("MaCoSo")::text = 'HADONG'::text)
               Buffers: shared hit=2
         ->  Index Scan using "HocPhan_pkey" on "HocPhan" hp  (cost=0.14..8.16 rows=1 width=476) (actual time=0.015..0.015 rows=1 loops=10)
               Index Cond: (("MaHP")::text = (lhp."MaHP")::text)
               Buffers: shared hit=20
 Planning: Buffers: shared hit=271
 Planning Time: 11.129 ms  Execution Time: 0.724 ms (16 rows)
```

**Q2:**
```
                                                     QUERY PLAN
 GroupAggregate  (cost=12.37..13.42 rows=60 width=46) (actual time=0.128..0.141 rows=3 loops=1)
   Group Key: "MaCoSo"
   Buffers: shared hit=1
   ->  Sort  (cost=12.37..12.52 rows=60 width=38) (actual time=0.109..0.114 rows=30 loops=1)
         Sort Key: "MaCoSo"
         Sort Method: quicksort  Memory: 26kB
         Buffers: shared hit=1
         ->  Seq Scan on "SinhVien"  (cost=0.00..10.60 rows=60 width=38) (actual time=0.018..0.032 rows=30 loops=1)
               Buffers: shared hit=1
 Planning: Buffers: shared hit=96
 Planning Time: 3.663 ms  Execution Time: 0.235 ms (13 rows)
```

**Q3:**
```
                                                        QUERY PLAN
 GroupAggregate  (cost=14.83..18.95 rows=110 width=94) (actual time=0.373..0.391 rows=3 loops=1)
   Group Key: "MaCoSo"
   Buffers: shared hit=1
   ->  Sort  (cost=14.83..15.10 rows=110 width=46) (actual time=0.324..0.329 rows=30 loops=1)
         Sort Key: "MaCoSo"
         Sort Method: quicksort  Memory: 26kB
         Buffers: shared hit=1
         ->  Seq Scan on "LopHocPhan" lhp  (cost=0.00..11.10 rows=110 width=46) (actual time=0.091..0.107 rows=30 loops=1)
               Buffers: shared hit=1
 Planning: Buffers: shared hit=2 read=1
 Planning Time: 2.125 ms  Execution Time: 0.644 ms (13 rows)
```

**Q4:**
```
                                                                QUERY PLAN
 Limit  (cost=37.57..37.62 rows=20 width=232) (actual time=0.938..0.942 rows=0 loops=1)
   Buffers: shared hit=6
   ->  Sort  (cost=37.57..37.76 rows=79 width=232) (actual time=0.935..0.939 rows=0 loops=1)
         Sort Key: dk."NgayDangKy" DESC
         Sort Method: quicksort  Memory: 25kB
         Buffers: shared hit=6
         ->  Hash Join  (cost=23.82..35.46 rows=79 width=232) (actual time=0.791..0.794 rows=0 loops=1)
               Hash Cond: ((dk."MaLopHP")::text = (lhp."MaLopHP")::text)
               Join Filter: ((sv."MaCoSo")::text <> (lhp."MaCoSo")::text)
               Rows Removed by Join Filter: 2
               Buffers: shared hit=3
               ->  Hash Join  (cost=11.35..22.37 rows=80 width=398) (actual time=0.428..0.433 rows=2 loops=1)
                     Hash Cond: ((dk."MaSV")::text = (sv."MaSV")::text)
                     Buffers: shared hit=2
                     ->  Seq Scan on "DangKy" dk  (cost=0.00..10.80 rows=80 width=124) (actual time=0.175..0.176 rows=2 loops=1)
                           Buffers: shared hit=1
                     ->  Hash  (cost=10.60..10.60 rows=60 width=332) (actual time=0.080..0.081 rows=30 loops=1)
                           Buckets: 1024  Batches: 1  Memory Usage: 10kB
                           Buffers: shared hit=1
                           ->  Seq Scan on "SinhVien" sv  (cost=0.00..10.60 rows=60 width=332) (actual time=0.017..0.030 rows=30 loops=1)
                                 Buffers: shared hit=1
               ->  Hash  (cost=11.10..11.10 rows=110 width=96) (actual time=0.078..0.079 rows=30 loops=1)
                     Buckets: 1024  Batches: 1  Memory Usage: 10kB
                     Buffers: shared hit=1
                     ->  Seq Scan on "LopHocPhan" lhp  (cost=0.00..11.10 rows=110 width=96) (actual time=0.024..0.034 rows=30 loops=1)
                           Buffers: shared hit=1
 Planning: Buffers: shared hit=138 read=1
 Planning Time: 5.063 ms  Execution Time: 1.265 ms (30 rows)
```

**Q5:**
```
                                                                                QUERY PLAN
 Limit  (cost=17.12..17.12 rows=1 width=496) (actual time=0.705..0.710 rows=2 loops=1)
   Buffers: shared hit=13
   ->  Sort  (cost=17.12..17.12 rows=1 width=496) (actual time=0.702..0.706 rows=2 loops=1)
         Sort Key: (count(dk."MaDangKy")) DESC
         Sort Method: quicksort  Memory: 25kB
         Buffers: shared hit=13
         ->  GroupAggregate  (cost=17.08..17.11 rows=1 width=496) (actual time=0.407..0.529 rows=2 loops=1)
               Group Key: hp."MaHP"
               Buffers: shared hit=10
               ->  Sort  (cost=17.08..17.09 rows=1 width=526) (actual time=0.291..0.295 rows=2 loops=1)
                     Sort Key: hp."MaHP"
                     Sort Method: quicksort  Memory: 25kB
                     Buffers: shared hit=10
                     ->  Nested Loop  (cost=0.43..17.07 rows=1 width=526) (actual time=0.204..0.230 rows=2 loops=1)
                           Buffers: shared hit=10
                           ->  Nested Loop  (cost=0.29..16.46 rows=1 width=104) (actual time=0.153..0.172 rows=2 loops=1)
                                 Buffers: shared hit=6
                                 ->  Index Scan using idx_dangky_trangthai on "DangKy" dk  (cost=0.14..8.16 rows=1 width=66) (actual time=0.093..0.098 rows=2 loops=1)
                                       Index Cond: (("TrangThaiDangKy")::text = 'DaDangKy'::text)
                                       Buffers: shared hit=2
                                 ->  Index Scan using "LopHocPhan_pkey" on "LopHocPhan" lhp  (cost=0.14..8.16 rows=1 width=154) (actual time=0.028..0.028 rows=1 loops=2)
                                       Index Cond: (("MaLopHP")::text = (dk."MaLopHP")::text)
                                       Buffers: shared hit=4
                           ->  Index Scan using "HocPhan_pkey" on "HocPhan" hp  (cost=0.14..0.59 rows=1 width=480) (actual time=0.024..0.024 rows=1 loops=2)
                                 Index Cond: (("MaHP")::text = (lhp."MaHP")::text)
                                 Buffers: shared hit=4
 Planning: Buffers: shared hit=10
 Planning Time: 1.136 ms  Execution Time: 1.054 ms (30 rows)
```

**Q6:**
```
                                                                         QUERY PLAN
 GroupAggregate  (cost=16.34..16.36 rows=1 width=292) (actual time=0.210..0.229 rows=10 loops=1)
   Group Key: lhp."MaLopHP"
   Buffers: shared hit=22
   ->  Sort  (cost=16.34..16.35 rows=1 width=292) (actual time=0.198..0.201 rows=10 loops=1)
         Sort Key: lhp."MaLopHP"
         Sort Method: quicksort  Memory: 25kB
         Buffers: shared hit=22
         ->  Nested Loop Left Join  (cost=0.29..16.33 rows=1 width=288) (actual time=0.087..0.139 rows=10 loops=1)
               Join Filter: ((lhp."MaLopHP")::text = (dk."MaLopHP")::text)
               Rows Removed by Join Filter: 18
               Buffers: shared hit=22
               ->  Index Scan using idx_lophocphan_macoso on "LopHocPhan" lhp  (cost=0.14..8.16 rows=1 width=284) (actual time=0.044..0.050 rows=10 loops=1)
                     Index Cond: (("MaCoSo")::text = 'HADONG'::text)
                     Buffers: shared hit=2
               ->  Index Scan using idx_dangky_trangthai on "DangKy" dk  (cost=0.14..8.16 rows=1 width=62) (actual time=0.005..0.006 rows=2 loops=10)
                     Index Cond: (("TrangThaiDangKy")::text = 'DaDangKy'::text)
                     Buffers: shared hit=20
 Planning: Buffers: shared hit=4
 Planning Time: 0.454 ms  Execution Time: 0.438 ms (21 rows)
```

**Q7:**
```
                                                                                 QUERY PLAN
 Sort  (cost=82.94..83.99 rows=420 width=174) (actual time=3.380..3.389 rows=8 loops=1)
   Sort Key: hk."NamHoc" DESC, hk."KySo"
   Sort Method: quicksort  Memory: 25kB
   Buffers: shared hit=12
   ->  GroupAggregate  (cost=56.24..64.64 rows=420 width=174) (actual time=1.655..3.231 rows=8 loops=1)
         Group Key: hk."MaHocKy"
         Buffers: shared hit=9
         ->  Sort  (cost=56.24..57.29 rows=420 width=224) (actual time=1.128..1.146 rows=37 loops=1)
               Sort Key: hk."MaHocKy"
               Sort Method: quicksort  Memory: 28kB
               Buffers: shared hit=4
               ->  Hash Left Join  (cost=21.07..37.95 rows=420 width=224) (actual time=0.442..0.472 rows=37 loops=1)
                     Hash Cond: ((hk."MaHocKy")::text = (lhp."MaHocKy")::text)
                     Buffers: shared hit=4
                     ->  Seq Scan on "HocKy" hk  (cost=0.00..14.20 rows=420 width=158) (actual time=0.032..0.037 rows=8 loops=1)
                           Buffers: shared hit=1
                     ->  Hash  (cost=19.70..19.70 rows=110 width=124) (actual time=0.366..0.370 rows=30 loops=1)
                           Buckets: 1024  Batches: 1  Memory Usage: 10kB
                           Buffers: shared hit=3
                           ->  Hash Left Join  (cost=8.17..19.70 rows=110 width=124) (actual time=0.293..0.327 rows=30 loops=1)
                                 Hash Cond: ((lhp."MaLopHP")::text = (dk."MaLopHP")::text)
                                 Buffers: shared hit=3
                                 ->  Seq Scan on "LopHocPhan" lhp  (cost=0.00..11.10 rows=110 width=116) (actual time=0.010..0.017 rows=30 loops=1)
                                       Buffers: shared hit=1
                                 ->  Hash  (cost=8.16..8.16 rows=1 width=66) (actual time=0.215..0.217 rows=2 loops=1)
                                       Buckets: 1024  Batches: 1  Memory Usage: 9kB
                                       Buffers: shared hit=2
                                       ->  Index Scan using idx_dangky_trangthai on "DangKy" dk  (cost=0.14..8.16 rows=1 width=66) (actual time=0.176..0.180 rows=2 loops=1)
                                             Index Cond: (("TrangThaiDangKy")::text = 'DaDangKy'::text)
                                             Buffers: shared hit=2
 Planning: Buffers: shared hit=48
 Planning Time: 4.781 ms  Execution Time: 3.954 ms (34 rows)
```

---

### DISTRIBUTED (HADONG site with FDW)

**Q1:**
```
                                                                      QUERY PLAN
 Sort  (cost=16.59..16.60 rows=1 width=600) (actual time=0.205..0.207 rows=10 loops=1)
   Sort Key: lhp."MaLopHP"
   Sort Method: quicksort  Memory: 25kB
   Buffers: shared hit=25
   ->  Nested Loop  (cost=0.28..16.58 rows=1 width=600) (actual time=0.074..0.103 rows=10 loops=1)
         Buffers: shared hit=22
         ->  Index Scan using idx_lophocphan_macoso on "LopHocPhan" lhp  (cost=0.14..8.16 rows=1 width=182) (actual time=0.045..0.049 rows=10 loops=1)
               Index Cond: (("MaCoSo")::text = 'HADONG'::text)
               Buffers: shared hit=2
         ->  Index Scan using "HocPhan_pkey" on "HocPhan" hp  (cost=0.14..8.16 rows=1 width=476) (actual time=0.004..0.004 rows=1 loops=10)
               Index Cond: (("MaHP")::text = (lhp."MaHP")::text)
               Buffers: shared hit=20
 Planning: Buffers: shared hit=352
 Planning Time: 7.666 ms  Execution Time: 0.397 ms (16 rows)
```

**Q2:**
```
                                                                   QUERY PLAN
 Sort  (cost=346.52..347.02 rows=200 width=46) (actual time=14.053..14.057 rows=3 loops=1)
   Sort Key: "SinhVien"."MaCoSo"
   Sort Method: quicksort  Memory: 25kB
   Buffers: shared hit=1
   ->  HashAggregate  (cost=336.88..338.88 rows=200 width=46) (actual time=13.988..13.993 rows=3 loops=1)
         Group Key: "SinhVien"."MaCoSo"
         Batches: 1  Memory Usage: 40kB
         Buffers: shared hit=1
         ->  Append  (cost=0.00..323.37 rows=2702 width=38) (actual time=0.032..13.939 rows=30 loops=1)
               Buffers: shared hit=1
               ->  Seq Scan on "SinhVien"  (cost=0.00..10.60 rows=60 width=38) (actual time=0.030..0.035 rows=10 loops=1)
                     Buffers: shared hit=1
               ->  Foreign Scan on "SinhVien" "SinhVien_1"  (cost=100.00..149.63 rows=1321 width=38) (actual time=6.677..6.680 rows=10 loops=1)
               ->  Foreign Scan on "SinhVien" "SinhVien_2"  (cost=100.00..149.63 rows=1321 width=38) (actual time=7.207..7.209 rows=10 loops=1)
 Planning: Buffers: shared hit=144
 Planning Time: 5.178 ms  Execution Time: 70.883 ms (18 rows)
```

**Q3:**
```
                                                                     QUERY PLAN
 Sort  (cost=350.94..351.44 rows=200 width=94) (actual time=12.758..12.763 rows=3 loops=1)
   Sort Key: "LopHocPhan"."MaCoSo"
   Sort Method: quicksort  Memory: 25kB
   Buffers: shared hit=1
   ->  HashAggregate  (cost=338.30..343.30 rows=200 width=94) (actual time=12.714..12.724 rows=3 loops=1)
         Group Key: "LopHocPhan"."MaCoSo"
         Batches: 1  Memory Usage: 40kB
         Buffers: shared hit=1
         ->  Append  (cost=0.00..313.70 rows=2460 width=46) (actual time=0.025..12.545 rows=30 loops=1)
               Buffers: shared hit=1
               ->  Seq Scan on "LopHocPhan"  (cost=0.00..11.20 rows=120 width=46) (actual time=0.023..0.028 rows=10 loops=1)
                     Buffers: shared hit=1
               ->  Foreign Scan on "LopHocPhan" "LopHocPhan_1"  (cost=100.00..145.10 rows=1170 width=46) (actual time=7.365..7.758 rows=10 loops=1)
               ->  Foreign Scan on "LopHocPhan" "LopHocPhan_2"  (cost=100.00..145.10 rows=1170 width=46) (actual time=4.736..4.739 rows=10 loops=1)
 Planning: Buffers: shared hit=50
 Planning Time: 1.699 ms  Execution Time: 14.859 ms (18 rows)
```

**Q4:**
```
                                                                         QUERY PLAN
 Limit  (cost=214.85..293.95 rows=20 width=232) (actual time=25.477..25.488 rows=0 loops=1)
   Buffers: shared hit=3
   ->  Nested Loop  (cost=214.85..92540.45 rows=23345 width=232) (actual time=25.475..25.485 rows=0 loops=1)
         Join Filter: ((("SinhVien"."MaCoSo")::text <> ("LopHocPhan"."MaCoSo")::text) AND (("DangKy"."MaLopHP")::text = ("LopHocPhan"."MaLopHP")::text))
         Rows Removed by Join Filter: 60
         Buffers: shared hit=3
         ->  Nested Loop  (cost=214.85..10023.34 rows=3162 width=398) (actual time=19.504..22.608 rows=2 loops=1)
               Join Filter: (("DangKy"."MaSV")::text = ("SinhVien"."MaSV")::text)
               Rows Removed by Join Filter: 58
               Buffers: shared hit=2
               ->  Merge Append  (cost=214.85..290.24 rows=1216 width=124) (actual time=19.417..19.425 rows=2 loops=1)
                     Sort Key: "DangKy"."NgayDangKy" DESC
                     Buffers: shared hit=1
                     ->  Sort  (cost=14.83..15.10 rows=110 width=124) (actual time=0.320..0.323 rows=2 loops=1)
                           Sort Key: "DangKy"."NgayDangKy" DESC
                           Sort Method: quicksort  Memory: 25kB
                           Buffers: shared hit=1
                           ->  Seq Scan on "DangKy"  (cost=0.00..11.10 rows=110 width=124) (actual time=0.276..0.278 rows=2 loops=1)
                                 Buffers: shared hit=1
                     ->  Foreign Scan on "DangKy" "DangKy_1"  (cost=100.00..129.70 rows=553 width=124) (actual time=9.986..9.986 rows=0 loops=1)
                     ->  Foreign Scan on "DangKy" "DangKy_2"  (cost=100.00..129.70 rows=553 width=124) (actual time=9.104..9.104 rows=0 loops=1)
               ->  Materialize  (cost=0.00..249.60 rows=520 width=332) (actual time=0.025..1.570 rows=30 loops=2)
                     Buffers: shared hit=1
                     ->  Append  (cost=0.00..247.00 rows=520 width=332) (actual time=0.025..3.069 rows=30 loops=1)
                           Buffers: shared hit=1
                           ->  Seq Scan on "SinhVien"  (cost=0.00..10.60 rows=60 width=332) (actual time=0.023..0.031 rows=10 loops=1)
                                 Buffers: shared hit=1
                           ->  Foreign Scan on "SinhVien" "SinhVien_1"  (cost=100.00..116.90 rows=230 width=332) (actual time=1.444..1.450 rows=10 loops=1)
                           ->  Foreign Scan on "SinhVien" "SinhVien_2"  (cost=100.00..116.90 rows=230 width=332) (actual time=1.566..1.571 rows=10 loops=1)
         ->  Materialize  (cost=0.00..286.96 rows=1484 width=96) (actual time=0.010..1.420 rows=30 loops=2)
               Buffers: shared hit=1
               ->  Append  (cost=0.00..279.54 rows=1484 width=96) (actual time=0.013..2.789 rows=30 loops=1)
                     Buffers: shared hit=1
                     ->  Seq Scan on "LopHocPhan"  (cost=0.00..11.20 rows=120 width=96) (actual time=0.012..0.015 rows=10 loops=1)
                           Buffers: shared hit=1
                     ->  Foreign Scan on "LopHocPhan" "LopHocPhan_1"  (cost=100.00..130.46 rows=682 width=96) (actual time=1.422..1.426 rows=10 loops=1)
                     ->  Foreign Scan on "LopHocPhan" "LopHocPhan_2"  (cost=100.00..130.46 rows=682 width=96) (actual time=1.294..1.332 rows=10 loops=1)
 Planning: Buffers: shared hit=208
 Planning Time: 10.184 ms  Execution Time: 29.865 ms (41 rows)
```

**Q5:**
```
                                                                                  QUERY PLAN
 Limit  (cost=533.47..533.49 rows=10 width=496) (actual time=20.750..20.762 rows=2 loops=1)
   Buffers: shared hit=10
   ->  Sort  (cost=533.47..533.51 rows=17 width=496) (actual time=20.747..20.758 rows=2 loops=1)
         Sort Key: (count("DangKy"."MaDangKy")) DESC
         Sort Method: quicksort  Memory: 25kB
         Buffers: shared hit=10
         ->  GroupAggregate  (cost=532.78..533.12 rows=17 width=496) (actual time=20.498..20.588 rows=2 loops=1)
               Group Key: hp."MaHP"
               Buffers: shared hit=7
               ->  Sort  (cost=532.78..532.82 rows=17 width=522) (actual time=20.291..20.302 rows=2 loops=1)
                     Sort Key: hp."MaHP"
                     Sort Method: quicksort  Memory: 25kB
                     Buffers: shared hit=7
                     ->  Nested Loop  (cost=252.49..532.43 rows=17 width=522) (actual time=17.701..20.238 rows=2 loops=1)
                           Buffers: shared hit=7
                           ->  Hash Join  (cost=252.35..520.82 rows=57 width=100) (actual time=17.579..20.104 rows=2 loops=1)
                                 Hash Cond: (("LopHocPhan"."MaLopHP")::text = ("DangKy"."MaLopHP")::text)
                                 Buffers: shared hit=3
                                 ->  Append  (cost=0.00..264.00 rows=1040 width=154) (actual time=0.022..2.531 rows=30 loops=1)
                                       Buffers: shared hit=1
                                       ->  Seq Scan on "LopHocPhan"  (cost=0.00..11.20 rows=120 width=154) (actual time=0.020..0.030 rows=10 loops=1)
                                             Buffers: shared hit=1
                                       ->  Foreign Scan on "LopHocPhan" "LopHocPhan_1"  (cost=100.00..123.80 rows=460 width=154) (actual time=1.255..1.259 rows=10 loops=1)
                                       ->  Foreign Scan on "LopHocPhan" "LopHocPhan_2"  (cost=100.00..123.80 rows=460 width=154) (actual time=1.220..1.224 rows=10 loops=1)
                                 ->  Hash  (cost=252.21..252.21 rows=11 width=62) (actual time=17.493..17.496 rows=2 loops=1)
                                       Buckets: 1024  Batches: 1  Memory Usage: 9kB
                                       Buffers: shared hit=2
                                       ->  Append  (cost=0.14..252.21 rows=11 width=62) (actual time=0.042..17.467 rows=2 loops=1)
                                             Buffers: shared hit=2
                                             ->  Index Scan using idx_dangky_demsiso on "DangKy"  (cost=0.14..8.16 rows=1 width=62) (actual time=0.041..0.045 rows=2 loops=1)
                                                   Buffers: shared hit=2
                                             ->  Foreign Scan on "DangKy" "DangKy_1"  (cost=100.00..122.00 rows=5 width=62) (actual time=8.628..8.628 rows=0 loops=1)
                                             ->  Foreign Scan on "DangKy" "DangKy_2"  (cost=100.00..122.00 rows=5 width=62) (actual time=8.784..8.784 rows=0 loops=1)
                           ->  Index Scan using "HocPhan_pkey" on "HocPhan" hp  (cost=0.14..0.20 rows=1 width=480) (actual time=0.035..0.035 rows=1 loops=2)
                                 Index Cond: (("MaHP")::text = ("LopHocPhan"."MaHP")::text)
                                 Buffers: shared hit=4
 Planning: Buffers: shared hit=55
 Planning Time: 9.347 ms  Execution Time: 24.083 ms (40 rows)
```

**Q6:**
```
                                                                         QUERY PLAN
 GroupAggregate  (cost=8.31..16.36 rows=1 width=292) (actual time=0.156..0.190 rows=10 loops=1)
   Group Key: lhp."MaLopHP"
   Buffers: shared hit=4
   ->  Merge Left Join  (cost=8.31..16.35 rows=1 width=288) (actual time=0.142..0.162 rows=10 loops=1)
         Merge Cond: ((lhp."MaLopHP")::text = (dk."MaLopHP")::text)
         Buffers: shared hit=4
         ->  Sort  (cost=8.17..8.18 rows=1 width=284) (actual time=0.101..0.105 rows=10 loops=1)
               Sort Key: lhp."MaLopHP"
               Sort Method: quicksort  Memory: 25kB
               Buffers: shared hit=2
               ->  Index Scan using idx_lophocphan_macoso on "LopHocPhan" lhp  (cost=0.14..8.16 rows=1 width=284) (actual time=0.044..0.054 rows=10 loops=1)
                     Index Cond: (("MaCoSo")::text = 'HADONG'::text)
                     Buffers: shared hit=2
         ->  Index Scan using idx_dangky_demsiso on "DangKy" dk  (cost=0.14..8.16 rows=1 width=62) (actual time=0.032..0.034 rows=2 loops=1)
               Index Cond: (("TrangThaiDangKy")::text = 'DaDangKy'::text)
               Buffers: shared hit=2
 Planning: Buffers: shared hit=11
 Planning Time: 0.802 ms  Execution Time: 0.453 ms (19 rows)
```

**Q7:**
```
                                                                              QUERY PLAN
 Sort  (cost=655.57..656.62 rows=420 width=174) (actual time=7.527..7.542 rows=8 loops=1)
   Sort Key: hk."NamHoc" DESC, hk."KySo"
   Sort Method: quicksort  Memory: 25kB
   Buffers: shared hit=7
   ->  GroupAggregate  (cost=620.17..637.27 rows=420 width=174) (actual time=6.361..7.287 rows=8 loops=1)
         Group Key: hk."MaHocKy"
         Buffers: shared hit=4
         ->  Sort  (cost=620.17..623.39 rows=1290 width=220) (actual time=6.089..6.112 rows=37 loops=1)
               Sort Key: hk."MaHocKy"
               Sort Method: quicksort  Memory: 28kB
               Buffers: shared hit=4
               ->  Hash Left Join  (cost=271.80..553.52 rows=1290 width=220) (actual time=3.071..6.018 rows=37 loops=1)
                     Hash Cond: (("LopHocPhan"."MaLopHP")::text = ("DangKy"."MaLopHP")::text)
                     Buffers: shared hit=4
                     ->  Hash Right Join  (cost=19.45..295.62 rows=1290 width=216) (actual time=0.308..3.221 rows=37 loops=1)
                           Hash Cond: (("LopHocPhan"."MaHocKy")::text = (hk."MaHocKy")::text)
                           Buffers: shared hit=2
                           ->  Append  (cost=0.00..272.75 rows=1290 width=116) (actual time=0.014..2.879 rows=30 loops=1)
                                 Buffers: shared hit=1
                                 ->  Seq Scan on "LopHocPhan"  (cost=0.00..11.20 rows=120 width=116) (actual time=0.013..0.020 rows=10 loops=1)
                                       Buffers: shared hit=1
                                 ->  Foreign Scan on "LopHocPhan" "LopHocPhan_1"  (cost=100.00..127.55 rows=585 width=116) (actual time=1.347..1.352 rows=10 loops=1)
                                 ->  Foreign Scan on "LopHocPhan" "LopHocPhan_2"  (cost=100.00..127.55 rows=585 width=116) (actual time=1.486..1.490 rows=10 loops=1)
                           ->  Hash  (cost=14.20..14.20 rows=420 width=158) (actual time=0.212..0.213 rows=8 loops=1)
                                 Buckets: 1024  Batches: 1  Memory Usage: 9kB
                                 Buffers: shared hit=1
                                 ->  Seq Scan on "HocKy" hk  (cost=0.00..14.20 rows=420 width=158) (actual time=0.172..0.177 rows=8 loops=1)
                                       Buffers: shared hit=1
                     ->  Hash  (cost=252.21..252.21 rows=11 width=62) (actual time=2.726..2.730 rows=2 loops=1)
                           Buckets: 1024  Batches: 1  Memory Usage: 9kB
                           Buffers: shared hit=2
                           ->  Append  (cost=0.14..252.21 rows=11 width=62) (actual time=0.148..2.691 rows=2 loops=1)
                                 Buffers: shared hit=2
                                 ->  Index Scan using idx_dangky_demsiso on "DangKy"  (cost=0.14..8.16 rows=1 width=62) (actual time=0.146..0.151 rows=2 loops=1)
                                       Buffers: shared hit=2
                                 ->  Foreign Scan on "DangKy" "DangKy_1"  (cost=100.00..122.00 rows=5 width=62) (actual time=1.275..1.275 rows=0 loops=1)
                                 ->  Foreign Scan on "DangKy" "DangKy_2"  (cost=100.00..122.00 rows=5 width=62) (actual time=1.256..1.256 rows=0 loops=1)
 Planning: Buffers: shared hit=66
 Planning Time: 3.606 ms  Execution Time: 13.251 ms (41 rows)
```

---

## NOTES

- Times shown are from `EXPLAIN (ANALYZE, BUFFERS, FORMAT TEXT)`
- Each query run 3 times; reported time is the **average** of 3 runs
- Round 3 raw output shown above for reference
- Distributed queries show `Foreign Scan` nodes when accessing remote sites (NGOCTRUC, HOALAC)
- Dataset size is small (~30 students, 30 LHP, 45 schedules, 2 DangKy total across 3 sites)
- **This is a benchmark for analyzing architectural trends, not absolute performance conclusions**

## HOW TO RE-RUN

```powershell
# 1. Ensure all containers are running
docker compose -f docker/docker-compose.yml ps

# 2. Setup centralized DB (if needed)
powershell -ExecutionPolicy Bypass -File scripts/setup_centralized_db.ps1

# 3. Run benchmark
powershell -ExecutionPolicy Bypass -File scripts/run_centralized_vs_distributed_benchmark.ps1
```
