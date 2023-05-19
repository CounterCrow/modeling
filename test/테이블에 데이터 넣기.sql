use nest;

CREATE TABLE IF NOT EXISTS `addPerson` (
  `seq` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `importCheck` TINYINT NULL,
  `nameRespect` VARCHAR(45) NULL,
  `nameFamily` VARCHAR(45) NULL,
  `nameMiddle` VARCHAR(45) NULL,
  `nameFirst` VARCHAR(45) NOT NULL,
  `nickName` VARCHAR(45) NULL,
  `naverID` VARCHAR(45) NULL,
  `groupName` VARCHAR(45) NULL,
  `memo` VARCHAR(4000) NULL,
  `regDT` DATETIME NULL,
  `modDT` DATETIME NULL,
  `modAcount` VARCHAR(45) NULL,
  `modEquipment` VARCHAR(45) NULL,
  `remDt` DATETIME NULL,
  `remAcount` VARCHAR(45) NULL,
  `remEquipment` VARCHAR(45) NULL,
  PRIMARY KEY (`seq`))
ENGINE = InnoDB
;
select * from addPerson;

 
DELETE FROM addPerson WHERE seq = 2;
INSERT INTO addPerson (
	importCheck,
    nameRespect,
    nameFamily,
    nameMiddle,
    nameFirst,
    nickName,
    naverID,
    groupName,
    memo,
    regDT,
    modDT,
    modAcount,
    modEquipment,
    remDt,
    remAcount,
    remEquipment
) VALUES (
	'1',
    '',
    '홍',
    '나',
    '림',
    'hnr',
    'hnr',
    '사촌동생',
    '그냥 해보는 연습',
    NOW(),
    NOW(),
    'hongoppa',
    'PC',
    'null',
    'null',
    'null'
);


CREATE TABLE IF NOT EXISTS `email` (
  `seq` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `defaultNY` TINYINT UNSIGNED NULL,
  `emailAddress` VARCHAR(45) NOT NULL,
  `addPerson_seq` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`seq`),
  INDEX `fk_email_addPerson1_idx` (`addPerson_seq` ASC) VISIBLE,
  CONSTRAINT `fk_email_addPerson1`
    FOREIGN KEY (`addPerson_seq`)
    REFERENCES `addPerson` (`seq`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
;
select * from email;

insert into email (
	defaultNY,
    emailAddress,
    addPerson_seq
	) VALUES (
	'1',
    'hongoppa@naver.com',
    '1'
	)
;