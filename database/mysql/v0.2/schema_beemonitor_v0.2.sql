-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema beemonitor
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `beemonitor` ;

-- -----------------------------------------------------
-- Schema beemonitor
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `beemonitor` DEFAULT CHARACTER SET utf8 ;
USE `beemonitor` ;

-- -----------------------------------------------------
-- Table `beemonitor`.`person`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `beemonitor`.`person` ;

CREATE TABLE IF NOT EXISTS `beemonitor`.`person` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `first_name` VARCHAR(45) NOT NULL,
  `last_name` VARCHAR(45) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `pwd` VARCHAR(512) NOT NULL,
  `phone` VARCHAR(45) NULL,
  `adress` VARCHAR(1000) NULL,
  `is_admin` TINYINT NULL,
  `is_active` TINYINT NULL,
  `token` VARCHAR(255) NULL,
  `token_exp_date` DATE NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `email_UNIQUE` (`email` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `beemonitor`.`apiary`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `beemonitor`.`apiary` ;

CREATE TABLE IF NOT EXISTS `beemonitor`.`apiary` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NULL,
  `latitude` DECIMAL(6,4) NOT NULL,
  `longitude` DECIMAL(7,4) NOT NULL,
  `creation_date` DATE NOT NULL,
  `end_date` DATE NULL,
  `comment` TEXT NULL,
  `is_active` TINYINT NULL,
  `person_id` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_apiary_person1_idx` (`person_id` ASC) VISIBLE,
  CONSTRAINT `fk_apiary_person1`
    FOREIGN KEY (`person_id`)
    REFERENCES `beemonitor`.`person` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `beemonitor`.`hive`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `beemonitor`.`hive` ;

CREATE TABLE IF NOT EXISTS `beemonitor`.`hive` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NULL,
  `latitude` DECIMAL(8,6) NOT NULL,
  `longitude` DECIMAL(9,6) NOT NULL,
  `altitude_in_m` INT NOT NULL,
  `orientation` VARCHAR(45) NOT NULL,
  `type` VARCHAR(45) NOT NULL,
  `bee_type` VARCHAR(45) NOT NULL,
  `initial_weight_in_g` INT NOT NULL,
  `purchase_date` DATE NOT NULL,
  `super_count` INT NULL,
  `comment` TEXT NULL,
  `is_active` TINYINT NULL,
  `apiary_id` INT UNSIGNED,
  PRIMARY KEY (`id`),
  INDEX `fk_hive_apiary1_idx` (`apiary_id` ASC) VISIBLE,
  CONSTRAINT `fk_hive_apiary1`
    FOREIGN KEY (`apiary_id`)
    REFERENCES `beemonitor`.`apiary` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `beemonitor`.`sensor`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `beemonitor`.`sensor` ;

CREATE TABLE IF NOT EXISTS `beemonitor`.`sensor` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `ref` VARCHAR(45) NOT NULL,
  `type` VARCHAR(45) NOT NULL,
  `is_active` TINYINT NULL,
  `id_hive` INT UNSIGNED NULL,
  `id_apiary` INT UNSIGNED NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_sensor_hive1_idx` (`id_hive` ASC) VISIBLE,
  INDEX `fk_sensor_apiary1_idx` (`id_apiary` ASC) VISIBLE,
  CONSTRAINT `fk_sensor_hive1`
    FOREIGN KEY (`id_hive`)
    REFERENCES `beemonitor`.`hive` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_sensor_apiary1`
    FOREIGN KEY (`id_apiary`)
    REFERENCES `beemonitor`.`apiary` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `beemonitor`.`measurement`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `beemonitor`.`measurement` ;

CREATE TABLE IF NOT EXISTS `beemonitor`.`measurement` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `value` DECIMAL(7,4) NOT NULL,
  `measurement_date` DATE NOT NULL,
  `measurement_hour` TIME NOT NULL,
  `unit` VARCHAR(45) NOT NULL,
  `id_sensor` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_measurement_sensor1_idx` (`id_sensor` ASC) INVISIBLE,
  CONSTRAINT `fk_measurement_sensor1`
    FOREIGN KEY (`id_sensor`)
    REFERENCES `beemonitor`.`sensor` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `beemonitor`.`alert_config`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `beemonitor`.`alert_config` ;

CREATE TABLE IF NOT EXISTS `beemonitor`.`alert_config` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `alert_type` VARCHAR(45) NOT NULL,
  `upper_limit` DECIMAL(5,2) NULL,
  `lower_limit` DECIMAL(5,2) NULL,
  `variation` DECIMAL(4,2) NULL,
  `interval` INT NULL,
  `interval_unit` VARCHAR(16) NULL,
  `id_sensor` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_alert_config_sensor1_idx` (`id_sensor` ASC) VISIBLE,
  CONSTRAINT `fk_alert_config_sensor`
    FOREIGN KEY (`id_sensor`)
    REFERENCES `beemonitor`.`sensor` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
