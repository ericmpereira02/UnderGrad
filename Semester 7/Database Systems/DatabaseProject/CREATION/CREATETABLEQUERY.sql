CREATE SCHEMA `videogamestore`;

CREATE TABLE `videogamestore`.`customer` (
  `email` varchar(45) NOT NULL,
  `name` varchar(45) NOT NULL,
  `Username` varchar(45) NOT NULL,
  `Password` varchar(45) NOT NULL,
  `phone` varchar(45) NOT NULL,
  PRIMARY KEY (`email`),
  UNIQUE KEY `email_UNIQUE` (`email`)
); #ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `videogamestore`.`addresses` (
  `email` varchar(45) NOT NULL,
  `address` varchar(90) NOT NULL,
  `city` varchar(45) NOT NULL,
  PRIMARY KEY (`email`,`address`),
  CONSTRAINT `addressemail` FOREIGN KEY (`email`) REFERENCES `customer` (`email`)
); #ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `videogamestore`.`members` (
  `email` varchar(45) NOT NULL,
  `start_date` datetime NOT NULL,
  `end_date` datetime NOT NULL,
  PRIMARY KEY (`email`),
  CONSTRAINT `email` FOREIGN KEY (`email`) REFERENCES `customer` (`email`)
); #ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci


CREATE TABLE `videogamestore`.`product` (
  `Product_Id` int(11) NOT NULL AUTO_INCREMENT,
  `Price` decimal(6,2) NOT NULL,
  `Name` varchar(45) NOT NULL,
  `Type` varchar(45) NOT NULL,
  PRIMARY KEY (`Product_Id`)
); #ENGINE=InnoDB AUTO_INCREMENT=361 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci

CREATE TABLE `videogamestore`.`individual_product` (
  `Serial_no` int(11) NOT NULL AUTO_INCREMENT,
  `Product_Id` int(11) NOT NULL,
  PRIMARY KEY (`Serial_no`),
  UNIQUE KEY `Serial_no_UNIQUE` (`Serial_no`),
  KEY `productid_idx` (`Product_Id`),
  CONSTRAINT `productid` FOREIGN KEY (`Product_Id`) REFERENCES `product` (`Product_Id`)
); #ENGINE=InnoDB AUTO_INCREMENT=15001 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci

CREATE TABLE `videogamestore`.`order` (
  `email` varchar(45) NOT NULL,
  `tracking_number` bigint(22) NOT NULL,
  `date_ordered` datetime NOT NULL,
  `address` varchar(90) NOT NULL,
  `city` varchar(45) NOT NULL,
  PRIMARY KEY (`tracking_number`),
  UNIQUE KEY `tracking_number_UNIQUE` (`tracking_number`),
  KEY `email_idx` (`email`),
  KEY `email` (`email`),
  CONSTRAINT `cust_email` FOREIGN KEY (`email`) REFERENCES `customer` (`email`) ON DELETE CASCADE ON UPDATE CASCADE
); #ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci


CREATE TABLE `videogamestore`.`products_ordered` (
  `Serial_No` int(11) NOT NULL,
  `Tracking_No` bigint(22) NOT NULL,
  PRIMARY KEY (`Serial_No`),
  UNIQUE KEY `Serial_No_UNIQUE` (`Serial_No`),
  KEY `trackingno_idx` (`Tracking_No`),
  CONSTRAINT `serialno` FOREIGN KEY (`Serial_No`) REFERENCES `individual_product` (`serial_no`),
  CONSTRAINT `trackingno` FOREIGN KEY (`Tracking_No`) REFERENCES `order` (`tracking_number`)
); #ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci*/




