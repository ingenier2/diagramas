-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema medico_pacientes
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema medico_pacientes
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `medico_pacientes` DEFAULT CHARACTER SET utf8 ;
USE `medico_pacientes` ;

-- -----------------------------------------------------
-- Table `medico_pacientes`.`cita`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `medico_pacientes`.`cita` (
  `codmed` INT NOT NULL,
  `codpac` INT NOT NULL,
  `hora` TIME NOT NULL,
  `fecha` DATETIME NOT NULL,
  PRIMARY KEY (`codmed`, `codpac`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `medico_pacientes`.`Medico`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `medico_pacientes`.`Medico` (
  `codmed` INT NOT NULL,
  `nombre` VARCHAR(45) NOT NULL,
  `cita_codmed` INT NOT NULL,
  `cita_codpac` INT NOT NULL,
  PRIMARY KEY (`codmed`),
  INDEX `fk_Medico_cita_idx` (`cita_codmed` ASC, `cita_codpac` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `medico_pacientes`.`Paciente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `medico_pacientes`.`Paciente` (
  `codpac` INT NOT NULL,
  `nombre` VARCHAR(45) NOT NULL,
  `cita_codmed` INT NOT NULL,
  `cita_codpac` INT NOT NULL,
  PRIMARY KEY (`codpac`),
  INDEX `fk_Paciente_cita1_idx` (`cita_codmed` ASC, `cita_codpac` ASC) VISIBLE)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
