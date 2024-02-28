-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema Ejemplo1_programa
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema Ejemplo1_programa
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Ejemplo1_programa` DEFAULT CHARACTER SET utf8 ;
USE `Ejemplo1_programa` ;

-- -----------------------------------------------------
-- Table `Ejemplo1_programa`.`PROGRAMA`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Ejemplo1_programa`.`PROGRAMA` (
  `cd.programa` INT NOT NULL,
  `lenguaje` VARCHAR(45) NOT NULL,
  `sistema_operativo` VARCHAR(45) NOT NULL,
  `lineas_codigo` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`cd.programa`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Ejemplo1_programa`.`PROGRAMADOR`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Ejemplo1_programa`.`PROGRAMADOR` (
  `nombre_programador` VARCHAR(45) NULL,
  `PROGRAMA_cd.programa` INT NOT NULL,
  PRIMARY KEY (`nombre_programador`),
  INDEX `fk_PROGRAMADOR_PROGRAMA_idx` (`PROGRAMA_cd.programa` ASC) VISIBLE)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
