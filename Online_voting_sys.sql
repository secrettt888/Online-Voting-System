

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Temporary view structure for view `VOTER_CHOICES`
--

DROP TABLE IF EXISTS `VOTER_CHOICES`;
/*!50001 DROP VIEW IF EXISTS `VOTER_CHOICES`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `VOTER_CHOICES` AS SELECT 
 1 AS `full_name_voter`,
 1 AS `election`,
 1 AS `candidate_voted`,
 1 AS `age_candidate`,
 1 AS `description_candidate`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `ballots`
--

DROP TABLE IF EXISTS `ballots`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ballots` (
  `v_id` int unsigned NOT NULL,
  `el_id` int unsigned NOT NULL,
  `c_id` int unsigned NOT NULL,
  PRIMARY KEY (`el_id`,`v_id`),
  UNIQUE KEY `el_id` (`el_id`,`v_id`),
  KEY `fk_voters` (`v_id`),
  CONSTRAINT `fk_elections` FOREIGN KEY (`el_id`) REFERENCES `elections` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `fk_voters` FOREIGN KEY (`v_id`) REFERENCES `voters` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ballots`
--

LOCK TABLES `ballots` WRITE;
/*!40000 ALTER TABLE `ballots` DISABLE KEYS */;
INSERT INTO `ballots` VALUES (1002,4,6),(1005,4,15),(1009,4,11),(1011,4,6),(1015,4,11),(1019,4,6),(1023,4,15),(1027,4,11),(1030,4,15),(1034,4,6),(1037,4,11),(1041,4,6),(1044,4,15),(1048,4,11),(1051,4,6),(1055,4,11),(1058,4,15),(1003,5,4),(1006,5,10),(1009,5,19),(1012,5,4),(1015,5,10),(1018,5,19),(1021,5,4),(1025,5,19),(1027,5,4),(1031,5,10),(1034,5,4),(1038,5,19),(1041,5,10),(1045,5,4),(1048,5,19),(1052,5,4),(1055,5,10),(1059,5,4),(1001,6,3),(1004,6,9),(1007,6,3),(1010,6,16),(1013,6,9),(1017,6,16),(1021,6,3),(1024,6,9),(1028,6,3),(1031,6,16),(1035,6,9),(1039,6,3),(1042,6,9),(1046,6,3),(1049,6,16),(1053,6,9),(1056,6,3),(1000,7,7),(1002,7,1),(1005,7,17),(1007,7,7),(1010,7,17),(1013,7,1),(1016,7,1),(1019,7,17),(1022,7,7),(1025,7,1),(1029,7,7),(1032,7,17),(1035,7,1),(1038,7,17),(1042,7,1),(1045,7,7),(1049,7,17),(1052,7,1),(1056,7,7),(1059,7,1),(1001,8,8),(1004,8,14),(1006,8,8),(1008,8,20),(1011,8,20),(1014,8,8),(1017,8,14),(1020,8,20),(1023,8,14),(1026,8,8),(1029,8,14),(1032,8,8),(1036,8,20),(1039,8,8),(1043,8,14),(1046,8,8),(1050,8,20),(1053,8,14),(1057,8,20),(1000,9,5),(1002,9,18),(1004,9,5),(1006,9,12),(1010,9,5),(1014,9,18),(1018,9,12),(1022,9,18),(1026,9,12),(1030,9,5),(1033,9,18),(1036,9,12),(1040,9,5),(1043,9,18),(1047,9,12),(1050,9,18),(1054,9,12),(1057,9,18),(1000,10,2),(1003,10,13),(1008,10,13),(1012,10,2),(1016,10,13),(1020,10,2),(1024,10,13),(1028,10,20),(1033,10,2),(1037,10,13),(1040,10,2),(1044,10,20),(1047,10,13),(1051,10,2),(1054,10,13),(1058,10,2);
/*!40000 ALTER TABLE `ballots` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/  /*!50003 TRIGGER `vote_proccess` AFTER INSERT ON `ballots` FOR EACH ROW begin
declare b int;
declare a int;
set b=( select n_o_votes from results where candidate_n=new.c_id and election_n=new.el_id);
set a=b+1;
update  results set n_o_votes=a where candidate_n=new.c_id and election_n=new.el_id;
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/  /*!50003 TRIGGER `check_for_correction` BEFORE UPDATE ON `ballots` FOR EACH ROW begin
declare pair_exist int;
select count(*) into pair_exist 
from participation where election_id=new.el_id and  candidate_id=new.c_id;
if pair_exist=0 then
signal sqlstate '45000' set message_text ='Invalid candidate-election pair';
end if;
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `candidates`
--

DROP TABLE IF EXISTS `candidates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `candidates` (
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `age` int unsigned NOT NULL,
  `descriptions` text,
  `candidate_id` int unsigned NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`candidate_id`),
  UNIQUE KEY `n_candidates` (`first_name`,`last_name`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `candidates`
--

LOCK TABLES `candidates` WRITE;
/*!40000 ALTER TABLE `candidates` DISABLE KEYS */;
INSERT INTO `candidates` VALUES ('Alice','Morgan',45,'Experienced public servant with a focus on education reform.',1),('James','Owens',52,'Entrepreneur with a background in sustainable development.',2),('Linda','Chavez',39,'Community organizer advocating for healthcare access.',3),('Robert','Khan',47,'Former mayor with a record in urban development.',4),('Maria','Lopez',34,'Youth leader promoting digital inclusion.',5),('David','Smith',50,'Retired military officer focused on national security.',6),('Angela','Nguyen',41,'Environmental scientist turned policy advocate.',7),('Michael','Johnson',44,'Business executive aiming to boost job creation.',8),('Sophia','Patel',29,'Civil rights lawyer championing equal justice.',9),('Daniel','Kim',38,'Educator seeking to modernize school curricula.',10),('Emma','White',33,'Healthcare professional running for health equity.',11),('Christopher','Brown',60,'Former senator returning with a new vision.',12),('Olivia','Martinez',36,'NGO director working on poverty alleviation.',13),('William','Zhou',43,'Tech expert focusing on digital governance.',14),('Isabella','Thomas',31,'Veteran advocating for better veterans services.',15),('Ethan','Ahmed',55,'Economist interested in fiscal responsibility.',16),('Mia','Clark',28,'Recent graduate with fresh perspectives on youth issues.',17),('Anthony','Garcia',49,'Labor union leader running on workers’ rights.',18),('Charlotte','Anderson',40,'Journalist pushing for transparency in government.',19),('Henry','Walker',53,'Cultural historian seeking to preserve heritage.',20);
/*!40000 ALTER TABLE `candidates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `elections`
--

DROP TABLE IF EXISTS `elections`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `elections` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name_of_elections` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `elections`
--

LOCK TABLES `elections` WRITE;
/*!40000 ALTER TABLE `elections` DISABLE KEYS */;
INSERT INTO `elections` VALUES (4,'Presidential Election'),(5,'Parliamentary Election'),(6,'Local Government Election'),(7,'Student Union Election'),(8,'Board of Directors Election'),(9,'Senate Election'),(10,'Mayoral Election');
/*!40000 ALTER TABLE `elections` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50003 TRIGGER `delete_candidate_election` AFTER DELETE ON `elections` FOR EACH ROW begin 
delete from participation where election_id=NULL;
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/  /*!50003 TRIGGER `in_case_deletion2` AFTER DELETE ON `elections` FOR EACH ROW begin
delete from ballots where el_id=NULL;
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `participation`
--

DROP TABLE IF EXISTS `participation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `participation` (
  `election_id` int unsigned NOT NULL,
  `candidate_id` int unsigned NOT NULL,
  KEY `fk_candidates` (`candidate_id`),
  KEY `fk_election` (`election_id`),
  CONSTRAINT `fk_candidates` FOREIGN KEY (`candidate_id`) REFERENCES `candidates` (`candidate_id`) ON UPDATE CASCADE,
  CONSTRAINT `fk_election` FOREIGN KEY (`election_id`) REFERENCES `elections` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `participation`
--

LOCK TABLES `participation` WRITE;
/*!40000 ALTER TABLE `participation` DISABLE KEYS */;
INSERT INTO `participation` VALUES (7,1),(10,2),(6,3),(5,4),(9,5),(4,6),(7,7),(8,8),(6,9),(5,10),(4,11),(9,12),(10,13),(8,14),(4,15),(6,16),(7,17),(9,18),(5,19),(8,20);
/*!40000 ALTER TABLE `participation` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/  /*!50003 TRIGGER `inseration` AFTER INSERT ON `participation` FOR EACH ROW begin 
declare n_c varchar(255);
declare l_c varchar(255);
declare n_o_e  varchar(255);
set n_c = (select first_name from candidates where candidate_id=new.candidate_id);
set l_c = (select last_name from candidates where candidate_id=new.candidate_id);
set n_o_e = (select name_of_elections from elections where id=new.election_id);
insert into results (name_of_election,election_n,candidate_n,name_of_candidate,last_name_cand) values (n_o_e,new.election_id,new.candidate_id,n_c,l_c);
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `results`
--

DROP TABLE IF EXISTS `results`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `results` (
  `name_of_election` varchar(255) DEFAULT NULL,
  `name_of_candidate` varchar(255) DEFAULT NULL,
  `last_name_cand` varchar(255) DEFAULT NULL,
  `n_o_votes` int unsigned DEFAULT '0',
  `election_n` int unsigned DEFAULT '0',
  `candidate_n` int unsigned DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `results`
--

LOCK TABLES `results` WRITE;
/*!40000 ALTER TABLE `results` DISABLE KEYS */;
INSERT INTO `results` VALUES ('Student Union Election','Alice','Morgan',11,7,1),('Mayoral Election','James','Owens',10,10,2),('Local Government Election','Linda','Chavez',10,6,3),('Parliamentary Election','Robert','Khan',11,5,4),('Senate Election','Maria','Lopez',7,9,5),('Presidential Election','David','Smith',9,4,6),('Student Union Election','Angela','Nguyen',9,7,7),('Board of Directors Election','Michael','Johnson',10,8,8),('Local Government Election','Sophia','Patel',9,6,9),('Parliamentary Election','Daniel','Kim',8,5,10),('Presidential Election','Emma','White',9,4,11),('Senate Election','Christopher','Brown',9,9,12),('Mayoral Election','Olivia','Martinez',10,10,13),('Board of Directors Election','William','Zhou',9,8,14),('Presidential Election','Isabella','Thomas',8,4,15),('Local Government Election','Ethan','Ahmed',7,6,16),('Student Union Election','Mia','Clark',9,7,17),('Senate Election','Anthony','Garcia',10,9,18),('Parliamentary Election','Charlotte','Anderson',8,5,19),('Board of Directors Election','Henry','Walker',9,8,20);
/*!40000 ALTER TABLE `results` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `voters`
--

DROP TABLE IF EXISTS `voters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `voters` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1060 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `voters`
--

LOCK TABLES `voters` WRITE;
/*!40000 ALTER TABLE `voters` DISABLE KEYS */;
INSERT INTO `voters` VALUES (1000,'Alice','Johnson'),(1001,'Michael','Smith'),(1002,'Emma','Brown'),(1003,'James','Davis'),(1004,'Olivia','Wilson'),(1005,'William','Moore'),(1006,'Sophia','Taylor'),(1007,'Daniel','Anderson'),(1008,'Isabella','Thomas'),(1009,'Ethan','Jackson'),(1010,'Mia','White'),(1011,'Henry','Harris'),(1012,'Charlotte','Martin'),(1013,'Benjamin','Thompson'),(1014,'Amelia','Garcia'),(1015,'Jacob','Martinez'),(1016,'Emily','Robinson'),(1017,'Noah','Clark'),(1018,'Abigail','Rodriguez'),(1019,'Logan','Lewis'),(1020,'Ava','Lee'),(1021,'Matthew','Walker'),(1022,'Harper','Hall'),(1023,'Elijah','Allen'),(1024,'Ella','Young'),(1025,'Alexander','King'),(1026,'Chloe','Wright'),(1027,'Sebastian','Scott'),(1028,'Grace','Torres'),(1029,'Jack','Nguyen'),(1030,'Lily','Hill'),(1031,'Owen','Adams'),(1032,'Zoe','Baker'),(1033,'Lucas','Nelson'),(1034,'Natalie','Carter'),(1035,'Mason','Mitchell'),(1036,'Hannah','Perez'),(1037,'Jayden','Roberts'),(1038,'Aria','Turner'),(1039,'Aiden','Phillips'),(1040,'Layla','Campbell'),(1041,'Carter','Parker'),(1042,'Riley','Evans'),(1043,'Julian','Edwards'),(1044,'Victoria','Collins'),(1045,'Levi','Stewart'),(1046,'Penelope','Sanchez'),(1047,'Caleb','Morris'),(1048,'Nora','Rogers'),(1049,'Gabriel','Reed'),(1050,'Scarlett','Cook'),(1051,'Isaac','Morgan'),(1052,'Aurora','Bell'),(1053,'Lincoln','Murphy'),(1054,'Lucy','Bailey'),(1055,'Nathan','Rivera'),(1056,'Ellie','Cooper'),(1057,'Christian','Richardson'),(1058,'Stella','Cox'),(1059,'Jonathan','Howard');
/*!40000 ALTER TABLE `voters` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/  /*!50003 TRIGGER `in_case_deletion` AFTER DELETE ON `voters` FOR EACH ROW begin
delete from ballots where v_id=NULL;
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

/*!50001 DROP VIEW IF EXISTS `VOTER_CHOICES`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50001 VIEW `VOTER_CHOICES` AS select concat(`v`.`first_name`,' ',`v`.`last_name`) AS `full_name_voter`,`e`.`name_of_elections` AS `election`,concat(`c`.`first_name`,' ',`c`.`last_name`) AS `candidate_voted`,`c`.`age` AS `age_candidate`,`c`.`descriptions` AS `description_candidate` from (((`ballots` `b` join `voters` `v` on((`b`.`v_id` = `v`.`id`))) join `candidates` `c` on((`b`.`c_id` = `c`.`candidate_id`))) join `elections` `e` on((`b`.`el_id` = `e`.`id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-05-16 16:37:46
