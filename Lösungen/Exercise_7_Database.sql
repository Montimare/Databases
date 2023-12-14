-- Exercise 7
-- #############################################################
-- 1.	Try to DELETE a dataset of your zip table on …
-- a. … which you have a reference out of your table person.

SELECT DISTINCT zip_id
FROM person
;

-- looking which zip_ids are used
-- RESULT:	10034 & 10035 & 10036 & 10038 & 10040 & 10041 & 10042 & 10044 & 10082

DELETE 
FROM zip
WHERE id = 10082
;
-- LÖSCHUNG wird nicht durchgeführt!

-- b. … which you haven’t got a reference out of your table person.
-- Erstellung einer Dubletten

SELECT *
FROM zip
WHERE id = 14957
;

DELETE 
FROM zip
WHERE id = 14957
;
-- LÖSCHUNG wird durchgeführt!

-- ROLLBACK 
INSERT INTO zip
VALUES (14957, 1, 'Weinbergen', '99998')
;

-- 2. Table gender
-- a. CREATE a new Table gender with the following settings:
CREATE TABLE gender
(
	id INT AUTO_INCREMENT PRIMARY KEY,
    gender VARCHAR(20) NOT NULL
)
;
-- b. Add in your table gender the following two attributes:
INSERT INTO gender (gender)
VALUES ('Mrs.'), ('Mr.')
;
-- works fine, but if we look at the ids ...

SELECT *
FROM gender
;

-- Version 1
UPDATE gender
SET id = 0
WHERE gender = 'Mrs.'
;

UPDATE gender
SET id = 1
WHERE gender = 'Mr.'
;

--
TRUNCATE TABLE gender;

-- Version 2
UPDATE gender
SET id = id-1
;

-- c. Add now a constraint with the name fk_person2gender and set the gender as a FOREIGN KEY from the table person which REFERENCES to the id from gender. Please use RESTRICT for UPDATE & DELETE!
ALTER TABLE person
ADD CONSTRAINT fk_person2gender
FOREIGN KEY (gender)
REFERENCES gender (id)
ON DELETE RESTRICT
ON UPDATE CASCADE
;

SELECT * FROM person;
-- 9 Attribute
-- 11 Datensätze

SELECT * FROM gender;
-- 2 Attribute
-- 2 Datensätze

-- Cardinality (datasets): 	2 * 11 = 22
-- Grade (attributes): 		2 + 9 = 11

SELECT *
FROM gender, person
;
-- Exkurs: JOIN EXAMPLE
-- How can we now combine our three tables (gender, person, zip)

SELECT g.gender, p.nnam, p.fnam, p.str, z.zip_code, z.city
FROM person p
INNER JOIN gender g ON g.id = p.gender
INNER JOIN zip z ON z.id = p.zip_id
;

-- ROLLBACK ALL

ALTER TABLE person
DROP FOREIGN KEY fk_person2gender;

DROP TABLE gender;
