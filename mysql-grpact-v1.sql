-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema MySQL-GRPACT
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `MySQL-GRPACT` ;

-- -----------------------------------------------------
-- Schema MySQL-GRPACT
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `MySQL-GRPACT` DEFAULT CHARACTER SET utf8 ;
USE `MySQL-GRPACT` ;

-- -----------------------------------------------------
-- Table `MySQL-GRPACT`.`states`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `MySQL-GRPACT`.`states` ;

CREATE TABLE IF NOT EXISTS `MySQL-GRPACT`.`states` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 6
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `MySQL-GRPACT`.`cities`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `MySQL-GRPACT`.`cities` ;

CREATE TABLE IF NOT EXISTS `MySQL-GRPACT`.`cities` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NULL DEFAULT NULL,
  `state_id` INT(11) NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_cities_states`
    FOREIGN KEY (`state_id`)
    REFERENCES `MySQL-GRPACT`.`states` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 8
DEFAULT CHARACTER SET = utf8;

CREATE INDEX `fk_cities_states_idx` ON `MySQL-GRPACT`.`cities` (`state_id` ASC);


-- -----------------------------------------------------
-- Table `MySQL-GRPACT`.`businesses`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `MySQL-GRPACT`.`businesses` ;

CREATE TABLE IF NOT EXISTS `MySQL-GRPACT`.`businesses` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NULL DEFAULT NULL,
  `city_id` INT(11) NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_businesses_cities1`
    FOREIGN KEY (`city_id`)
    REFERENCES `MySQL-GRPACT`.`cities` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 11
DEFAULT CHARACTER SET = utf8;

CREATE INDEX `fk_businesses_cities1_idx` ON `MySQL-GRPACT`.`businesses` (`city_id` ASC);


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- -----------------------------------------------------
-- Data for table `MySQL-GRPACT`.`states`
-- -----------------------------------------------------
START TRANSACTION;
USE `MySQL-GRPACT`;
INSERT INTO `MySQL-GRPACT`.`states` (`id`, `name`) VALUES (1, 'California');
INSERT INTO `MySQL-GRPACT`.`states` (`id`, `name`) VALUES (2, 'Nevada');
INSERT INTO `MySQL-GRPACT`.`states` (`id`, `name`) VALUES (3, 'Utah');
INSERT INTO `MySQL-GRPACT`.`states` (`id`, `name`) VALUES (4, 'Washington');
INSERT INTO `MySQL-GRPACT`.`states` (`id`, `name`) VALUES (5, 'New York');

COMMIT;


-- -----------------------------------------------------
-- Data for table `MySQL-GRPACT`.`cities`
-- -----------------------------------------------------
START TRANSACTION;
USE `MySQL-GRPACT`;
INSERT INTO `MySQL-GRPACT`.`cities` (`id`, `name`, `state_id`) VALUES (1, 'Los Angeles', 1);
INSERT INTO `MySQL-GRPACT`.`cities` (`id`, `name`, `state_id`) VALUES (2, 'Las Vegas', 2);
INSERT INTO `MySQL-GRPACT`.`cities` (`id`, `name`, `state_id`) VALUES (3, 'Park City', 3);
INSERT INTO `MySQL-GRPACT`.`cities` (`id`, `name`, `state_id`) VALUES (4, 'San Francisco', 1);
INSERT INTO `MySQL-GRPACT`.`cities` (`id`, `name`, `state_id`) VALUES (5, 'Reno', 2);
INSERT INTO `MySQL-GRPACT`.`cities` (`id`, `name`, `state_id`) VALUES (6, 'New York City', 5);
INSERT INTO `MySQL-GRPACT`.`cities` (`id`, `name`, `state_id`) VALUES (7, 'Seattle', 4);

COMMIT;


-- -----------------------------------------------------
-- Data for table `MySQL-GRPACT`.`businesses`
-- -----------------------------------------------------
START TRANSACTION;
USE `MySQL-GRPACT`;
INSERT INTO `MySQL-GRPACT`.`businesses` (`id`, `name`, `city_id`) VALUES (1, 'Bubba Gump', 4);
INSERT INTO `MySQL-GRPACT`.`businesses` (`id`, `name`, `city_id`) VALUES (2, 'Ceasars Palace', 2);
INSERT INTO `MySQL-GRPACT`.`businesses` (`id`, `name`, `city_id`) VALUES (3, 'Sonic', 3);
INSERT INTO `MySQL-GRPACT`.`businesses` (`id`, `name`, `city_id`) VALUES (4, 'Starbucks', 7);
INSERT INTO `MySQL-GRPACT`.`businesses` (`id`, `name`, `city_id`) VALUES (5, 'Trump Hotel', 6);
INSERT INTO `MySQL-GRPACT`.`businesses` (`id`, `name`, `city_id`) VALUES (6, 'In an Out Burger', 1);
INSERT INTO `MySQL-GRPACT`.`businesses` (`id`, `name`, `city_id`) VALUES (7, 'Microsoft', 7);
INSERT INTO `MySQL-GRPACT`.`businesses` (`id`, `name`, `city_id`) VALUES (8, 'Stark\'s Steakhouse', 5);
INSERT INTO `MySQL-GRPACT`.`businesses` (`id`, `name`, `city_id`) VALUES (9, 'Liberty Tours', 6);
INSERT INTO `MySQL-GRPACT`.`businesses` (`id`, `name`, `city_id`) VALUES (10, 'Giradelli', 4);

COMMIT;

