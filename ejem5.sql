-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema EMPLE_DEPA
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema EMPLE_DEPA
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `EMPLE_DEPA` DEFAULT CHARACTER SET utf8 ;
USE `EMPLE_DEPA` ;

-- -----------------------------------------------------
-- Table `EMPLE_DEPA`.`DEPARTAMENTO`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `EMPLE_DEPA`.`DEPARTAMENTO` (
  `cd_depa` INT NOT NULL,
  `nombre` VARCHAR(45) NULL,
  `localidad` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`cd_depa`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `EMPLE_DEPA`.`E-D`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `EMPLE_DEPA`.`E-D` (
  `ultima_fecha` INT NOT NULL,
  `DEPARTAMENTO_cd_depa` INT NOT NULL,
  PRIMARY KEY (`ultima_fecha`),
  INDEX `fk_E-D_DEPARTAMENTO1_idx` (`DEPARTAMENTO_cd_depa` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `EMPLE_DEPA`.`EMPLEADO`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `EMPLE_DEPA`.`EMPLEADO` (
  `dni` INT NOT NULL,
  `nombre` VARCHAR(45) NOT NULL,
  `direccion` VARCHAR(45) NOT NULL,
  `E-D_ultima_fecha` INT NOT NULL,
  PRIMARY KEY (`dni`),
  INDEX `fk_EMPLEADO_E-D_idx` (`E-D_ultima_fecha` ASC) VISIBLE)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
