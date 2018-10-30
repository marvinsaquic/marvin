-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: aselsi
-- ------------------------------------------------------
-- Server version	5.7.19

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `bitacora`
--

DROP TABLE IF EXISTS `bitacora`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bitacora` (
  `bit_id` int(11) NOT NULL AUTO_INCREMENT,
  `bit_nombre_usuario` varchar(100) COLLATE utf8_spanish_ci DEFAULT NULL,
  `bit_tipo_modificacion` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL,
  `bit_dato_anterior` varchar(100) COLLATE utf8_spanish_ci DEFAULT NULL,
  `bit_dato_actual` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL,
  `bit_fecha` date DEFAULT NULL,
  PRIMARY KEY (`bit_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bitacora`
--

LOCK TABLES `bitacora` WRITE;
/*!40000 ALTER TABLE `bitacora` DISABLE KEYS */;
/*!40000 ALTER TABLE `bitacora` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cdp_composicion`
--

DROP TABLE IF EXISTS `cdp_composicion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cdp_composicion` (
  `com_id` int(11) NOT NULL AUTO_INCREMENT,
  `com_nombre` varchar(150) COLLATE utf8_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`com_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cdp_composicion`
--

LOCK TABLES `cdp_composicion` WRITE;
/*!40000 ALTER TABLE `cdp_composicion` DISABLE KEYS */;
INSERT INTO `cdp_composicion` VALUES (1,'500 gramos'),(2,'100 gramo'),(3,'200 gramos');
/*!40000 ALTER TABLE `cdp_composicion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cdp_detalle_salida`
--

DROP TABLE IF EXISTS `cdp_detalle_salida`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cdp_detalle_salida` (
  `det_salida` int(11) NOT NULL AUTO_INCREMENT,
  `det_fecha` date DEFAULT NULL,
  `det_us_id` int(11) NOT NULL,
  `det_sal_id` int(11) NOT NULL,
  PRIMARY KEY (`det_salida`),
  KEY `det_us_id_idx` (`det_us_id`),
  KEY `det_sal_id_idx` (`det_sal_id`),
  CONSTRAINT `det_sal_id` FOREIGN KEY (`det_sal_id`) REFERENCES `cdp_salida` (`sal_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `det_us_id` FOREIGN KEY (`det_us_id`) REFERENCES `cdp_usuario` (`us_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cdp_detalle_salida`
--

LOCK TABLES `cdp_detalle_salida` WRITE;
/*!40000 ALTER TABLE `cdp_detalle_salida` DISABLE KEYS */;
INSERT INTO `cdp_detalle_salida` VALUES (3,'2018-10-11',1,3),(4,'2018-10-11',1,3);
/*!40000 ALTER TABLE `cdp_detalle_salida` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cdp_donante`
--

DROP TABLE IF EXISTS `cdp_donante`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cdp_donante` (
  `don_id` int(11) NOT NULL AUTO_INCREMENT,
  `don_nombre` varchar(100) COLLATE utf8_spanish_ci DEFAULT NULL,
  `don_direccion` varchar(200) COLLATE utf8_spanish_ci DEFAULT NULL,
  `don_telefono` int(11) DEFAULT NULL,
  `don_fecha` date DEFAULT NULL,
  `don_cantidad` double DEFAULT NULL,
  PRIMARY KEY (`don_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cdp_donante`
--

LOCK TABLES `cdp_donante` WRITE;
/*!40000 ALTER TABLE `cdp_donante` DISABLE KEYS */;
INSERT INTO `cdp_donante` VALUES (1,'Marvin','Guatemala',5678906,'2018-09-15',5000);
/*!40000 ALTER TABLE `cdp_donante` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cdp_entradas`
--

DROP TABLE IF EXISTS `cdp_entradas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cdp_entradas` (
  `en_id` int(11) NOT NULL AUTO_INCREMENT,
  `en_fecha_add` date DEFAULT NULL,
  `en_fecha_expiracion` date DEFAULT NULL,
  `en_num_factura` int(11) DEFAULT NULL,
  `en_costo` double DEFAULT NULL,
  `en_cantidad` int(11) DEFAULT NULL,
  `en_bonificacion` int(11) DEFAULT NULL,
  PRIMARY KEY (`en_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cdp_entradas`
--

LOCK TABLES `cdp_entradas` WRITE;
/*!40000 ALTER TABLE `cdp_entradas` DISABLE KEYS */;
INSERT INTO `cdp_entradas` VALUES (1,'2018-10-13','2018-10-02',123456,2.5,100,10),(3,'2018-09-25','2018-10-19',77654567,4,67,8),(4,'2018-10-11','2019-10-11',345678,3,50,NULL),(5,'2018-10-12','2019-10-12',3456789,3.5,500,NULL),(6,'2018-10-01','2018-10-31',65432234,4.25,200,NULL);
/*!40000 ALTER TABLE `cdp_entradas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cdp_grupo`
--

DROP TABLE IF EXISTS `cdp_grupo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cdp_grupo` (
  `gru_id` int(11) NOT NULL AUTO_INCREMENT,
  `gru_nombre` varchar(200) COLLATE utf8_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`gru_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cdp_grupo`
--

LOCK TABLES `cdp_grupo` WRITE;
/*!40000 ALTER TABLE `cdp_grupo` DISABLE KEYS */;
INSERT INTO `cdp_grupo` VALUES (1,'Antibióticos'),(3,'Analgésicos'),(4,'Crema');
/*!40000 ALTER TABLE `cdp_grupo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cdp_medicamento`
--

DROP TABLE IF EXISTS `cdp_medicamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cdp_medicamento` (
  `me_id` int(11) NOT NULL AUTO_INCREMENT,
  `me_codigo` int(11) DEFAULT NULL,
  `me_nombre` varchar(200) COLLATE utf8_spanish_ci DEFAULT NULL,
  `me_com_id` int(11) NOT NULL,
  `me_gru_id` int(11) NOT NULL,
  `me_pro_id` int(11) NOT NULL,
  `me_en_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`me_id`),
  KEY `fk_cdp_medicamento_cdp_compsicion1_idx` (`me_com_id`),
  KEY `fk_cdp_medicamento_cdp_grupo1_idx` (`me_gru_id`),
  KEY `fk_cdp_medicamento_cdp_proveedor1_idx` (`me_pro_id`),
  KEY `fk_cdp_medicamento_cdp_entradas1_idx` (`me_en_id`),
  CONSTRAINT `fk_cdp_medicamento_cdp_compsicion1` FOREIGN KEY (`me_com_id`) REFERENCES `cdp_composicion` (`com_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_cdp_medicamento_cdp_entradas1` FOREIGN KEY (`me_en_id`) REFERENCES `cdp_entradas` (`en_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_cdp_medicamento_cdp_grupo1` FOREIGN KEY (`me_gru_id`) REFERENCES `cdp_grupo` (`gru_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_cdp_medicamento_cdp_proveedor1` FOREIGN KEY (`me_pro_id`) REFERENCES `cdp_proveedor` (`pro_codigo`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cdp_medicamento`
--

LOCK TABLES `cdp_medicamento` WRITE;
/*!40000 ALTER TABLE `cdp_medicamento` DISABLE KEYS */;
INSERT INTO `cdp_medicamento` VALUES (2,45678,'Balsamico',3,3,2,1),(5,45678,'vick',2,3,2,1),(6,56789,'mentol',2,4,2,4),(7,87654321,'ibuprofeno',1,1,2,5),(8,87654321,'ibuprofeno',1,1,2,6);
/*!40000 ALTER TABLE `cdp_medicamento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cdp_programa`
--

DROP TABLE IF EXISTS `cdp_programa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cdp_programa` (
  `progra_id` int(11) NOT NULL AUTO_INCREMENT,
  `progra_nombre` varchar(100) COLLATE utf8_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`progra_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cdp_programa`
--

LOCK TABLES `cdp_programa` WRITE;
/*!40000 ALTER TABLE `cdp_programa` DISABLE KEYS */;
INSERT INTO `cdp_programa` VALUES (1,'Crónicos'),(3,'Oveginas'),(4,'CAF'),(5,'Prenatal'),(6,'Consulta general'),(7,'Leche'),(8,'Jornadas médicas');
/*!40000 ALTER TABLE `cdp_programa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cdp_proveedor`
--

DROP TABLE IF EXISTS `cdp_proveedor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cdp_proveedor` (
  `pro_codigo` int(11) NOT NULL AUTO_INCREMENT,
  `pro_nombre` varchar(100) COLLATE utf8_spanish_ci DEFAULT NULL,
  `pro_direccion` varchar(150) COLLATE utf8_spanish_ci DEFAULT NULL,
  `pro_telefono` int(11) DEFAULT NULL,
  PRIMARY KEY (`pro_codigo`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cdp_proveedor`
--

LOCK TABLES `cdp_proveedor` WRITE;
/*!40000 ALTER TABLE `cdp_proveedor` DISABLE KEYS */;
INSERT INTO `cdp_proveedor` VALUES (2,'marvin','guatemala',1234504),(3,'test','solola',45678);
/*!40000 ALTER TABLE `cdp_proveedor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cdp_salida`
--

DROP TABLE IF EXISTS `cdp_salida`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cdp_salida` (
  `sal_id` int(11) NOT NULL AUTO_INCREMENT,
  `sal_me_id` int(11) NOT NULL,
  `sal_progra_id` int(11) NOT NULL,
  `sal_cantidad` int(11) DEFAULT NULL,
  PRIMARY KEY (`sal_id`),
  KEY `fk_cdp_salida_cdp_medicamento1_idx` (`sal_me_id`),
  KEY `fk_cdp_salida_cdp_programa1_idx` (`sal_progra_id`),
  CONSTRAINT `fk_cdp_salida_cdp_medicamento1` FOREIGN KEY (`sal_me_id`) REFERENCES `cdp_medicamento` (`me_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_cdp_salida_cdp_programa1` FOREIGN KEY (`sal_progra_id`) REFERENCES `cdp_programa` (`progra_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cdp_salida`
--

LOCK TABLES `cdp_salida` WRITE;
/*!40000 ALTER TABLE `cdp_salida` DISABLE KEYS */;
INSERT INTO `cdp_salida` VALUES (3,2,7,6),(4,5,3,20),(5,6,3,9),(6,7,3,20);
/*!40000 ALTER TABLE `cdp_salida` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cdp_tipo`
--

DROP TABLE IF EXISTS `cdp_tipo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cdp_tipo` (
  `ti_id` int(11) NOT NULL AUTO_INCREMENT,
  `ti_nombre` varchar(100) COLLATE utf8_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`ti_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cdp_tipo`
--

LOCK TABLES `cdp_tipo` WRITE;
/*!40000 ALTER TABLE `cdp_tipo` DISABLE KEYS */;
INSERT INTO `cdp_tipo` VALUES (1,'administrador');
/*!40000 ALTER TABLE `cdp_tipo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cdp_usuario`
--

DROP TABLE IF EXISTS `cdp_usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cdp_usuario` (
  `us_id` int(11) NOT NULL AUTO_INCREMENT,
  `us_name` longtext COLLATE utf8_spanish_ci,
  `us_email` longtext COLLATE utf8_spanish_ci,
  `us_password` longtext COLLATE utf8_spanish_ci,
  `us_fecha_ingresado` date DEFAULT NULL,
  `us_ti_id` int(11) NOT NULL,
  PRIMARY KEY (`us_id`),
  KEY `fk_cdp_usuario_cdp_tipo1_idx` (`us_ti_id`),
  CONSTRAINT `fk_cdp_usuario_cdp_tipo1` FOREIGN KEY (`us_ti_id`) REFERENCES `cdp_tipo` (`ti_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cdp_usuario`
--

LOCK TABLES `cdp_usuario` WRITE;
/*!40000 ALTER TABLE `cdp_usuario` DISABLE KEYS */;
INSERT INTO `cdp_usuario` VALUES (1,'Mr. Admin','admin@example.com','7110eda4d09e062aa5e4a390b0a572ac0d2c0220','2018-08-30',1),(2,'Marvin','marvin@example.com','7110eda4d09e062aa5e4a390b0a572ac0d2c0220','2018-09-08',1);
/*!40000 ALTER TABLE `cdp_usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ci_sessions`
--

DROP TABLE IF EXISTS `ci_sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ci_sessions` (
  `id` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `ip_address` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `timestamp` int(10) unsigned NOT NULL DEFAULT '0',
  `data` blob NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ci_sessions_timestamp` (`timestamp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ci_sessions`
--

LOCK TABLES `ci_sessions` WRITE;
/*!40000 ALTER TABLE `ci_sessions` DISABLE KEYS */;
INSERT INTO `ci_sessions` VALUES ('01b412b310d0f2edc513249ec2650ec35d4a0764','::1',1539114369,'__ci_last_regenerate|i:1539114200;last_page|s:53:\"http://localhost/aselsi/index.php?/aselsi/medicamento\";admin_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:9:\"Mr. Admin\";login_type|s:6:\"Aselsi\";'),('0208638e21ee304c00881cc8c0fde47060f9b585','::1',1539202868,'__ci_last_regenerate|i:1539202862;last_page|s:53:\"http://localhost/aselsi/index.php?/aselsi/medicamento\";admin_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:9:\"Mr. Admin\";login_type|s:6:\"Aselsi\";'),('023f945765692ededf36f691449ac561895e3881','::1',1539442653,'__ci_last_regenerate|i:1539442356;last_page|s:48:\"http://localhost/aselsi/index.php?/aselsi/salida\";admin_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:9:\"Mr. Admin\";login_type|s:6:\"Aselsi\";'),('04df188fa8d0c8214354e0dbef808e0f1dc26477','::1',1539118799,'__ci_last_regenerate|i:1539118500;last_page|s:53:\"http://localhost/aselsi/index.php?/aselsi/medicamento\";admin_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:9:\"Mr. Admin\";login_type|s:6:\"Aselsi\";'),('04eeb3e216013fd3e3e8c565cbfa782f59b28883','::1',1539297519,'__ci_last_regenerate|i:1539297510;last_page|s:48:\"http://localhost/aselsi/index.php?/aselsi/salida\";admin_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:9:\"Mr. Admin\";login_type|s:6:\"Aselsi\";'),('059af87bcfc9f2ed19c464e0ddb397c183c3c609','::1',1537044725,'__ci_last_regenerate|i:1537044724;admin_login|s:1:\"1\";login_user_id|s:1:\"2\";name|s:6:\"Marvin\";login_type|s:6:\"Aselsi\";'),('06c8595329b0a3096e9e9744cfd9b6ea402fde13','::1',1538935198,'__ci_last_regenerate|i:1538934975;admin_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:9:\"Mr. Admin\";login_type|s:6:\"Aselsi\";'),('077bc83adb1f21072b3b26478e0eb7d42e011c77','::1',1539122138,'__ci_last_regenerate|i:1539121917;last_page|s:53:\"http://localhost/aselsi/index.php?/aselsi/medicamento\";admin_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:9:\"Mr. Admin\";login_type|s:6:\"Aselsi\";'),('0dcd31b77c77b1783086ac4ac5f38b20022a5152','::1',1539203289,'__ci_last_regenerate|i:1539203176;last_page|s:53:\"http://localhost/aselsi/index.php?/aselsi/medicamento\";admin_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:9:\"Mr. Admin\";login_type|s:6:\"Aselsi\";'),('104c9b77b465b9e09717ff42fd044c9857e7285c','::1',1538963286,'__ci_last_regenerate|i:1538962987;last_page|s:47:\"http://localhost/aselsi/index.php?/aselsi/grupo\";admin_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:9:\"Mr. Admin\";login_type|s:6:\"Aselsi\";'),('10b79735c89e86fbc058d01395b1ef8bd7837ebd','::1',1536826940,'__ci_last_regenerate|i:1536826757;admin_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:9:\"Mr. Admin\";login_type|s:6:\"Aselsi\";'),('116fb96268cab7a8c3bbc302989a4a9df855dc03','::1',1537343756,'__ci_last_regenerate|i:1537343734;last_page|s:51:\"http://localhost/aselsi/index.php?/aselsi/dashboard\";admin_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:9:\"Mr. Admin\";login_type|s:6:\"Aselsi\";'),('130f101e3e60276055228d1a0bbf93af19f1fa2d','::1',1537138801,'__ci_last_regenerate|i:1537138795;admin_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:9:\"Mr. Admin\";login_type|s:6:\"Aselsi\";'),('14a9d9f0ed3a62b526149c184eb788da16a834a7','::1',1539199488,'__ci_last_regenerate|i:1539199166;last_page|s:53:\"http://localhost/aselsi/index.php?/aselsi/medicamento\";admin_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:9:\"Mr. Admin\";login_type|s:6:\"Aselsi\";'),('15887a6b104a75be9776178c1c96a9ca8eb09032','::1',1536982394,'admin_login|s:1:\"1\";login_user_id|s:1:\"2\";name|s:6:\"Marvin\";login_type|s:6:\"Aselsi\";__ci_last_regenerate|i:1536982393;'),('15f2515d29f0b0c0bb414573c68adf0654315492','::1',1537117453,'__ci_last_regenerate|i:1537117432;admin_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:9:\"Mr. Admin\";login_type|s:6:\"Aselsi\";'),('169aa71751b628b98bcf4f3da0e3407f547f718d','::1',1536816029,'__ci_last_regenerate|i:1536815938;last_page|s:51:\"http://localhost/aselsi/index.php?/aselsi/dashboard\";admin_login|s:1:\"1\";login_user_id|s:1:\"2\";name|s:6:\"Marvin\";login_type|s:6:\"Aselsi\";'),('16c9755322b6c1e0c4089d44e45545777f3534e9','::1',1537052994,'__ci_last_regenerate|i:1537052946;admin_login|s:1:\"1\";login_user_id|s:1:\"2\";name|s:6:\"Marvin\";login_type|s:6:\"Aselsi\";'),('17a6856a5fad91de121ac0821e908e8ef6674c69','::1',1539120693,'__ci_last_regenerate|i:1539120465;last_page|s:53:\"http://localhost/aselsi/index.php?/aselsi/medicamento\";admin_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:9:\"Mr. Admin\";login_type|s:6:\"Aselsi\";'),('1807d2f912c191733bf8a2c6b386e1157c924490','::1',1539118163,'__ci_last_regenerate|i:1539117891;last_page|s:53:\"http://localhost/aselsi/index.php?/aselsi/medicamento\";admin_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:9:\"Mr. Admin\";login_type|s:6:\"Aselsi\";'),('1a85bd0772ef90f5d04546dc576f3a326b7dce1e','::1',1539209478,'__ci_last_regenerate|i:1539209087;last_page|s:53:\"http://localhost/aselsi/index.php?/aselsi/medicamento\";admin_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:9:\"Mr. Admin\";login_type|s:6:\"Aselsi\";'),('1ae99c8d5e0ada20180d7df627fb9990ced33abb','::1',1538962607,'__ci_last_regenerate|i:1538962324;last_page|s:47:\"http://localhost/aselsi/index.php?/aselsi/grupo\";admin_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:9:\"Mr. Admin\";login_type|s:6:\"Aselsi\";'),('1b0de4c60d07d4339e63b750ba78027c750ff5fa','::1',1539122373,'__ci_last_regenerate|i:1539122232;admin_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:9:\"Mr. Admin\";login_type|s:6:\"Aselsi\";'),('1cda5451976fb0387f6c08e36b411418e9f0023d','::1',1539207335,'__ci_last_regenerate|i:1539206879;last_page|s:53:\"http://localhost/aselsi/index.php?/aselsi/medicamento\";admin_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:9:\"Mr. Admin\";login_type|s:6:\"Aselsi\";'),('1f8865b4e608277bdbb1d5a01af6b69fbd725ea7','::1',1537051439,'__ci_last_regenerate|i:1537051379;admin_login|s:1:\"1\";login_user_id|s:1:\"2\";name|s:6:\"Marvin\";login_type|s:6:\"Aselsi\";'),('1fe8e5ebbefa2c485bd9e552a818790b0c0b45f8','::1',1539018767,'__ci_last_regenerate|i:1539018547;admin_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:9:\"Mr. Admin\";login_type|s:6:\"Aselsi\";'),('21a69844f9a490f64b9ccbd99c77d1abedf9ce0d','::1',1538964070,'__ci_last_regenerate|i:1538963932;last_page|s:47:\"http://localhost/aselsi/index.php?/aselsi/grupo\";admin_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:9:\"Mr. Admin\";login_type|s:6:\"Aselsi\";'),('26247a235254a187162d7fb57171abaf2a9fcfb2','::1',1539394084,'__ci_last_regenerate|i:1539393795;last_page|s:51:\"http://localhost/aselsi/index.php?/aselsi/dashboard\";admin_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:9:\"Mr. Admin\";login_type|s:6:\"Aselsi\";'),('319147534f4594b820e77e26b5249e420e8132cb','::1',1539123456,'__ci_last_regenerate|i:1539123180;admin_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:9:\"Mr. Admin\";login_type|s:6:\"Aselsi\";'),('34a5316ade810a85c68a79b14afa8961022d14a5','::1',1536827045,'__ci_last_regenerate|i:1536826991;last_page|s:51:\"http://localhost/aselsi/index.php?/aselsi/dashboard\";admin_login|s:1:\"1\";login_user_id|s:1:\"2\";name|s:6:\"Marvin\";login_type|s:6:\"Aselsi\";'),('35f0f5bb6020ebb32956cbe08456ea6286d26594','::1',1539197182,'__ci_last_regenerate|i:1539197129;last_page|s:53:\"http://localhost/aselsi/index.php?/aselsi/medicamento\";admin_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:9:\"Mr. Admin\";login_type|s:6:\"Aselsi\";'),('37c06e9f08e2288b2b4f2b7ea8d12a47c467e465','::1',1539199629,'__ci_last_regenerate|i:1539199509;last_page|s:53:\"http://localhost/aselsi/index.php?/aselsi/medicamento\";admin_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:9:\"Mr. Admin\";login_type|s:6:\"Aselsi\";'),('38878e8541dbd6d0c2e9602bc8cff62cfa2efdda','::1',1539293986,'__ci_last_regenerate|i:1539293695;last_page|s:48:\"http://localhost/aselsi/index.php?/aselsi/salida\";admin_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:9:\"Mr. Admin\";login_type|s:6:\"Aselsi\";'),('3c685027b2275580fa841df3e57c0747b5c4fd04','::1',1539296573,'__ci_last_regenerate|i:1539296438;last_page|s:48:\"http://localhost/aselsi/index.php?/aselsi/salida\";admin_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:9:\"Mr. Admin\";login_type|s:6:\"Aselsi\";'),('3cb90ca3efedc0f988bd11add37fb3380b344e41','::1',1536823588,'__ci_last_regenerate|i:1536823362;admin_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:9:\"Mr. Admin\";login_type|s:6:\"Aselsi\";'),('416d100a70d0215caa8f4db7708e7b05164a6a34','127.0.0.1',1536821279,'__ci_last_regenerate|i:1536821072;admin_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:9:\"Mr. Admin\";login_type|s:6:\"Aselsi\";'),('42fb54ad7aeb8b51750c379162ad65eefb5fc4d7','::1',1536820722,'__ci_last_regenerate|i:1536820636;last_page|s:51:\"http://localhost/aselsi/index.php?/aselsi/dashboard\";admin_login|s:1:\"1\";login_user_id|s:1:\"2\";name|s:6:\"Marvin\";login_type|s:6:\"Aselsi\";'),('437220d99ed98d91c18b5e2842fc7d4c6bcdb43f','::1',1537037613,'__ci_last_regenerate|i:1537037515;admin_login|s:1:\"1\";login_user_id|s:1:\"2\";name|s:6:\"Marvin\";login_type|s:6:\"Aselsi\";'),('4385c71596f8e0b0c568c1c12b72ca8b6cf0c933','::1',1536815934,'__ci_last_regenerate|i:1536815042;last_page|s:51:\"http://localhost/aselsi/index.php?/aselsi/dashboard\";admin_login|s:1:\"1\";login_user_id|s:1:\"2\";name|s:6:\"Marvin\";login_type|s:6:\"Aselsi\";'),('455da75ed23fd103fd8d76967308fda80d7653f0','::1',1536819694,'__ci_last_regenerate|i:1536819690;last_page|s:51:\"http://localhost/aselsi/index.php?/aselsi/dashboard\";admin_login|s:1:\"1\";login_user_id|s:1:\"2\";name|s:6:\"Marvin\";login_type|s:6:\"Aselsi\";'),('46b3932d00c4bf69ebb4c607297103b72cc28038','::1',1539119035,'__ci_last_regenerate|i:1539118819;last_page|s:53:\"http://localhost/aselsi/index.php?/aselsi/medicamento\";admin_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:9:\"Mr. Admin\";login_type|s:6:\"Aselsi\";'),('48c268834f722182f905daa5878c3ac30b08335b','::1',1539114962,'__ci_last_regenerate|i:1539114961;last_page|s:53:\"http://localhost/aselsi/index.php?/aselsi/medicamento\";admin_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:9:\"Mr. Admin\";login_type|s:6:\"Aselsi\";'),('4af7a6a99bd664f66a924bdab3c3b20f132c4927','::1',1539210819,'__ci_last_regenerate|i:1539210599;last_page|s:53:\"http://localhost/aselsi/index.php?/aselsi/medicamento\";admin_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:9:\"Mr. Admin\";login_type|s:6:\"Aselsi\";'),('4b22f22c793f321ca4e5395b5315975a7b2df3d6','::1',1539212866,'__ci_last_regenerate|i:1539212595;last_page|s:53:\"http://localhost/aselsi/index.php?/aselsi/medicamento\";admin_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:9:\"Mr. Admin\";login_type|s:6:\"Aselsi\";'),('4c88faff4ae36ce4d2a78a6dd36d20cd700df9df','::1',1537038373,'__ci_last_regenerate|i:1537038373;admin_login|s:1:\"1\";login_user_id|s:1:\"2\";name|s:6:\"Marvin\";login_type|s:6:\"Aselsi\";'),('4c98c06615233046281b1fca467e7c3e4b9c102f','::1',1539117199,'__ci_last_regenerate|i:1539117199;last_page|s:53:\"http://localhost/aselsi/index.php?/aselsi/medicamento\";admin_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:9:\"Mr. Admin\";login_type|s:6:\"Aselsi\";'),('4c9aaef55bcf4fa53505577ec804e55ad80b67b1','::1',1539211934,'__ci_last_regenerate|i:1539211918;last_page|s:53:\"http://localhost/aselsi/index.php?/aselsi/medicamento\";admin_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:9:\"Mr. Admin\";login_type|s:6:\"Aselsi\";'),('4e40eb68ce15ea7b2842c322eabefb28a52d9825','::1',1536814928,'__ci_last_regenerate|i:1536808933;last_page|s:51:\"http://localhost/aselsi/index.php?/aselsi/dashboard\";admin_login|s:1:\"1\";login_user_id|s:1:\"2\";name|s:6:\"Marvin\";login_type|s:6:\"Aselsi\";'),('531c97ca7e40ab7e2081ff9d22eb0882da95c925','::1',1539123079,'__ci_last_regenerate|i:1539122820;admin_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:9:\"Mr. Admin\";login_type|s:6:\"Aselsi\";'),('54e825a8c08f55ab05a2c34bb57cd9521917b9b7','::1',1539392692,'__ci_last_regenerate|i:1539389035;last_page|s:51:\"http://localhost/aselsi/index.php?/aselsi/dashboard\";admin_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:9:\"Mr. Admin\";login_type|s:6:\"Aselsi\";'),('5887e0eeb3563611049c2bdbb0992344664a324d','::1',1538936291,'__ci_last_regenerate|i:1538936004;admin_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:9:\"Mr. Admin\";login_type|s:6:\"Aselsi\";'),('590356e67c8fa9ad7b5779e2169d3de29763934c','::1',1538963523,'__ci_last_regenerate|i:1538963302;last_page|s:47:\"http://localhost/aselsi/index.php?/aselsi/grupo\";admin_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:9:\"Mr. Admin\";login_type|s:6:\"Aselsi\";'),('5b28303dd4d997f063369159b4559236fd7c5792','::1',1537657183,'admin_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:9:\"Mr. Admin\";login_type|s:6:\"Aselsi\";__ci_last_regenerate|i:1537656906;'),('61a2cb31b229192d597d5dd2da637feeac050fd6','::1',1539294365,'__ci_last_regenerate|i:1539294101;last_page|s:48:\"http://localhost/aselsi/index.php?/aselsi/salida\";admin_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:9:\"Mr. Admin\";login_type|s:6:\"Aselsi\";'),('6295b16e27f9407f695d61623d80c16da9f371a1','::1',1539394275,'__ci_last_regenerate|i:1539394096;last_page|s:51:\"http://localhost/aselsi/index.php?/aselsi/dashboard\";admin_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:9:\"Mr. Admin\";login_type|s:6:\"Aselsi\";'),('68cd9ca1a9bf33e7d1d24bc318ca8ae35a5e485e','::1',1539121115,'__ci_last_regenerate|i:1539120815;last_page|s:53:\"http://localhost/aselsi/index.php?/aselsi/medicamento\";admin_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:9:\"Mr. Admin\";login_type|s:6:\"Aselsi\";message|s:16:\"Creacion Exitosa\";__ci_vars|a:1:{s:7:\"message\";s:3:\"new\";}'),('696eab7220e6acc1226dd39cf5d334f37535c5af','::1',1539121784,'__ci_last_regenerate|i:1539121502;last_page|s:53:\"http://localhost/aselsi/index.php?/aselsi/medicamento\";admin_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:9:\"Mr. Admin\";login_type|s:6:\"Aselsi\";'),('69dead48a4a2de08d99dee07b76e66d22604df95','::1',1539121340,'__ci_last_regenerate|i:1539121137;last_page|s:53:\"http://localhost/aselsi/index.php?/aselsi/medicamento\";admin_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:9:\"Mr. Admin\";login_type|s:6:\"Aselsi\";'),('6ca3b02a0f0ac67c5af80e349377350a956b5414','::1',1539215508,'__ci_last_regenerate|i:1539215228;last_page|s:53:\"http://localhost/aselsi/index.php?/aselsi/medicamento\";admin_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:9:\"Mr. Admin\";login_type|s:6:\"Aselsi\";'),('6db77bcb6ad6f7d3bd265f1a54621e30d1a84e59','::1',1539196294,'__ci_last_regenerate|i:1539196032;last_page|s:53:\"http://localhost/aselsi/index.php?/aselsi/medicamento\";admin_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:9:\"Mr. Admin\";login_type|s:6:\"Aselsi\";'),('6e7a3bbd5487903db76cc15ae023d753169ed046','::1',1539298205,'__ci_last_regenerate|i:1539298088;last_page|s:48:\"http://localhost/aselsi/index.php?/aselsi/salida\";admin_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:9:\"Mr. Admin\";login_type|s:6:\"Aselsi\";'),('70cce33785758bd186725e6f45a36d8b5330c4d7','::1',1536901270,'__ci_last_regenerate|i:1536901249;'),('728b28dad40c43b08954015ed50ced61770b43df','::1',1536821780,'__ci_last_regenerate|i:1536821656;admin_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:9:\"Mr. Admin\";login_type|s:6:\"Aselsi\";'),('7338a30376997860f97b5559b9f9a881487ee887','::1',1537396827,'__ci_last_regenerate|i:1537396704;last_page|s:53:\"http://localhost/aselsi/index.php?/aselsi/medicamento\";admin_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:9:\"Mr. Admin\";login_type|s:6:\"Aselsi\";'),('79963107a2e7ce47d5601f83cf860aed7e5dd0eb','::1',1539293554,'__ci_last_regenerate|i:1539293324;last_page|s:48:\"http://localhost/aselsi/index.php?/aselsi/salida\";admin_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:9:\"Mr. Admin\";login_type|s:6:\"Aselsi\";'),('7ab77e04370a596aa7d57ae0c6ceb24a49148967','::1',1538962316,'__ci_last_regenerate|i:1538962021;last_page|s:47:\"http://localhost/aselsi/index.php?/aselsi/grupo\";admin_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:9:\"Mr. Admin\";login_type|s:6:\"Aselsi\";'),('7ba1223fcae35befd03bdf7b7e60b1595e1db6f6','::1',1539199852,'__ci_last_regenerate|i:1539199852;last_page|s:53:\"http://localhost/aselsi/index.php?/aselsi/medicamento\";admin_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:9:\"Mr. Admin\";login_type|s:6:\"Aselsi\";'),('7bc0b7be0efc0811d2fc843e6dd4b35147b5a6ef','::1',1536825042,'__ci_last_regenerate|i:1536824916;admin_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:9:\"Mr. Admin\";login_type|s:6:\"Aselsi\";'),('7c2f3a2d680c2fe9dbfffa6d86ce2e109ee69434','::1',1536817384,'__ci_last_regenerate|i:1536817190;last_page|s:51:\"http://localhost/aselsi/index.php?/aselsi/dashboard\";admin_login|s:1:\"1\";login_user_id|s:1:\"2\";name|s:6:\"Marvin\";login_type|s:6:\"Aselsi\";'),('7d9eef268bdb5dcc18243667ab3319ce28199b2a','::1',1538868190,'__ci_last_regenerate|i:1538868123;admin_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:9:\"Mr. Admin\";login_type|s:6:\"Aselsi\";'),('7dd558387cec39d3a87809a135872079ff65e1b2','::1',1537419474,'__ci_last_regenerate|i:1537419467;last_page|s:53:\"http://localhost/aselsi/index.php?/aselsi/composicion\";'),('80b359b8de198dca312bb30b8b016d08310f3f8b','::1',1537037155,'__ci_last_regenerate|i:1537036891;admin_login|s:1:\"1\";login_user_id|s:1:\"2\";name|s:6:\"Marvin\";login_type|s:6:\"Aselsi\";'),('825cab5910e9265cad413e0a4b6bf1a2d69cbb7f','::1',1537051745,'__ci_last_regenerate|i:1537051707;admin_login|s:1:\"1\";login_user_id|s:1:\"2\";name|s:6:\"Marvin\";login_type|s:6:\"Aselsi\";message|s:16:\"Creacion Exitosa\";__ci_vars|a:1:{s:7:\"message\";s:3:\"old\";}'),('882c57931eb96a0b4180beefb2ac953191f7d1cc','::1',1536827935,'__ci_last_regenerate|i:1536827533;last_page|s:51:\"http://localhost/aselsi/index.php?/aselsi/dashboard\";admin_login|s:1:\"1\";login_user_id|s:1:\"2\";name|s:6:\"Marvin\";login_type|s:6:\"Aselsi\";'),('8ac34d3bb62365c9e27a0b8e2db7d9dfb6cb57a8','::1',1536818097,'__ci_last_regenerate|i:1536817881;last_page|s:51:\"http://localhost/aselsi/index.php?/aselsi/dashboard\";admin_login|s:1:\"1\";login_user_id|s:1:\"2\";name|s:6:\"Marvin\";login_type|s:6:\"Aselsi\";'),('8ae014ad442ed7f555bc0d3f15c503bd391dda1b','::1',1539393380,'__ci_last_regenerate|i:1539393100;last_page|s:51:\"http://localhost/aselsi/index.php?/aselsi/dashboard\";admin_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:9:\"Mr. Admin\";login_type|s:6:\"Aselsi\";'),('8b82a973f98ddf3a182d03eb1bd13f67617f2403','::1',1539116889,'__ci_last_regenerate|i:1539116739;last_page|s:53:\"http://localhost/aselsi/index.php?/aselsi/medicamento\";admin_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:9:\"Mr. Admin\";login_type|s:6:\"Aselsi\";'),('8be025e1ab2c2cfad322082444f262b737d3c9d4','::1',1539117858,'__ci_last_regenerate|i:1539117575;last_page|s:53:\"http://localhost/aselsi/index.php?/aselsi/medicamento\";admin_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:9:\"Mr. Admin\";login_type|s:6:\"Aselsi\";'),('8d6c9fe188000fb3c92c428eae0784135b9fb98d','::1',1539297321,'__ci_last_regenerate|i:1539297095;last_page|s:48:\"http://localhost/aselsi/index.php?/aselsi/salida\";admin_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:9:\"Mr. Admin\";login_type|s:6:\"Aselsi\";'),('8f250156e32f2b82d98d35d8833316d362146f7a','::1',1539215205,'__ci_last_regenerate|i:1539214905;last_page|s:53:\"http://localhost/aselsi/index.php?/aselsi/medicamento\";admin_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:9:\"Mr. Admin\";login_type|s:6:\"Aselsi\";'),('92ea7c0fd6bd66f63f0fa4b0a23f7af34500b8e7','::1',1537052460,'__ci_last_regenerate|i:1537052183;admin_login|s:1:\"1\";login_user_id|s:1:\"2\";name|s:6:\"Marvin\";login_type|s:6:\"Aselsi\";'),('95230e8ad1087d41e6416ed6b9108e1a0ffdaa15','::1',1536826201,'__ci_last_regenerate|i:1536825597;admin_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:9:\"Mr. Admin\";login_type|s:6:\"Aselsi\";'),('9831d69c5f53062879ed45326d9ad0a6a852e373','::1',1539119474,'__ci_last_regenerate|i:1539119460;last_page|s:53:\"http://localhost/aselsi/index.php?/aselsi/medicamento\";admin_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:9:\"Mr. Admin\";login_type|s:6:\"Aselsi\";'),('98dd57653fccd5271e78bc2250bff924c6e40967','::1',1539210595,'__ci_last_regenerate|i:1539209816;last_page|s:53:\"http://localhost/aselsi/index.php?/aselsi/medicamento\";admin_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:9:\"Mr. Admin\";login_type|s:6:\"Aselsi\";'),('98eca6c62beb696ea67dc7d8143655881cd0f8a9','::1',1539229798,'__ci_last_regenerate|i:1539229734;last_page|s:53:\"http://localhost/aselsi/index.php?/aselsi/medicamento\";admin_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:9:\"Mr. Admin\";login_type|s:6:\"Aselsi\";'),('9b8f66d30e57976964c6a0901ef1bc4ae9f3f9f8','::1',1536822827,'__ci_last_regenerate|i:1536822548;admin_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:9:\"Mr. Admin\";login_type|s:6:\"Aselsi\";'),('9d1789dba2033ac4ccf08fcf1294353541257a20','::1',1539214538,'__ci_last_regenerate|i:1539213428;last_page|s:53:\"http://localhost/aselsi/index.php?/aselsi/medicamento\";admin_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:9:\"Mr. Admin\";login_type|s:6:\"Aselsi\";'),('9d2e5f2303ce7e73e74ae7123a8ace15c0106813','::1',1538935595,'__ci_last_regenerate|i:1538935334;admin_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:9:\"Mr. Admin\";login_type|s:6:\"Aselsi\";'),('9d40688acf5ea265fc87cb5eef37f95f9343e082','::1',1536824216,'__ci_last_regenerate|i:1536823972;admin_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:9:\"Mr. Admin\";login_type|s:6:\"Aselsi\";'),('9eaed06a0e4e94d4cc94f3fffcfedbd44b623316','::1',1537718656,''),('9f889194300ab45bf82a2f6192452dd64aacace7','::1',1539439059,'__ci_last_regenerate|i:1539438998;last_page|s:48:\"http://localhost/aselsi/index.php?/aselsi/salida\";admin_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:9:\"Mr. Admin\";login_type|s:6:\"Aselsi\";'),('9ffaab823373dd4c4218e4b26bcac778bf42da02','::1',1536983364,'admin_login|s:1:\"1\";login_user_id|s:1:\"2\";name|s:6:\"Marvin\";login_type|s:6:\"Aselsi\";__ci_last_regenerate|i:1536983349;'),('a2be52e30d75aad8b6fc3a73b42809f476d53e5c','::1',1537396637,'__ci_last_regenerate|i:1537396382;last_page|s:53:\"http://localhost/aselsi/index.php?/aselsi/medicamento\";admin_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:9:\"Mr. Admin\";login_type|s:6:\"Aselsi\";'),('a3233d79bd14b2863502f4f23c67af0c040c12e7','::1',1539215696,'__ci_last_regenerate|i:1539215696;last_page|s:53:\"http://localhost/aselsi/index.php?/aselsi/medicamento\";admin_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:9:\"Mr. Admin\";login_type|s:6:\"Aselsi\";'),('a3f73d1922684de9c02c4d23e783fde3311af817','::1',1539196903,'__ci_last_regenerate|i:1539196438;last_page|s:53:\"http://localhost/aselsi/index.php?/aselsi/medicamento\";admin_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:9:\"Mr. Admin\";login_type|s:6:\"Aselsi\";'),('a4ea8a6ac58553e01bff2e569ca3f61ee4347779','::1',1539442011,'__ci_last_regenerate|i:1539441819;last_page|s:48:\"http://localhost/aselsi/index.php?/aselsi/salida\";admin_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:9:\"Mr. Admin\";login_type|s:6:\"Aselsi\";'),('a7b3a4e0f049ddfb525cdf7890fd67a427151008','::1',1536819324,'__ci_last_regenerate|i:1536819041;last_page|s:51:\"http://localhost/aselsi/index.php?/aselsi/dashboard\";admin_login|s:1:\"1\";login_user_id|s:1:\"2\";name|s:6:\"Marvin\";login_type|s:6:\"Aselsi\";'),('aa05c91b43408cc1d7da75466be8697735882af6','::1',1536824701,'__ci_last_regenerate|i:1536824597;admin_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:9:\"Mr. Admin\";login_type|s:6:\"Aselsi\";'),('ab074a1afa19c4cd39864409afbf1acbe71c5c2e','::1',1539292581,'__ci_last_regenerate|i:1539292345;last_page|s:48:\"http://localhost/aselsi/index.php?/aselsi/salida\";admin_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:9:\"Mr. Admin\";login_type|s:6:\"Aselsi\";'),('acc2a10d8cb969e60d8e2d8d7eb154a9d187b628','::1',1537718658,'__ci_last_regenerate|i:1537718656;last_page|s:50:\"http://localhost/aselsi/index.php?/aselsi/programa\";'),('add6d88b46769ca053be2d57d6d800f7b60abdc7','::1',1539211873,'__ci_last_regenerate|i:1539211383;last_page|s:53:\"http://localhost/aselsi/index.php?/aselsi/medicamento\";admin_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:9:\"Mr. Admin\";login_type|s:6:\"Aselsi\";'),('adf1ed9adfe2b84fb9da36f7d08e428f7b74566b','::1',1538966869,'__ci_last_regenerate|i:1538966869;last_page|s:47:\"http://localhost/aselsi/index.php?/aselsi/grupo\";admin_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:9:\"Mr. Admin\";login_type|s:6:\"Aselsi\";'),('ae7c943c156c7c2690e20e4918c70e12c7924170','::1',1539116500,'__ci_last_regenerate|i:1539116409;last_page|s:53:\"http://localhost/aselsi/index.php?/aselsi/medicamento\";admin_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:9:\"Mr. Admin\";login_type|s:6:\"Aselsi\";'),('af184ce24a634a16791c56b9d4a306ba2853912a','::1',1539213380,'__ci_last_regenerate|i:1539213104;last_page|s:53:\"http://localhost/aselsi/index.php?/aselsi/medicamento\";admin_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:9:\"Mr. Admin\";login_type|s:6:\"Aselsi\";'),('af64be86585907a3285b6f22e1b0087c78127a08','::1',1537134194,'__ci_last_regenerate|i:1537134194;admin_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:9:\"Mr. Admin\";login_type|s:6:\"Aselsi\";'),('b274d1d6805d6a4c3f846e3cf03ab653a1ea80f1','::1',1538962933,'__ci_last_regenerate|i:1538962643;last_page|s:47:\"http://localhost/aselsi/index.php?/aselsi/grupo\";admin_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:9:\"Mr. Admin\";login_type|s:6:\"Aselsi\";'),('b5ea823382c308a35fe9703105983033568fb97a','::1',1539062142,'__ci_last_regenerate|i:1539061847;last_page|s:51:\"http://localhost/aselsi/index.php?/aselsi/dashboard\";admin_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:9:\"Mr. Admin\";login_type|s:6:\"Aselsi\";'),('b6059b165a46c91f591b1fba1b6d38c6676ae81b','::1',1537052540,'__ci_last_regenerate|i:1537052499;admin_login|s:1:\"1\";login_user_id|s:1:\"2\";name|s:6:\"Marvin\";login_type|s:6:\"Aselsi\";'),('b9060bd8c3e24bc8b7a79983764341ae1b296500','::1',1539211001,'__ci_last_regenerate|i:1539211001;last_page|s:53:\"http://localhost/aselsi/index.php?/aselsi/medicamento\";admin_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:9:\"Mr. Admin\";login_type|s:6:\"Aselsi\";'),('b91aaf6f0205aa74de12380ec2fec95924fa2b9d','::1',1536819617,'__ci_last_regenerate|i:1536819372;last_page|s:51:\"http://localhost/aselsi/index.php?/aselsi/dashboard\";admin_login|s:1:\"1\";login_user_id|s:1:\"2\";name|s:6:\"Marvin\";login_type|s:6:\"Aselsi\";'),('bcfa9266f7993bf98a8534be6e6e7dea351f2429','::1',1538964974,'__ci_last_regenerate|i:1538964849;last_page|s:47:\"http://localhost/aselsi/index.php?/aselsi/grupo\";admin_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:9:\"Mr. Admin\";login_type|s:6:\"Aselsi\";'),('bf3adb38278ed19761f9d68e8aa93b53c2046f10','::1',1537035861,'__ci_last_regenerate|i:1537033223;admin_login|s:1:\"1\";login_user_id|s:1:\"2\";name|s:6:\"Marvin\";login_type|s:6:\"Aselsi\";'),('bff1f834cf179d37cbb21bb5e0ac65ffa49a5ca2','::1',1539195499,'__ci_last_regenerate|i:1539195488;last_page|s:53:\"http://localhost/aselsi/index.php?/aselsi/medicamento\";admin_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:9:\"Mr. Admin\";login_type|s:6:\"Aselsi\";'),('c74ab77ffc99886f8a56a311c0f96e191e752c7a','::1',1539120460,'__ci_last_regenerate|i:1539119843;last_page|s:53:\"http://localhost/aselsi/index.php?/aselsi/medicamento\";admin_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:9:\"Mr. Admin\";login_type|s:6:\"Aselsi\";'),('ca33b041abe885beeb8fd1550f91308bd35c3ea4','::1',1538936893,'__ci_last_regenerate|i:1538936801;admin_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:9:\"Mr. Admin\";login_type|s:6:\"Aselsi\";'),('ca50445e18f41fc1248ae3af0fc56baa18df035c','::1',1538936691,'__ci_last_regenerate|i:1538936392;admin_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:9:\"Mr. Admin\";login_type|s:6:\"Aselsi\";'),('ceb72a5bbdf8e46bc9a6eaa1d1255a8b7410cc64','::1',1536828375,'__ci_last_regenerate|i:1536827945;last_page|s:51:\"http://localhost/aselsi/index.php?/aselsi/dashboard\";admin_login|s:1:\"1\";login_user_id|s:1:\"2\";name|s:6:\"Marvin\";login_type|s:6:\"Aselsi\";'),('d1936561034cdad8cace4013d278a8571cf24771','::1',1536823108,'__ci_last_regenerate|i:1536822850;admin_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:9:\"Mr. Admin\";login_type|s:6:\"Aselsi\";'),('d5d6b8009b67d99062a311b1be748a660efce91a','::1',1536825593,'__ci_last_regenerate|i:1536825246;admin_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:9:\"Mr. Admin\";login_type|s:6:\"Aselsi\";'),('d69b4988f7ba8b26a87bc709083b0bf960f20f40','::1',1539209799,'__ci_last_regenerate|i:1539209505;last_page|s:53:\"http://localhost/aselsi/index.php?/aselsi/medicamento\";admin_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:9:\"Mr. Admin\";login_type|s:6:\"Aselsi\";'),('d837fb46e2f0cba86fa1dc8b99df7cde90a80351','::1',1537128651,'__ci_last_regenerate|i:1537128631;admin_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:9:\"Mr. Admin\";login_type|s:6:\"Aselsi\";'),('d986acb5717b7dc5d9650cf5c1c0e15d04b6d18b','::1',1536826685,'__ci_last_regenerate|i:1536826263;admin_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:9:\"Mr. Admin\";login_type|s:6:\"Aselsi\";'),('d9d40bd0871f3061dbffbb688f1c1cc22588ed6e','::1',1537655298,'admin_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:9:\"Mr. Admin\";login_type|s:6:\"Aselsi\";__ci_last_regenerate|i:1537655152;'),('dbb9684f3d2e2fd20bed507558ecff5397082642','::1',1539208168,'__ci_last_regenerate|i:1539208031;last_page|s:53:\"http://localhost/aselsi/index.php?/aselsi/medicamento\";admin_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:9:\"Mr. Admin\";login_type|s:6:\"Aselsi\";'),('dfdcdcd5cbcfdbea6a24c62a37d6971ac26dd882','::1',1539292920,'__ci_last_regenerate|i:1539292695;last_page|s:48:\"http://localhost/aselsi/index.php?/aselsi/salida\";admin_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:9:\"Mr. Admin\";login_type|s:6:\"Aselsi\";'),('e0049310f114561027c454e6ee129109fd3b23d5','::1',1537656891,'admin_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:9:\"Mr. Admin\";login_type|s:6:\"Aselsi\";__ci_last_regenerate|i:1537656590;message|s:16:\"Settings Updated\";__ci_vars|a:1:{s:7:\"message\";s:3:\"old\";}'),('e68ca0ce364dad63aec1b9347e04a7309df403d4','::1',1536818769,'__ci_last_regenerate|i:1536818474;last_page|s:51:\"http://localhost/aselsi/index.php?/aselsi/dashboard\";admin_login|s:1:\"1\";login_user_id|s:1:\"2\";name|s:6:\"Marvin\";login_type|s:6:\"Aselsi\";'),('e8d11e70c4a63c70152e6765ed1173a290582e36','::1',1536817812,'__ci_last_regenerate|i:1536817548;last_page|s:51:\"http://localhost/aselsi/index.php?/aselsi/dashboard\";admin_login|s:1:\"1\";login_user_id|s:1:\"2\";name|s:6:\"Marvin\";login_type|s:6:\"Aselsi\";'),('e9c4b9ef761da863a851fdfb832965a14957b569','::1',1538964439,'__ci_last_regenerate|i:1538964436;last_page|s:47:\"http://localhost/aselsi/index.php?/aselsi/grupo\";admin_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:9:\"Mr. Admin\";login_type|s:6:\"Aselsi\";'),('ecaefb28d4dcd9e27978bd796a66e84109813802','::1',1539439502,'__ci_last_regenerate|i:1539439311;last_page|s:48:\"http://localhost/aselsi/index.php?/aselsi/salida\";admin_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:9:\"Mr. Admin\";login_type|s:6:\"Aselsi\";'),('ed2bf4116e3b4caec9c796e0d2d0ff23ae52a083','::1',1539294956,'__ci_last_regenerate|i:1539294956;last_page|s:48:\"http://localhost/aselsi/index.php?/aselsi/salida\";admin_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:9:\"Mr. Admin\";login_type|s:6:\"Aselsi\";'),('f03d3e4b9063de0f3503212d50d03d3ad4047f4a','::1',1538935921,'__ci_last_regenerate|i:1538935687;admin_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:9:\"Mr. Admin\";login_type|s:6:\"Aselsi\";'),('fa26dfd28fb2432bfc7267d94c42b6f4d710c1f0','::1',1539207760,'__ci_last_regenerate|i:1539207407;last_page|s:53:\"http://localhost/aselsi/index.php?/aselsi/medicamento\";admin_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:9:\"Mr. Admin\";login_type|s:6:\"Aselsi\";'),('fc2757d9ccacbfe73b55ba3bf34edf37688be0ad','::1',1537393204,'__ci_last_regenerate|i:1537393180;last_page|s:53:\"http://localhost/aselsi/index.php?/aselsi/medicamento\";admin_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:9:\"Mr. Admin\";login_type|s:6:\"Aselsi\";'),('fd1a4b825e15988fd82a05e42b73a045a8b8b681','::1',1539293139,'__ci_last_regenerate|i:1539293014;last_page|s:48:\"http://localhost/aselsi/index.php?/aselsi/salida\";admin_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:9:\"Mr. Admin\";login_type|s:6:\"Aselsi\";');
/*!40000 ALTER TABLE `ci_sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `crg_language`
--

DROP TABLE IF EXISTS `crg_language`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `crg_language` (
  `la_id` int(11) NOT NULL AUTO_INCREMENT,
  `la_frase` longtext COLLATE utf8_unicode_ci,
  `la_english` longtext COLLATE utf8_unicode_ci,
  `la_spanish` longtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`la_id`)
) ENGINE=MyISAM AUTO_INCREMENT=179 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `crg_language`
--

LOCK TABLES `crg_language` WRITE;
/*!40000 ALTER TABLE `crg_language` DISABLE KEYS */;
INSERT INTO `crg_language` VALUES (1,'login','Login','Iniciar Sesión'),(2,'forgot_password','Forgot Password','¿Has Olvidado Tu Contraseña'),(3,'reset_password','Reset Password','Restablecer contraseña'),(4,'return_to_login_page','Return To Login Page','Volver a Página Inicio'),(5,'admin_dashboard','Admin Dashboard','Dashboard de Administración'),(6,'welcome','Welcome','Bienvenid@'),(7,'edit_profile','Edit Profile','Editar Perfil'),(8,'change_password','Change Password','Cambiar Contraseña'),(9,'dashboard','Dashboard','Salpicadero'),(10,'department','Department','Departamento'),(11,'settings','Settings','Ajustes'),(12,'system_settings','System Settings','Configuración del Sistema'),(13,'language_settings','Language Settings','Configuración de Idioma'),(14,'account','Account','Cuenta'),(15,'payment','Payment','Pago'),(16,'delete','Delete','Borrar'),(17,'cancel','Cancel','Cancelar'),(18,'add_department','Add Department','Agregar Departamento'),(19,'name','Name','Nombre'),(20,'description','Description','Descripción'),(21,'options','Options','Opciones'),(22,'add_doctor','Add Doctor','Añadir Médico'),(23,'image','Image','Imagen'),(24,'email','Email','Correo electrónico'),(25,'address','Address','Dirección'),(26,'phone','Phone','Teléfono'),(27,'profile','Profile','Perfil'),(28,'edit_department','Edit Department','Editar Departamento'),(29,'password','Password','Contraseña'),(30,'select_department','Select Department','Seleccione Departamento'),(31,'edit_doctor','Edit Doctor','Editar Médico'),(32,'add_patient','Add Patient','Añadir Paciente'),(33,'sex','Sex','Sexo'),(34,'birth_date','Birth Date','Fecha de Nacimiento'),(35,'age','Age','Edad'),(36,'blood_group','Blood Group','Grupo Sanguíneo'),(37,'select_sex','Select Sex','Seleccionar Sexo'),(38,'male','Male','Masculino'),(39,'female','Female','Femenino'),(40,'select_blood_group','Select Blood Group','Seleccionar grupo sanguíneo'),(41,'title','Title','Título'),(42,'creation_date','Creation Date','Fecha de Creación'),(43,'due_date','Due Date','Fecha de Vencimiento'),(44,'vat_percentage','Vat Percentage','Vat Porcentaje'),(45,'salida','Output','Salida'),(46,'status','Status','Estado'),(47,'bed_number','Bed Number','Número de cama'),(48,'bed_type','Bed Type','Tipo Bed'),(49,'allotment_time','Allotment Time','Asignación Tiempo'),(50,'discharge_time','Discharge Time','Tiempo de descarga'),(51,'issue_date','Issue Date','Fecha de Asunto'),(52,'payment_to','Payment To','Pago Para'),(53,'bill_to','Bill To','Cobrar a'),(54,'invoice_entries','Invoice Entries','Entradas Factura'),(55,'entry','Entry','Entrada'),(56,'price','Price','Precio'),(57,'sub_total','Sub Total','Sub Total'),(58,'discount','Discount','Descuento'),(59,'grand_total','Grand Total','Gran Total'),(60,'date','Date','Fecha'),(61,'amount','Amount','Cantidad'),(62,'method','Method','Método'),(63,'last_donation_date','Last Donation Date','Última Donación Fecha'),(64,'medicine_category','Medicine Category','Medicina Categoría'),(65,'manufacturing_company','Manufacturing Company','Empresa de Producción'),(66,'system_name','System Name','Nombre del Sistema'),(67,'system_title','System Title','Sistema Título'),(68,'paypal_email','Paypal Email','PayPal Correo electrónico'),(69,'currency','Currency','Moneda'),(70,'system_email','System Email','Sistema Electrónico'),(71,'buyer','Buyer','Comprador'),(72,'value_required','Value Required','Valor Obligatorio'),(73,'purchase_code','Purchase Code','Código de Compra'),(74,'language','Language','Idioma'),(75,'text_align','Text Align','Texto Alinear'),(76,'save','Save','Guardar'),(77,'manage_language','Manage Language','Administrar Idioma'),(78,'phrase_list','Phrase List','Lista Frase'),(79,'add_phrase','Add Phrase','Agregar Frase'),(80,'add_language','Add Language','Agregar Idioma'),(81,'option','Option','Opción'),(82,'edit_phrase','Edit Phrase','Editar Frase'),(83,'delete_language','Delete Language','Eliminar Idioma'),(84,'phrase','Phrase','Frase'),(85,'update_phrase','Update Phrase','Actualización Frase'),(86,'manage_profile','Manage Profile','Administrar Perfil'),(87,'update_profile','Update Profile','Actualizar Perfil'),(88,'current_password','Current Password','Contraseña Actual'),(89,'new_password','New Password','Nueva Contraseña'),(90,'confirm_new_password','Confirm New Password','Confirmar Nueva Contraseña'),(91,'update_password','Update Password','Actualizar Contraseña'),(92,'profile_info_updated_successfuly','Profile Info Updated Successfuly','Información del Perfil Actualizado Exitosamente'),(93,'doctor_dashboard','Doctor Dashboard','Médico Dashboard'),(94,'appointment','Appointment','Nombramiento'),(95,'prescription','Prescription','Receta'),(96,'report','Report','Informe'),(97,'appointment_schedule','Appointment Schedule','Programar una Cita'),(98,'add_appointment','Add Appointment','Añadir Cita'),(99,'event_schedule','Event Schedule','Calendario de Eventos'),(100,'select_patient','Select Patient','Seleccionar paciente'),(101,'edit_appointment','Edit Appointment','Modificar cita'),(102,'add_prescription','Add Prescription','Agregar Receta'),(103,'case_history','Case History','Case History'),(104,'medication','Medication','Medicación'),(105,'note','Note','Nota'),(106,'edit_prescription','Edit Prescription','Editar Prescription'),(107,'report_type','Report Type','Tipo de Informe'),(108,'document_type','Document Type','Tipo de Documento'),(109,'download','Download','Descargar'),(110,'add_diagnosis_report','Add Diagnosis Report','Añadir Informe de Diagnóstico'),(111,'select_report_type','Select Report Type','Seleccione el tipo de informe'),(112,'xray','Xray','Radiografía'),(113,'blood_test','Blood Test','Análisis de sangre'),(114,'document','Document','Documento'),(115,'select_document_type','Select Document Type','Seleccionar tipo de documento'),(116,'doc','Doc','Doctor'),(117,'pdf','Pdf','Pdf'),(118,'excel','Excel','Sobresalir'),(119,'other','Other','Otro'),(120,'add_bed_allotment','Add Bed Allotment','Añadir Asignación Cama'),(121,'select_bed_number','Select Bed Number','Seleccione un número de cama'),(122,'edit_bed_allotment','Edit Bed Allotment','Editar Bed Loteo'),(123,'blood_donor_list','Blood Donor List','Lista de Donación de Sangre'),(124,'blood_bank_status','Blood Bank Status','Estado del Banco de Sangre'),(125,'add_report','Add Report','Añadir Reportar'),(126,'operation','Operation','Operación'),(127,'birth','Birth','Nacimiento'),(128,'death','Death','Muerte'),(129,'type','Type','Tipo'),(130,'select_type','Select Type','Seleccionar tipo'),(131,'edit_report','Edit Report','Editar informe'),(132,'old_password','Old Password','Contraseña anterior'),(133,'pharmacist_dashboard','Pharmacist Dashboard','Dashboard Farmacéutico'),(134,'select_status','Select Status','Seleccione Estado'),(135,'available','Available','Disponible'),(136,'unavailable','Unavailable','Indisponible'),(137,'edit_medicine','Edit Medicine','Editar Medicina'),(138,'add_medicine_category','Add Medicine Category','Añadir Medicina Categoría'),(139,'edit_medicine_category','Edit Medicine Category','Editar Medicina Categoría'),(140,'laboratorist_dashboard','Laboratorist Dashboard','Dashboard de Laboratorio'),(141,'accountant_dashboard','Accountant Dashboard','Dashboard Contador'),(142,'add_invoice','Add Invoice','Agregar Factura'),(143,'manage_invoice','Manage Invoice','Administrar Factura'),(144,'invoice_title','Invoice Title','Factura Título'),(145,'select_a_patient','Select A Patient','Seleccione un paciente'),(146,'payment_status','Payment Status','El estado del pedido'),(147,'select_a_status','Select A Status','Seleccione un Estado'),(148,'paid','Paid','Pagado'),(149,'unpaid','Unpaid','No pagado'),(150,'invoice_entry','Invoice Entry','Entrada de facturas'),(151,'add_invoice_entry','Add Invoice Entry','Añadir entrada Factura'),(152,'create_new_invoice','Create New Invoice','Crear Nueva factura'),(153,'edit_invoice','Edit Invoice','Editar Factura'),(154,'update_invoice','Update Invoice','Actualización Factura'),(155,'update','Update','Actualizar'),(156,'edit','Edit','Editar'),(157,'update_product','Update Producto','Actualizar Producto'),(158,'file','File','Archivo'),(159,'install_update','Install Update','Instalar Actualización'),(160,'language_list','Language List','Lista de Idiomas'),(161,'log_out','Log Out','Cerrar Sesión'),(162,'client','Client','Cliente'),(163,'add_client','Add Client','Agregar Cliente'),(164,'product','Product','Producto'),(165,'programa','Program','Programa'),(166,'lending','Lending','Préstamo'),(167,'approval_request','Approval Request','Aprovación de Solicitud'),(168,'account','Account','Cuenta'),(169,'user','User','Usuario'),(170,'programa','',''),(171,'grupo','Group','Grupo'),(172,'composicion','Composition','Composición'),(173,'medicamento','Medicament','Medicamento'),(174,'donante','Donor','Donante'),(175,'reporte','Report','Reporte'),(176,'usuario','User','Usuario'),(177,'proveedor','Provider','Proveedor'),(178,'report','report','reporte');
/*!40000 ALTER TABLE `crg_language` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `crg_settings`
--

DROP TABLE IF EXISTS `crg_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `crg_settings` (
  `se_id` int(11) NOT NULL AUTO_INCREMENT,
  `se_type` longtext,
  `se_descripcion` longtext,
  PRIMARY KEY (`se_id`)
) ENGINE=MyISAM AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `crg_settings`
--

LOCK TABLES `crg_settings` WRITE;
/*!40000 ALTER TABLE `crg_settings` DISABLE KEYS */;
INSERT INTO `crg_settings` VALUES (1,'system_name','CORAZON DEL PADRE'),(2,'system_title','CORAZON DEL PADRE'),(3,'address',NULL),(4,'phone',NULL),(5,'paypal_email','donative@example.com'),(6,'currency','usd'),(7,'system_email','info@example.com'),(8,'buyer',NULL),(9,'purchase_code',NULL),(11,'language','la_spanish'),(12,'text_align','left-to-right'),(13,'system_currency_id','1');
/*!40000 ALTER TABLE `crg_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `crg_system`
--

DROP TABLE IF EXISTS `crg_system`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `crg_system` (
  `sys_id` int(11) NOT NULL AUTO_INCREMENT,
  `sys_nombre` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  `sys_contacto` int(11) DEFAULT NULL,
  `sys_correo` varchar(150) COLLATE utf8_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`sys_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `crg_system`
--

LOCK TABLES `crg_system` WRITE;
/*!40000 ALTER TABLE `crg_system` DISABLE KEYS */;
/*!40000 ALTER TABLE `crg_system` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-10-13  9:33:52
