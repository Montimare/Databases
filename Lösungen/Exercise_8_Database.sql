-- Exercise 8
-- #############################################################
/*
-- 1.	You have received some new requisitions from your Marketing Manager. 
--		He decided to add some company informations. So please add the following attributes:
--	a.	Attribute:	company_name	Type:	VARCHAR(30)
*/

ALTER TABLE person
ADD COLUMN company_name VARCHAR(30)
;

-- b.	Attribute:	str_company		Type:	VARCHAR (60)

ALTER TABLE person
ADD COLUMN str_company VARCHAR(60)
;

-- c.	Attribute:	zip_company_id	Type:	INTEGER

ALTER TABLE person
ADD COLUMN zip_company_id int
;

-- d.	Attribute:	tel_company		Type:	VARCHAR (40)

ALTER TABLE person
ADD COLUMN tel_company VARCHAR(40)
;

-- e.	Attribute:	url			Type:	VARCHAR (45)

ALTER TABLE person
ADD COLUMN URL VARCHAR(45)
;

SELECT *
FROM person
;
/*
-- f.	Add a constraint with the name fk_person2zip_company and 
--		set the zip_company_id as a FOREIGN KEY from the table person which 
--		REFERENCES to the id from zip. Please use RESTRICT for UPDATE & DELETE!
*/

ALTER TABLE person
ADD CONSTRAINT fk_person2zip_company
FOREIGN KEY (zip_company_id)
REFERENCES zip(id)
ON DELETE RESTRICT
ON UPDATE RESTRICT
;

/*
-- 2.	Your Marketing Manages is saying that all your datasets in
--		your table person are so called SOHOs (Small Office / Home Office). 
*/

SELECT *
FROM person
;

/*
-- a.	That’s why he wants you to fill the new fields (1a till 1f) with the existing private information 
--		(e.g. the address of the company is the same like the private). 
*/

UPDATE person
SET str_company = str
;

UPDATE person
SET zip_company_id = zip_id, tel_company = tel
;

-- b.	Please drop the attribute url.
ALTER TABLE person
DROP COLUMN url
;

-- c.	He also wants you to fill at least 5 datasets with a company name!

UPDATE person
SET company_name = concat(nnam, ' GBR')
;

/*
-- 3.	While you are filling the company information, you recognized that 
--		the field “company_name” is not big enough. That’s why you have 
--		to change the datatype in VARCHAR (60)!
*/

ALTER TABLE person
MODIFY COLUMN company_name VARCHAR(60)
;
