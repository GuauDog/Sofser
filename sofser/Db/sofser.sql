/*
SQLyog Ultimate v11.11 (64 bit)
MySQL - 5.5.5-10.4.18-MariaDB : Database - farmaday
*********************************************************************
*/


/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`sofser` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;

USE `sofser`;

/*Table structure for table `dcconsentimiento` */

DROP TABLE IF EXISTS `dcconsentimiento`;

CREATE TABLE `dcconsentimiento` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `cargo` varchar(100) NOT NULL,
  `nomPaciente` varchar(100) NOT NULL,
  `firmPaciente` varchar(100) NOT NULL,
  `tpDocument` varchar(50) NOT NULL,
  `cedula` varchar(20) NOT NULL,
  `nombreAcargo` varchar(100) NOT NULL,
  `firmaCargo` varchar(100) NOT NULL,
  `fechaRegistro` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

/*Data for the table `dcconsentimiento` */

insert  into `dcconsentimiento`(`id`,`nombre`,`cargo`,`nomPaciente`,`firmPaciente`,`tpDocument`,`cedula`,`nombreAcargo`,`firmaCargo`,`fechaRegistro`) values (6,'Juan','Sebastian','Juan Cardenas','sebas','Tipo de Documento','1003652437','Doctor','Doctor2021','2021-10-10 20:01:19');

/*Table structure for table `iva` */

DROP TABLE IF EXISTS `iva`;

CREATE TABLE `iva` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(11) NOT NULL,
  `codigo_Iva` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

/*Data for the table `iva` */

insert  into `iva`(`id`,`nombre`,`codigo_Iva`) values (3,'Medicamento','0.16');

/*Table structure for table `productos` */

DROP TABLE IF EXISTS `productos`;

CREATE TABLE `productos` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `codigo` varchar(255) NOT NULL,
  `descripcion` varchar(255) NOT NULL,
  `precioVenta` float(6,2) NOT NULL,
  `precioCompra` float(6,2) NOT NULL,
  `existencia` varchar(20) NOT NULL,
  `id_iva` bigint(20) DEFAULT NULL,
  `fechaVencimiento` date DEFAULT NULL,
  `registroInvima` int(20) DEFAULT NULL,
  `valor_uno` float(6,2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_iva` (`id_iva`),
  CONSTRAINT `productos_ibfk_1` FOREIGN KEY (`id_iva`) REFERENCES `iva` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

/*Data for the table `productos` */

insert  into `productos`(`id`,`codigo`,`descripcion`,`precioVenta`,`precioCompra`,`existencia`,`id_iva`,`fechaVencimiento`,`registroInvima`,`valor_uno`) values (13,'1212','Vitamina',1000.00,50.00,'8',3,'2021-10-09',1231312,2.00),(14,'1515','Dolex',1000.00,50.00,'10',3,'2021-10-09',1231312,NULL);

/*Table structure for table `productos_vendidos` */

DROP TABLE IF EXISTS `productos_vendidos`;

CREATE TABLE `productos_vendidos` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `id_producto` bigint(20) unsigned NOT NULL,
  `cantidad` varchar(20) NOT NULL,
  `id_venta` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_producto` (`id_producto`),
  KEY `id_venta` (`id_venta`),
  CONSTRAINT `productos_vendidos_ibfk_1` FOREIGN KEY (`id_producto`) REFERENCES `productos` (`id`) ON DELETE CASCADE,
  CONSTRAINT `productos_vendidos_ibfk_2` FOREIGN KEY (`id_venta`) REFERENCES `ventas` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;

/*Data for the table `productos_vendidos` */

insert  into `productos_vendidos`(`id`,`id_producto`,`cantidad`,`id_venta`) values (23,13,'1',23),(24,14,'1',23);

/*Table structure for table `usuario` */

DROP TABLE IF EXISTS `usuario`;

CREATE TABLE `usuario` (
  `idUsuario` int(11) NOT NULL AUTO_INCREMENT,
  `usuario` varchar(30) NOT NULL,
  `genero` varchar(11) NOT NULL,
  `telefono` varchar(15) NOT NULL,
  `estado` varchar(7) NOT NULL DEFAULT 'Activo',
  `fechaNacimiento` date DEFAULT NULL,
  `tpDocumento` varchar(20) NOT NULL,
  `cedula` varchar(12) NOT NULL,
  `password` varchar(130) NOT NULL,
  `nombreUsuario` varchar(100) NOT NULL,
  `apellido` varchar(100) NOT NULL,
  `correo` varchar(80) NOT NULL,
  `last_session` datetime DEFAULT NULL,
  `activacion` int(11) NOT NULL DEFAULT 0,
  `token` varchar(40) NOT NULL,
  `token_password` varchar(100) DEFAULT NULL,
  `password_request` int(11) DEFAULT 0,
  PRIMARY KEY (`idUsuario`)
) ENGINE=InnoDB AUTO_INCREMENT=77 DEFAULT CHARSET=utf8;

/*Data for the table `usuario` */

insert  into `usuario`(`idUsuario`,`usuario`,`genero`,`telefono`,`estado`,`fechaNacimiento`,`tpDocumento`,`cedula`,`password`,`nombreUsuario`,`apellido`,`correo`,`last_session`,`activacion`,`token`,`token_password`,`password_request`) values (76,'Juan','','','Activo',NULL,'','','$2y$10$5uvOTDazyGACs1wHXfFCyeIGSLMzQKGONofLZEtlPYTDQufhYscge','Juan','','rrejuancho1999@gmail.com','2021-10-10 18:10:43',0,'9e823c93c11fd13292e8dfdeee81726a','',0);

/*Table structure for table `ventas` */

DROP TABLE IF EXISTS `ventas`;

CREATE TABLE `ventas` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `fecha` datetime NOT NULL,
  `total` float(6,2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;

/*Data for the table `ventas` */

insert  into `ventas`(`id`,`fecha`,`total`) values (3,'2021-10-09 20:48:38',12.00),(4,'2021-10-09 20:51:17',0.00),(8,'2021-10-09 23:29:45',1160.00),(10,'2021-10-09 23:33:59',1160.00),(11,'2021-10-09 23:34:59',1160.00),(16,'2021-10-10 00:08:29',1160.00),(23,'2021-10-11 02:46:39',2320.00);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
