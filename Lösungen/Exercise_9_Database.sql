-- Exercise 9
-- #############################################################
/*
Please use the JOIN Operator for the following requests:
a. Select the attributes zip_code and city of the table zip, which are used in your table person!
*/

SELECT DISTINCT z.zip_code, z.city
FROM person AS p
INNER JOIN zip AS z ON p.zip_id = z.id
ORDER BY z.zip_code, z.city
;

-- b. Select the attributes zip_code and city of the table zip, which are not used in your table person!

SELECT DISTINCT z.zip_code, z.city
FROM zip AS z 
LEFT JOIN person AS p ON p.zip_id = z.id
WHERE p.zip_id IS NULL
ORDER BY z.zip_code, z.city
;

-- c. Select all attributes of the table person with the attribute zip_code & city of the table zip!

SELECT p.*, z.zip_code, z.city
FROM person AS p
INNER JOIN zip AS z ON p.zip_id = z.id
ORDER BY z.zip_code, z.city
;
