-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema PILOTO_COCHE
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema PILOTO_COCHE
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `PILOTO_COCHE` DEFAULT CHARACTER SET utf8 ;
USE `PILOTO_COCHE` ;

-- -----------------------------------------------------
-- Table `PILOTO_COCHE`.`COCHE`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `PILOTO_COCHE`.`COCHE` (
  `matricula` INT NOT NULL,
  `asientos` VARCHAR(45) NOT NULL,
  `marca` VARCHAR(45) NOT NULL,
  `modelo` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`matricula`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `PILOTO_COCHE`.`PILOTO`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `PILOTO_COCHE`.`PILOTO` (
  `nif` INT NOT NULL,
  `nombre` VARCHAR(45) NOT NULL,
  `direccion` VARCHAR(45) NOT NULL,
  `COCHE_matricula` INT NOT NULL,
  PRIMARY KEY (`nif`),
  INDEX `fk_PILOTO_COCHE_idx` (`COCHE_matricula` ASC) VISIBLE)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
