-- MySQL dump 10.13  Distrib 8.0.32, for Linux (x86_64)
--
-- Host: localhost    Database: baseerasmus
-- ------------------------------------------------------
-- Server version	8.0.32

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
-- Table structure for table `administrador`
--

DROP TABLE IF EXISTS `administrador`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `administrador` (
  `idadministrador` int NOT NULL AUTO_INCREMENT,
  `correo` varchar(45) NOT NULL,
  `contrasena` varchar(45) NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `tipodeusuario` varchar(3) NOT NULL DEFAULT 'ADM',
  PRIMARY KEY (`idadministrador`),
  KEY `FK_idadm_idusu_idx` (`correo`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `administrador`
--

LOCK TABLES `administrador` WRITE;
/*!40000 ALTER TABLE `administrador` DISABLE KEYS */;
INSERT INTO `administrador` VALUES (1,'admin@gmail.com','foss123uazuay.','admin','ADM');
/*!40000 ALTER TABLE `administrador` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `asignados`
--

DROP TABLE IF EXISTS `asignados`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `asignados` (
  `idasignados` int NOT NULL AUTO_INCREMENT,
  `iddeestudiante` int NOT NULL,
  `iddeprofesor` int NOT NULL,
  PRIMARY KEY (`idasignados`),
  UNIQUE KEY `iddeestudiante_UNIQUE` (`iddeestudiante`),
  KEY `fk_ide_idu_idx` (`iddeestudiante`),
  KEY `fk_idp_idu_idx` (`iddeprofesor`),
  CONSTRAINT `fk_ide_idu` FOREIGN KEY (`iddeestudiante`) REFERENCES `estudiantes` (`idestudiantes`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_idp_idu` FOREIGN KEY (`iddeprofesor`) REFERENCES `profesores` (`idprofesores`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `asignados`
--

LOCK TABLES `asignados` WRITE;
/*!40000 ALTER TABLE `asignados` DISABLE KEYS */;
INSERT INTO `asignados` VALUES (30,5,15),(32,1,15),(33,6,15);
/*!40000 ALTER TABLE `asignados` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estudiantes`
--

DROP TABLE IF EXISTS `estudiantes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `estudiantes` (
  `idestudiantes` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  `correo` varchar(45) NOT NULL,
  `contrasena` varchar(45) NOT NULL,
  `institucion` varchar(45) NOT NULL,
  `sexo` varchar(1) NOT NULL DEFAULT 'M',
  `tipodeusuario` varchar(3) NOT NULL DEFAULT 'EST',
  `cedula` varchar(13) DEFAULT NULL,
  PRIMARY KEY (`idestudiantes`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estudiantes`
--

LOCK TABLES `estudiantes` WRITE;
/*!40000 ALTER TABLE `estudiantes` DISABLE KEYS */;
INSERT INTO `estudiantes` VALUES (1,'Pedro Figueroa','pedro@gmail.com','1234','UDA','M','EST',NULL),(3,'Diego Barbecho','diego@gmail.com','1234','UDA','M','EST','0106652613'),(5,'Adri','adriana.leonpe@gmail.com','123456','CEIAP','F','EST','0102276623'),(6,'Mateo','hola@gmail.com','1234','CATO','M','EST','0107560971');
/*!40000 ALTER TABLE `estudiantes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `imagenes`
--

DROP TABLE IF EXISTS `imagenes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `imagenes` (
  `idimagenes` int NOT NULL AUTO_INCREMENT,
  `nombreimagen` varchar(100) NOT NULL,
  `rutaimagen` varchar(200) NOT NULL,
  `grupoimagen` int NOT NULL DEFAULT '1',
  `estado` int NOT NULL DEFAULT '1',
  PRIMARY KEY (`idimagenes`),
  UNIQUE KEY `nombreimagen_UNIQUE` (`nombreimagen`)
) ENGINE=InnoDB AUTO_INCREMENT=113 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `imagenes`
--

LOCK TABLES `imagenes` WRITE;
/*!40000 ALTER TABLE `imagenes` DISABLE KEYS */;
INSERT INTO `imagenes` VALUES (34,'Arriba','https://foss.uazuay.edu.ec:8443/imagenesJuego/arrow-up.svg',1,1),(35,'Abajo','https://foss.uazuay.edu.ec:8443/imagenesJuego/arrow-down.svg',1,1),(36,'Izquierda','https://foss.uazuay.edu.ec:8443/imagenesJuego/arrow-izquierda.svg',1,1),(37,'Derecha','https://foss.uazuay.edu.ec:8443/imagenesJuego/arrow-derecha.svg',1,1),(38,'Barrer','https://foss.uazuay.edu.ec:8443/imagenesJuego/imagen1.png',2,0),(39,'Tomar','https://foss.uazuay.edu.ec:8443/imagenesJuego/imagen2.png',2,0),(40,'Ahorrar','https://foss.uazuay.edu.ec:8443/imagenesJuego/imagen3.png',2,0),(41,'BatidoGuineo','https://foss.uazuay.edu.ec:8443/imagenesJuego/imagen4.png',2,0),(42,'Te','https://foss.uazuay.edu.ec:8443/imagenesJuego/imagen5.png',2,1),(43,'Helado','https://foss.uazuay.edu.ec:8443/imagenesJuego/imagen6.png',2,1),(44,'Carro','https://foss.uazuay.edu.ec:8443/imagenesJuego/imagen7.png',2,1),(45,'Avion','https://foss.uazuay.edu.ec:8443/imagenesJuego/imagen8.png',2,1),(46,'Bicicleta','https://foss.uazuay.edu.ec:8443/imagenesJuego/imagen9.png',2,1),(47,'Tarea1','https://foss.uazuay.edu.ec:8443/imagenesJuego/actividad1.jpg',3,0),(48,'TareaLineas1','https://foss.uazuay.edu.ec:8443/imagenesJuego/preescritura-para-dos-anos.png',3,0),(49,'Avatar','https://foss.uazuay.edu.ec:8443/imagenesJuego/diego.svg',1,0),(50,'Globo Rojo','https://foss.uazuay.edu.ec:8443/imagenesJuego/rojo.svg',4,1),(51,'Globo Azul','https://foss.uazuay.edu.ec:8443/imagenesJuego/azul.svg',4,1),(52,'Globo Amarillo','https://foss.uazuay.edu.ec:8443/imagenesJuego/amarillo.svg',4,1),(53,'Globo Verde','https://foss.uazuay.edu.ec:8443/imagenesJuego/verde.svg',4,1),(54,'Globo Rosa','https://foss.uazuay.edu.ec:8443/imagenesJuego/rosado.svg',4,1),(55,'Globo Naranja','https://foss.uazuay.edu.ec:8443/imagenesJuego/naranja.svg',4,1),(61,'Laberinto Perro','https://foss.uazuay.edu.ec:8443/imagenesJuego/laberintoPerro.jpg',3,0),(62,'Atún','https://foss.uazuay.edu.ec:8443/imagenesJuego/AtÃºn.jpg',4,1),(63,'Bañera','https://foss.uazuay.edu.ec:8443/imagenesJuego/BaÃ±era.jpg',4,1),(64,'Caramelo','https://foss.uazuay.edu.ec:8443/imagenesJuego/Caramelo.jpg',4,1),(65,'Galleta','https://foss.uazuay.edu.ec:8443/imagenesJuego/Galleta.jpg',4,1),(66,'Puerta','https://foss.uazuay.edu.ec:8443/imagenesJuego/Puerta.jpg',4,1),(67,'Lápiz','https://foss.uazuay.edu.ec:8443/imagenesJuego/LÃ¡piz.jpg',4,1),(68,'Timbre','https://foss.uazuay.edu.ec:8443/imagenesJuego/Timbre.jpg',4,1),(69,'Vela','https://foss.uazuay.edu.ec:8443/imagenesJuego/Vela.jpg',4,1),(70,'AtúnJuego2','https://foss.uazuay.edu.ec:8443/imagenesJuego/AtÃºn.jpg',2,1),(71,'Aguacate','https://foss.uazuay.edu.ec:8443/imagenesJuego/Aguacate.jpg',2,1),(72,'Bandera','https://foss.uazuay.edu.ec:8443/imagenesJuego/Bandera.jpg',2,1),(73,'Dinosaurio','https://foss.uazuay.edu.ec:8443/imagenesJuego/Dinosaurio.jpg',2,1),(74,'Kiwi','https://foss.uazuay.edu.ec:8443/imagenesJuego/Kiwi.jpg',2,1),(75,'laberintos perro','https://foss.uazuay.edu.ec:8443/imagenesJuego/AtenciÃ³n- laberintos.jpg',3,1),(76,'Manguera','https://foss.uazuay.edu.ec:8443/imagenesJuego/Manguera.jpg',2,1),(77,'Mano','https://foss.uazuay.edu.ec:8443/imagenesJuego/Mano.jpg',2,1),(78,'Martillo','https://foss.uazuay.edu.ec:8443/imagenesJuego/Martillo.jpg',2,1),(79,'Monstruo','https://foss.uazuay.edu.ec:8443/imagenesJuego/Monstruo.jpg',2,1),(80,'figura ocultas flecha','https://foss.uazuay.edu.ec:8443/imagenesJuego/AtenciÃ³n visual- figuras ocultas.jpg',3,1),(81,'Atención Laberintos','https://foss.uazuay.edu.ec:8443/imagenesJuego/AtenciÃ³n- laberintos.jpg',3,1),(82,'Atención Visual Figuras Ocultas','https://foss.uazuay.edu.ec:8443/imagenesJuego/AtenciÃ³n visual- figuras ocultas.jpg',3,1),(83,'Atención Visual Parte del Todo','https://foss.uazuay.edu.ec:8443/imagenesJuego/AtenciÃ³n visual- parte del todo.jpg',3,1),(84,'Atención Visual CCMOTO','https://foss.uazuay.edu.ec:8443/imagenesJuego/CCMOTO.jpg',3,1),(85,'Constancia Perceptual - Forma','https://foss.uazuay.edu.ec:8443/imagenesJuego/constancia perceptual- forma.jpg',3,1),(86,'Constancia Perceptual - Posición','https://foss.uazuay.edu.ec:8443/imagenesJuego/constancia perceptual- posiciÃ³n.jpg',3,1),(87,'Coordinación Motora','https://foss.uazuay.edu.ec:8443/imagenesJuego/coor motora.jpg',3,1),(88,'Coordinación Motora Fina 1','https://foss.uazuay.edu.ec:8443/imagenesJuego/coordinaciÃ³m motora fina 1.jpg',3,1),(89,'Coordinación Motora 2','https://foss.uazuay.edu.ec:8443/imagenesJuego/coordinaciÃ³n motora 2.jpg',3,1),(90,'Coordinación Motora 3','https://foss.uazuay.edu.ec:8443/imagenesJuego/coordinaciÃ³n motora 3.jpg',3,1),(91,'Figura Fondo - Visual 1','https://foss.uazuay.edu.ec:8443/imagenesJuego/figura fondo- visual 1.jpg',3,1),(92,'Figura Fondo - Visual 2','https://foss.uazuay.edu.ec:8443/imagenesJuego/figura fondo-visual 2.jpg',3,1),(93,'Figura Fondo - Visual','https://foss.uazuay.edu.ec:8443/imagenesJuego/figura fondo-visual.jpg',3,1),(94,'Nociones Espaciales','https://foss.uazuay.edu.ec:8443/imagenesJuego/nociones espaciales.jpg',3,1),(95,'Percepción del espacio - izquierda','https://foss.uazuay.edu.ec:8443/imagenesJuego/percepciÃ³n del espacio- izquierda.png',3,1),(96,'Percepción del espacio arriba - abajo','https://foss.uazuay.edu.ec:8443/imagenesJuego/percepciÃ³n espacio  arriba- abajo.png',3,1),(97,'Abuelita','https://foss.uazuay.edu.ec:8443/imagenesJuego/Abuelita.jpg',2,1),(98,'Águila','https://foss.uazuay.edu.ec:8443/imagenesJuego/Ãguila.jpg',2,1),(99,'Cabra','https://foss.uazuay.edu.ec:8443/imagenesJuego/Cabra.jpg',2,1),(100,'Circo','https://foss.uazuay.edu.ec:8443/imagenesJuego/Circo.jpg',2,1),(101,'Clavo','https://foss.uazuay.edu.ec:8443/imagenesJuego/Clavo.jpg',2,1),(102,'Cuchillo','https://foss.uazuay.edu.ec:8443/imagenesJuego/Cuchillo.jpg',2,1),(103,'Familia','https://foss.uazuay.edu.ec:8443/imagenesJuego/Familia.jpg',2,1),(104,'Globo','https://foss.uazuay.edu.ec:8443/imagenesJuego/Globo.jpg',2,1),(105,'Inyección','https://foss.uazuay.edu.ec:8443/imagenesJuego/InyecciÃ³n.jpg',2,1),(106,'Jugo de naranja','https://foss.uazuay.edu.ec:8443/imagenesJuego/Jugo de naranja.jpg',2,1),(107,'Llanta','https://foss.uazuay.edu.ec:8443/imagenesJuego/Llanta.jpg',2,1),(108,'Lombriz','https://foss.uazuay.edu.ec:8443/imagenesJuego/Lombriz.jpg',2,1),(109,'Micrófono','https://foss.uazuay.edu.ec:8443/imagenesJuego/MircÃ³fono.jpg',2,1),(110,'Pluma','https://foss.uazuay.edu.ec:8443/imagenesJuego/Pluma.jpg',2,1),(111,'Santa Claus','https://foss.uazuay.edu.ec:8443/imagenesJuego/Santa Claus.jpg',2,1),(112,'Topo','https://foss.uazuay.edu.ec:8443/imagenesJuego/Topo.jpg',2,1);
/*!40000 ALTER TABLE `imagenes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `juego1`
--

DROP TABLE IF EXISTS `juego1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `juego1` (
  `idjuego1` int NOT NULL AUTO_INCREMENT,
  `img1` int DEFAULT NULL,
  `img2` int DEFAULT NULL,
  `img3` int DEFAULT NULL,
  `img4` int DEFAULT NULL,
  `numRondas` int NOT NULL DEFAULT '5',
  `idprofesor` int NOT NULL,
  PRIMARY KEY (`idjuego1`),
  KEY `FK_j1i1_img_idx` (`img1`),
  KEY `FK_j1i2_img_idx` (`img2`),
  KEY `FK_j1i3_img_idx` (`img3`),
  KEY `FK_j1i4_img_idx` (`img4`),
  KEY `fk_profesor_config_idx` (`idprofesor`),
  CONSTRAINT `fk_1` FOREIGN KEY (`img1`) REFERENCES `imagenes` (`idimagenes`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `fk_2` FOREIGN KEY (`img2`) REFERENCES `imagenes` (`idimagenes`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `fk_3` FOREIGN KEY (`img3`) REFERENCES `imagenes` (`idimagenes`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `fk_4` FOREIGN KEY (`img4`) REFERENCES `imagenes` (`idimagenes`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `fk_profesor_config` FOREIGN KEY (`idprofesor`) REFERENCES `profesores` (`idprofesores`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `juego1`
--

LOCK TABLES `juego1` WRITE;
/*!40000 ALTER TABLE `juego1` DISABLE KEYS */;
INSERT INTO `juego1` VALUES (1,34,37,35,NULL,5,1),(13,34,37,35,36,5,15),(14,NULL,NULL,NULL,NULL,5,16),(15,34,34,34,34,5,17);
/*!40000 ALTER TABLE `juego1` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `juego2`
--

DROP TABLE IF EXISTS `juego2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `juego2` (
  `idjuego2` int NOT NULL AUTO_INCREMENT,
  `img1` int DEFAULT NULL,
  `img2` int DEFAULT NULL,
  `img3` int DEFAULT NULL,
  `img4` int DEFAULT NULL,
  `img5` int DEFAULT NULL,
  `img6` int DEFAULT NULL,
  `img7` int DEFAULT NULL,
  `img8` int DEFAULT NULL,
  `img9` int DEFAULT NULL,
  `idprofesor` int NOT NULL,
  `numCartas` int DEFAULT '3',
  PRIMARY KEY (`idjuego2`),
  KEY `FK_j2i1_img_idx` (`img1`),
  KEY `FK_j2i2_img_idx` (`img2`),
  KEY `FK_j2i4_img_idx` (`img4`),
  KEY `FK_j2i3_img_idx` (`img3`),
  KEY `FK_j2i5_img_idx` (`img5`),
  KEY `FK_j2i6_img_idx` (`img6`),
  KEY `FK_j2i7_img_idx` (`img7`),
  KEY `FK_j2i8_img_idx` (`img8`),
  KEY `FK_j2i9_img_idx` (`img9`),
  KEY `FK_profesor_config2_idx` (`idprofesor`),
  CONSTRAINT `FK_j2i1_img` FOREIGN KEY (`img1`) REFERENCES `imagenes` (`idimagenes`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `FK_j2i2_img` FOREIGN KEY (`img2`) REFERENCES `imagenes` (`idimagenes`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `FK_j2i3_img` FOREIGN KEY (`img3`) REFERENCES `imagenes` (`idimagenes`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `FK_j2i4_img` FOREIGN KEY (`img4`) REFERENCES `imagenes` (`idimagenes`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `FK_j2i5_img` FOREIGN KEY (`img5`) REFERENCES `imagenes` (`idimagenes`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `FK_j2i6_img` FOREIGN KEY (`img6`) REFERENCES `imagenes` (`idimagenes`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `FK_j2i7_img` FOREIGN KEY (`img7`) REFERENCES `imagenes` (`idimagenes`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `FK_j2i8_img` FOREIGN KEY (`img8`) REFERENCES `imagenes` (`idimagenes`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `FK_j2i9_img` FOREIGN KEY (`img9`) REFERENCES `imagenes` (`idimagenes`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `FK_profesor_p` FOREIGN KEY (`idprofesor`) REFERENCES `profesores` (`idprofesores`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `juego2`
--

LOCK TABLES `juego2` WRITE;
/*!40000 ALTER TABLE `juego2` DISABLE KEYS */;
INSERT INTO `juego2` VALUES (1,38,39,40,41,42,43,44,45,46,1,3),(7,73,72,79,78,74,77,76,71,70,15,3),(8,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,16,3),(9,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,17,3);
/*!40000 ALTER TABLE `juego2` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `juego3`
--

DROP TABLE IF EXISTS `juego3`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `juego3` (
  `idjuego3` int NOT NULL AUTO_INCREMENT,
  `img1` int DEFAULT NULL,
  `ordenJuego` varchar(500) DEFAULT 'Bienvenido al pizarrón',
  `idprofesor` int NOT NULL,
  PRIMARY KEY (`idjuego3`),
  KEY `FK_j3i1_img_idx` (`img1`),
  KEY `FK_profesor_config3_idx` (`idprofesor`),
  CONSTRAINT `FK_j3i1_img` FOREIGN KEY (`img1`) REFERENCES `imagenes` (`idimagenes`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `FK_profesor_config3` FOREIGN KEY (`idprofesor`) REFERENCES `profesores` (`idprofesores`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `juego3`
--

LOCK TABLES `juego3` WRITE;
/*!40000 ALTER TABLE `juego3` DISABLE KEYS */;
INSERT INTO `juego3` VALUES (1,47,'Bienvenido al pizarrón, hoy vamos a dibujar el camino a casa para los niños!',1),(8,75,'Bienvenido al pizarrón',15),(9,NULL,'Bienvenido al pizarrón',16),(10,NULL,'Bienvenido al pizarrón',17);
/*!40000 ALTER TABLE `juego3` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `juego4`
--

DROP TABLE IF EXISTS `juego4`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `juego4` (
  `idjuego4` int NOT NULL AUTO_INCREMENT,
  `img1` int DEFAULT NULL,
  `img2` int DEFAULT NULL,
  `img3` int DEFAULT NULL,
  `velocidad` int NOT NULL DEFAULT '1',
  `numFilas` int NOT NULL DEFAULT '3',
  `idcorrecto` int DEFAULT NULL,
  `idprofesor` int NOT NULL,
  PRIMARY KEY (`idjuego4`),
  KEY `FK_j4i1_img_idx` (`img1`),
  KEY `FK_j4i2_img_idx` (`img2`),
  KEY `FK_j4i3_img_idx` (`img3`),
  KEY `FK_profesor_config_idx` (`idprofesor`),
  KEY `FK_img_correcto_idx` (`idcorrecto`),
  CONSTRAINT `FK_img_correcto` FOREIGN KEY (`idcorrecto`) REFERENCES `imagenes` (`idimagenes`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `FK_j4i1_img` FOREIGN KEY (`img1`) REFERENCES `imagenes` (`idimagenes`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `FK_j4i2_img` FOREIGN KEY (`img2`) REFERENCES `imagenes` (`idimagenes`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `FK_j4i3_img` FOREIGN KEY (`img3`) REFERENCES `imagenes` (`idimagenes`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `FK_profesor_config4` FOREIGN KEY (`idprofesor`) REFERENCES `profesores` (`idprofesores`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `juego4`
--

LOCK TABLES `juego4` WRITE;
/*!40000 ALTER TABLE `juego4` DISABLE KEYS */;
INSERT INTO `juego4` VALUES (1,50,52,55,2,5,52,1),(7,62,63,65,2,3,65,15),(8,NULL,NULL,NULL,1,3,NULL,16),(9,NULL,NULL,NULL,1,3,NULL,17);
/*!40000 ALTER TABLE `juego4` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jugada`
--

DROP TABLE IF EXISTS `jugada`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jugada` (
  `idjugada` int NOT NULL AUTO_INCREMENT,
  `idestudiante` int NOT NULL,
  `juego` varchar(6) NOT NULL,
  `calificacion` int NOT NULL,
  `fechajugada` datetime DEFAULT NULL,
  PRIMARY KEY (`idjugada`),
  KEY `FK_est_est_idx` (`idestudiante`),
  CONSTRAINT `FK_est_est` FOREIGN KEY (`idestudiante`) REFERENCES `estudiantes` (`idestudiantes`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=335 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jugada`
--

LOCK TABLES `jugada` WRITE;
/*!40000 ALTER TABLE `jugada` DISABLE KEYS */;
INSERT INTO `jugada` VALUES (1,1,'juego1',3,'2024-01-15 00:00:00'),(2,1,'juego1',1,'2023-02-20 00:00:00'),(171,3,'juego1',3,'2024-01-16 00:00:00'),(172,3,'juego1',1,'2024-01-15 00:00:00'),(173,3,'juego1',1,'2024-01-15 00:00:00'),(174,3,'juego1',1,'2024-01-15 00:00:00'),(175,3,'juego1',1,'2024-01-16 00:00:00'),(176,3,'juego1',1,'2024-01-16 00:00:00'),(177,3,'juego1',1,'2024-01-14 00:00:00'),(178,3,'juego1',1,'2024-01-16 00:00:00'),(179,3,'juego1',1,'2024-01-16 00:00:00'),(180,3,'juego1',1,'2024-01-16 00:00:00'),(181,3,'juego1',1,'2024-01-16 00:00:00'),(182,3,'juego1',1,'2024-01-16 00:00:00'),(183,3,'juego1',1,'2024-01-16 00:00:00'),(184,3,'juego1',1,'2024-01-16 00:00:00'),(185,3,'juego1',1,'2024-01-16 00:00:00'),(186,3,'juego1',0,'2024-01-16 00:00:00'),(187,3,'juego2',0,'2024-01-16 00:00:00'),(188,3,'juego2',0,'2024-01-16 00:00:00'),(189,3,'juego1',0,'2024-01-20 00:00:00'),(190,3,'juego1',0,'2024-01-20 00:00:00'),(191,3,'juego1',1,'2024-01-20 00:00:00'),(192,3,'juego1',1,'2024-01-20 00:00:00'),(193,3,'juego1',1,'2024-01-20 00:00:00'),(194,3,'juego2',1,'2024-01-20 00:00:00'),(195,3,'juego2',0,'2024-01-20 00:00:00'),(196,3,'juego2',1,'2024-01-20 00:00:00'),(197,3,'juego2',1,'2024-01-20 00:00:00'),(198,3,'juego2',1,'2024-01-20 00:00:00'),(199,3,'juego2',0,'2024-01-20 00:00:00'),(200,3,'juego2',1,'2024-01-20 00:00:00'),(201,3,'juego2',1,'2024-01-20 00:00:00'),(202,3,'juego1',0,'2024-01-21 00:00:00'),(203,3,'juego1',0,'2024-01-21 00:00:00'),(204,3,'juego1',0,'2024-01-21 00:00:00'),(205,3,'juego1',0,'2024-01-21 00:00:00'),(206,3,'juego1',1,'2024-01-21 00:00:00'),(207,3,'juego2',0,'2024-01-21 00:00:00'),(208,3,'juego1',0,'2024-01-22 00:00:00'),(209,3,'juego1',0,'2024-01-22 00:00:00'),(210,3,'juego1',1,'2024-01-22 00:00:00'),(211,3,'juego1',0,'2024-01-22 00:00:00'),(212,3,'juego1',0,'2024-01-22 00:00:00'),(213,3,'juego1',1,'2024-01-22 00:00:00'),(214,3,'juego1',1,'2024-01-22 00:00:00'),(215,3,'juego1',1,'2024-01-22 00:00:00'),(216,3,'juego1',1,'2024-01-22 00:00:00'),(217,3,'juego1',1,'2024-01-22 00:00:00'),(218,3,'juego1',1,'2024-01-22 00:00:00'),(219,3,'juego1',1,'2024-01-22 00:00:00'),(220,3,'juego2',1,'2024-01-29 00:00:00'),(221,3,'juego1',1,'2024-02-03 00:00:00'),(222,3,'juego1',1,'2024-02-03 00:00:00'),(223,3,'juego4',2,'2024-02-04 00:00:00'),(224,3,'juego4',0,'2024-02-04 00:00:00'),(225,3,'juego4',2,'2024-02-04 00:00:00'),(226,3,'juego4',3,'2024-02-04 00:00:00'),(227,1,'juego4',3,'2024-02-04 00:00:00'),(228,1,'juego1',1,'2024-02-04 00:00:00'),(229,1,'juego4',3,'2024-02-04 00:00:00'),(230,1,'juego1',1,'2024-02-04 00:00:00'),(231,1,'juego4',3,'2024-02-05 00:00:00'),(232,1,'juego4',2,'2024-02-05 00:00:00'),(233,1,'juego4',0,'2024-02-05 00:00:00'),(234,1,'juego1',1,'2024-02-05 00:00:00'),(235,3,'juego2',0,'2024-02-07 00:00:00'),(236,3,'juego2',0,'2024-02-07 00:00:00'),(237,3,'juego4',2,'2024-02-07 00:00:00'),(238,3,'juego4',0,'2024-02-07 00:00:00'),(239,1,'juego2',1,'2024-02-07 00:00:00'),(240,1,'juego2',0,'2024-02-07 00:00:00'),(241,1,'juego2',0,'2024-02-07 00:00:00'),(242,1,'juego1',1,'2024-02-07 00:00:00'),(243,1,'juego1',0,'2024-02-07 00:00:00'),(244,1,'juego1',1,'2024-02-07 00:00:00'),(245,1,'juego4',2,'2024-02-07 00:00:00'),(246,1,'juego4',0,'2024-02-07 00:00:00'),(247,1,'juego4',0,'2024-02-07 00:00:00'),(248,1,'juego1',1,'2024-02-07 00:00:00'),(249,5,'juego2',0,'2024-02-08 00:00:00'),(250,5,'juego2',0,'2024-02-08 00:00:00'),(251,5,'juego2',0,'2024-02-08 00:00:00'),(252,5,'juego2',1,'2024-02-08 00:00:00'),(253,5,'juego4',2,'2024-02-08 00:00:00'),(254,5,'juego4',2,'2024-02-08 00:00:00'),(255,5,'juego4',2,'2024-02-08 00:00:00'),(256,5,'juego1',1,'2024-02-14 00:00:00'),(257,5,'juego2',1,'2024-02-14 00:00:00'),(258,5,'juego1',1,'2024-02-15 00:00:00'),(259,5,'juego2',0,'2024-02-15 00:00:00'),(260,1,'juego2',2,'2024-02-16 00:00:00'),(261,5,'juego2',0,'2024-02-19 00:00:00'),(262,5,'juego4',2,'2024-02-19 00:00:00'),(263,5,'juego1',1,'2024-02-19 00:00:00'),(264,5,'juego2',0,'2024-02-19 00:00:00'),(265,5,'juego2',0,'2024-02-19 00:00:00'),(266,5,'juego1',0,'2024-02-21 00:00:00'),(267,5,'juego1',1,'2024-02-21 00:00:00'),(268,5,'juego1',1,'2024-02-21 00:00:00'),(269,5,'juego2',0,'2024-02-21 00:00:00'),(270,5,'juego2',1,'2024-02-21 00:00:00'),(271,5,'juego2',1,'2024-02-21 00:00:00'),(272,5,'juego2',0,'2024-02-21 00:00:00'),(273,5,'juego2',0,'2024-02-21 00:00:00'),(274,5,'juego2',0,'2024-02-21 00:00:00'),(275,5,'juego2',1,'2024-02-21 00:00:00'),(276,5,'juego2',0,'2024-02-21 00:00:00'),(277,1,'juego1',1,'2024-02-26 00:00:00'),(278,1,'juego1',0,'2024-02-26 00:00:00'),(279,5,'juego1',0,'2024-03-01 00:00:00'),(280,5,'juego1',0,'2024-03-01 00:00:00'),(281,5,'juego1',0,'2024-03-01 00:00:00'),(282,5,'juego2',0,'2024-03-01 00:00:00'),(283,5,'juego4',2,'2024-03-01 00:00:00'),(284,5,'juego2',1,'2024-03-01 00:00:00'),(285,5,'juego2',1,'2024-03-01 00:00:00'),(286,5,'juego4',2,'2024-03-01 00:00:00'),(287,5,'juego4',2,'2024-03-01 00:00:00'),(288,5,'juego4',2,'2024-03-01 00:00:00'),(289,5,'juego4',2,'2024-03-01 00:00:00'),(290,5,'juego1',0,'2024-03-01 00:00:00'),(291,5,'juego1',1,'2024-03-01 00:00:00'),(292,5,'juego1',0,'2024-03-01 00:00:00'),(293,5,'juego1',0,'2024-03-01 00:00:00'),(294,5,'juego1',0,'2024-03-01 00:00:00'),(295,5,'juego2',0,'2024-03-01 00:00:00'),(296,5,'juego2',1,'2024-03-01 00:00:00'),(297,5,'juego4',2,'2024-03-01 00:00:00'),(298,5,'juego4',0,'2024-03-01 00:00:00'),(299,5,'juego4',2,'2024-03-01 00:00:00'),(300,5,'juego4',2,'2024-03-01 00:00:00'),(301,5,'juego1',1,'2024-03-01 00:00:00'),(302,5,'juego1',1,'2024-03-01 00:00:00'),(303,5,'juego1',0,'2024-03-01 00:00:00'),(304,5,'juego1',1,'2024-03-01 00:00:00'),(305,5,'juego4',2,'2024-03-01 00:00:00'),(306,5,'juego1',1,'2024-03-01 00:00:00'),(307,5,'juego1',0,'2024-03-01 00:00:00'),(308,5,'juego1',0,'2024-03-01 00:00:00'),(309,5,'juego1',1,'2024-03-01 00:00:00'),(310,5,'juego1',1,'2024-03-01 00:00:00'),(311,5,'juego4',2,'2024-03-01 00:00:00'),(312,5,'juego1',1,'2024-03-11 00:00:00'),(313,5,'juego1',0,'2024-03-11 00:00:00'),(314,5,'juego1',0,'2024-03-11 00:00:00'),(315,5,'juego2',1,'2024-03-11 00:00:00'),(316,5,'juego2',1,'2024-03-11 00:00:00'),(317,5,'juego2',0,'2024-03-11 00:00:00'),(318,5,'juego2',1,'2024-03-11 00:00:00'),(319,5,'juego1',1,'2024-03-11 00:00:00'),(320,5,'juego1',1,'2024-03-11 00:00:00'),(321,5,'juego4',2,'2024-03-11 00:00:00'),(322,5,'juego4',2,'2024-03-11 00:00:00'),(323,5,'juego2',1,'2024-03-11 00:00:00'),(324,5,'juego2',0,'2024-03-11 00:00:00'),(325,5,'juego2',0,'2024-03-11 00:00:00'),(326,5,'juego2',0,'2024-03-11 00:00:00'),(327,5,'juego2',0,'2024-03-11 00:00:00'),(328,5,'juego2',0,'2024-03-11 00:00:00'),(329,5,'juego2',0,'2024-03-11 00:00:00'),(330,5,'juego2',0,'2024-03-11 00:00:00'),(331,5,'juego1',0,'2024-03-11 00:00:00'),(332,5,'juego1',0,'2024-03-11 00:00:00'),(333,5,'juego2',0,'2024-03-11 00:00:00'),(334,5,'juego2',0,'2024-03-11 00:00:00');
/*!40000 ALTER TABLE `jugada` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `profesores`
--

DROP TABLE IF EXISTS `profesores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `profesores` (
  `idprofesores` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  `correo` varchar(45) NOT NULL,
  `contrasena` varchar(45) NOT NULL,
  `institucion` varchar(45) NOT NULL,
  `sexo` varchar(1) NOT NULL DEFAULT 'M',
  `tipodeusuario` varchar(2) NOT NULL DEFAULT 'PR',
  `cedula` varchar(13) DEFAULT NULL,
  PRIMARY KEY (`idprofesores`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profesores`
--

LOCK TABLES `profesores` WRITE;
/*!40000 ALTER TABLE `profesores` DISABLE KEYS */;
INSERT INTO `profesores` VALUES (1,'Elisa Ampuero','eli@gmail.com','1234','UDA','F','PR',NULL),(15,'Adriana León','aleon@uazuay.edu.ec','123456','UDA','F','PR','0102357895'),(16,'Raffa','ransaloni@uazuay.edu.ec','raffaella','UDA','F','PR','0103969432'),(17,'KATHERINE ORTIZ','kortiz@uazuay.edu.ec','Eneagrama2o24','UDA','F','PR','0102657301');
/*!40000 ALTER TABLE `profesores` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-03-13 22:48:02
