-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema ruche_connectee
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `ruche_connectee` ;

-- -----------------------------------------------------
-- Schema ruche_connectee
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `ruche_connectee` DEFAULT CHARACTER SET utf8 ;
USE `ruche_connectee` ;

-- -----------------------------------------------------
-- Table `ruche_connectee`.`Utilisateur`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ruche_connectee`.`Utilisateur` ;

CREATE TABLE IF NOT EXISTS `ruche_connectee`.`Utilisateur` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `nom` VARCHAR(45) NOT NULL,
  `prenom` VARCHAR(45) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `pwd` VARCHAR(512) NOT NULL,
  `telephone` VARCHAR(45) NULL,
  `adresse` VARCHAR(1000) NULL,
  `SIREN` VARCHAR(9) NULL,
  `isAdmin` TINYINT NULL,
  `isActive` TINYINT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `email_UNIQUE` (`email` ASC) VISIBLE,
  UNIQUE INDEX `SIRET_UNIQUE` (`SIREN` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ruche_connectee`.`Rucher`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ruche_connectee`.`Rucher` ;

CREATE TABLE IF NOT EXISTS `ruche_connectee`.`Rucher` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `nom` VARCHAR(45) NULL,
  `latitude` DECIMAL(6,4) NOT NULL,
  `longitude` DECIMAL(7,4) NOT NULL,
  `dateCreation` DATE NOT NULL,
  `dateFinRucher` DATE NULL,
  `commentaire` TEXT NULL,
  `isActive` TINYINT NULL,
  `idUtilisateur` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_Rucher_Utilisateur1_idx` (`idUtilisateur` ASC) VISIBLE,
  CONSTRAINT `fk_Rucher_Utilisateur1`
    FOREIGN KEY (`idUtilisateur`)
    REFERENCES `ruche_connectee`.`Utilisateur` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ruche_connectee`.`Ruche`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ruche_connectee`.`Ruche` ;

CREATE TABLE IF NOT EXISTS `ruche_connectee`.`Ruche` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `nom` VARCHAR(45) NULL,
  `latitude` DECIMAL(8,6) NOT NULL,
  `longitude` DECIMAL(9,6) NOT NULL,
  `altitudeEnM` INT NOT NULL,
  `orientation` VARCHAR(45) NOT NULL,
  `type` VARCHAR(45) NOT NULL,
  `typeAbeille` VARCHAR(45) NOT NULL,
  `poidsInitialEnG` INT NOT NULL,
  `dateAchat` DATE NOT NULL,
  `nbHausse` INT NULL,
  `commentaire` TEXT NULL,
  `isActive` TINYINT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ruche_connectee`.`Capteur`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ruche_connectee`.`Capteur` ;

CREATE TABLE IF NOT EXISTS `ruche_connectee`.`Capteur` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `ref` VARCHAR(45) NOT NULL,
  `type` VARCHAR(45) NOT NULL,
  `isActive` TINYINT NULL,
  `idRuche` INT UNSIGNED NULL,
  `idRucher` INT UNSIGNED NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_CapteurUnitaire_Ruche1_idx` (`idRuche` ASC) VISIBLE,
  INDEX `fk_CapteurUnitaire_Rucher1_idx` (`idRucher` ASC) VISIBLE,
  CONSTRAINT `fk_CapteurUnitaire_Ruche1`
    FOREIGN KEY (`idRuche`)
    REFERENCES `ruche_connectee`.`Ruche` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_CapteurUnitaire_Rucher1`
    FOREIGN KEY (`idRucher`)
    REFERENCES `ruche_connectee`.`Rucher` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ruche_connectee`.`Mesure`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ruche_connectee`.`Mesure` ;

CREATE TABLE IF NOT EXISTS `ruche_connectee`.`Mesure` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `valeur` DECIMAL(7,4) NOT NULL,
  `dateMesure` DATE NOT NULL,
  `heureMesure` TIME NOT NULL,
  `unite` VARCHAR(45) NOT NULL,
  `idCapteur` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_Mesure_CapteurUnitaire1_idx` (`idCapteur` ASC) VISIBLE,
  CONSTRAINT `fk_Mesure_CapteurUnitaire1`
    FOREIGN KEY (`idCapteur`)
    REFERENCES `ruche_connectee`.`Capteur` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ruche_connectee`.`Rucher_has_Ruche`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ruche_connectee`.`Rucher_has_Ruche` ;

CREATE TABLE IF NOT EXISTS `ruche_connectee`.`Rucher_has_Ruche` (
  `idRucher` INT UNSIGNED NOT NULL,
  `idRuche` INT UNSIGNED NOT NULL,
  `dateMiseEnPlace` DATE NOT NULL,
  `dateEnlevement` DATE NULL,
  PRIMARY KEY (`idRucher`, `idRuche`),
  INDEX `fk_Rucher_has_Ruche_Ruche1_idx` (`idRuche` ASC) VISIBLE,
  INDEX `fk_Rucher_has_Ruche_Rucher1_idx` (`idRucher` ASC) VISIBLE,
  CONSTRAINT `fk_Rucher_has_Ruche_Rucher1`
    FOREIGN KEY (`idRucher`)
    REFERENCES `ruche_connectee`.`Rucher` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Rucher_has_Ruche_Ruche1`
    FOREIGN KEY (`idRuche`)
    REFERENCES `ruche_connectee`.`Ruche` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ruche_connectee`.`ConfigAlerte`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ruche_connectee`.`ConfigAlerte` ;

CREATE TABLE IF NOT EXISTS `ruche_connectee`.`ConfigAlerte` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `typeAlerte` VARCHAR(45) NOT NULL,
  `limiteHaute` DECIMAL(5,2) NULL,
  `limiteBasse` DECIMAL(5,2) NULL,
  `variation` DECIMAL(4,2) NULL,
  `intervalle` INT NULL,
  `intervalleUnite` VARCHAR(16) NULL,
  `idCapteur` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_ConfigAlerte_CapteurUnitaire1_idx` (`idCapteur` ASC) VISIBLE,
  CONSTRAINT `fk_ConfigAlerte_CapteurUnitaire1`
    FOREIGN KEY (`idCapteur`)
    REFERENCES `ruche_connectee`.`Capteur` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
