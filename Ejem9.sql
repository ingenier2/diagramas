-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema pdf
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema pdf
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `pdf` DEFAULT CHARACTER SET utf8 ;
USE `pdf` ;

-- -----------------------------------------------------
-- Table `pdf`.`P-P`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pdf`.`P-P` (
  `COD-PIEZA-CONTINETE` VARCHAR(45) NOT NULL,
  `FUNCION` INT NOT NULL,
  `COD-PIEZA-CONTENIDO` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`FUNCION`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `pdf`.`PIEZA`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pdf`.`PIEZA` (
  `COD-PIEZA` INT NOT NULL,
  `NOMBRE` VARCHAR(45) NOT NULL,
  `COLOR` VARCHAR(45) NOT NULL,
  `P-P_FUNCION1` INT NOT NULL,
  `P-P_FUNCION` INT NOT NULL,
  PRIMARY KEY (`COD-PIEZA`, `P-P_FUNCION1`, `P-P_FUNCION`),
  INDEX `fk_PIEZA_P-P_idx` (`P-P_FUNCION` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `pdf`.`A-F`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pdf`.`A-F` (
  `HA-ESTUDIADO` INT NOT NULL,
  `ESTUDIA-EN` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`HA-ESTUDIADO`, `ESTUDIA-EN`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `pdf`.`ARQUITECTO`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pdf`.`ARQUITECTO` (
  `COD-EMPLEADO` INT NOT NULL,
  `NOMBRE` VARCHAR(45) NULL,
  `DIRECCION` VARCHAR(45) NULL,
  `NUM-` VARCHAR(45) NULL,
  `A-F_HA-ESTUDIADO` INT NOT NULL,
  `A-F_ESTUDIA-EN` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`COD-EMPLEADO`, `A-F_HA-ESTUDIADO`, `A-F_ESTUDIA-EN`),
  INDEX `fk_ARQUITECTO_A-F1_idx` (`A-F_HA-ESTUDIADO` ASC, `A-F_ESTUDIA-EN` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `pdf`.`E-A`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pdf`.`E-A` (
  `FECHA-INICIO` INT NOT NULL,
  `FECHA-FINAL` VARCHAR(45) NULL,
  `ARQUITECTO_COD-EMPLEADO` INT NOT NULL,
  `ARQUITECTO_A-F_HA-ESTUDIADO` INT NOT NULL,
  `ARQUITECTO_A-F_ESTUDIA-EN` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`FECHA-INICIO`, `ARQUITECTO_COD-EMPLEADO`, `ARQUITECTO_A-F_HA-ESTUDIADO`, `ARQUITECTO_A-F_ESTUDIA-EN`),
  INDEX `fk_E-A_ARQUITECTO1_idx` (`ARQUITECTO_COD-EMPLEADO` ASC, `ARQUITECTO_A-F_HA-ESTUDIADO` ASC, `ARQUITECTO_A-F_ESTUDIA-EN` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `pdf`.`E-C`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pdf`.`E-C` (
  `FECHA-INICIO` INT NULL,
  `FECHA-FINAL` VARCHAR(45) NULL,
  `COD-EDIFICIO` VARCHAR(45) NULL,
  `COD-EMPLEADO` VARCHAR(45) NULL,
  PRIMARY KEY (`FECHA-INICIO`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `pdf`.`E-AL`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pdf`.`E-AL` (
  `FECHA-INICIO` INT NOT NULL,
  `FECHA-FIN` VARCHAR(45) NULL,
  `COD-EDIFICIO` VARCHAR(45) NULL,
  `COD-EMPLEADO` VARCHAR(45) NULL,
  PRIMARY KEY (`FECHA-INICIO`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `pdf`.`EDIFICIO`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pdf`.`EDIFICIO` (
  `COD-EDIT` INT NOT NULL,
  `DIRECCI[ON` VARCHAR(45) NULL,
  `CIUDAD` VARCHAR(45) NULL,
  `E-A_FECHA-INICIO` INT NOT NULL,
  `E-C_FECHA-INICIO` INT NOT NULL,
  `E-AL_FECHA-INICIO` INT NOT NULL,
  PRIMARY KEY (`COD-EDIT`, `E-A_FECHA-INICIO`, `E-C_FECHA-INICIO`, `E-AL_FECHA-INICIO`),
  INDEX `fk_EDIFICIO_E-A1_idx` (`E-A_FECHA-INICIO` ASC) VISIBLE,
  INDEX `fk_EDIFICIO_E-C1_idx` (`E-C_FECHA-INICIO` ASC) VISIBLE,
  INDEX `fk_EDIFICIO_E-AL1_idx` (`E-AL_FECHA-INICIO` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `pdf`.`FACULTAD`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pdf`.`FACULTAD` (
  `COD-FACULTAD` INT NOT NULL,
  `NOMBRE` VARCHAR(45) NOT NULL,
  `CIUDAD` VARCHAR(45) NOT NULL,
  `A-F_HA-ESTUDIADO` INT NOT NULL,
  `A-F_ESTUDIA-EN` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`COD-FACULTAD`, `A-F_HA-ESTUDIADO`, `A-F_ESTUDIA-EN`),
  INDEX `fk_FACULTAD_A-F1_idx` (`A-F_HA-ESTUDIADO` ASC, `A-F_ESTUDIA-EN` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `pdf`.`HERRAMIENTA`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pdf`.`HERRAMIENTA` (
  `COD-HERRAMINETA` INT NOT NULL,
  `NOMBRE-HERRAMIENTA` VARCHAR(45) NULL,
  PRIMARY KEY (`COD-HERRAMINETA`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `pdf`.`A-H`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pdf`.`A-H` (
  `COD-EMPLEADO` INT NOT NULL,
  `COD-HERRAMIENTA` VARCHAR(45) NOT NULL,
  `HERRAMIENTA_COD-HERRAMINETA` INT NOT NULL,
  PRIMARY KEY (`COD-EMPLEADO`, `HERRAMIENTA_COD-HERRAMINETA`),
  INDEX `fk_A-H_HERRAMIENTA1_idx` (`HERRAMIENTA_COD-HERRAMINETA` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `pdf`.`CAPATAZ`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pdf`.`CAPATAZ` (
  `COD-EMPLEADO` INT NOT NULL,
  `NOMNRE` VARCHAR(45) NULL,
  `DIRECCION` VARCHAR(45) NULL,
  `E-C_FECHA-INICIO` INT NOT NULL,
  PRIMARY KEY (`COD-EMPLEADO`, `E-C_FECHA-INICIO`),
  INDEX `fk_CAPATAZ_E-C1_idx` (`E-C_FECHA-INICIO` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `pdf`.`C-A`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pdf`.`C-A` (
  `idC-A` INT NOT NULL,
  `CAPATAZ_COD-EMPLEADO` INT NOT NULL,
  PRIMARY KEY (`idC-A`),
  INDEX `fk_C-A_CAPATAZ1_idx` (`CAPATAZ_COD-EMPLEADO` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `pdf`.`ALBAÑIL`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pdf`.`ALBAÑIL` (
  `COD-EMPLEADO` INT NOT NULL,
  `DIRECCION` VARCHAR(45) NULL,
  `ESPECIALIDAD` VARCHAR(45) NULL,
  `COD-EMPLEADO-CAPATAZ` VARCHAR(45) NULL,
  `A-H_COD-EMPLEADO` INT NOT NULL,
  `C-A_idC-A` INT NOT NULL,
  `E-AL_FECHA-INICIO` INT NOT NULL,
  PRIMARY KEY (`COD-EMPLEADO`, `A-H_COD-EMPLEADO`, `C-A_idC-A`, `E-AL_FECHA-INICIO`),
  INDEX `fk_ALBAÑIL_A-H1_idx` (`A-H_COD-EMPLEADO` ASC) VISIBLE,
  INDEX `fk_ALBAÑIL_C-A1_idx` (`C-A_idC-A` ASC) VISIBLE,
  INDEX `fk_ALBAÑIL_E-AL1_idx` (`E-AL_FECHA-INICIO` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `pdf`.`EMPLEADO`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pdf`.`EMPLEADO` (
  `NIF-TIENERESPONSABLE` INT NOT NULL,
  `NOMBRE` VARCHAR(45) NOT NULL,
  `APELLIDOS` VARCHAR(45) NOT NULL,
  `DEPARTAMENTO` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`NIF-TIENERESPONSABLE`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `pdf`.`E-E`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pdf`.`E-E` (
  `NIF-RESPONSABLE` INT NOT NULL,
  `DEPARTAMENTO` VARCHAR(45) NOT NULL,
  `EMPLEADO_NIF-TIENERESPONSABLE` INT NOT NULL,
  PRIMARY KEY (`NIF-RESPONSABLE`, `EMPLEADO_NIF-TIENERESPONSABLE`),
  INDEX `fk_E-E_EMPLEADO2_idx` (`EMPLEADO_NIF-TIENERESPONSABLE` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `pdf`.`E-E`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pdf`.`E-E` (
  `NIF-RESPONSABLE` INT NOT NULL,
  `DEPARTAMENTO` VARCHAR(45) NOT NULL,
  `EMPLEADO_NIF-TIENERESPONSABLE` INT NOT NULL,
  PRIMARY KEY (`NIF-RESPONSABLE`, `EMPLEADO_NIF-TIENERESPONSABLE`),
  INDEX `fk_E-E_EMPLEADO2_idx` (`EMPLEADO_NIF-TIENERESPONSABLE` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `pdf`.`DIRECTOR`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pdf`.`DIRECTOR` (
  `COD-EMPLEADO` INT NOT NULL,
  PRIMARY KEY (`COD-EMPLEADO`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `pdf`.`H-A`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pdf`.`H-A` (
  `COD-EMPLEADO` INT NOT NULL,
  `COD-PAQUETE` VARCHAR(45) NULL,
  PRIMARY KEY (`COD-EMPLEADO`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `pdf`.`AUXILIAR`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pdf`.`AUXILIAR` (
  `COD-EMPLEADO` INT NOT NULL,
  `NUM-PULSACIONES` VARCHAR(45) NULL,
  `H-A_COD-EMPLEADO` INT NOT NULL,
  PRIMARY KEY (`COD-EMPLEADO`),
  INDEX `fk_AUXILIAR_H-A1_idx` (`H-A_COD-EMPLEADO` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `pdf`.`EMPLEADO-DE-EMPRESA`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pdf`.`EMPLEADO-DE-EMPRESA` (
  `COD-EMPLEADO` INT NOT NULL,
  `NOMBRE` VARCHAR(45) NOT NULL,
  `DIRECCION` VARCHAR(45) NOT NULL,
  `TIPO` VARCHAR(45) NULL,
  `E-E_COD-EMPRESA` INT NOT NULL,
  `E-E_COD-EMPLEADO` VARCHAR(45) NOT NULL,
  `DIRECTOR_COD-EMPLEADO` INT NOT NULL,
  `AUXILIAR_COD-EMPLEADO` INT NOT NULL,
  PRIMARY KEY (`COD-EMPLEADO`, `E-E_COD-EMPRESA`, `E-E_COD-EMPLEADO`, `DIRECTOR_COD-EMPLEADO`),
  INDEX `fk_EMPLEADO-DE-EMPRESA_E-E1_idx` (`E-E_COD-EMPRESA` ASC, `E-E_COD-EMPLEADO` ASC) VISIBLE,
  INDEX `fk_EMPLEADO-DE-EMPRESA_DIRECTOR1_idx` (`DIRECTOR_COD-EMPLEADO` ASC) VISIBLE,
  INDEX `fk_EMPLEADO-DE-EMPRESA_AUXILIAR1_idx` (`AUXILIAR_COD-EMPLEADO` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `pdf`.`EMPRESA`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pdf`.`EMPRESA` (
  `COD-EMPRESA` INT NOT NULL,
  `DIRECCION` VARCHAR(45) NULL,
  `E-E_COD-EMPRESA` INT NOT NULL,
  `E-E_COD-EMPLEADO` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`COD-EMPRESA`, `E-E_COD-EMPRESA`, `E-E_COD-EMPLEADO`),
  INDEX `fk_EMPRESA_E-E1_idx` (`E-E_COD-EMPRESA` ASC, `E-E_COD-EMPLEADO` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `pdf`.`P-PL`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pdf`.`P-PL` (
  `COD-EMPLEADO` INT NOT NULL,
  `COD-LENGUAJE` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`COD-EMPLEADO`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `pdf`.`PROGRAMADOR`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pdf`.`PROGRAMADOR` (
  `COD-EMPLEADO` INT NOT NULL,
  `P-PL_COD-EMPLEADO` INT NOT NULL,
  `EMPLEADO-DE-EMPRESA_COD-EMPLEADO` INT NOT NULL,
  `EMPLEADO-DE-EMPRESA_E-E_COD-EMPRESA` INT NOT NULL,
  `EMPLEADO-DE-EMPRESA_E-E_COD-EMPLEADO` VARCHAR(45) NOT NULL,
  `EMPLEADO-DE-EMPRESA_DIRECTOR_COD-EMPLEADO` INT NOT NULL,
  PRIMARY KEY (`COD-EMPLEADO`, `P-PL_COD-EMPLEADO`),
  INDEX `fk_PROGRAMADOR_P-PL1_idx` (`P-PL_COD-EMPLEADO` ASC) VISIBLE,
  INDEX `fk_PROGRAMADOR_EMPLEADO-DE-EMPRESA1_idx` (`EMPLEADO-DE-EMPRESA_COD-EMPLEADO` ASC, `EMPLEADO-DE-EMPRESA_E-E_COD-EMPRESA` ASC, `EMPLEADO-DE-EMPRESA_E-E_COD-EMPLEADO` ASC, `EMPLEADO-DE-EMPRESA_DIRECTOR_COD-EMPLEADO` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `pdf`.`D-P`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pdf`.`D-P` (
  `COD-EMPLEADO'` INT NOT NULL,
  `COD-PAIS` VARCHAR(45) NULL,
  `DIRECTOR_COD-EMPLEADO` INT NOT NULL,
  PRIMARY KEY (`COD-EMPLEADO'`),
  INDEX `fk_D-P_DIRECTOR1_idx` (`DIRECTOR_COD-EMPLEADO` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `pdf`.`PAIS`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pdf`.`PAIS` (
  `COD-PAIS` INT NOT NULL,
  `NOMBRE-PAIS` VARCHAR(45) NOT NULL,
  `D-P_COD-EMPLEADO'` INT NOT NULL,
  PRIMARY KEY (`COD-PAIS`),
  INDEX `fk_PAIS_D-P1_idx` (`D-P_COD-EMPLEADO'` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `pdf`.`LENGUAJE-PROGRMACION`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pdf`.`LENGUAJE-PROGRMACION` (
  `COD-LENGUAJE` INT NOT NULL,
  `NOMBRE-LENGUAJE` VARCHAR(45) NULL,
  `P-PL_COD-EMPLEADO` INT NOT NULL,
  PRIMARY KEY (`COD-LENGUAJE`, `P-PL_COD-EMPLEADO`),
  INDEX `fk_LENGUAJE-PROGRMACION_P-PL1_idx` (`P-PL_COD-EMPLEADO` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `pdf`.`PAQUETE OFIMATICO`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pdf`.`PAQUETE OFIMATICO` (
  `COD-EMPLEADO` INT NOT NULL,
  `NOMBRE-PAQUETE` VARCHAR(45) NULL,
  `H-A_COD-EMPLEADO` INT NOT NULL,
  PRIMARY KEY (`COD-EMPLEADO`, `H-A_COD-EMPLEADO`),
  INDEX `fk_PAQUETE OFIMATICO_H-A1_idx` (`H-A_COD-EMPLEADO` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `pdf`.`PROFESOR`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pdf`.`PROFESOR` (
  `COD-PROFESOR` INT NOT NULL,
  `NIF` VARCHAR(45) NOT NULL,
  `NOMBRE` VARCHAR(45) NOT NULL,
  `APELLIDOS` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`COD-PROFESOR`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `pdf`.`GRUPOALUMNOS`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pdf`.`GRUPOALUMNOS` (
  `COD-GRUPO` VARCHAR(45) NOT NULL,
  `CURSO` INT NOT NULL,
  PRIMARY KEY (`COD-GRUPO`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `pdf`.`P-G`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pdf`.`P-G` (
  `AÑO-ACADEMICO` TIME NOT NULL,
  `GRUPOALUMNOS_COD-GRUPO` VARCHAR(45) NOT NULL,
  `PROFESOR_COD-PROFESOR` INT NOT NULL,
  INDEX `fk_P-G_GRUPOALUMNOS1_idx` (`GRUPOALUMNOS_COD-GRUPO` ASC) VISIBLE,
  INDEX `fk_P-G_PROFESOR1_idx` (`PROFESOR_COD-PROFESOR` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `pdf`.`PILOTO`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pdf`.`PILOTO` (
  `NIF` INT NOT NULL,
  `NOMBRE` VARCHAR(45) NOT NULL,
  `APELLIDOS` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`NIF`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `pdf`.`CIUDAD`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pdf`.`CIUDAD` (
  `NOMBRE-CIUDAD` INT NOT NULL,
  `PAIS` VARCHAR(45) NOT NULL,
  `NUM-HABITANTES` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`NOMBRE-CIUDAD`, `PAIS`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `pdf`.`AVION`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pdf`.`AVION` (
  `COD-AVION` INT NOT NULL,
  `NOMBRE-AVION` VARCHAR(45) NOT NULL,
  `NUMERO-MOTO` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`COD-AVION`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `pdf`.`P-C-A`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pdf`.`P-C-A` (
  `FECHA` DATE NOT NULL,
  `CIUDAD_NOMBRE-CIUDAD` INT NOT NULL,
  `CIUDAD_PAIS` VARCHAR(45) NOT NULL,
  `PILOTO_NIF` INT NOT NULL,
  `AVION_COD-AVION` INT NOT NULL,
  PRIMARY KEY (`FECHA`, `CIUDAD_NOMBRE-CIUDAD`, `CIUDAD_PAIS`, `PILOTO_NIF`, `AVION_COD-AVION`),
  INDEX `fk_P-C-A_CIUDAD1_idx` (`CIUDAD_NOMBRE-CIUDAD` ASC, `CIUDAD_PAIS` ASC) VISIBLE,
  INDEX `fk_P-C-A_PILOTO1_idx` (`PILOTO_NIF` ASC) VISIBLE,
  INDEX `fk_P-C-A_AVION1_idx` (`AVION_COD-AVION` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `pdf`.`EMPLEADO`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pdf`.`EMPLEADO` (
  `NIF-TIENERESPONSABLE` INT NOT NULL,
  `NOMBRE` VARCHAR(45) NOT NULL,
  `APELLIDOS` VARCHAR(45) NOT NULL,
  `DEPARTAMENTO` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`NIF-TIENERESPONSABLE`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `pdf`.`E-E`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pdf`.`E-E` (
  `NIF-RESPONSABLE` INT NOT NULL,
  `DEPARTAMENTO` VARCHAR(45) NOT NULL,
  `EMPLEADO_NIF-TIENERESPONSABLE` INT NOT NULL,
  PRIMARY KEY (`NIF-RESPONSABLE`, `EMPLEADO_NIF-TIENERESPONSABLE`),
  INDEX `fk_E-E_EMPLEADO2_idx` (`EMPLEADO_NIF-TIENERESPONSABLE` ASC) VISIBLE)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
