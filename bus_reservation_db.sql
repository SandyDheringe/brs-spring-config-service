-- MySQL dump 10.13  Distrib 8.1.0, for Win64 (x86_64)
--
-- Host: localhost    Database: bus_reservation_db
-- ------------------------------------------------------
-- Server version	8.1.0

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admin` (
  `admin_id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`admin_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin`
--

LOCK TABLES `admin` WRITE;
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `booking`
--

DROP TABLE IF EXISTS `booking`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `booking` (
  `booking_id` int NOT NULL AUTO_INCREMENT,
  `bus_id` int NOT NULL,
  `customer_id` int NOT NULL,
  `booking_date` datetime DEFAULT NULL,
  `no_of_seats` int DEFAULT NULL,
  `booking_status` varchar(20) DEFAULT NULL,
  `total_amount` float DEFAULT NULL,
  PRIMARY KEY (`booking_id`),
  KEY `customer_fk` (`customer_id`),
  KEY `bus_booking_fk` (`bus_id`),
  CONSTRAINT `bus_booking_fk` FOREIGN KEY (`bus_id`) REFERENCES `bus_route` (`bus_id`),
  CONSTRAINT `customer_fk` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`cust_id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `booking`
--

LOCK TABLES `booking` WRITE;
/*!40000 ALTER TABLE `booking` DISABLE KEYS */;
INSERT INTO `booking` VALUES (1,5,3,'2023-08-27 08:21:00',1,'PENDING',500),(2,11,3,'2023-08-28 08:21:00',2,'PENDING',900),(3,11,3,'2023-08-28 08:21:00',2,'PENDING',900),(4,11,3,'2023-08-28 08:21:00',2,'PENDING',900),(5,11,3,'2023-08-28 08:21:00',2,'PENDING',900),(6,11,3,'2023-08-28 08:21:00',2,'PENDING',900),(7,11,3,'2023-08-28 08:21:00',2,'PENDING',900),(8,11,3,'2023-08-28 08:21:00',2,'PENDING',900),(9,11,3,'2023-08-28 08:21:00',2,'PENDING',900),(10,9,3,'2023-08-28 08:21:00',2,'PENDING',2000),(11,9,3,'2023-08-28 08:21:00',2,'CONFIRMED',2000),(12,6,3,'2023-08-28 08:21:00',2,'CONFIRMED',1000),(13,6,3,'2023-08-28 08:21:00',1,'CONFIRMED',500),(14,5,3,'2023-08-28 08:21:00',1,'CANCEL',500),(15,12,3,'2023-08-28 08:21:00',1,'CANCEL',600),(16,11,3,'2023-08-28 08:21:00',1,'CONFIRMED',450),(17,11,3,'2023-08-28 08:21:00',1,'PENDING',450),(18,13,3,'2023-08-31 08:21:00',1,'CANCEL',2500);
/*!40000 ALTER TABLE `booking` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bus_inventory`
--

DROP TABLE IF EXISTS `bus_inventory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bus_inventory` (
  `inventory_id` int NOT NULL AUTO_INCREMENT,
  `bus_id` int NOT NULL,
  `available_seats` int DEFAULT NULL,
  `last_updated_date` datetime DEFAULT NULL,
  PRIMARY KEY (`inventory_id`),
  KEY `bus_fk` (`bus_id`),
  CONSTRAINT `bus_fk` FOREIGN KEY (`bus_id`) REFERENCES `bus_route` (`bus_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bus_inventory`
--

LOCK TABLES `bus_inventory` WRITE;
/*!40000 ALTER TABLE `bus_inventory` DISABLE KEYS */;
INSERT INTO `bus_inventory` VALUES (1,1,29,'2023-08-27 17:58:51'),(2,5,30,'2023-08-27 15:36:53'),(3,11,39,'2023-08-30 12:04:42'),(4,9,38,'2023-08-28 10:35:53'),(5,6,36,'2023-08-28 12:42:47'),(6,12,49,'2023-08-28 23:05:46'),(7,13,49,'2023-08-30 12:23:02');
/*!40000 ALTER TABLE `bus_inventory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bus_route`
--

DROP TABLE IF EXISTS `bus_route`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bus_route` (
  `bus_id` int NOT NULL AUTO_INCREMENT,
  `bus_number` varchar(20) DEFAULT NULL,
  `bus_type` varchar(50) DEFAULT NULL,
  `total_seats` int DEFAULT NULL,
  `source` varchar(100) NOT NULL,
  `destination` varchar(100) NOT NULL,
  `duration` int DEFAULT NULL,
  `fare_amount` float DEFAULT NULL,
  `is_deleted` tinyint DEFAULT NULL,
  PRIMARY KEY (`bus_id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bus_route`
--

LOCK TABLES `bus_route` WRITE;
/*!40000 ALTER TABLE `bus_route` DISABLE KEYS */;
INSERT INTO `bus_route` VALUES (1,'MH15AB1234','AC_SLEEPER',50,'','',NULL,NULL,1),(2,'MH15EX2856','AC_SLEEPER',40,'','',NULL,NULL,1),(3,'MH14EX2856','AC_SLEEPER',35,'','',NULL,NULL,1),(4,'MH14EX2856','AC_SLEEPER',30,'nashik','pune',240,NULL,1),(5,'MH14EX2857','AC_SLEEPER',30,'nashik','pune',240,500,0),(6,'MH15EX1234','AC_SLEEPER',40,'nashik','pune',240,500,0),(7,'MH12EX1122','AC_SLEEPER',40,'pune','nashik',240,500,0),(8,'MH15EX1212','AC_SLEEPER',40,'nashik','aurangabad',240,500,0),(9,'MH15EX1212','AC_SLEEPER',40,'nashik','nagpur',600,1000,0),(10,'MH15EX1212','AC_SLEEPER',40,'nashik','thane',180,400,0),(11,'MH15EX1212','AC_SLEEPER',40,'nashik','mumbai',200,450,0),(12,'MH15EX9999','AC_SEATER',50,'pune','mumbai',220,600,0),(13,'MH15EX4444','AC_SEATER',50,'nagpur','mumbai',500,2500,0);
/*!40000 ALTER TABLE `bus_route` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer` (
  `cust_id` int NOT NULL AUTO_INCREMENT,
  `user_name` varchar(100) NOT NULL,
  `password` varchar(512) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `email` varchar(50) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `gender` varchar(10) DEFAULT NULL,
  `age` int DEFAULT NULL,
  `is_deleted` tinyint DEFAULT NULL,
  PRIMARY KEY (`cust_id`),
  UNIQUE KEY `customer_pk` (`user_name`),
  UNIQUE KEY `customer_pk2` (`user_name`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES (1,'sandeep','$2a$10$5QTtjfJM4JS8LlaLYotddu2tvnRzK5oAsCL0uW21Rf71zpsfqe5em','+919021029785','sandeep@gmail.com','Sandeep Dheringe','MALE',33,0),(3,'sandeep1','$2a$10$vlWwh0tRYy4xS7GCjiZDNuWQ69717fYRYtIOgR1DXkTXiXNvJK9Ai','+919021029785','sandeep@gmail.com','Sandeep Dheringe','MALE',33,0),(7,'sandeep_d','$2a$10$O5y3iAUi/M2QwXVCiphz1.s7ZCHfIg5ILdpm4uzq3c3u0Le4V.Tk6','+919911234567','sandeepd@gmail.com','Sandeep Dheringe','MALE',33,0);
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `passenger`
--

DROP TABLE IF EXISTS `passenger`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `passenger` (
  `passenger_id` int NOT NULL AUTO_INCREMENT,
  `booking_id` int NOT NULL,
  `name` varchar(100) NOT NULL,
  `gender` varchar(10) DEFAULT NULL,
  `age` int DEFAULT NULL,
  `city` varchar(100) DEFAULT NULL,
  `state` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`passenger_id`),
  KEY `passenger_booking_fk` (`booking_id`),
  CONSTRAINT `passenger_booking_fk` FOREIGN KEY (`booking_id`) REFERENCES `booking` (`booking_id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `passenger`
--

LOCK TABLES `passenger` WRITE;
/*!40000 ALTER TABLE `passenger` DISABLE KEYS */;
INSERT INTO `passenger` VALUES (1,1,'Sandeep Dheringe','MALE',33,'nashik','MH'),(2,2,'Dipali Dheringe','FEMALE',26,'nashik','MH'),(3,2,'Devansh Dheringe','MALE',5,'nashik','MH'),(4,3,'Dhanashree Dheringe','FEMALE',10,'nashik','MH'),(5,3,'Omkar Dheringe','MALE',5,'nashik','MH'),(6,4,'Dhanashree Dheringe','FEMALE',10,'nashik','MH'),(7,4,'Omkar Dheringe','MALE',5,'nashik','MH'),(8,5,'Vedika Dheringe','FEMALE',10,'nashik','MH'),(9,5,'Swaraj Dheringe','MALE',5,'nashik','MH'),(10,6,'Vedika Dheringe','FEMALE',10,'nashik','MH'),(11,6,'Swaraj Dheringe','MALE',5,'nashik','MH'),(12,7,'Vedika Dheringe','FEMALE',10,'nashik','MH'),(13,7,'Swaraj Dheringe','MALE',5,'nashik','MH'),(14,8,'Vedika Dheringe','FEMALE',10,'nashik','MH'),(15,8,'Swaraj Dheringe','MALE',5,'nashik','MH'),(16,9,'Advika Dheringe','FEMALE',4,'nashik','MH'),(17,9,'Samadhan Dheringe','MALE',35,'nashik','MH'),(18,10,'Ankita Dheringe','FEMALE',28,'nashik','MH'),(19,10,'Yogesh Dheringe','MALE',31,'nashik','MH'),(20,11,'Rupali J','FEMALE',28,'nashik','MH'),(21,11,'Pramod J','MALE',31,'nashik','MH'),(22,12,'Shweta G','FEMALE',28,'nashik','MH'),(23,12,'Ganesh G','MALE',31,'nashik','MH'),(24,13,'Sandeep K','FEMALE',28,'nashik','MH'),(25,14,'Vijaya D','FEMALE',28,'nashik','MH'),(26,15,'Reema D','FEMALE',28,'nashik','MH'),(27,16,'Swara D','FEMALE',28,'nashik','MH'),(28,17,'Swara D','FEMALE',28,'nashik','MH'),(29,18,'Shyamal D','FEMALE',28,'nashik','MH');
/*!40000 ALTER TABLE `passenger` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment`
--

DROP TABLE IF EXISTS `payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payment` (
  `payment_id` int NOT NULL AUTO_INCREMENT,
  `booking_id` int NOT NULL,
  `payment_date` datetime DEFAULT NULL,
  `payment_amount` float DEFAULT NULL,
  `payment_status` varchar(50) DEFAULT NULL,
  `payment_method` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`payment_id`),
  KEY `booking_payment_fk` (`booking_id`),
  CONSTRAINT `booking_payment_fk` FOREIGN KEY (`booking_id`) REFERENCES `booking` (`booking_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment`
--

LOCK TABLES `payment` WRITE;
/*!40000 ALTER TABLE `payment` DISABLE KEYS */;
INSERT INTO `payment` VALUES (1,9,'2023-08-28 10:06:13',100,'0','3'),(2,10,'2023-08-28 10:14:01',2000,'1','3'),(3,11,'2023-08-28 10:35:53',2000,'COMPLETED','UPI'),(4,12,'2023-08-28 10:44:12',1000,'COMPLETED','UPI'),(5,13,'2023-08-28 12:35:31',500,'COMPLETED','UPI'),(6,14,'2023-08-28 12:42:47',500,'REFUND_INITIATED','UPI'),(7,15,'2023-08-28 23:05:46',600,'REFUND_INITIATED','UPI'),(8,16,'2023-08-30 12:04:42',450,'COMPLETED','UPI'),(9,17,'2023-08-30 12:21:41',450,'PENDING','UPI'),(10,18,'2023-08-30 12:23:02',2500,'REFUND_INITIATED','UPI');
/*!40000 ALTER TABLE `payment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transaction`
--

DROP TABLE IF EXISTS `transaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `transaction` (
  `transaction_id` int NOT NULL AUTO_INCREMENT,
  `booking_id` int NOT NULL,
  `transaction_date` datetime DEFAULT NULL,
  `transaction_event` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`transaction_id`),
  KEY `booking_transaction_fk` (`booking_id`),
  CONSTRAINT `booking_transaction_fk` FOREIGN KEY (`booking_id`) REFERENCES `booking` (`booking_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transaction`
--

LOCK TABLES `transaction` WRITE;
/*!40000 ALTER TABLE `transaction` DISABLE KEYS */;
INSERT INTO `transaction` VALUES (1,10,'2023-08-28 10:14:01','0'),(2,11,'2023-08-28 10:35:53','BOOKING_CONFIRMED'),(3,12,'2023-08-28 10:44:12','BOOKING_CONFIRMED'),(4,13,'2023-08-28 12:35:31','BOOKING_CONFIRMED'),(5,14,'2023-08-28 12:42:47','BOOKING_CONFIRMED'),(6,15,'2023-08-28 23:05:46','BOOKING_CONFIRMED'),(7,16,'2023-08-30 12:04:42','BOOKING_CONFIRMED'),(8,18,'2023-08-30 12:23:02','BOOKING_CONFIRMED');
/*!40000 ALTER TABLE `transaction` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-08-30 22:09:16
