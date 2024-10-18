-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema porkybd
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema porkybd
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `porkybd` DEFAULT CHARACTER SET utf8 ;
USE `porkybd` ;

-- -----------------------------------------------------
-- Table `porkybd`.`Recetas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `porkybd`.`Recetas` (
  `idReceta` INT NOT NULL,
  `nombre` VARCHAR(30) NULL,
  `tiempoPreparacion` VARCHAR(45) NULL,
  `porciones` INT NULL,
  PRIMARY KEY (`idReceta`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `porkybd`.`RecetasDerivadas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `porkybd`.`RecetasDerivadas` (
  `idrecetaDerivada` INT NOT NULL,
  `Receta_idReceta` INT NOT NULL,
  PRIMARY KEY (`idrecetaDerivada`, `Receta_idReceta`),
  INDEX `fk_recetaDerivada_Receta1_idx` (`Receta_idReceta` ASC),  	
  CONSTRAINT `fk_recetaDerivada_Receta1`
    FOREIGN KEY (`Receta_idReceta`)
    REFERENCES `porkybd`.`Recetas` (`idReceta`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `porkybd`.`Productos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `porkybd`.`Productos` (
  `idProducto` INT NOT NULL,
  `nombre` VARCHAR(30) NULL,
  `precio` INT NULL,
  `stock` INT NULL,
  `sinTacc` TINYINT NULL,
  `tamaño` VARCHAR(30) NULL,
  `recetaDerivada_idrecetaDerivada` INT NOT NULL,
  `recetaDerivada_Receta_idReceta` INT NOT NULL,
  PRIMARY KEY (`idProducto`, `recetaDerivada_idrecetaDerivada`, `recetaDerivada_Receta_idReceta`),
  INDEX `fk_Producto_recetaDerivada1_idx` (`recetaDerivada_idrecetaDerivada` ASC, `recetaDerivada_Receta_idReceta` ASC),
  CONSTRAINT `fk_Producto_recetaDerivada1`
    FOREIGN KEY (`recetaDerivada_idrecetaDerivada` , `recetaDerivada_Receta_idReceta`)
    REFERENCES `porkybd`.`RecetasDerivadas` (`idrecetaDerivada` , `Receta_idReceta`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `porkybd`.`Preparaciones`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `porkybd`.`Preparaciones` (
  `idPreparacion` INT NOT NULL,
  `numeroPaso` INT NULL,
  `descripcion` VARCHAR(30) NULL,
  `Receta_idReceta` INT NOT NULL,
  PRIMARY KEY (`idPreparacion`, `Receta_idReceta`),
  INDEX `fk_Preparacion_Receta1_idx` (`Receta_idReceta` ASC),
  CONSTRAINT `fk_Preparacion_Receta1`
    FOREIGN KEY (`Receta_idReceta`)
    REFERENCES `porkybd`.`Recetas` (`idReceta`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `porkybd`.`Ingredientes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `porkybd`.`Ingredientes` (
  `idIngrediente` INT NOT NULL,
  `nombre` VARCHAR(30) NULL,
  `stock` INT NULL,
  PRIMARY KEY (`idIngrediente`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `porkybd`.`Pasos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `porkybd`.`Pasos` (
  `idPaso` INT NOT NULL,
  `descripcionPaso` VARCHAR(45) NULL,
  `Preparacion_idPreparacion` INT NOT NULL,
  PRIMARY KEY (`idPaso`, `Preparacion_idPreparacion`),
  INDEX `fk_Paso_Preparacion_idx` (`Preparacion_idPreparacion` ASC),
  CONSTRAINT `fk_Paso_Preparacion`
    FOREIGN KEY (`Preparacion_idPreparacion`)
    REFERENCES `porkybd`.`Preparaciones` (`idPreparacion`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `porkybd`.`PreparacionesXingredientes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `porkybd`.`PreparacionesXingredientes` (
  `Preparacion_idPreparacion` INT NOT NULL,
  `Preparacion_Receta_idReceta` INT NOT NULL,
  `Ingrediente_idIngrediente` INT NOT NULL,
  `cantidad` INT NULL,
  PRIMARY KEY (`Preparacion_idPreparacion`, `Preparacion_Receta_idReceta`, `Ingrediente_idIngrediente`),
  INDEX `fk_Preparacion_has_Ingrediente_Ingrediente1_idx` (`Ingrediente_idIngrediente` ASC),
  INDEX `fk_Preparacion_has_Ingrediente_Preparacion1_idx` (`Preparacion_idPreparacion` ASC, `Preparacion_Receta_idReceta` ASC),
  CONSTRAINT `fk_Preparacion_has_Ingrediente_Preparacion1`
    FOREIGN KEY (`Preparacion_idPreparacion`)
    REFERENCES `porkybd`.`Preparaciones` (`idPreparacion`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Preparacion_has_Ingrediente_Ingrediente1`
    FOREIGN KEY (`Ingrediente_idIngrediente`)
    REFERENCES `porkybd`.`Ingredientes` (`idIngrediente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `porkybd`.`RecetasBases`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `porkybd`.`RecetasBases` (
  `idrecetaBase` INT NOT NULL,
  `tamaño` VARCHAR(30) NULL,
  `Receta_idReceta` INT NOT NULL,
  `recetaDerivada_idrecetaDerivada` INT NOT NULL,
  `recetaDerivada_Receta_idReceta` INT NOT NULL,
  PRIMARY KEY (`idrecetaBase`, `Receta_idReceta`, `recetaDerivada_idrecetaDerivada`, `recetaDerivada_Receta_idReceta`),
  INDEX `fk_recetaBase_Receta1_idx` (`Receta_idReceta` ASC),
  INDEX `fk_recetaBase_recetaDerivada1_idx` (`recetaDerivada_idrecetaDerivada` ASC, `recetaDerivada_Receta_idReceta` ASC),
  CONSTRAINT `fk_recetaBase_Receta1`
    FOREIGN KEY (`Receta_idReceta`)
    REFERENCES `porkybd`.`Recetas` (`idReceta`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_recetaBase_recetaDerivada1`
    FOREIGN KEY (`recetaDerivada_idrecetaDerivada` , `recetaDerivada_Receta_idReceta`)
    REFERENCES `porkybd`.`RecetasDerivadas` (`idrecetaDerivada` , `Receta_idReceta`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;