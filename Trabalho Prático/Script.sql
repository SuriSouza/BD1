CREATE DATABASE  IF NOT EXISTS `educatorr` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `educatorr`;
-- MySQL dump 10.13  Distrib 8.0.18, for Win64 (x86_64)
--
-- Host: educatorr.ccqy8084hset.sa-east-1.rds.amazonaws.com    Database: educatorr
-- ------------------------------------------------------
-- Server version	8.0.16

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
SET @MYSQLDUMP_TEMP_LOG_BIN = @@SESSION.SQL_LOG_BIN;
SET @@SESSION.SQL_LOG_BIN= 0;

--
-- GTID state at the beginning of the backup 
--

SET @@GLOBAL.GTID_PURGED=/*!80000 '+'*/ '';

--
-- Table structure for table `aluno`
--

DROP TABLE IF EXISTS `aluno`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `aluno` (
  `ID_aluno` int(11) NOT NULL AUTO_INCREMENT,
  `Nome` varchar(45) NOT NULL,
  `Num_Matricula` varchar(45) NOT NULL,
  `CPF` varchar(45) NOT NULL,
  `RG` varchar(45) NOT NULL,
  `Endereco` varchar(100) NOT NULL,
  `Email` varchar(45) NOT NULL,
  `ID_curso` int(11) NOT NULL,
  PRIMARY KEY (`ID_aluno`),
  UNIQUE KEY `CPF_UNIQUE` (`CPF`),
  UNIQUE KEY `RG_UNIQUE` (`RG`),
  UNIQUE KEY `Num_Matricula_UNIQUE` (`Num_Matricula`),
  UNIQUE KEY `Email_UNIQUE` (`Email`),
  KEY `fk_id_curso_idx` (`ID_curso`),
  CONSTRAINT `fk_ID_Curso_aluno` FOREIGN KEY (`ID_curso`) REFERENCES `curso` (`ID_curso`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aluno`
--

LOCK TABLES `aluno` WRITE;
/*!40000 ALTER TABLE `aluno` DISABLE KEYS */;
INSERT INTO `aluno` VALUES (1,'Artur Teixeira Sales','376859','12758498736','20695728','Goiás, 472, José Elói, João Monlevade','artur.sales@aluno.ufjm.com',1),(2,'Lorena Paiva','365748','35574916574','3768590271','Av. Petrolina, 2768, Sagrada Família, BH','lorena.paiva@aluno.ufjm.com',3),(3,'Mateus Leite de Souza','365098','27685904475','37281111','Felizardo, 302, Rita de Sá, Timóteo','mateus.souza@aluno.ufjm.com',2),(4,'Tulio Henrique Azevedo','376912','12388956748','12048694','Ulisses, 309, Nova Lima, C. Fabriciano','tulio.azevedo@aluno.ufjm.com',5),(5,'Fernanda Larissa Carvalho','376851','55748690982','37685912','Santo Agostinho, 404, Hortolândia, Bela Vista','fernanda.carvalho@aluno.ufjm.com',4),(7,'Caique Savio Lopes','376858','28596055849','28594030','Jatobá, 156, União, Rio Piracicaba','caique.lopes@aluno.ufjm.com',2),(8,'Daniele Cristina Guedes Soares','483960','38574801923','27584098','Nova Era, 108, José Elói, J. Monlevade','daniele.soares@aluno.ufjm.com',5),(9,'Everton Luís Fernandes','486950','47867710978','30295847','Bandeirantes, 99, São João, J. Monlevade','everton.fernandes@aluno.ufjm.com',6),(10,'Enzo Lopes de Freitas','376810','13215425696','20261868','Jatobá, 156, São João, JM','enzo.freitas@aluno.ufjm.com',4),(11,'Vitor William Siqueira Maltez','185940','27558490981','27557309','Bandeirantes, 189, São João, JM','vitor.maltez@aluno.ufjm.com',5),(12,'Milena Alves Caldeira','175112','12254000987','27558760','Av.Galhardo, 2001, Felizardo','milena.caldeira@aluno.ufjm.com',6),(14,'Giovanna Clara Cardoso','386950','28594091837','29504987','Mantena, 386, São João, João Monlevade','giovanna.cardoso@aluno.ufjm.com',3);
/*!40000 ALTER TABLE `aluno` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aluno_disciplina`
--

DROP TABLE IF EXISTS `aluno_disciplina`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `aluno_disciplina` (
  `ID_aluno` int(11) NOT NULL,
  `ID_disciplina` int(11) NOT NULL,
  `Nota` int(11) DEFAULT NULL,
  `Falta` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID_aluno`,`ID_disciplina`),
  KEY `fk_ID_disciplina_ad_idx` (`ID_disciplina`),
  CONSTRAINT `fk_ID_aluno_ad` FOREIGN KEY (`ID_aluno`) REFERENCES `aluno` (`ID_aluno`),
  CONSTRAINT `fk_ID_disciplina_ad` FOREIGN KEY (`ID_disciplina`) REFERENCES `disciplina` (`ID_disciplina`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aluno_disciplina`
--

LOCK TABLES `aluno_disciplina` WRITE;
/*!40000 ALTER TABLE `aluno_disciplina` DISABLE KEYS */;
INSERT INTO `aluno_disciplina` VALUES (1,1,0,0),(1,2,0,0),(1,3,0,0),(1,4,0,0),(1,5,0,0),(2,11,54,4),(2,12,0,0),(2,13,0,0),(2,14,0,0),(2,15,0,0),(3,6,0,0),(3,7,0,0),(3,8,0,0),(3,9,0,0),(3,10,70,10),(4,21,0,0),(4,22,0,0),(4,23,0,0),(4,24,0,0),(4,25,0,0),(5,16,30,7),(5,17,0,0),(5,18,0,0),(5,19,0,0),(5,20,0,0),(7,6,0,0),(7,7,0,0),(7,8,0,0),(7,9,0,0),(7,10,43,20),(8,21,0,0),(8,22,0,0),(8,23,0,0),(8,24,0,0),(8,25,0,0),(9,26,0,0),(9,27,0,0),(9,28,0,0),(9,29,0,0),(9,30,0,0),(10,16,6,20),(10,17,0,0),(10,18,0,0),(10,19,0,0),(10,20,0,0),(11,21,0,0),(11,22,0,0),(11,23,0,0),(11,24,0,0),(11,25,0,0),(12,26,0,0),(12,27,0,0),(12,28,0,0),(12,29,0,0),(12,30,0,0),(14,11,0,0),(14,12,0,0),(14,13,0,0),(14,14,0,0),(14,15,0,0);
/*!40000 ALTER TABLE `aluno_disciplina` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `coordenador`
--

DROP TABLE IF EXISTS `coordenador`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `coordenador` (
  `ID_coordenador` int(11) NOT NULL AUTO_INCREMENT,
  `Nome` varchar(45) NOT NULL,
  `CPF` char(11) NOT NULL,
  `Email` varchar(45) NOT NULL,
  `ID_departamento` int(11) NOT NULL,
  PRIMARY KEY (`ID_coordenador`),
  UNIQUE KEY `CPF_UNIQUE` (`CPF`),
  KEY `fk_ID_depart_coord_idx` (`ID_departamento`),
  CONSTRAINT `fk_ID_depart_coord` FOREIGN KEY (`ID_departamento`) REFERENCES `departamento` (`ID_departamento`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `coordenador`
--

LOCK TABLES `coordenador` WRITE;
/*!40000 ALTER TABLE `coordenador` DISABLE KEYS */;
INSERT INTO `coordenador` VALUES (3,'Mario Felix Januzi','17584909876','mario.januzi@coord.ufjm.com',1),(4,'Aline Oliveira Grotzk','56785498007','aline.grotzk@coord.ufjm.com',2);
/*!40000 ALTER TABLE `coordenador` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `curso`
--

DROP TABLE IF EXISTS `curso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `curso` (
  `ID_curso` int(11) NOT NULL AUTO_INCREMENT,
  `Nome` varchar(45) NOT NULL,
  `ID_departamento` int(11) NOT NULL,
  PRIMARY KEY (`ID_curso`),
  KEY `fk_ID_departamento_idx` (`ID_departamento`),
  CONSTRAINT `fk_ID_departamento` FOREIGN KEY (`ID_departamento`) REFERENCES `departamento` (`ID_departamento`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `curso`
--

LOCK TABLES `curso` WRITE;
/*!40000 ALTER TABLE `curso` DISABLE KEYS */;
INSERT INTO `curso` VALUES (1,'História',1),(2,'Filosofia',1),(3,'Ciências Sociais',1),(4,'Física',2),(5,'Química',2),(6,'Matemática',2);
/*!40000 ALTER TABLE `curso` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `departamento`
--

DROP TABLE IF EXISTS `departamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `departamento` (
  `ID_departamento` int(11) NOT NULL AUTO_INCREMENT,
  `Nome` varchar(45) NOT NULL,
  PRIMARY KEY (`ID_departamento`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `departamento`
--

LOCK TABLES `departamento` WRITE;
/*!40000 ALTER TABLE `departamento` DISABLE KEYS */;
INSERT INTO `departamento` VALUES (1,'Departamento de Ciências Humanas'),(2,'Departamento de Ciências Exatas');
/*!40000 ALTER TABLE `departamento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `disciplina`
--

DROP TABLE IF EXISTS `disciplina`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `disciplina` (
  `ID_disciplina` int(11) NOT NULL AUTO_INCREMENT,
  `Nome` varchar(45) NOT NULL,
  `Professor` varchar(45) DEFAULT NULL,
  `ID_curso` int(11) NOT NULL,
  PRIMARY KEY (`ID_disciplina`),
  UNIQUE KEY `Nome_UNIQUE` (`Nome`),
  KEY `fk_ID_curso_idx` (`ID_curso`),
  CONSTRAINT `fk_ID_curso` FOREIGN KEY (`ID_curso`) REFERENCES `curso` (`ID_curso`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `disciplina`
--

LOCK TABLES `disciplina` WRITE;
/*!40000 ALTER TABLE `disciplina` DISABLE KEYS */;
INSERT INTO `disciplina` VALUES (1,'História Antiga Ocidental','Paula Nara Lopes',1),(2,'História Antiga Oriental','Bruno Ricardo de Azevedo',1),(3,'História Conteporânea','Getúlio Bernardo da Silva',1),(4,'História Ibérica','Fernanda Maria Pessoa',1),(5,'História da América','Maurício Machado de Almeida',1),(6,'Estudos Socioculturais','Getúlio Bernardo da Silva',2),(7,'Filosofia na Grécia Antiga','Paula Nara Lopes',2),(8,'Filosofia na Idade Média','Clara Masashi Yamato',2),(9,'Ética','Kátia Fernades de Freitas',2),(10,'Ontologia Antiga e Medieval','Humberto Saulo ',2),(11,'Introdução às Ciências Sociais','Humberto Saulo ',3),(12,'Política','Charles Hilton de Menezes',3),(13,'História','Getúlio Bernardo da Silva',3),(14,'Geografia','Charles Hilton de Menezes',3),(15,'Filosofia','Clara Masashi Yamato',3),(16,'Magnetismo','Nathan Irlan Veríssimo',4),(17,'Termodinâmica','Sheldon Lee Cooper',4),(18,'Mecânica Geral','Giovana Ferreira Mattos',4),(19,'Cálculo','Nathan Irlan Veríssimo',4),(20,'Álgebra Linear','Pedro Galhardo de Oliveira',4),(21,'Bioquímica','Bernadette Maryann Rostenkowski',5),(22,'Química Ambiental','Lucas Alves de Melo',5),(23,'Química Analítica','Suelen Maria Pernambuco',5),(24,'Química Estrutural','Irlandre Ramos de Menezes',5),(25,'Química Experimental','Bernadette Maryann Rostenkowski',5),(26,'Álgebra','Pedro Galhardo de Oliveira',6),(27,'Análise Combinatória','Felipe Azevedo Silva',6),(28,'Estatística','Felipe Azevedo Silva',6),(29,'Física Geral','Nathan Irlan Veríssimo',6),(30,'Integral','Giovana Ferreira Mattos',6);
/*!40000 ALTER TABLE `disciplina` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `login`
--

DROP TABLE IF EXISTS `login`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `login` (
  `ID_login` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(45) NOT NULL,
  `Email` varchar(45) NOT NULL,
  `Password` varchar(45) NOT NULL,
  PRIMARY KEY (`ID_login`),
  UNIQUE KEY `Password_UNIQUE` (`Password`),
  UNIQUE KEY `Email_UNIQUE` (`Email`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `login`
--

LOCK TABLES `login` WRITE;
/*!40000 ALTER TABLE `login` DISABLE KEYS */;
INSERT INTO `login` VALUES (21,'mario felix','mario.januzi@coord.ufjm.com','felixmario'),(22,'AlineOG','aline.grotzk@coord.ufjm.com','alineoliveira'),(25,'humberto.s','humberto.saulo@prof.ufjm.com','humberto'),(26,'mateusleite','mateus.souza@aluno.ufjm.com','mateusleite'),(27,'arturts','artur.sales@aluno.ufjm.com','arturts'),(28,'caiquesLopes','caique.lopes@aluno.ufjm.com','caique'),(29,'loohP','lorena.paiva@aluno.ufjm.com','lorena'),(30,'enzoskn','enzo.freitas@aluno.ufjm.com','enzolopes'),(31,'nathan','nathan.veríssimo@prof.ufjm.com','nathan');
/*!40000 ALTER TABLE `login` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `professor`
--

DROP TABLE IF EXISTS `professor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `professor` (
  `ID_professor` int(11) NOT NULL AUTO_INCREMENT,
  `Nome` varchar(45) NOT NULL,
  `CPF` varchar(45) NOT NULL,
  `Especialidade` varchar(45) NOT NULL,
  `Email` varchar(45) NOT NULL,
  `ID_departamento` int(11) NOT NULL,
  PRIMARY KEY (`ID_professor`),
  KEY `fk_ID_departamento_professor_idx` (`ID_departamento`),
  CONSTRAINT `fk_ID_departamento_professor` FOREIGN KEY (`ID_departamento`) REFERENCES `departamento` (`ID_departamento`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `professor`
--

LOCK TABLES `professor` WRITE;
/*!40000 ALTER TABLE `professor` DISABLE KEYS */;
INSERT INTO `professor` VALUES (1,'Humberto Saulo ','57486910272','Literatura Medieval','humberto.saulo@prof.ufjm.com',1),(2,'Clara Masashi Yamato','47386958473','Filosofia Oriental','clara.yamato@prof.ufjm.com',1),(3,'Lucas Gomes de Oliveira','4758309821','História da África séc XX','lucas.oliveira@prof.ufjm.com',1),(4,'Charles Hilton de Menezes','37558990551','Política','charles.menezes@prof.ufjm.com',1),(5,'Felipe Azevedo Silva','47685009812','Estatística e Probabilidade','felipe.silva@prof.ufjm.com',2),(6,'Nathan Irlan Veríssimo','39099875844','Teoria das Cordas','nathan.veríssimo@prof.ufjm.com',2),(7,'Suelen Maria Pernambuco','48659908157','Química Orgânica','suelen.pernambuco@prof.ufjm.com',2),(8,'Bruno Ricardo de Azevedo','37584909847','Literatura Asiática','bruno.azevedo@prof.ufjm.com',1),(9,'Getúlio Bernardo da Silva','48695019389','História','getúlio.silva@prof.ufjm.com',1),(10,'Kátia Fernades de Freitas','48695048390','Linguagens','kátia.freitas@prof.ufjm.com',1),(11,'Pedro Galhardo de Oliveira','38605918490','Geometria Analítica e Álgebra Linear','pedro.oliveira@prof.ufjm.com',2),(12,'Giovana Ferreira Mattos','48700917283','Mecânica Quântica','giovana.mattos@prof.ufjm.com',2),(13,'Sheldon Lee Cooper','12869091238','Física Teórica','sheldon.cooper@prof.ufjm.com',2),(14,'Bernadette Maryann Rostenkowski','10980796857','Microbiologia','bernadette.rostenkowski@prof.ufjm.com',2),(15,'Irlandre Ramos de Menezes','10098093557','Química Nuclear','irlandre.menezes@prof.ufjm.com',2),(16,'Lucas Montano Almeida','03102894783','Química Forense','lucas.almeida@prof.ufjm.com',2),(17,'Lucas Alves de Melo','33768894738','Biólogo Marinho','lucas.melo@prof.ufjm.com',2),(18,'Maurício Machado de Almeida','1859094838','Política e Socioeconomia da Guerra Fria','maurício.machado@prof.ufjm.com',1),(19,'Paula Nara Lopes','37666859400','História Antiga Ocidental','paula.lopes@prof.ufjm.com',1),(21,'Fernanda Maria Pessoa','35991000984','História da Península Ibérica','fernanda.pessoa@prof.ufjm.com',1);
/*!40000 ALTER TABLE `professor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'educatorr'
--

--
-- Dumping routines for database 'educatorr'
--
SET @@SESSION.SQL_LOG_BIN = @MYSQLDUMP_TEMP_LOG_BIN;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-11-29 13:33:49
