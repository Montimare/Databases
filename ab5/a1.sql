SELECT * FROM zip;
SELECT zip_code FROM zip;
-- a)
SELECT 
LEFT(zip_code, 2) AS ZIP_short,
COUNT( * ) AS qty
FROM zip
GROUP BY ZIP_short
;
-- b)
SELECT 
DISTINCT city,
COUNT( * ) AS qty
FROM zip
GROUP BY city
ORDER BY qty DESC
;
-- c)
SELECT
DISTINCT city
FROM zip
ORDER BY city
;
SELECT
DISTINCT city,
COUNT( * ) AS qty
FROM zip
GROUP BY city
HAVING qty = 1
;
-- d)
SELECT
city
FROM zip
WHERE city in ("Berlin", "Frankfurt", "Aachen") OR
city LIKE "Frankfurt%";
-- e)
-- SELECT
-- city,
-- zip_code,
-- COUNT(*) AS qty
-- FROM zip
-- GROUP BY city, zip_code
-- HAVING qty > 1;
SELECT
city,
COUNT(zip_code) AS qty
FROM zip
GROUP BY city
ORDER BY qty DESC 
-- LIMIT 3
;
