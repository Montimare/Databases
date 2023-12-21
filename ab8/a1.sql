

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