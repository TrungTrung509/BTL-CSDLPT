-- Check PhongHoc column names in all 3 sites
SELECT column_name, ordinal_position FROM information_schema.columns
WHERE table_name = 'PhongHoc' ORDER BY ordinal_position;
