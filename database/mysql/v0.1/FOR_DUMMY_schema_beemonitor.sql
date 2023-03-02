-- MySQL Workbench Forward Engineering

-- ---------------------------------------------------------
-- Script for dummy data generation at https://filldb.info/
-- ---------------------------------------------------------

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';


-- -----------------------------------------------------
-- Table `personEntity`
-- -----------------------------------------------------

CREATE TABLE IF NOT EXISTS `personEntity` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `first_name` VARCHAR(45) NOT NULL,
  `last_name` VARCHAR(45) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `pwd` VARCHAR(512) NOT NULL,
  `phone` VARCHAR(45) NULL,
  `adress` VARCHAR(1000) NULL,
  `is_admin` TINYINT NULL,
  `is_active` TINYINT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `email_UNIQUE` (`email` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `apiary`
-- -----------------------------------------------------

CREATE TABLE IF NOT EXISTS `apiary` (
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
    REFERENCES `personEntity` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `hive`
-- -----------------------------------------------------

CREATE TABLE IF NOT EXISTS `hive` (
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
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sensor`
-- -----------------------------------------------------

CREATE TABLE IF NOT EXISTS `sensor` (
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
    REFERENCES `hive` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_sensor_apiary1`
    FOREIGN KEY (`id_apiary`)
    REFERENCES `apiary` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `measurement`
-- -----------------------------------------------------

CREATE TABLE IF NOT EXISTS `measurement` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `value` DECIMAL(7,4) NOT NULL,
  `measurement_date` DATE NOT NULL,
  `measurement_hour` TIME NOT NULL,
  `unit` VARCHAR(45) NOT NULL,
  `id_sensor` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_measurement_sensor1_idx` (`id_sensor` ASC) VISIBLE,
  CONSTRAINT `fk_measurement_sensor1`
    FOREIGN KEY (`id_sensor`)
    REFERENCES `sensor` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `apiary_has_hive`
-- -----------------------------------------------------

CREATE TABLE IF NOT EXISTS `apiary_has_hive` (
  `id_apiary` INT UNSIGNED NOT NULL,
  `id_hive` INT UNSIGNED NOT NULL,
  `add_date` DATE NOT NULL,
  `remove_date` DATE NULL,
  PRIMARY KEY (`id_apiary`, `id_hive`),
  INDEX `fk_apiary_has_hive_hive1_idx` (`id_hive` ASC) VISIBLE,
  INDEX `fk_apiary_has_hive_apiary1_idx` (`id_apiary` ASC) VISIBLE,
  CONSTRAINT `fk_apiary_has_hive_apiary1`
    FOREIGN KEY (`id_apiary`)
    REFERENCES `apiary` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_apiary_has_hive_hive1`
    FOREIGN KEY (`id_hive`)
    REFERENCES `hive` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `alert_config`
-- -----------------------------------------------------

CREATE TABLE IF NOT EXISTS `alert_config` (
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
    REFERENCES `sensor` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
