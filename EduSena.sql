-- MySQL dump 10.13  Distrib 8.0.29, for Win64 (x86_64)
--
-- Host: localhost    Database: edusena
-- ------------------------------------------------------
-- Server version	8.0.29

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
-- Table structure for table `alumnos`
--

DROP TABLE IF EXISTS `alumnos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `alumnos` (
  `idAlumno` int NOT NULL AUTO_INCREMENT,
  `nombres` varchar(45) NOT NULL,
  `apellidos` varchar(45) NOT NULL,
  `nid` int NOT NULL,
  `grado` int NOT NULL,
  `email` varchar(45) NOT NULL,
  `telefono` int NOT NULL,
  `direccion` varchar(45) NOT NULL,
  `genero` varchar(45) NOT NULL,
  `fecha_nacimiento` date NOT NULL,
  `codigoAlu` int NOT NULL,
  PRIMARY KEY (`idAlumno`),
  KEY `Alumnos_Usuario_idx` (`codigoAlu`),
  CONSTRAINT `Alumnos_Usuario` FOREIGN KEY (`codigoAlu`) REFERENCES `usuarios` (`IdCodigo`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alumnos`
--

LOCK TABLES `alumnos` WRITE;
/*!40000 ALTER TABLE `alumnos` DISABLE KEYS */;
INSERT INTO `alumnos` VALUES (1,'Juan','Salas ',7982378,11,'mail.com',836762387,'calle 23','Masculino','1998-05-06',2001),(2,'Juana','de la Hoz ',778378,10,'mail.com',738373,'calle 90','Femenino','1997-10-05',2003),(3,'Manuel','de la Hoz ',378378,15,'mail',738373,'calle 90','Masculino','1997-10-05',2005),(4,'Daniela','Gamarra',117386783,9,'mail',13276237,'calle 34','Femenino','1997-10-05',2007),(6,'Samuel','perez',4545211,11,'samu@mail.com',320125214,'calle 231','Masculino','1997-10-05',2011),(7,'Dany','d',98787,8,'88',8888,'88','Masculino','1997-10-05',2013);
/*!40000 ALTER TABLE `alumnos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cursos`
--

DROP TABLE IF EXISTS `cursos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cursos` (
  `idCurso` int NOT NULL AUTO_INCREMENT,
  `materia` varchar(45) NOT NULL,
  `idProfesor` int NOT NULL,
  PRIMARY KEY (`idCurso`,`idProfesor`),
  KEY `ForaneaKey_Docente_idx` (`idProfesor`),
  CONSTRAINT `Foreing_Docente` FOREIGN KEY (`idProfesor`) REFERENCES `docentes` (`idProfesor`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=105 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cursos`
--

LOCK TABLES `cursos` WRITE;
/*!40000 ALTER TABLE `cursos` DISABLE KEYS */;
INSERT INTO `cursos` VALUES (100,'Matematicas',1),(101,'Fisica',2),(102,'Quimica',3),(103,'Español',4),(104,'Etica y Valores',4);
/*!40000 ALTER TABLE `cursos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `docentes`
--

DROP TABLE IF EXISTS `docentes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `docentes` (
  `idProfesor` int NOT NULL AUTO_INCREMENT,
  `nombres` varchar(45) NOT NULL,
  `apellidos` varchar(45) NOT NULL,
  `nid` varchar(10) NOT NULL,
  `email` varchar(45) NOT NULL,
  `telefono` varchar(10) NOT NULL,
  `direccion` varchar(45) NOT NULL,
  `genero` varchar(10) NOT NULL,
  `fecha_nacimiento` date NOT NULL,
  `codigo` int NOT NULL,
  PRIMARY KEY (`idProfesor`,`codigo`),
  KEY `Docente_Usuarios_FK_idx` (`codigo`),
  CONSTRAINT `Docente_Usuarios_FK` FOREIGN KEY (`codigo`) REFERENCES `usuarios` (`IdCodigo`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `docentes`
--

LOCK TABLES `docentes` WRITE;
/*!40000 ALTER TABLE `docentes` DISABLE KEYS */;
INSERT INTO `docentes` VALUES (1,'Diego Andres','Salas','837367','mail','8378378','carrera 12','Masculino','1997-03-17',2002),(2,'Rafa','Perez','9273878','mail.com','63356','carrera 21','Masculino','1995-03-25',2004),(3,'Samuel','Martinez','1','mail','78373678','calle 2','Masculino','2022-09-01',2006),(4,'Daniel','Jimenez','387383','mail','9837487','carera 32','Femenino','1999-09-28',2007),(5,'Daniel','loaizas','778676','dani@mail.com','78478489','calle 23','Masculino','2022-09-01',2012);
/*!40000 ALTER TABLE `docentes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notas`
--

DROP TABLE IF EXISTS `notas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `notas` (
  `idNotas` int NOT NULL AUTO_INCREMENT,
  `idCurso` int NOT NULL,
  `idAlumno` int NOT NULL,
  `nota1` double NOT NULL,
  `nota2` double NOT NULL,
  `nota3` double NOT NULL,
  `nota4` double NOT NULL,
  `promedio` double NOT NULL,
  PRIMARY KEY (`idNotas`),
  KEY `Notas_Alumnos_FK_idx` (`idAlumno`),
  KEY `Notas_curso_FK_idx` (`idCurso`),
  CONSTRAINT `Notas_Alumnos_FK` FOREIGN KEY (`idAlumno`) REFERENCES `alumnos` (`codigoAlu`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `Notas_curso_FK` FOREIGN KEY (`idCurso`) REFERENCES `cursos` (`idCurso`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notas`
--

LOCK TABLES `notas` WRITE;
/*!40000 ALTER TABLE `notas` DISABLE KEYS */;
INSERT INTO `notas` VALUES (1,100,2005,3.5,4.5,4.9,1.1,3.5),(2,101,2005,3.5,5,4.9,1.1,3.625),(13,101,2003,3.5,5,1.9,1.1,2.875),(15,100,2005,3.5,4.5,4.9,1.1,3.5),(16,101,2013,2.3,3.6,5,2.6,3.375),(18,100,2005,3.5,4.5,4.9,1.1,3.5);
/*!40000 ALTER TABLE `notas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuarios` (
  `IdCodigo` int NOT NULL AUTO_INCREMENT,
  `contraseña` varchar(45) NOT NULL,
  `rol` varchar(45) NOT NULL,
  `activo` varchar(45) NOT NULL,
  PRIMARY KEY (`IdCodigo`)
) ENGINE=InnoDB AUTO_INCREMENT=2014 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` VALUES (2001,'123','Estudiante','1'),(2002,'1234','Docente','1'),(2003,'123','Estudiante','1'),(2004,'123','Docente','1'),(2005,'123','Estudiante','1'),(2006,'123','Docente','1'),(2007,'123','Docente','1'),(2008,'1234','Rector','1'),(2009,'vyNlPG6WEuR6apG9ifQ0fg==','Estudiante','1'),(2010,'91b21277787e39f6b7289d6b3849258fdfcd1a08','Estudiante','1'),(2011,'5bdec2bb53e3770fa89c86d3d0548ab7eba2887b','Estudiante','1'),(2012,'5da41b77495de0858c1e3dba50fb1e76fa0e328a','Docente','1'),(2013,'ca3fb4216697c74eacad3e89d43695d469d00ec8','Estudiante','1');
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-09-29 17:29:50
