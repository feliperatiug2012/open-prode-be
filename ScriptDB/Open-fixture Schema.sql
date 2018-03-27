-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema open_fixture
-- -----------------------------------------------------
-- Modelo de BD del proyecto Open-Fixture

-- -----------------------------------------------------
-- Schema open_fixture
--
-- Modelo de BD del proyecto Open-Fixture
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `open_fixture` DEFAULT CHARACTER SET utf8 ;
USE `open_fixture` ;

-- -----------------------------------------------------
-- Table `open_fixture`.`Persona`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `open_fixture`.`Persona` ;

CREATE TABLE IF NOT EXISTS `open_fixture`.`Persona` (
  `idPersona` INT NOT NULL,
  `Nombre` VARCHAR(45) NULL,
  `Apellido` VARCHAR(45) NULL,
  `Sexo` CHAR NULL,
  `FechaNac` DATE NULL,
  PRIMARY KEY (`idPersona`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `open_fixture`.`Perfil`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `open_fixture`.`Perfil` ;

CREATE TABLE IF NOT EXISTS `open_fixture`.`Perfil` (
  `idPerfil` INT NOT NULL,
  `Correo` VARCHAR(45) NOT NULL,
  `Password` VARCHAR(45) NOT NULL,
  `Fecha` DATE NULL,
  `idPersona` INT NULL,
  PRIMARY KEY (`idPerfil`),
  INDEX `fk_Perfil_1_idx` (`idPersona` ASC),
  UNIQUE INDEX `idPersona_UNIQUE` (`idPersona` ASC),
  CONSTRAINT `fk_Perfil_1`
    FOREIGN KEY (`idPersona`)
    REFERENCES `open_fixture`.`Persona` (`idPersona`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `open_fixture`.`Equipo`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `open_fixture`.`Equipo` ;

CREATE TABLE IF NOT EXISTS `open_fixture`.`Equipo` (
  `idEquipo` INT NOT NULL,
  `Nombre` VARCHAR(45) NULL,
  `Abbr` VARCHAR(45) NULL,
  `Grupo` CHAR(1) NULL,
  PRIMARY KEY (`idEquipo`))
ENGINE = InnoDB
COMMENT = 'Informacion de los equipos que participan';


-- -----------------------------------------------------
-- Table `open_fixture`.`Fase`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `open_fixture`.`Fase` ;

CREATE TABLE IF NOT EXISTS `open_fixture`.`Fase` (
  `idFase` INT NOT NULL,
  `Nombre` VARCHAR(45) NULL,
  `FechaInicio` DATETIME NULL,
  `FechaFin` DATETIME NULL,
  PRIMARY KEY (`idFase`))
ENGINE = InnoDB
COMMENT = 'Fase de Partidos entre los equipos. Se dividen en: Fase de Grupos, Fase Octavos, Fase Cuartos, Fase Semifinal, Fase 3ro, Fase final';


-- -----------------------------------------------------
-- Table `open_fixture`.`Partido`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `open_fixture`.`Partido` ;

CREATE TABLE IF NOT EXISTS `open_fixture`.`Partido` (
  `idPartido` INT NOT NULL,
  `idFase` INT NULL,
  `idEquipoA` INT NOT NULL,
  `idEquipoB` INT NOT NULL,
  `Fecha` DATETIME NULL,
  `GolesEqupoA` INT NULL DEFAULT -1,
  `GolesEquipoB` INT NULL DEFAULT -1,
  PRIMARY KEY (`idPartido`),
  INDEX `fk_Partido_2_idx` (`idFase` ASC),
  INDEX `fk_Partido_4_idx` (`idEquipoB` ASC),
  CONSTRAINT `fk_Partido_1`
    FOREIGN KEY (`idFase`)
    REFERENCES `open_fixture`.`Fase` (`idFase`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Partido_2`
    FOREIGN KEY (`idEquipoA`)
    REFERENCES `open_fixture`.`Equipo` (`idEquipo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Partido_3`
    FOREIGN KEY (`idEquipoB`)
    REFERENCES `open_fixture`.`Equipo` (`idEquipo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
COMMENT = 'Información de los partidos con equipos y resultados';


-- -----------------------------------------------------
-- Table `open_fixture`.`Score`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `open_fixture`.`Score` ;

CREATE TABLE IF NOT EXISTS `open_fixture`.`Score` (
  `idScore` INT NOT NULL,
  `idPerfil` INT NULL,
  `idPartido` INT NULL,
  `EquipoGanador` INT NULL,
  `GF` INT NULL,
  `GC` INT NULL,
  PRIMARY KEY (`idScore`),
  INDEX `fk_Score_1_idx` (`idPerfil` ASC),
  INDEX `fk_Score_2_idx` (`idPartido` ASC),
  CONSTRAINT `fk_Score_1`
    FOREIGN KEY (`idPerfil`)
    REFERENCES `open_fixture`.`Perfil` (`idPerfil`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Score_2`
    FOREIGN KEY (`idPartido`)
    REFERENCES `open_fixture`.`Partido` (`idPartido`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
COMMENT = 'Información de los puntos obtenidos en cada partido';


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
