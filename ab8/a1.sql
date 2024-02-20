

ALTER TABLE person
ADD COLUMN `company_name` VARCHAR(30),
ADD COLUMN `str_company` VARCHAR(60),
ADD COLUMN `zip_company_id` INTEGER,
ADD COLUMN `tel_company` VARCHAR(40),
ADD COLUMN `url` VARCHAR(45)
;

ALTER TABLE person
ADD CONSTRAINT `fk_person2zip_company`
FOREIGN KEY (`zip_company_id`)
REFERENCES zip (id)
ON UPDATE RESTRICT
ON DELETE RESTRICT
;

SELECT * FROM person;

UPDATE person
SET str_company = str
;

UPDATE person
SET zip_company_id = zip_id, tel_company = tel
;

-- alles was die tabelle selber bearbeiten soll ist alter table
ALTER TABLE person
DROP url
;
-- alles was die werte in der tabelle angeht ist update
UPDATE person
SET company_name = concat(fnam, nnam, id, "GMBH")
;

ALTER TABLE person
MODIFY COLUMN company_name VARCHAR(60)
;

DESC person;