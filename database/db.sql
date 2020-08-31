-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema database_links
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema database_links
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `database_links` DEFAULT CHARACTER SET utf8 ;
USE `database_links` ;

-- -----------------------------------------------------
-- Table `database_links`.`users`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `database_links`.`users` (
  `id` INT(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `username` VARCHAR(30) NOT NULL,
  `password` VARCHAR(30) NOT NULL,
  `fullname` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `database_links`.`links`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `database_links`.`links` (
  `id` INT(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(100) NOT NULL,
  `url` VARCHAR(255) NOT NULL,
  `description` TEXT NULL,
  `user_id` INT(11) UNSIGNED NULL,
  `timestamp` TIMESTAMP NOT NULL DEFAULT current_timestamp,
  PRIMARY KEY (`id`),
  INDEX `FK_User_Link_idx` (`user_id` ASC) ,
  CONSTRAINT `FK_User_Link`
    FOREIGN KEY (`user_id`)
    REFERENCES `database_links`.`users` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
