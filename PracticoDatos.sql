CREATE DATABASE  IF NOT EXISTS `practico` /*!40100 DEFAULT CHARACTER SET latin1 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `practico`;
-- MySQL dump 10.13  Distrib 8.0.25, for Win64 (x86_64)
--
-- Host: localhost    Database: practico
-- ------------------------------------------------------
-- Server version	8.0.17

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
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cliente` (
  `rut_cliente` varchar(10) NOT NULL,
  `primer_nombre` varchar(15) NOT NULL,
  `segundo_nombre` varchar(15) NOT NULL,
  `primer_apellido` varchar(15) NOT NULL,
  `segundo_apellido` varchar(15) NOT NULL,
  `calle` varchar(25) NOT NULL,
  `numero` varchar(3) NOT NULL,
  `ciudad` varchar(15) NOT NULL,
  `fecha_nacimiento` date NOT NULL,
  `mail_cliente` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`rut_cliente`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
INSERT INTO `cliente` VALUES ('03777228-7','Loreto','Andrea','Lagos','Jeria','Heras','345','Concepcion','1944-05-23','loreto.lagos@gmail.com'),('05343234-7','Tania','Estefania','Seguel','Rojo','Michimalongo','2','Concepcion','1956-03-25','tania2@gmail.com\n\n'),('08673554-3','Francisco','Javier','Muñoz','Muñoz','Prat','232','Concepcion','1977-04-04','F.muñoz@gmail.com'),('09323123-4','Esteban','Andres','Godoy','Lathrop','Los Carrera','234','Concepcion','1977-03-08','egodoy@yahoo.es\n'),('10222123-4','Carla','Paola','Morales','Perez','Los Carrera','45','Concepcion','1966-03-04','cmorales@hotmail.com'),('11901728-0','Maria','Isidora','Alaman','Huerto','Mardal','919','Chiguayante','1999-10-10',''),('12343454-7','Victor','Victorino','Perez','Mergarejo','Victor Lamas','12','Concepcion','1978-04-05',NULL),('12345454-5','Rocio','Andrea','Faundez','Ortega','Chacabuco','34','Concepcion','1970-03-12',NULL),('20439111-2','Sebastian','Esteban','Guerrero','Espinoza','Huertos','222','San pedro','2000-10-03','sebastian.guerreroe@usm.cl'),('23434343-3','Andres','Ricardo','Rocha','Fernandez','Tucapel','32','Concepcion','1975-05-05','arocha@gmail.com'),('23454545-3','Carlos','Alberto','Hernandez','Pinto','Rengo','654','Concepcion','1980-05-06','chernan@gmail.com');
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `compra`
--

DROP TABLE IF EXISTS `compra`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `compra` (
  `idcompra` int(11) NOT NULL AUTO_INCREMENT,
  `fecha_compra` date NOT NULL,
  `cliente_rut_cliente` varchar(10) NOT NULL,
  `sucursal_codigo_sucursal` varchar(6) NOT NULL,
  PRIMARY KEY (`idcompra`),
  KEY `fk_compra_cliente` (`cliente_rut_cliente`),
  KEY `fk_compra_sucursal1` (`sucursal_codigo_sucursal`),
  CONSTRAINT `fk_compra_cliente` FOREIGN KEY (`cliente_rut_cliente`) REFERENCES `cliente` (`rut_cliente`),
  CONSTRAINT `fk_compra_sucursal1` FOREIGN KEY (`sucursal_codigo_sucursal`) REFERENCES `sucursal` (`codigo_sucursal`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `compra`
--

LOCK TABLES `compra` WRITE;
/*!40000 ALTER TABLE `compra` DISABLE KEYS */;
INSERT INTO `compra` VALUES (1,'2013-04-10','03777228-7','1113AA'),(2,'2013-04-10','12343454-7','1113AA'),(3,'2013-04-17','10222123-4','3245GB'),(4,'2013-04-17','12343454-7','2222BB'),(5,'2013-04-17','05343234-7','2234BD'),(6,'2013-04-15','08673554-3','1113AA'),(7,'2021-04-10','03777228-7','1113AA'),(8,'2013-04-01','20439111-2','3245GB');
/*!40000 ALTER TABLE `compra` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detalle_venta`
--

DROP TABLE IF EXISTS `detalle_venta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `detalle_venta` (
  `compra_idcompra` int(11) NOT NULL,
  `producto_codigo_producto` varchar(8) NOT NULL,
  `cantidad` tinyint(4) NOT NULL,
  PRIMARY KEY (`compra_idcompra`,`producto_codigo_producto`),
  KEY `fk_compra_has_producto_producto1` (`producto_codigo_producto`),
  KEY `fk_compra_has_producto_compra1` (`compra_idcompra`),
  CONSTRAINT `fk_compra_has_producto_compra1` FOREIGN KEY (`compra_idcompra`) REFERENCES `compra` (`idcompra`),
  CONSTRAINT `fk_compra_has_producto_producto1` FOREIGN KEY (`producto_codigo_producto`) REFERENCES `producto` (`codigo_producto`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detalle_venta`
--

LOCK TABLES `detalle_venta` WRITE;
/*!40000 ALTER TABLE `detalle_venta` DISABLE KEYS */;
INSERT INTO `detalle_venta` VALUES (1,'34657BVD',3),(1,'55555GFD',3),(1,'93823HBF',2),(2,'26737ASD',2),(2,'84737GTF',5),(3,'55555GFD',1),(3,'74747GBF',1),(4,'95959DSA',22),(5,'84737GTF',10),(5,'89353AAA',1),(6,'93823HBF',2),(6,'95959DSA',3);
/*!40000 ALTER TABLE `detalle_venta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `producto`
--

DROP TABLE IF EXISTS `producto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `producto` (
  `codigo_producto` varchar(8) NOT NULL,
  `nombre_fantasia` varchar(20) NOT NULL,
  `marca` varchar(15) NOT NULL,
  `precio` smallint(6) NOT NULL,
  `fecha_vencimiento` date NOT NULL,
  `stock` smallint(6) NOT NULL,
  `proveedor_codigo_proveedor` varchar(6) NOT NULL,
  PRIMARY KEY (`codigo_producto`),
  KEY `fk_producto_proveedor1` (`proveedor_codigo_proveedor`),
  CONSTRAINT `fk_producto_proveedor1` FOREIGN KEY (`proveedor_codigo_proveedor`) REFERENCES `proveedor` (`codigo_proveedor`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `producto`
--

LOCK TABLES `producto` WRITE;
/*!40000 ALTER TABLE `producto` DISABLE KEYS */;
INSERT INTO `producto` VALUES ('26737ASD','Chocapic','Nestle',1250,'2013-04-30',34,'JG6543'),('34657BVD','Super 8','Nestle',150,'2013-05-15',23,'BB6767'),('43543GHF','Leche descremada','Colun',650,'2013-05-30',2,'BB6767'),('55555GFD','Jamon de pierna','Llanquihue',1200,'2013-04-30',5,'AG2334'),('74747GBF','Mantequilla untable','Soprole',1250,'2013-07-30',14,'AH9834'),('84737GTF','Yogurt','calan',120,'2013-04-15',55,'AG2334'),('89353AAA','Colacao','Nestle',890,'2013-07-15',4,'GD8787'),('93823HBF','Pate de ave','Rios',700,'2013-04-30',5,'GD8787'),('95959DSA','atun','del rey',750,'2012-04-18',43,'GD8787'),('99jd8911','Centella','Savory',990,'2022-04-10',100,'BB6767'),('9l9m1222','Mani salado','delValle',1490,'2023-10-10',190,'BB6767');
/*!40000 ALTER TABLE `producto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proveedor`
--

DROP TABLE IF EXISTS `proveedor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `proveedor` (
  `codigo_proveedor` varchar(6) NOT NULL,
  `nombre` varchar(20) NOT NULL,
  `nombre_contacto` varchar(30) NOT NULL,
  `telefono_contacto` varchar(12) NOT NULL,
  PRIMARY KEY (`codigo_proveedor`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proveedor`
--

LOCK TABLES `proveedor` WRITE;
/*!40000 ALTER TABLE `proveedor` DISABLE KEYS */;
INSERT INTO `proveedor` VALUES ('AAGWUU','El del barrio','Juan Perez','991827318'),('AG2334','El Puro Precio','Sebastian Guerrero','419993393'),('AH9834','Mas barato dificil','Pedro Piñera','416666665'),('BB6767','Donde Luchito','Luis Andrade','417676796'),('GD8787','El Mejor','Esteban Riquelme','413434343'),('JG6543','Mas cosas','Juana Diaz','413432424');
/*!40000 ALTER TABLE `proveedor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sucursal`
--

DROP TABLE IF EXISTS `sucursal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sucursal` (
  `codigo_sucursal` varchar(6) NOT NULL,
  `nombre_sucursal` varchar(20) NOT NULL,
  `telefono_sucursal` varchar(12) NOT NULL,
  PRIMARY KEY (`codigo_sucursal`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sucursal`
--

LOCK TABLES `sucursal` WRITE;
/*!40000 ALTER TABLE `sucursal` DISABLE KEYS */;
INSERT INTO `sucursal` VALUES ('1111AA','Los Acacios','422323334'),('1112AA','Vega Monumental','412323212'),('1113AA','Mall','412234323'),('2222BB','Diagonal','418767576'),('2234BD','San Pedro','415556675'),('3245GB','Chiguayante','413332345'),('4555DS','Collao','414343432'),('9081LL','Colon','419928171');
/*!40000 ALTER TABLE `sucursal` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-07-10  9:52:58
