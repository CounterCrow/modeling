-- use sp1
CREATE TABLE IF NOT EXISTS `sp1`.`boradMaster` (
  `seq` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NULL,
  PRIMARY KEY (`seq`))
ENGINE = InnoDB
;
CREATE TABLE IF NOT EXISTS `sp1`.`borad` (
  `seq` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `type` INT NULL,
  `title` VARCHAR(45) NULL,
  `boradcol` VARCHAR(45) NULL,
  `regSeq` INT NULL,
  `regDatetime` DATETIME NULL,
  `boradMaster_seq` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`seq`),
  INDEX `fk_borad_boradMaster1_idx` (`boradMaster_seq` ASC) VISIBLE,
  CONSTRAINT `fk_borad_boradMaster1`
    FOREIGN KEY (`boradMaster_seq`)
    REFERENCES `sp1`.`boradMaster` (`seq`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
;
CREATE TABLE IF NOT EXISTS `sp1`.`member` (
  `seq` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `id` VARCHAR(45) NULL,
  `nickname` VARCHAR(45) NULL,
  `level` INT NULL,
  PRIMARY KEY (`seq`))
ENGINE = InnoDB
;
CREATE TABLE IF NOT EXISTS `sp1`.`boardLike` (
  `seq` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `borad_seq` INT UNSIGNED NOT NULL,
  `member_seq` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`seq`),
  INDEX `fk_boardLike_borad1_idx` (`borad_seq` ASC) VISIBLE,
  INDEX `fk_boardLike_member1_idx` (`member_seq` ASC) VISIBLE,
  CONSTRAINT `fk_boardLike_borad1`
    FOREIGN KEY (`borad_seq`)
    REFERENCES `sp1`.`borad` (`seq`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_boardLike_member1`
    FOREIGN KEY (`member_seq`)
    REFERENCES `sp1`.`member` (`seq`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
;
CREATE TABLE IF NOT EXISTS `sp1`.`boradCount` (
  `seq` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `regSeq` INT NULL,
  `regIp` VARCHAR(45) NULL,
  `regDatetime` DATETIME NULL,
  `borad_seq` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`seq`),
  INDEX `fk_boradCount_borad_idx` (`borad_seq` ASC) VISIBLE,
  CONSTRAINT `fk_boradCount_borad`
    FOREIGN KEY (`borad_seq`)
    REFERENCES `sp1`.`borad` (`seq`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
;
CREATE TABLE IF NOT EXISTS `sp1`.`boradComment` (
  `seq` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `comment` VARCHAR(45) NULL,
  `regSeq` INT NULL,
  `borad_seq` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`seq`),
  INDEX `fk_boradComment_borad1_idx` (`borad_seq` ASC) VISIBLE,
  CONSTRAINT `fk_boradComment_borad1`
    FOREIGN KEY (`borad_seq`)
    REFERENCES `sp1`.`borad` (`seq`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
;
CREATE TABLE IF NOT EXISTS `sp1`.`boardAttached` (
  `seq` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `type` INT NULL,
  `path` VARCHAR(45) NULL,
  `fileNameOri` VARCHAR(45) NULL,
  `fileName` VARCHAR(45) NULL,
  `size` DOUBLE NULL,
  `extension` VARCHAR(45) NULL,
  PRIMARY KEY (`seq`))
ENGINE = InnoDB
;
ALTER TABLE boardAttached ADD board_seq int;