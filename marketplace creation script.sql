CREATE SCHEMA IF NOT EXISTS `marketplace` DEFAULT CHARACTER SET latin1 

CREATE TABLE IF NOT EXISTS `marketplace`.`user_t` (
  `email` VARCHAR(45) NOT NULL,
  `user_id` VARCHAR(45) NOT NULL,
  `first_name` VARCHAR(45) NOT NULL,
  `last_name` VARCHAR(45) NOT NULL,
  `phone_number` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE INDEX `email_UNIQUE` (`email` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1

CREATE TABLE IF NOT EXISTS `marketplace`.`picture` (
  `picture_key` INT(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`picture_key`))
ENGINE = InnoDB
AUTO_INCREMENT = 117
DEFAULT CHARACTER SET = latin1

CREATE TABLE IF NOT EXISTS `marketplace`.`product` (
  `product_id` INT(11) NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(45) NOT NULL,
  `description` LONGTEXT NULL DEFAULT NULL,
  `price` DECIMAL(12,2) NOT NULL,
  `is_active` TINYINT(1) NOT NULL,
  `user_id_product` VARCHAR(45) NOT NULL,
  `date_posted` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `picture_key_product` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`product_id`),
  INDEX `picture_key_idx` (`picture_key_product` ASC),
  INDEX `user_id_product_idx` (`user_id_product` ASC),
  CONSTRAINT `picture_key_product`
    FOREIGN KEY (`picture_key_product`)
    REFERENCES `marketplace`.`picture` (`picture_key`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `user_id_product`
    FOREIGN KEY (`user_id_product`)
    REFERENCES `marketplace`.`user_t` (`user_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 69
DEFAULT CHARACTER SET = latin1

CREATE TABLE IF NOT EXISTS `marketplace`.`personal` (
  `personal_id` INT(11) NOT NULL AUTO_INCREMENT,
  `user_id_personal` VARCHAR(45) NOT NULL,
  `title` VARCHAR(45) NOT NULL,
  `description` LONGTEXT NULL DEFAULT NULL,
  `location` VARCHAR(45) NULL DEFAULT NULL,
  `date_posted` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `is_active` TINYINT(1) NOT NULL,
  `picture_key_personal` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`personal_id`),
  INDEX `picture_key_idx` (`picture_key_personal` ASC),
  INDEX `user_id_personal_idx` (`user_id_personal` ASC),
  CONSTRAINT `picture_key_personal`
    FOREIGN KEY (`picture_key_personal`)
    REFERENCES `marketplace`.`picture` (`picture_key`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `user_id_personal`
    FOREIGN KEY (`user_id_personal`)
    REFERENCES `marketplace`.`user_t` (`user_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 23
DEFAULT CHARACTER SET = latin1

CREATE TABLE IF NOT EXISTS `marketplace`.`job` (
  `job_id` INT(11) NOT NULL AUTO_INCREMENT,
  `user_id_job` VARCHAR(45) NOT NULL,
  `date_posted` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `location` VARCHAR(45) NOT NULL,
  `hours_per_week` INT(11) NULL DEFAULT NULL,
  `description` LONGTEXT NULL DEFAULT NULL,
  `title` VARCHAR(45) NOT NULL,
  `pay` DECIMAL(8,2) NOT NULL,
  `start_date` DATE NULL DEFAULT NULL,
  `is_active` TINYINT(1) NOT NULL,
  `picture_key_job` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`job_id`),
  INDEX `picture_id_idx` (`picture_key_job` ASC),
  INDEX `user_id_job_idx` (`user_id_job` ASC),
  CONSTRAINT `picture_key_job`
    FOREIGN KEY (`picture_key_job`)
    REFERENCES `marketplace`.`picture` (`picture_key`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `user_id_job`
    FOREIGN KEY (`user_id_job`)
    REFERENCES `marketplace`.`user_t` (`user_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 17
DEFAULT CHARACTER SET = latin1