-- MySQL Script generated by MySQL Workbench
-- Wed May 10 19:25:49 2023
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema portfolio
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema portfolio
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `portfolio` DEFAULT CHARACTER SET utf8 ;
USE `portfolio` ;

-- -----------------------------------------------------
-- Table `portfolio`.`usuario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `portfolio`.`usuario` (
  `usuario_id` INT NOT NULL,
  `nombre` VARCHAR(45) NOT NULL,
  `apellido` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`usuario_id`));


-- -----------------------------------------------------
-- Table `portfolio`.`tipo_contacto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `portfolio`.`tipo_contacto` (
  `tipo_contacto_id` INT NOT NULL,
  `tipo` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`tipo_contacto_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `portfolio`.`experiencia`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `portfolio`.`experiencia` (
  `experiencia_id` INT NOT NULL,
  `titulo` VARCHAR(255) NOT NULL,
  `descripcion` VARCHAR(255) NOT NULL,
  `anio` DATE NOT NULL,
  `usuario_usuario_id` INT NOT NULL,
  PRIMARY KEY (`experiencia_id`),
  INDEX `fk_experiencia_usuario1_idx` (`usuario_usuario_id` ASC) VISIBLE,
  CONSTRAINT `fk_experiencia_usuario1`
    FOREIGN KEY (`usuario_usuario_id`)
    REFERENCES `portfolio`.`usuario` (`usuario_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `portfolio`.`nivel`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `portfolio`.`nivel` (
  `nivel_id` INT NOT NULL,
  `nivel` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`nivel_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `portfolio`.`habilidad`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `portfolio`.`habilidad` (
  `habilidad_id` INT NOT NULL,
  `titulo` VARCHAR(255) NOT NULL,
  `usuario_usuario_id` INT NOT NULL,
  `nivel_nivel_id` INT NOT NULL,
  PRIMARY KEY (`habilidad_id`),
  INDEX `fk_habilidad_usuario1_idx` (`usuario_usuario_id` ASC) VISIBLE,
  INDEX `fk_habilidad_nivel1_idx` (`nivel_nivel_id` ASC) VISIBLE,
  CONSTRAINT `fk_habilidad_usuario1`
    FOREIGN KEY (`usuario_usuario_id`)
    REFERENCES `portfolio`.`usuario` (`usuario_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_habilidad_nivel1`
    FOREIGN KEY (`nivel_nivel_id`)
    REFERENCES `portfolio`.`nivel` (`nivel_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `portfolio`.`imagen`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `portfolio`.`imagen` (
  `imagen_id` INT NOT NULL,
  `url` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`imagen_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `portfolio`.`trabajo_realizado`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `portfolio`.`trabajo_realizado` (
  `trabajo_realizado_id` INT NOT NULL,
  `titulo` VARCHAR(255) NOT NULL,
  `descripcion` VARCHAR(255) NOT NULL,
  `usuario_usuario_id` INT NOT NULL,
  `imagen_imagen_id` INT NOT NULL,
  PRIMARY KEY (`trabajo_realizado_id`),
  INDEX `fk_trabajo_realizado_usuario1_idx` (`usuario_usuario_id` ASC) VISIBLE,
  INDEX `fk_trabajo_realizado_imagen1_idx` (`imagen_imagen_id` ASC) VISIBLE,
  CONSTRAINT `fk_trabajo_realizado_usuario1`
    FOREIGN KEY (`usuario_usuario_id`)
    REFERENCES `portfolio`.`usuario` (`usuario_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_trabajo_realizado_imagen1`
    FOREIGN KEY (`imagen_imagen_id`)
    REFERENCES `portfolio`.`imagen` (`imagen_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `portfolio`.`experiencia_has_usuario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `portfolio`.`experiencia_has_usuario` (
  `experiencia_experiencia_id` INT NOT NULL,
  `usuario_usuario_id` INT NOT NULL,
  PRIMARY KEY (`experiencia_experiencia_id`, `usuario_usuario_id`),
  INDEX `fk_experiencia_has_usuario_usuario1_idx` (`usuario_usuario_id` ASC) VISIBLE,
  INDEX `fk_experiencia_has_usuario_experiencia_idx` (`experiencia_experiencia_id` ASC) VISIBLE,
  CONSTRAINT `fk_experiencia_has_usuario_experiencia`
    FOREIGN KEY (`experiencia_experiencia_id`)
    REFERENCES `portfolio`.`experiencia` (`experiencia_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_experiencia_has_usuario_usuario1`
    FOREIGN KEY (`usuario_usuario_id`)
    REFERENCES `portfolio`.`usuario` (`usuario_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `portfolio`.`contacto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `portfolio`.`contacto` (
  `contacto_id` INT NOT NULL,
  `datos` VARCHAR(255) NOT NULL,
  `tipo_contacto_tipo_contacto_id` INT NOT NULL,
  `usuario_usuario_id` INT NOT NULL,
  PRIMARY KEY (`contacto_id`),
  INDEX `fk_contacto_tipo_contacto1_idx` (`tipo_contacto_tipo_contacto_id` ASC) VISIBLE,
  INDEX `fk_contacto_usuario1_idx` (`usuario_usuario_id` ASC) VISIBLE,
  CONSTRAINT `fk_contacto_tipo_contacto1`
    FOREIGN KEY (`tipo_contacto_tipo_contacto_id`)
    REFERENCES `portfolio`.`tipo_contacto` (`tipo_contacto_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_contacto_usuario1`
    FOREIGN KEY (`usuario_usuario_id`)
    REFERENCES `portfolio`.`usuario` (`usuario_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
