-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema poliza
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema poliza
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `poliza` DEFAULT CHARACTER SET utf8 ;
USE `poliza` ;

-- -----------------------------------------------------
-- Table `poliza`.`De automovil`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `poliza`.`De automovil` (
  `matricula` INT NOT NULL,
  PRIMARY KEY (`matricula`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `poliza`.`Poliza`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `poliza`.`Poliza` (
  `número` INT NOT NULL,
  `fecha_ini` VARCHAR(45) NOT NULL,
  `fecha_fin` VARCHAR(45) NOT NULL,
  `De automovil_matricula` INT NOT NULL,
  PRIMARY KEY (`número`),
  INDEX `fk_Poliza_De automovil_idx` (`De automovil_matricula` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `poliza`.`Beneficiario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `poliza`.`Beneficiario` (
  `DNI` INT NOT NULL,
  `nombre` VARCHAR(45) NOT NULL,
  `fecha_nacim` DATETIME(10) NOT NULL,
  PRIMARY KEY (`DNI`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `poliza`.`De vida`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `poliza`.`De vida` (
  `Poliza_número` INT NOT NULL,
  `Beneficiario_DNI` INT NOT NULL,
  INDEX `fk_De vida_Poliza1_idx` (`Poliza_número` ASC) VISIBLE,
  INDEX `fk_De vida_Beneficiario1_idx` (`Beneficiario_DNI` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `poliza`.`De vivienda`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `poliza`.`De vivienda` (
  `domicilio` VARCHAR(45) NOT NULL,
  `Poliza_número` INT NOT NULL,
  INDEX `fk_De vivienda_Poliza1_idx` (`Poliza_número` ASC) VISIBLE)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
