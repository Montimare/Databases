id 5 
id 6
;
SELECT * FROM zip;

DELETE 
FROM zip
WHERE id = 5; -- cannot delete because of foreign key constraint

DELETE
FROM zip
WHERE id = 6; -- works because no foreign key is set

CREATE TABLE `db_ws_23`.`gender`(
`id` INT NOT NULL AUTO_INCREMENT,
`gender` VARCHAR(20) NOT NULL,
PRIMARY KEY(`id`)
);

SELECT * FROM gender;
-- DOESNT WORK
INSERT INTO gender
VALUES(0,"Mr.");

INSERT INTO gender
VALUES(1,"Mrs.");

DELETE
FROM gender
WHERE id = 3;

TRUNCATE gender;

UPDATE gender
SET id = id-1;
-- TILL HERE

INSERT INTO gender (gender)
VALUES ("Mrs."), ("Mr.");

UPDATE gender
SET id = 0
WHERE gender = "Mr.";

UPDATE gender
SET id = id-1;

-- 

ALTER TABLE person
ADD CONSTRAINT fk_person2gender
FOREIGN KEY (gender)
REFERENCES gender (id)
ON UPDATE RESTRICT
ON DELETE RESTRICT;

DELETE FROM person
WHERE gender NOT IN (SELECT id FROM gender);

SELECT * FROM person;
DESC person;