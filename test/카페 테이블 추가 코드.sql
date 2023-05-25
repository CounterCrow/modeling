-- 데이블 추가

-- member 테이블 생성
CREATE TABLE IF NOT EXISTS `member` (
  `seq` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `naver_id` VARCHAR(45) NOT NULL,
  `nickname` VARCHAR(45) NOT NULL,
  `class` VARCHAR(45) NULL,
  `member_DT_update` DATETIME NULL,
  `member_DT_created` DATETIME NULL,
  `member_DT_delete` DATETIME NULL,
  PRIMARY KEY (`seq`))
ENGINE = InnoDB
;

-- Bulletin 테이블 생성
CREATE TABLE IF NOT EXISTS `Bulletin` (
  `seq` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `Bulletin_type` INT NOT NULL,
  `Bulletin_title` VARCHAR(45) NOT NULL,
  `Bulletin_text` VARCHAR(200) NULL,
  `Bulletinl_hits` INT NULL,
  `Bulletinl_like` INT NULL,
  `Bulletin_DT_created` DATETIME NULL,
  `Bulletin_DT_update` DATETIME NULL,
  `Bulletin_DT_delete` DATETIME NULL,
  `member_seq` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`seq`),
  INDEX `fk_Bulletin_member1_idx` (`member_seq` ASC) VISIBLE,
  CONSTRAINT `fk_Bulletin_member1`
    FOREIGN KEY (`member_seq`)
    REFERENCES `member` (`seq`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
;

-- Bulletin_comments
CREATE TABLE IF NOT EXISTS `Bulletin_comments` (
  `seq` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `comments_author` VARCHAR(45) NULL,
  `comments_text` VARCHAR(45) NULL,
  `comments_DT_create` DATETIME NULL,
  `comments_DT_update` DATETIME NULL,
  `comments_DT_delete` DATETIME NULL,
  `Bulletin_comments_seq1` INT UNSIGNED NOT NULL,
  `Bulletin_seq` INT UNSIGNED NOT NULL,
  `member_seq` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`seq`),
  INDEX `fk_Bulletin_comments_Bulletin_comments2_idx` (`Bulletin_comments_seq1` ASC) VISIBLE,
  INDEX `fk_Bulletin_comments_Bulletin1_idx` (`Bulletin_seq` ASC) VISIBLE,
  INDEX `fk_Bulletin_comments_member1_idx` (`member_seq` ASC) VISIBLE,
  CONSTRAINT `fk_Bulletin_comments_Bulletin_comments2`
    FOREIGN KEY (`Bulletin_comments_seq1`)
    REFERENCES `Bulletin_comments` (`seq`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Bulletin_comments_Bulletin1`
    FOREIGN KEY (`Bulletin_seq`)
    REFERENCES `Bulletin` (`seq`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Bulletin_comments_member1`
    FOREIGN KEY (`member_seq`)
    REFERENCES `member` (`seq`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
;

-- Bulletin_addfile 테이블 생성
CREATE TABLE IF NOT EXISTS `Bulletin_addfile` (
  `seq` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `add_file_type` VARCHAR(45) NULL,
  `add_file_title` VARCHAR(45) NULL,
  `add_file_url` VARCHAR(100) NULL,
  `Bulletin_seq` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`seq`),
  INDEX `fk_cafe_xxx_Bulletin_addfile_cafe_xxx_Bulletin1_idx` (`Bulletin_seq` ASC) VISIBLE,
  CONSTRAINT `fk_cafe_xxx_Bulletin_addfile_cafe_xxx_Bulletin1`
    FOREIGN KEY (`Bulletin_seq`)
    REFERENCES `Bulletin` (`seq`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
;