/*
SQLyog Ultimate v11.11 (64 bit)
MySQL - 5.5.5-10.4.21-MariaDB : Database - sofser
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`sofser` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `sofser`;

/*Table structure for table `compra` */

DROP TABLE IF EXISTS `compra`;

CREATE TABLE `compra` (
  `idCompra` bigint(11) NOT NULL AUTO_INCREMENT,
  `fechaCompra` datetime NOT NULL,
  `totalCompra` bigint(11) NOT NULL,
  `proveedor_idProveedor` bigint(11) NOT NULL,
  PRIMARY KEY (`idCompra`),
  KEY `proveedor_idProveedor` (`proveedor_idProveedor`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

/*Data for the table `compra` */

insert  into `compra`(`idCompra`,`fechaCompra`,`totalCompra`,`proveedor_idProveedor`) values (1,'2021-12-01 16:41:31',4000,0),(2,'2021-12-01 16:49:19',10000,0),(3,'2021-12-01 16:49:42',4000,0),(4,'2021-12-01 16:50:04',4000,0),(5,'2021-12-01 16:51:19',4000,0),(6,'2021-12-01 16:52:10',4000,0),(8,'2021-12-01 17:50:40',10000,0);

/*Table structure for table `producto` */

DROP TABLE IF EXISTS `producto`;

CREATE TABLE `producto` (
  `idProducto` bigint(20) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(300) NOT NULL,
  `codigoBarras` varchar(30) NOT NULL,
  `precio` bigint(10) NOT NULL,
  `ubicacion` varchar(30) NOT NULL,
  `perecedero` varchar(20) NOT NULL,
  `empresa` varchar(300) NOT NULL,
  `fechaEntrada` date DEFAULT NULL,
  `fechaVencimiento` date NOT NULL,
  `existencia` bigint(11) NOT NULL,
  `stockMinimo` bigint(11) NOT NULL,
  `stockBasico` bigint(11) NOT NULL,
  `stockMaximo` bigint(11) NOT NULL,
  PRIMARY KEY (`idProducto`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

/*Data for the table `producto` */

insert  into `producto`(`idProducto`,`nombre`,`codigoBarras`,`precio`,`ubicacion`,`perecedero`,`empresa`,`fechaEntrada`,`fechaVencimiento`,`existencia`,`stockMinimo`,`stockBasico`,`stockMaximo`) values (11,'gfagdsa','48',2000,'Bodega','Si','12',NULL,'2021-11-01',13,10,15,20),(12,'prueba','132465',2000,'','Si','dsadsa',NULL,'3453-04-25',305,10,15,20);

/*Table structure for table `producto_compra` */

DROP TABLE IF EXISTS `producto_compra`;

CREATE TABLE `producto_compra` (
  `idProducto_compra` bigint(11) NOT NULL AUTO_INCREMENT,
  `producto_idProducto` bigint(11) NOT NULL,
  `cantidad` varchar(30) NOT NULL,
  `compra_idCompra` bigint(11) NOT NULL,
  `proveedor_idProveedor` bigint(11) NOT NULL,
  PRIMARY KEY (`idProducto_compra`),
  KEY `venta_idventa` (`compra_idCompra`),
  KEY `producto_idProducto` (`producto_idProducto`),
  KEY `proveedor_idProveedor` (`proveedor_idProveedor`),
  CONSTRAINT `producto_compra_ibfk_1` FOREIGN KEY (`compra_idCompra`) REFERENCES `compra` (`idCompra`),
  CONSTRAINT `producto_compra_ibfk_2` FOREIGN KEY (`producto_idProducto`) REFERENCES `producto` (`idProducto`),
  CONSTRAINT `producto_compra_ibfk_3` FOREIGN KEY (`proveedor_idProveedor`) REFERENCES `proveedores` (`idProveedor`),
  CONSTRAINT `producto_compra_ibfk_4` FOREIGN KEY (`proveedor_idProveedor`) REFERENCES `proveedores` (`idProveedor`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

/*Data for the table `producto_compra` */

insert  into `producto_compra`(`idProducto_compra`,`producto_idProducto`,`cantidad`,`compra_idCompra`,`proveedor_idProveedor`) values (2,12,'5',8,8);

/*Table structure for table `producto_venta` */

DROP TABLE IF EXISTS `producto_venta`;

CREATE TABLE `producto_venta` (
  `idProducto_venta` bigint(11) NOT NULL AUTO_INCREMENT,
  `producto_idProducto` bigint(11) NOT NULL,
  `cantidad` varchar(30) NOT NULL,
  `venta_idVenta` bigint(11) NOT NULL,
  `proveedor_idProveedor` bigint(11) NOT NULL,
  PRIMARY KEY (`idProducto_venta`),
  KEY `producto_idProducto` (`producto_idProducto`),
  KEY `venta_idventa` (`venta_idVenta`),
  KEY `proveedor_idProveedor` (`proveedor_idProveedor`),
  CONSTRAINT `producto_venta_ibfk_1` FOREIGN KEY (`producto_idProducto`) REFERENCES `producto` (`idProducto`),
  CONSTRAINT `producto_venta_ibfk_2` FOREIGN KEY (`venta_idventa`) REFERENCES `venta` (`idVenta`),
  CONSTRAINT `producto_venta_ibfk_3` FOREIGN KEY (`proveedor_idProveedor`) REFERENCES `proveedores` (`idProveedor`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

/*Data for the table `producto_venta` */

insert  into `producto_venta`(`idProducto_venta`,`producto_idProducto`,`cantidad`,`venta_idVenta`,`proveedor_idProveedor`) values (15,12,'3',24,8),(16,12,'5',25,8),(17,12,'5',26,8),(18,12,'2',27,8),(19,12,'35',28,8),(20,12,'354',29,8);

/*Table structure for table `proveedores` */

DROP TABLE IF EXISTS `proveedores`;

CREATE TABLE `proveedores` (
  `idProveedor` bigint(11) NOT NULL AUTO_INCREMENT,
  `documentoProveedor` int(11) NOT NULL,
  `nombreProveedor` varchar(100) NOT NULL,
  `empresaProveedor` varchar(100) NOT NULL,
  `codigoEmpresa` varchar(30) NOT NULL,
  PRIMARY KEY (`idProveedor`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

/*Data for the table `proveedores` */

insert  into `proveedores`(`idProveedor`,`documentoProveedor`,`nombreProveedor`,`empresaProveedor`,`codigoEmpresa`) values (8,123464,'aaaaa','dsadsa','4564312');

/*Table structure for table `usuario` */

DROP TABLE IF EXISTS `usuario`;

CREATE TABLE `usuario` (
  `idUsuario` int(11) NOT NULL AUTO_INCREMENT,
  `usuario` varchar(30) NOT NULL,
  `cedula` varchar(12) NOT NULL,
  `correo` varchar(80) NOT NULL,
  `password` varchar(130) NOT NULL,
  `last_session` datetime DEFAULT NULL,
  `token` varchar(40) NOT NULL,
  `token_password` varchar(100) DEFAULT NULL,
  `password_request` int(11) DEFAULT 0,
  `estado` varchar(7) NOT NULL DEFAULT 'Activo',
  PRIMARY KEY (`idUsuario`)
) ENGINE=InnoDB AUTO_INCREMENT=80 DEFAULT CHARSET=utf8;

/*Data for the table `usuario` */

insert  into `usuario`(`idUsuario`,`usuario`,`cedula`,`correo`,`password`,`last_session`,`token`,`token_password`,`password_request`,`estado`) values (76,'Juan','','rrejuancho1999@gmail.com','$2y$10$5uvOTDazyGACs1wHXfFCyeIGSLMzQKGONofLZEtlPYTDQufhYscge','2021-10-10 18:10:43','9e823c93c11fd13292e8dfdeee81726a','',0,'Activo'),(77,'brandon','1073668158','example@gmail.com','$2y$10$.rqd4.lnyDos3oGDE.K5dutDpVPTcVdOZahaNFex7I0yRU8RacisC','2021-11-25 16:43:32','1','',0,'Activo'),(79,'brandon','1073668158','jdsoa@gmail.com','$2y$10$auKMg2ZAxkw1TXUJdLhf5eSkexMIUT54tW5O5n5uGi.NW0aeWR6b2',NULL,'170',NULL,0,'Activo');

/*Table structure for table `venta` */

DROP TABLE IF EXISTS `venta`;

CREATE TABLE `venta` (
  `idVenta` bigint(11) NOT NULL AUTO_INCREMENT,
  `fechaVenta` datetime NOT NULL,
  `totalVenta` bigint(11) NOT NULL,
  `proveedor_idProveedor` bigint(11) NOT NULL,
  PRIMARY KEY (`idVenta`),
  KEY `proveedor_idProveedor` (`proveedor_idProveedor`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8;

/*Data for the table `venta` */

insert  into `venta`(`idVenta`,`fechaVenta`,`totalVenta`,`proveedor_idProveedor`) values (24,'2021-12-01 17:50:15',6000,0),(25,'2021-12-01 17:50:59',10000,0),(26,'2021-12-01 17:51:52',10000,0),(27,'2021-12-01 17:55:54',4000,0),(28,'2021-12-01 17:59:47',70000,0),(29,'2021-12-01 18:00:01',708000,0);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
