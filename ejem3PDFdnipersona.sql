-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema DNI_PERSONA
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema DNI_PERSONA
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `DNI_PERSONA` DEFAULT CHARACTER SET utf8 ;
USE `DNI_PERSONA` ;

-- -----------------------------------------------------
-- Table `DNI_PERSONA`.`PERSONA`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `DNI_PERSONA`.`PERSONA` (
  `num_dni` INT NOT NULL,
  `nombre` VARCHAR(45) NULL,
  `apellido1` VARCHAR(45) NULL,
  `apellido2` VARCHAR(45) NULL,
  PRIMARY KEY (`num_dni`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `DNI_PERSONA`.`D-P`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `DNI_PERSONA`.`D-P` (
  `idD-P` INT NOT NULL,
  `PERSONA_num_dni` INT NOT NULL,
  PRIMARY KEY (`idD-P`),
  INDEX `fk_D-P_PERSONA1_idx` (`PERSONA_num_dni` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `DNI_PERSONA`.`DNI`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `DNI_PERSONA`.`DNI` (
  `num_dni` INT NOT NULL,
  `D-P_idD-P` INT NOT NULL,
  PRIMARY KEY (`num_dni`),
  INDEX `fk_DNI_D-P_idx` (`D-P_idD-P` ASC) VISIBLE)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
