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

/*Table structure for table `compras` */

DROP TABLE IF EXISTS `compras`;

CREATE TABLE `compras` (
  `idVenta` bigint(11) NOT NULL AUTO_INCREMENT,
  `fechaCompra` datetime NOT NULL,
  `totalCompra` float(6,2) NOT NULL,
  `proveedor_idProveedor` bigint(11) NOT NULL,
  PRIMARY KEY (`idVenta`),
  KEY `proveedor_idProveedor` (`proveedor_idProveedor`),
  CONSTRAINT `compras_ibfk_1` FOREIGN KEY (`proveedor_idProveedor`) REFERENCES `proveedores` (`idProveedor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `compras` */

/*Table structure for table `producto` */

DROP TABLE IF EXISTS `producto`;

CREATE TABLE `producto` (
  `idProducto` bigint(22) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(300) NOT NULL,
  `codigoBarras` int(30) NOT NULL,
  `precio` int(10) NOT NULL,
  `ubicacion` varchar(30) NOT NULL,
  `perecedero` varchar(20) NOT NULL,
  `empresa` varchar(300) NOT NULL,
  `fechaEntrada` date DEFAULT NULL,
  `fechaVencimiento` date NOT NULL,
  `existencia` int(11) NOT NULL,
  `stockMinimo` int(11) NOT NULL,
  `stockBasico` int(11) NOT NULL,
  `stockMaximo` int(11) NOT NULL,
  PRIMARY KEY (`idProducto`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

/*Data for the table `producto` */

insert  into `producto`(`idProducto`,`nombre`,`codigoBarras`,`precio`,`ubicacion`,`perecedero`,`empresa`,`fechaEntrada`,`fechaVencimiento`,`existencia`,`stockMinimo`,`stockBasico`,`stockMaximo`) values (11,'gfagdsa',48,2000,'Vitrina','Si','12',NULL,'2021-11-01',45,689,85,23);

/*Table structure for table `producto_venta` */

DROP TABLE IF EXISTS `producto_venta`;

CREATE TABLE `producto_venta` (
  `idProducto_venta` bigint(11) NOT NULL AUTO_INCREMENT,
  `producto_idProducto` bigint(11) NOT NULL,
  `cantidad` varchar(30) NOT NULL,
  `venta_idventa` bigint(11) NOT NULL,
  PRIMARY KEY (`idProducto_venta`),
  KEY `producto_idProducto` (`producto_idProducto`),
  KEY `venta_idventa` (`venta_idventa`),
  CONSTRAINT `producto_venta_ibfk_1` FOREIGN KEY (`producto_idProducto`) REFERENCES `producto` (`idProducto`),
  CONSTRAINT `producto_venta_ibfk_2` FOREIGN KEY (`venta_idventa`) REFERENCES `compras` (`idVenta`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `producto_venta` */

/*Table structure for table `proveedores` */

DROP TABLE IF EXISTS `proveedores`;

CREATE TABLE `proveedores` (
  `idProveedor` bigint(11) NOT NULL AUTO_INCREMENT,
  `documentoProveedor` int(11) NOT NULL,
  `nombreProveedor` varchar(100) NOT NULL,
  `empresaProveedor` varchar(100) NOT NULL,
  `codigoEmpresa` varchar(30) NOT NULL,
  PRIMARY KEY (`idProveedor`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

/*Data for the table `proveedores` */

insert  into `proveedores`(`idProveedor`,`documentoProveedor`,`nombreProveedor`,`empresaProveedor`,`codigoEmpresa`) values (2,123464,'fds','dsadsa','587587');

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

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
