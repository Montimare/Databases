-- Exercise 6
-- #############################################################
-- 1.	CREATE a table person with the following attributes and settings. 

-- CREATE first the table with all his attributes and afterwords set the id as PRIMARY KEY.
-- Version 1: PK Definition while creating the table
CREATE TABLE person
(
	id INT primary key auto_increment,
    gender INT NOT NULL,
    nnam VARCHAR(60) NOT NULL,
    fnam VARCHAR(60) NOT NULL,
    bdate TIMESTAMP NOT NULL DEFAULT '2014-01-01 06:30:00',
    zip_id INT,
    str VARCHAR(60) NOT NULL,
    tel VARCHAR(40) NOT NULL,
    mobil VARCHAR(40) NOT NULL
)
;
-- Show Table information
DESC person;

SELECT * 
FROM person
;

-- Dropping the table
DROP TABLE person;

-- Version 2: PK Definition afterwards
 
 CREATE TABLE person
(
	id INT NOT NULL,
    gender INT NOT NULL,
    nnam VARCHAR(60) NOT NULL,
    fnam VARCHAR(60) NOT NULL,
    bdate TIMESTAMP NOT NULL DEFAULT '2014-01-01 06:30:00',
    zip_id INT,
    str VARCHAR(60) NOT NULL,
    tel VARCHAR(40) NOT NULL,
    mobil VARCHAR(40) NOT NULL
)
;

-- Version 1.1 ADD CONSTRAINT 
ALTER TABLE person
ADD CONSTRAINT pk_person
PRIMARY KEY (id) 
;

DESC person; 

-- MISSING AUTO_INCREMENT!!!
-- MODIFY COLUMN
ALTER TABLE person 
MODIFY COLUMN id INT AUTO_INCREMENT
;

DESC person;

-- 2.	Add now a constraint with the name fk_person2plz and 
--		set the plz_id as a FOREIGN KEY from the table person
--		which REFERENCES to the id from plz. Please 
--		use RESTRICT for UPDATE & DELETE!

ALTER TABLE person
ADD CONSTRAINT fk_person_zip_id
FOREIGN KEY (zip_id)
REFERENCES zip (id)
ON DELETE RESTRICT
ON UPDATE RESTRICT 
;

DESC person;

-- Dropping the foreign key 
ALTER TABLE person
DROP FOREIGN KEY fk_person_zip_id
;

-- showing the table information
DESC person;

SELECT *
FROM person;

-- 3.	Add at least 10 datasets in your table person by using the INSERT INTO command 
-- inserting single datasets
INSERT INTO person (gender, nnam, fnam, bdate, zip_id, str, tel, mobil)
-- 0 = Mrs. // 1 = Mr.
VALUES (0, 'Mueller', 'Julia', '2000-06-01 00:00:00', 63128, 'Musterstr. 12', '123456', '654321')
;
-- ERROR -- 63128 is not a valid id (ZIP)

-- inserting a dataset -> the attribute order is different to the table order!!!
INSERT INTO person (gender, nnam, fnam, bdate, zip_id, str, tel, mobil)
-- 0 = Mrs. // 1 = Mr.
VALUES (0, 'Mueller', 'Julia', '2000-06-01 00:00:00', 10081, 'Musterstr. 12', '123456', '654321')
;

-- inserting with less attributes
INSERT INTO person (nnam, fnam, zip_id, str, tel, mobil, gender)
-- 0 = Mrs. // 1 = Mr.
VALUES ('Mueller', 'Thomas', 10082, 'Musterstr. 12', '123456', '654321', 1)
;

DESC person;

-- inserting a dataset without using the attributenames
INSERT INTO person 
-- 0 = Mrs. // 1 = Mr.
VALUES (4, 0, 'Sabba', 'Salvatore', '1980-10-06 06:30:00', 10081, 'Bahnhofstr. 12', '123456', '654321')
;

SELECT * FROM zip WHERE zip_code = '63128' OR id = 10082;

-- inserting multiple datasets
INSERT INTO person (nnam, fnam, zip_id, str, tel, mobil, gender)
-- 0 = Mrs. // 1 = Mr.
VALUES 	('Rabb', 'Stefan', 10082, 'Musterstr. 12', '123456', '654321', 1),
		('Ivanov', 'Plamen', 10082, 'Musterstr. 12', '123456', '654321', 1),
		('Lösche', 'Colin', 10082, 'Musterstr. 12', '123456', '654321', 1),
		('Steinmer', 'Peter', 10082, 'Musterstr. 12', '123456', '654321', 1),
		('Angela', 'Merkel', 10082, 'Musterstr. 12', '123456', '654321', 1),        
		('Tina', 'Toni', 10082, 'Musterstr. 12', '123456', '654321', 1),        
		('Hook', 'Peter', 10082, 'Musterstr. 12', '123456', '654321', 1),        
		('Carey', 'Mariah', 10082, 'Musterstr. 12', '123456', '654321', 1),        
		('Caliskan', 'Nihat', 10082, 'Musterstr. 12', '123456', '654321', 1),
		('Jonas', 'Scheffner', 10082, 'Musterstr. 12', '123456', '654321', 1)
;

-- ADDITIONAL:
--	inserting a dataset by using SELECT for an attribute value
INSERT INTO person (nnam, fnam, zip_id, str, tel, mobil, gender)
-- 0 = Mrs. // 1 = Mr.
VALUES 	('Sabba', 'Carmine', (SELECT id FROM zip WHERE zip_code = '63128'), 'Musterstr. 12', '123456', '654321', 1)
;

SELECT *
FROM person
;
-- Example Reference Integrity
SELECT max(id)
FROM zip
;

-- we try to insert a dataset with plz_id = 14957
INSERT INTO person 
-- 0 = Mrs. // 1 = Mr.
VALUES (4, 0, 'Sabba', 'Salvatore', '1980-10-06 06:30:00', 14958, 'Bahnhofstr. 12', '123456', '654321')
;
