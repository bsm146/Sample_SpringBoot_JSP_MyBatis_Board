DROP TABLE IF EXISTS `board`;

CREATE TABLE `board` (
  `id` int NOT NULL AUTO_INCREMENT,
  `writer` varchar(20) NOT NULL,
  `title` varchar(20) NOT NULL,
  `content` varchar(100) NOT NULL,
  `views` int DEFAULT '0',
  `writingDate` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
)

-- LOCK TABLES `board` WRITE;
INSERT INTO `board` VALUES (1,'a','제목 1','내용 1',58,'2023-03-24 12:57:35'),(2,'a','제목 2','내용 2',0,'2023-03-24 12:57:35'),(3,'a','제목 3','내용 3',0,'2023-03-24 12:57:35'),(4,'a','제목 4','내용 4',0,'2023-03-24 12:57:35'),(5,'a','제목 5','내용 5',0,'2023-03-24 12:57:35'),(6,'a','제목 6','내용 6',0,'2023-03-24 12:57:35'),(7,'a','제목 7','내용 7',0,'2023-03-24 12:57:35'),(8,'a','제목 8','내용 8',0,'2023-03-24 12:57:35'),(9,'a','제목 9','내용 9',0,'2023-03-24 12:57:35'),(10,'a','제목 10','내용 10',0,'2023-03-24 12:57:35'),(11,'a','제목 11','내용 11',0,'2023-03-24 12:57:35'),(12,'a','제목 12','내용 12',0,'2023-03-24 12:57:35'),(13,'a','제목 13','내용 13',0,'2023-03-24 12:57:35'),(14,'a','제목 14','내용 14',0,'2023-03-24 12:57:35'),(15,'a','제목 15','내용 15',0,'2023-03-24 12:57:35'),(16,'a','제목 16','내용 16',0,'2023-03-24 12:57:35'),(17,'a','제목 17','내용 17',0,'2023-03-24 12:57:35'),(18,'a','제목 18','내용 18',0,'2023-03-24 12:57:35'),(19,'a','제목 19','내용 19',0,'2023-03-24 12:57:35'),(20,'a','제목 20','내용 20',0,'2023-03-24 12:57:35'),(21,'a','제목 21','내용 21',0,'2023-03-24 12:57:35'),(22,'a','제목 22','내용 22',0,'2023-03-24 12:57:35'),(23,'a','제목 23','내용 23',0,'2023-03-24 12:57:35'),(24,'a','제목 24','내용 24',0,'2023-03-24 12:57:35'),(25,'a','제목 25','내용 25',0,'2023-03-24 12:57:35'),(26,'a','제목 26','내용 26',0,'2023-03-24 12:57:35'),(27,'a','제목 27','내용 27',0,'2023-03-24 12:57:35'),(28,'a','제목 28','내용 28',0,'2023-03-24 12:57:35'),(29,'a','제목 29','내용 29',0,'2023-03-24 12:57:35'),(30,'a','제목 30','내용 30',0,'2023-03-24 12:57:35'),(31,'a','제목 31','내용 31',0,'2023-03-24 12:57:35'),(32,'a','제목 32','내용 32',0,'2023-03-24 12:57:35'),(33,'a','제목 33','내용 33',0,'2023-03-24 12:57:35'),(34,'a','제목 34','내용 34',0,'2023-03-24 12:57:35'),(35,'a','제목 35','내용 35',0,'2023-03-24 12:57:35'),(36,'a','제목 36','내용 36',0,'2023-03-24 12:57:35'),(37,'a','제목 37','내용 37',0,'2023-03-24 12:57:35'),(38,'a','제목 38','내용 38',0,'2023-03-24 12:57:35'),(39,'a','제목 39','내용 39',0,'2023-03-24 12:57:35'),(40,'a','제목 40','내용 40',0,'2023-03-24 12:57:35'),(41,'a','제목 41','내용 41',0,'2023-03-24 12:57:35'),(42,'a','제목 42','내용 42',0,'2023-03-24 12:57:35'),(43,'a','제목 43','내용 43',0,'2023-03-24 12:57:35'),(44,'a','제목 44','내용 44',0,'2023-03-24 12:57:35'),(45,'a','제목 45','내용 45',0,'2023-03-24 12:57:35'),(46,'a','제목 46','내용 46',0,'2023-03-24 12:57:35'),(47,'a','제목 47','내용 47',0,'2023-03-24 12:57:35'),(48,'a','제목 48','내용 48',0,'2023-03-24 12:57:35'),(49,'a','제목 49','내용 49',0,'2023-03-24 12:57:35'),(50,'a','제목 50','내용 50',0,'2023-03-24 12:57:35'),(51,'a','제목 51','내용 51',0,'2023-03-24 12:57:35'),(52,'a','제목 52','내용 52',0,'2023-03-24 12:57:35'),(53,'a','제목 53','내용 53',0,'2023-03-24 12:57:35'),(54,'a','제목 54','내용 54',0,'2023-03-24 12:57:35'),(55,'a','제목 55','내용 55',0,'2023-03-24 12:57:35'),(56,'a','제목 56','내용 56',0,'2023-03-24 12:57:35'),(57,'a','제목 57','내용 57',0,'2023-03-24 12:57:35'),(58,'a','제목 58','내용 58',0,'2023-03-24 12:57:35'),(59,'a','제목 59','내용 59',0,'2023-03-24 12:57:35'),(60,'a','제목 60','내용 60',0,'2023-03-24 12:57:35'),(61,'a','제목 61','내용 61',0,'2023-03-24 12:57:35'),(62,'a','제목 62','내용 62',0,'2023-03-24 12:57:35'),(63,'a','제목 63','내용 63',0,'2023-03-24 12:57:35'),(64,'a','제목 64','내용 64',0,'2023-03-24 12:57:35'),(65,'a','제목 65','내용 65',0,'2023-03-24 12:57:35'),(66,'a','제목 66','내용 66',0,'2023-03-24 12:57:35'),(67,'a','제목 67','내용 67',0,'2023-03-24 12:57:35'),(68,'a','제목 68','내용 68',0,'2023-03-24 12:57:35'),(69,'a','제목 69','내용 69',0,'2023-03-24 12:57:35'),(70,'a','제목 70','내용 70',0,'2023-03-24 12:57:35'),(71,'a','제목 71','내용 71',0,'2023-03-24 12:57:35'),(72,'a','제목 72','내용 72',0,'2023-03-24 12:57:35'),(73,'a','제목 73','내용 73',0,'2023-03-24 12:57:35'),(74,'a','제목 74','내용 74',0,'2023-03-24 12:57:35'),(75,'a','제목 75','내용 75',0,'2023-03-24 12:57:35'),(76,'a','제목 76','내용 76',0,'2023-03-24 12:57:35'),(77,'a','제목 77','내용 77',0,'2023-03-24 12:57:35'),(78,'a','제목 78','내용 78',0,'2023-03-24 12:57:35'),(79,'a','제목 79','내용 79',0,'2023-03-24 12:57:35'),(80,'a','제목 80','내용 80',0,'2023-03-24 12:57:35'),(81,'a','제목 81','내용 81',0,'2023-03-24 12:57:35'),(82,'a','제목 82','내용 82',0,'2023-03-24 12:57:35'),(83,'a','제목 83','내용 83',0,'2023-03-24 12:57:35'),(84,'a','제목 84','내용 84',0,'2023-03-24 12:57:35'),(85,'a','제목 85','내용 85',0,'2023-03-24 12:57:35'),(86,'a','제목 86','내용 86',0,'2023-03-24 12:57:35'),(87,'a','제목 87','내용 87',0,'2023-03-24 12:57:35'),(88,'a','제목 88','내용 88',0,'2023-03-24 12:57:35'),(89,'a','제목 89','내용 89',0,'2023-03-24 12:57:35'),(90,'a','제목 90','내용 90',0,'2023-03-24 12:57:35'),(91,'a','제목 91','내용 91',0,'2023-03-24 12:57:35'),(92,'a','제목 92','내용 92',0,'2023-03-24 12:57:35'),(93,'a','제목 93','내용 93',0,'2023-03-24 12:57:35'),(94,'a','제목 94','내용 94',0,'2023-03-24 12:57:35'),(95,'a','제목 95','내용 95',0,'2023-03-24 12:57:35'),(96,'a','제목 96','내용 96',0,'2023-03-24 12:57:35'),(97,'a','제목 97','내용 97',0,'2023-03-24 12:57:35'),(98,'a','제목 98','내용 98',0,'2023-03-24 12:57:35'),(100,'a','제목 100','내용 100',0,'2023-03-24 12:57:35'),(101,'a','제목 101','내용 101',1,'2023-03-24 12:57:35'),(102,'a','제목 102','내용 102',0,'2023-03-24 12:57:35'),(103,'a','제목 103','내용 103',0,'2023-03-24 12:57:35'),(104,'a','제목 104','내용 104',1,'2023-03-24 12:57:35'),(105,'a','제목 105','내용 105',0,'2023-03-24 12:57:35'),(106,'a','제목 106','내용 106',0,'2023-03-24 12:57:35'),(107,'a','제목 107','내용 107',0,'2023-03-24 12:57:35'),(108,'a','제목 108','내용 108',0,'2023-03-24 12:57:35'),(109,'a','제목 109','내용 109',0,'2023-03-24 12:57:35'),(110,'a','제목 110','내용 110',0,'2023-03-24 12:57:35'),(111,'a','제목 111','내용 111',4,'2023-03-24 12:57:35'),(112,'a','제목 112','내용 112',0,'2023-03-24 12:57:35'),(113,'a','제목 113','내용 113',0,'2023-03-24 12:57:35'),(114,'a','제목 114','내용 114',1,'2023-03-24 12:57:35'),(115,'a','제목 115','내용 115',1,'2023-03-24 12:57:35'),(116,'a','제목 116','내용 116',1,'2023-03-24 12:57:35'),(118,'a','제목 118','내용 118',6,'2023-03-24 12:57:35'),(120,'a','1201','1201',33,'2023-03-24 12:57:35');
-- UNLOCK TABLES;

DROP TABLE IF EXISTS `member`;
CREATE TABLE `member` (
  `id` varchar(20) NOT NULL,
  `name` varchar(20) NOT NULL,
  `pw` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
)

-- LOCK TABLES `member` WRITE;
INSERT INTO `member` VALUES ('a','홍길동','a');
-- UNLOCK TABLES;



-- Procedure
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `insertData`()
BEGIN

    DECLARE i INT DEFAULT 1;

    WHILE i <= 120 DO

        INSERT INTO board (writer, title, content) VALUES ('a', concat('제목 ',i), concat('내용 ',i));

        SET i = i + 1;

    END WHILE;

END ;;
DELIMITER ;
