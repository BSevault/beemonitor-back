-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';


-- -----------------------------------------------------
-- Table `utilisateur`
-- -----------------------------------------------------

CREATE TABLE IF NOT EXISTS `utilisateur` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `nom` VARCHAR(45) NOT NULL,
  `prenom` VARCHAR(45) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `pwd` VARCHAR(512) NOT NULL,
  `telephone` VARCHAR(45) NULL,
  `adresse` VARCHAR(1000) NULL,
  `is_admin` TINYINT NULL,
  `is_active` TINYINT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `email_UNIQUE` (`email` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `rucher`
-- -----------------------------------------------------

CREATE TABLE IF NOT EXISTS `rucher` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `nom` VARCHAR(45) NULL,
  `latitude` DECIMAL(6,4) NOT NULL,
  `longitude` DECIMAL(7,4) NOT NULL,
  `date_creation` DATE NOT NULL,
  `date_fin_rucher` DATE NULL,
  `commentaire` TEXT NULL,
  `is_active` TINYINT NULL,
  `utilisateur_id` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_rucher_utilisateur1_idx` (`utilisateur_id` ASC) VISIBLE,
  CONSTRAINT `fk_rucher_utilisateur1`
    FOREIGN KEY (`utilisateur_id`)
    REFERENCES `utilisateur` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ruche`
-- -----------------------------------------------------

CREATE TABLE IF NOT EXISTS `ruche` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `nom` VARCHAR(45) NULL,
  `latitude` DECIMAL(8,6) NOT NULL,
  `longitude` DECIMAL(9,6) NOT NULL,
  `altitude_en_m` INT NOT NULL,
  `orientation` VARCHAR(45) NOT NULL,
  `type` VARCHAR(45) NOT NULL,
  `type_abeille` VARCHAR(45) NOT NULL,
  `poids_initial_en_g` INT NOT NULL,
  `date_achat` DATE NOT NULL,
  `nb_hausse` INT NULL,
  `commentaire` TEXT NULL,
  `is_active` TINYINT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `capteur`
-- -----------------------------------------------------

CREATE TABLE IF NOT EXISTS `capteur` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `ref` VARCHAR(45) NOT NULL,
  `type` VARCHAR(45) NOT NULL,
  `is_active` TINYINT NULL,
  `id_ruche` INT UNSIGNED NULL,
  `id_rucher` INT UNSIGNED NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_capteur_ruche1_idx` (`id_ruche` ASC) VISIBLE,
  INDEX `fk_capteur_rucher1_idx` (`id_rucher` ASC) VISIBLE,
  CONSTRAINT `fk_capteur_ruche1`
    FOREIGN KEY (`id_ruche`)
    REFERENCES `ruche` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_capteur_rucher1`
    FOREIGN KEY (`id_rucher`)
    REFERENCES `rucher` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mesure`
-- -----------------------------------------------------

CREATE TABLE IF NOT EXISTS `mesure` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `valeur` DECIMAL(7,4) NOT NULL,
  `date_mesure` DATE NOT NULL,
  `heure_mesure` TIME NOT NULL,
  `unite` VARCHAR(45) NOT NULL,
  `id_capteur` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_mesure_capteur1_idx` (`id_capteur` ASC) VISIBLE,
  CONSTRAINT `fk_mesure_capteur1`
    FOREIGN KEY (`id_capteur`)
    REFERENCES `capteur` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `rucher_has_ruche`
-- -----------------------------------------------------

CREATE TABLE IF NOT EXISTS `rucher_has_ruche` (
  `id_rucher` INT UNSIGNED NOT NULL,
  `id_ruche` INT UNSIGNED NOT NULL,
  `date_mise_en_place` DATE NOT NULL,
  `date_enlevement` DATE NULL,
  PRIMARY KEY (`id_rucher`, `id_ruche`),
  INDEX `fk_rucher_has_ruche_ruche1_idx` (`id_ruche` ASC) VISIBLE,
  INDEX `fk_rucher_has_ruche_rucher1_idx` (`id_rucher` ASC) VISIBLE,
  CONSTRAINT `fk_rucher_has_ruche_rucher1`
    FOREIGN KEY (`id_rucher`)
    REFERENCES `rucher` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_rucher_has_ruche_ruche1`
    FOREIGN KEY (`id_ruche`)
    REFERENCES `ruche` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `config_alerte`
-- -----------------------------------------------------

CREATE TABLE IF NOT EXISTS `config_alerte` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `type_alerte` VARCHAR(45) NOT NULL,
  `limite_haute` DECIMAL(5,2) NULL,
  `limite_basse` DECIMAL(5,2) NULL,
  `variation` DECIMAL(4,2) NULL,
  `intervalle` INT NULL,
  `intervalle_unite` VARCHAR(16) NULL,
  `id_capteur` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_config_alerte_capteur1_idx` (`id_capteur` ASC) VISIBLE,
  CONSTRAINT `fk_config_alerte_capteur`
    FOREIGN KEY (`id_capteur`)
    REFERENCES `capteur` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
