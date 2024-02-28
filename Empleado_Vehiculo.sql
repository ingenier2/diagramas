-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema Empleado_Vehiculo
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema Empleado_Vehiculo
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Empleado_Vehiculo` DEFAULT CHARACTER SET utf8 ;
USE `Empleado_Vehiculo` ;

-- -----------------------------------------------------
-- Table `Empleado_Vehiculo`.`conduce`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Empleado_Vehiculo`.`conduce` (
  `matricula` INT NOT NULL,
  `codemp` VARCHAR(45) NOT NULL,
  `fecha_inicio` DATETIME(50) NULL,
  PRIMARY KEY (`matricula`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Empleado_Vehiculo`.`Empleado`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Empleado_Vehiculo`.`Empleado` (
  `codemp` INT NOT NULL,
  `nombre` VARCHAR(45) NOT NULL,
  `conduce_matricula` INT NOT NULL,
  PRIMARY KEY (`codemp`, `conduce_matricula`),
  INDEX `fk_Empleado_conduce1_idx` (`conduce_matricula` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Empleado_Vehiculo`.`Vehiculo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Empleado_Vehiculo`.`Vehiculo` (
  `matricula` INT NOT NULL,
  `modelo` INT NOT NULL,
  `conduce_matricula` INT NOT NULL,
  PRIMARY KEY (`matricula`),
  INDEX `fk_Vehiculo_conduce_idx` (`conduce_matricula` ASC) VISIBLE)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
