-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: farmacia
-- ------------------------------------------------------
-- Server version	5.5.5-10.4.11-MariaDB

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
-- Table structure for table `categoria`
--

DROP TABLE IF EXISTS `categoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categoria` (
  `id_categoria` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_categoria` varchar(32) NOT NULL,
  `descripcion_categoria` varchar(127) DEFAULT NULL,
  `estado_categoria` tinyint(4) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id_categoria`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categoria`
--

LOCK TABLES `categoria` WRITE;
/*!40000 ALTER TABLE `categoria` DISABLE KEYS */;
INSERT INTO `categoria` VALUES (1,'Medicamentos','Productos farmacéuticos para el alivio de síntomas.',1),(2,'Cuidado Personal','Productos para el cuidado personal, como champú y jabón.',1),(3,'Vitaminas y Suplementos','Suplementos vitamínicos y minerales.',1);
/*!40000 ALTER TABLE `categoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categoria_producto`
--

DROP TABLE IF EXISTS `categoria_producto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categoria_producto` (
  `id_categoria` int(11) NOT NULL,
  `id_producto` int(11) NOT NULL,
  PRIMARY KEY (`id_categoria`,`id_producto`),
  KEY `fk_producto_has_categoria_producto1` (`id_producto`),
  CONSTRAINT `fk_producto_has_categoria_categoria1` FOREIGN KEY (`id_categoria`) REFERENCES `categoria` (`id_categoria`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_producto_has_categoria_producto1` FOREIGN KEY (`id_producto`) REFERENCES `producto` (`id_producto`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categoria_producto`
--

LOCK TABLES `categoria_producto` WRITE;
/*!40000 ALTER TABLE `categoria_producto` DISABLE KEYS */;
INSERT INTO `categoria_producto` VALUES (1,1),(1,2),(1,3),(1,4),(1,5),(1,6),(2,6),(3,3),(3,5);
/*!40000 ALTER TABLE `categoria_producto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cliente` (
  `id_cliente` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_cliente` varchar(63) NOT NULL,
  `ci_cliente` varchar(12) DEFAULT NULL,
  `celular_cliente` varchar(10) DEFAULT NULL,
  `puntos_cliente` float DEFAULT 0,
  PRIMARY KEY (`id_cliente`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
INSERT INTO `cliente` VALUES (1,'Juan Pérez','12345678','75483112',0),(2,'María Rodríguez','87654321','66369712',0),(3,'Luis González','55555555','77482123',75);
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `compra`
--

DROP TABLE IF EXISTS `compra`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `compra` (
  `id_compra` int(11) NOT NULL AUTO_INCREMENT,
  `id_sucursal` int(11) NOT NULL,
  `id_farmaceutico` int(11) NOT NULL,
  `id_proveedor` int(11) NOT NULL,
  `fecha_compra` datetime NOT NULL,
  `precio_compra` float NOT NULL,
  `pago_compra` float NOT NULL,
  PRIMARY KEY (`id_compra`,`id_sucursal`,`id_farmaceutico`,`id_proveedor`),
  KEY `fk_compra_sucursal1` (`id_sucursal`),
  KEY `fk_compra_farmaceutico1` (`id_farmaceutico`),
  KEY `fk_compra_proveedor1` (`id_proveedor`),
  CONSTRAINT `fk_compra_farmaceutico1` FOREIGN KEY (`id_farmaceutico`) REFERENCES `farmaceutico` (`id_farmaceutico`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_compra_proveedor1` FOREIGN KEY (`id_proveedor`) REFERENCES `proveedor` (`id_proveedor`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_compra_sucursal1` FOREIGN KEY (`id_sucursal`) REFERENCES `sucursal` (`id_sucursal`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `compra`
--

LOCK TABLES `compra` WRITE;
/*!40000 ALTER TABLE `compra` DISABLE KEYS */;
INSERT INTO `compra` VALUES (1,1,1,1,'2023-10-15 00:00:00',100,100),(2,2,2,2,'2023-10-16 00:00:00',150,150),(3,1,3,3,'2023-10-17 00:00:00',200,200);
/*!40000 ALTER TABLE `compra` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `compra_producto`
--

DROP TABLE IF EXISTS `compra_producto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `compra_producto` (
  `id_compra` int(11) NOT NULL,
  `id_producto` int(11) NOT NULL,
  `cantidad_compra_producto` int(11) NOT NULL,
  `precio_compra_producto` float NOT NULL,
  `fecha_expiracion_producto` datetime NOT NULL,
  PRIMARY KEY (`id_compra`,`id_producto`),
  KEY `fk_detalle_producto_producto1` (`id_producto`),
  CONSTRAINT `fk_detalle_producto_compra1` FOREIGN KEY (`id_compra`) REFERENCES `compra` (`id_compra`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_detalle_producto_producto1` FOREIGN KEY (`id_producto`) REFERENCES `producto` (`id_producto`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `compra_producto`
--

LOCK TABLES `compra_producto` WRITE;
/*!40000 ALTER TABLE `compra_producto` DISABLE KEYS */;
INSERT INTO `compra_producto` VALUES (1,1,10,50,'2023-10-31 00:00:00'),(1,2,5,30,'2023-11-15 00:00:00'),(1,3,20,100,'2023-12-05 00:00:00');
/*!40000 ALTER TABLE `compra_producto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detalle_producto`
--

DROP TABLE IF EXISTS `detalle_producto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `detalle_producto` (
  `id_detalle_producto` int(11) NOT NULL AUTO_INCREMENT,
  `id_sucursal` int(11) NOT NULL,
  `id_producto` int(11) NOT NULL,
  `stock_detalle_producto` int(11) DEFAULT 0,
  `expiracion_detalle_producto` datetime DEFAULT NULL,
  `estado_detalle_producto` tinyint(4) DEFAULT 1,
  `precio_detalle_producto` float DEFAULT 0,
  PRIMARY KEY (`id_detalle_producto`,`id_sucursal`,`id_producto`),
  KEY `fk_detalle_producto_sucursal1` (`id_sucursal`),
  KEY `fk_detalle_producto_producto2` (`id_producto`),
  CONSTRAINT `fk_detalle_producto_producto2` FOREIGN KEY (`id_producto`) REFERENCES `producto` (`id_producto`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_detalle_producto_sucursal1` FOREIGN KEY (`id_sucursal`) REFERENCES `sucursal` (`id_sucursal`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detalle_producto`
--

LOCK TABLES `detalle_producto` WRITE;
/*!40000 ALTER TABLE `detalle_producto` DISABLE KEYS */;
INSERT INTO `detalle_producto` VALUES (1,1,1,100,'2023-12-31 00:00:00',1,20),(2,1,2,50,'2023-11-30 00:00:00',1,30),(3,2,1,75,'2023-12-15 00:00:00',1,75),(4,2,2,40,'2023-11-20 00:00:00',1,20);
/*!40000 ALTER TABLE `detalle_producto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `farmaceutico`
--

DROP TABLE IF EXISTS `farmaceutico`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `farmaceutico` (
  `id_farmaceutico` int(11) NOT NULL AUTO_INCREMENT,
  `id_sucursal` int(11) NOT NULL,
  `nombre_farmaceutico` varchar(63) NOT NULL,
  `celular_farmaceutico` varchar(10) DEFAULT NULL,
  `direccion_farmaceutico` varchar(63) DEFAULT NULL,
  `usuario_famaceutico` varchar(63) NOT NULL,
  `pass_farmaceutico` varchar(25) NOT NULL,
  `estado_farmaceutico` varchar(45) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id_farmaceutico`,`id_sucursal`),
  KEY `fk_farmaceutico_sucursal` (`id_sucursal`),
  CONSTRAINT `fk_farmaceutico_sucursal` FOREIGN KEY (`id_sucursal`) REFERENCES `sucursal` (`id_sucursal`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `farmaceutico`
--

LOCK TABLES `farmaceutico` WRITE;
/*!40000 ALTER TABLE `farmaceutico` DISABLE KEYS */;
/*!40000 ALTER TABLE `farmaceutico` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pedido`
--

DROP TABLE IF EXISTS `pedido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pedido` (
  `id_pedido` int(11) NOT NULL AUTO_INCREMENT,
  `id_farmaceutico` int(11) NOT NULL,
  `id_sucursal` int(11) NOT NULL,
  `id_cliente` int(11) NOT NULL,
  `fecha_pedido` datetime NOT NULL,
  `pago_pedido` float NOT NULL,
  `descuento_pedido` float NOT NULL,
  `img_receta_pedido` varchar(256) DEFAULT NULL,
  `estado_pedido` enum('Solicitud','Proceso','Entregado') NOT NULL,
  PRIMARY KEY (`id_pedido`,`id_farmaceutico`,`id_sucursal`,`id_cliente`),
  KEY `fk_pedido_cliente1` (`id_cliente`),
  KEY `fk_pedido_farmaceutico1` (`id_farmaceutico`),
  KEY `fk_pedido_sucursal1` (`id_sucursal`),
  CONSTRAINT `fk_pedido_cliente1` FOREIGN KEY (`id_cliente`) REFERENCES `cliente` (`id_cliente`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_pedido_farmaceutico1` FOREIGN KEY (`id_farmaceutico`) REFERENCES `farmaceutico` (`id_farmaceutico`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_pedido_sucursal1` FOREIGN KEY (`id_sucursal`) REFERENCES `sucursal` (`id_sucursal`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedido`
--

LOCK TABLES `pedido` WRITE;
/*!40000 ALTER TABLE `pedido` DISABLE KEYS */;
INSERT INTO `pedido` VALUES (1,1,1,1,'2023-10-15 00:00:00',100,10,'receta1.jpg','Entregado'),(2,2,2,2,'2023-10-16 00:00:00',150,15,'receta2.jpg','Solicitud'),(3,3,1,3,'2023-10-17 00:00:00',200,20,'receta3.jpg','Proceso'),(4,2,1,1,'2023-10-20 00:00:00',120,12,'receta4.jpg','Entregado'),(5,1,2,2,'2023-10-21 00:00:00',180,18,'receta5.jpg','Solicitud'),(6,2,1,3,'2023-10-22 00:00:00',220,22,'receta6.jpg','Proceso');
/*!40000 ALTER TABLE `pedido` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pedido_producto`
--

DROP TABLE IF EXISTS `pedido_producto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pedido_producto` (
  `id_pedido` int(11) NOT NULL,
  `id_producto` int(11) NOT NULL,
  `cantidad_pedido_producto` int(11) NOT NULL,
  `precio_pedido_producto` float NOT NULL,
  PRIMARY KEY (`id_pedido`,`id_producto`),
  KEY `fk_pedido_producto_producto1` (`id_producto`),
  CONSTRAINT `fk_pedido_producto_pedido1` FOREIGN KEY (`id_pedido`) REFERENCES `pedido` (`id_pedido`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_pedido_producto_producto1` FOREIGN KEY (`id_producto`) REFERENCES `producto` (`id_producto`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedido_producto`
--

LOCK TABLES `pedido_producto` WRITE;
/*!40000 ALTER TABLE `pedido_producto` DISABLE KEYS */;
INSERT INTO `pedido_producto` VALUES (1,1,10,50),(1,2,5,30),(2,1,15,60),(2,3,20,100),(3,2,8,35),(3,3,12,120);
/*!40000 ALTER TABLE `pedido_producto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `producto`
--

DROP TABLE IF EXISTS `producto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `producto` (
  `id_producto` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_producto` varchar(127) NOT NULL,
  `descripcion_producto` varchar(1023) DEFAULT NULL,
  `codigo_barra_producto` varchar(45) DEFAULT NULL,
  `estado_producto` tinyint(4) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id_producto`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `producto`
--

LOCK TABLES `producto` WRITE;
/*!40000 ALTER TABLE `producto` DISABLE KEYS */;
INSERT INTO `producto` VALUES (1,'Paracetamol','Analgésico y antipirético','12345',1),(2,'Ibuprofeno','Antiinflamatorio y analgésico','67890',1),(3,'Aspirina','Analgésico y antiinflamatorio','54321',1),(4,'Omeprazol','Inhibidor de la bomba de protones','98765',1),(5,'Loratadina','Antihistamínico','13579',1),(6,'Amoxicilina','Antibiótico','24680',1);
/*!40000 ALTER TABLE `producto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proveedor`
--

DROP TABLE IF EXISTS `proveedor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `proveedor` (
  `id_proveedor` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_proveedor` varchar(31) NOT NULL,
  `direccion_proveedor` varchar(64) NOT NULL,
  `telefono_proveedot` varchar(10) DEFAULT NULL,
  `estado_proveedor` tinyint(4) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id_proveedor`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proveedor`
--

LOCK TABLES `proveedor` WRITE;
/*!40000 ALTER TABLE `proveedor` DISABLE KEYS */;
INSERT INTO `proveedor` VALUES (1,'Proveedor A','Calle Flores y San Martin','34782211',1),(2,'Proveedor B','Avenida Potosi y Antezana 1452','44752224',1),(3,'Proveedor C','Carretera a Cochabamba 1453 km 2','25732214',1);
/*!40000 ALTER TABLE `proveedor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sucursal`
--

DROP TABLE IF EXISTS `sucursal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sucursal` (
  `id_sucursal` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_sucursal` varchar(63) NOT NULL,
  `direccion_sucursal` varchar(63) NOT NULL,
  `telefono_sucursal` varchar(10) DEFAULT NULL,
  `estado_sucursal` tinyint(4) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id_sucursal`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sucursal`
--

LOCK TABLES `sucursal` WRITE;
/*!40000 ALTER TABLE `sucursal` DISABLE KEYS */;
INSERT INTO `sucursal` VALUES (1,'Sucursal A','Calle 123 y Bolivar','24782214',1),(2,'Sucursal B','Avenida 456 y Sucre ','27521123',1),(3,'Sucursal C','Carretera 789 y San Sebastian','36483155',1);
/*!40000 ALTER TABLE `sucursal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `venta`
--

DROP TABLE IF EXISTS `venta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `venta` (
  `id_venta` int(11) NOT NULL AUTO_INCREMENT,
  `id_cliente` int(11) NOT NULL,
  `id_farmaceutico` int(11) NOT NULL,
  `id_sucursal` int(11) NOT NULL,
  `fecha_venta` datetime NOT NULL,
  `precio_venta` float NOT NULL,
  `pago_venta` float NOT NULL,
  `descuento_venta` float DEFAULT NULL,
  `img_receta_venta` varchar(256) DEFAULT NULL,
  PRIMARY KEY (`id_venta`,`id_cliente`,`id_farmaceutico`,`id_sucursal`),
  KEY `fk_venta_cliente1` (`id_cliente`),
  KEY `fk_venta_sucursal1` (`id_sucursal`),
  KEY `fk_venta_farmaceutico1` (`id_farmaceutico`),
  CONSTRAINT `fk_venta_cliente1` FOREIGN KEY (`id_cliente`) REFERENCES `cliente` (`id_cliente`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_venta_farmaceutico1` FOREIGN KEY (`id_farmaceutico`) REFERENCES `farmaceutico` (`id_farmaceutico`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_venta_sucursal1` FOREIGN KEY (`id_sucursal`) REFERENCES `sucursal` (`id_sucursal`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `venta`
--

LOCK TABLES `venta` WRITE;
/*!40000 ALTER TABLE `venta` DISABLE KEYS */;
INSERT INTO `venta` VALUES (1,1,1,1,'2023-10-15 00:00:00',150,150,0,'receta1.jpg'),(2,2,2,2,'2023-10-16 00:00:00',200,200,0,'receta2.jpg'),(3,3,3,1,'2023-10-17 00:00:00',300,300,0,'receta3.jpg'),(4,1,2,1,'2023-10-20 00:00:00',180,180,0,'receta4.jpg'),(5,2,1,2,'2023-10-21 00:00:00',220,220,0,'receta5.jpg'),(6,3,2,1,'2023-10-22 00:00:00',280,280,0,'receta6.jpg');
/*!40000 ALTER TABLE `venta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `venta_producto`
--

DROP TABLE IF EXISTS `venta_producto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `venta_producto` (
  `id_venta` int(11) NOT NULL,
  `id_producto` int(11) NOT NULL,
  `cantidad_venta_producto` int(11) NOT NULL,
  `precio_venta_producto` float NOT NULL,
  PRIMARY KEY (`id_venta`,`id_producto`),
  KEY `fk_venta_producto_producto1` (`id_producto`),
  CONSTRAINT `fk_venta_producto_producto1` FOREIGN KEY (`id_producto`) REFERENCES `producto` (`id_producto`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_venta_producto_venta1` FOREIGN KEY (`id_venta`) REFERENCES `venta` (`id_venta`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `venta_producto`
--

LOCK TABLES `venta_producto` WRITE;
/*!40000 ALTER TABLE `venta_producto` DISABLE KEYS */;
INSERT INTO `venta_producto` VALUES (1,1,5,20),(1,2,3,15),(2,1,8,25),(2,3,10,50),(3,2,12,40),(3,3,6,30);
/*!40000 ALTER TABLE `venta_producto` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-10-17 12:46:14
