-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema ER_ED
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema ER_ED
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `ER_ED` DEFAULT CHARACTER SET utf8 ;
USE `ER_ED` ;

-- -----------------------------------------------------
-- Table `ER_ED`.`Empleado`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ER_ED`.`Empleado` (
  `num_empleado` INT NOT NULL,
  `nombre` VARCHAR(45) NOT NULL,
  `fecha_ingreso` DATETIME NOT NULL,
  PRIMARY KEY (`num_empleado`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ER_ED`.`Departamento`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ER_ED`.`Departamento` (
  `num_departamento` INT NOT NULL,
  `nombre` VARCHAR(45) NOT NULL,
  `presupuesto` INT NOT NULL,
  `Empleado_num_empleado` INT NOT NULL,
  PRIMARY KEY (`nombre`, `num_departamento`, `Empleado_num_empleado`),
  INDEX `fk_Departamento_Empleado_idx` (`Empleado_num_empleado` ASC) VISIBLE)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
