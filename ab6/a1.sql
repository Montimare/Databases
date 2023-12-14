CREATE TABLE `db_ws_23`.`person` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `gender` INT NOT NULL,
  `nnam` VARCHAR(60) NOT NULL,
  `fnam` VARCHAR(60) NOT NULL,
  `bdate` TIMESTAMP NOT NULL DEFAULT '2014-01-01 06:30:00',
  `zip_id` INT NULL,
  `str` VARCHAR(60) NOT NULL,
  `tel` VARCHAR(40) NOT NULL,
  `mobil` VARCHAR(40) NOT NULL,
  PRIMARY KEY (`id`));

ALTER TABLE person
MODIFY COLUMN id INT AUTO_INCREMENT; -- KLAUSURRELEVANT WICHTIG, falls vergessen primary key zu setzen

DESC person;

ALTER TABLE person
ADD CONSTRAINT fk_person2zip
FOREIGN KEY (zip_id)
REFERENCES zip (id)
ON DELETE RESTRICT
ON UPDATE RESTRICT;

INSERT INTO person
VALUES(null,2,"a","b","2015-01-01",5,"c","d","e");

SELECT * FROM person;