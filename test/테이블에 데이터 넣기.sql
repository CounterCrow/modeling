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
CREATE TABLE IF NOT EXISTS `phone` (
  `seq` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `defaultNY` TINYINT NULL,
  `phoneWhere` VARCHAR(45) NULL,
  `phoneNum` VARCHAR(45) NOT NULL,
  `addPerson_seq` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`seq`),
  INDEX `fk_phone_addPerson_idx` (`addPerson_seq` ASC) VISIBLE,
  CONSTRAINT `fk_phone_addPerson`
    FOREIGN KEY (`addPerson_seq`)
    REFERENCES `addPerson` (`seq`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
;
INSERT INTO phone(
defaultNY
, phoneWhere
, phoneNum
, addPerson_seq
)VALUES(
-- defaultNY
'1'
-- phoneWhere (cellPhone home work)
, 'cellPhone'
-- phoneNum
, '010-020-0202'
-- addPerson_seq
, '11'
)
;

select * from phone;
UPDATE phone 
SET 
    defaultNY = '+82-070-222-3333'
WHERE
    seq = '3'
; 
-- addfess 테이블 생성
CREATE TABLE IF NOT EXISTS `address` (
  `seq` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `defaultNY` TINYINT UNSIGNED NULL,
  `addressWhere` VARCHAR(45) NULL,
  `addressPostNum` INT UNSIGNED NULL,
  `address` VARCHAR(100) NULL,
  `addPerson_seq` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`seq`),
  INDEX `fk_address_addPerson1_idx` (`addPerson_seq` ASC) VISIBLE,
  CONSTRAINT `fk_address_addPerson1`
    FOREIGN KEY (`addPerson_seq`)
    REFERENCES `addPerson` (`seq`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
;
-- 디폴트값 입력
INSERT INTO address(
defaultNY
,addressWhere
,addressPostNum
,address
,addPerson_seq
)VALUES(
-- defaultNY
'1'
-- addressWhere (회사,집,기타 ,직접입력)
, '집'
-- addressPostNum
, '111116'
-- address
, '경기도 김포시 장기동 이젠아파트 2동 108호'
-- addPerson_seq
, '5'
)
;
-- 주소 컬럼 호출
SELECT*FROM address;
-- 디폴트 아닌곳 회사 입력
INSERT INTO address(
defaultNY
,addressWhere
,addressPostNum
,address
,addPerson_seq
)VALUES(
-- defaultNY
'0'
-- addressWhere (회사,집,기타 ,직접입력)
, '회사'
-- addressPostNum
, '78887'
-- address
, '지리산 중턱 어딘가'
-- addPerson_seq
, '11'
)
;


