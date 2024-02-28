-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema PERSONA
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema PERSONA
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `PERSONA` DEFAULT CHARACTER SET utf8 ;
USE `PERSONA` ;

-- -----------------------------------------------------
-- Table `PERSONA`.`PERSONA`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `PERSONA`.`PERSONA` (
  `dni` INT NOT NULL,
  `nombre` VARCHAR(45) NOT NULL,
  `apellido1` VARCHAR(45) NOT NULL,
  `apellido2` VARCHAR(45) NOT NULL,
  `edad` VARCHAR(45) NOT NULL,
  `dia_nacimiento` VARCHAR(45) NOT NULL,
  `mes_nacimiento` VARCHAR(45) NOT NULL,
  `año_nacimiento` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`dni`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `PERSONA`.`PERSONA`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `PERSONA`.`PERSONA` (
  `dni` INT NOT NULL,
  `nombre` VARCHAR(45) NOT NULL,
  `apellido1` VARCHAR(45) NOT NULL,
  `apellido2` VARCHAR(45) NOT NULL,
  `edad` VARCHAR(45) NOT NULL,
  `dia_nacimiento` VARCHAR(45) NOT NULL,
  `mes_nacimiento` VARCHAR(45) NOT NULL,
  `año_nacimiento` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`dni`))
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
