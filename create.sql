-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema w3_project
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema w3_project
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `w3_project` DEFAULT CHARACTER SET utf8 ;
-- -----------------------------------------------------
-- Schema w3 project
-- -----------------------------------------------------
USE `w3_project` ;

-- -----------------------------------------------------
-- Table `w3_project`.`category`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `w3_project`.`category` (
  `category_id` INT NOT NULL,
  `name` VARCHAR(45) NULL,
  PRIMARY KEY (`category_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `w3_project`.`language`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `w3_project`.`language` (
  `language_id` INT NOT NULL,
  `name` VARCHAR(45) NULL,
  PRIMARY KEY (`language_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `w3_project`.`film`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `w3_project`.`film` (
  `film_id` INT NOT NULL,
  `title` VARCHAR(45) NULL,
  `description` VARCHAR(45) NULL,
  `release_year` INT NULL,
  `rental_duration` INT NULL,
  `renta_rate` FLOAT NULL,
  `length` INT NULL,
  `replacement_cost` FLOAT NULL,
  `rating` VARCHAR(45) NULL,
  `special_features` VARCHAR(45) NULL,
  `category_category_id` INT NOT NULL,
  `language_language_id` INT NOT NULL,
  PRIMARY KEY (`film_id`, `category_category_id`, `language_language_id`),
  UNIQUE INDEX `film_id_UNIQUE` (`film_id` ASC) VISIBLE,
  INDEX `fk_film_category1_idx` (`category_category_id` ASC) VISIBLE,
  INDEX `fk_film_language1_idx` (`language_language_id` ASC) VISIBLE,
  CONSTRAINT `fk_film_category1`
    FOREIGN KEY (`category_category_id`)
    REFERENCES `w3_project`.`category` (`category_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_film_language1`
    FOREIGN KEY (`language_language_id`)
    REFERENCES `w3_project`.`language` (`language_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `w3_project`.`actor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `w3_project`.`actor` (
  `actor_id` INT NOT NULL,
  `first_name` VARCHAR(45) NULL,
  `last_name` VARCHAR(45) NULL,
  PRIMARY KEY (`actor_id`),
  UNIQUE INDEX `actor_id_UNIQUE` (`actor_id` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `w3_project`.`film_has_actor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `w3_project`.`film_has_actor` (
  `film_film_id` INT NOT NULL,
  `actor_actor_id` INT NOT NULL,
  PRIMARY KEY (`film_film_id`, `actor_actor_id`),
  INDEX `fk_film_has_actor_actor1_idx` (`actor_actor_id` ASC) VISIBLE,
  INDEX `fk_film_has_actor_film_idx` (`film_film_id` ASC) VISIBLE,
  CONSTRAINT `fk_film_has_actor_film`
    FOREIGN KEY (`film_film_id`)
    REFERENCES `w3_project`.`film` (`film_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_film_has_actor_actor1`
    FOREIGN KEY (`actor_actor_id`)
    REFERENCES `w3_project`.`actor` (`actor_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `w3_project`.`hdd`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `w3_project`.`hdd` (
  `hdd_id` INT NOT NULL,
  `first_name` VARCHAR(45) NULL,
  `last_name` VARCHAR(45) NULL,
  `title` VARCHAR(45) NULL,
  `release_year` INT NULL,
  `category_category_id` INT NOT NULL,
  PRIMARY KEY (`hdd_id`, `category_category_id`),
  INDEX `fk_hdd_category1_idx` (`category_category_id` ASC) VISIBLE,
  CONSTRAINT `fk_hdd_category1`
    FOREIGN KEY (`category_category_id`)
    REFERENCES `w3_project`.`category` (`category_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `w3_project`.`inventory`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `w3_project`.`inventory` (
  `inventory_id` INT NOT NULL,
  `film_film_id` INT NOT NULL,
  `hdd_hdd_id` INT NOT NULL,
  PRIMARY KEY (`inventory_id`, `film_film_id`, `hdd_hdd_id`),
  INDEX `fk_inventory_film1_idx` (`film_film_id` ASC) VISIBLE,
  INDEX `fk_inventory_hdd1_idx` (`hdd_hdd_id` ASC) VISIBLE,
  CONSTRAINT `fk_inventory_film1`
    FOREIGN KEY (`film_film_id`)
    REFERENCES `w3_project`.`film` (`film_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_inventory_hdd1`
    FOREIGN KEY (`hdd_hdd_id`)
    REFERENCES `w3_project`.`hdd` (`hdd_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `w3_project`.`customer`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `w3_project`.`customer` (
  `customer_id` INT NOT NULL,
  `name` VARCHAR(45) NULL,
  `phone` VARCHAR(45) NULL,
  PRIMARY KEY (`customer_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `w3_project`.`staff`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `w3_project`.`staff` (
  `staff_id` INT NOT NULL,
  `name` VARCHAR(45) NULL,
  PRIMARY KEY (`staff_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `w3_project`.`rental`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `w3_project`.`rental` (
  `rental_id` INT NOT NULL,
  `rental_date` VARCHAR(45) NULL,
  `return_date` VARCHAR(45) NULL,
  `inventory_inventory_id` INT NOT NULL,
  `customer_customer_id` INT NOT NULL,
  `staff_staff_id` INT NOT NULL,
  PRIMARY KEY (`rental_id`, `inventory_inventory_id`, `customer_customer_id`, `staff_staff_id`),
  INDEX `fk_rental_inventory1_idx` (`inventory_inventory_id` ASC) VISIBLE,
  INDEX `fk_rental_customer1_idx` (`customer_customer_id` ASC) VISIBLE,
  INDEX `fk_rental_staff1_idx` (`staff_staff_id` ASC) VISIBLE,
  CONSTRAINT `fk_rental_inventory1`
    FOREIGN KEY (`inventory_inventory_id`)
    REFERENCES `w3_project`.`inventory` (`inventory_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_rental_customer1`
    FOREIGN KEY (`customer_customer_id`)
    REFERENCES `w3_project`.`customer` (`customer_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_rental_staff1`
    FOREIGN KEY (`staff_staff_id`)
    REFERENCES `w3_project`.`staff` (`staff_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

