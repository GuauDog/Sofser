<?php
#Salir si alguno de los datos no está presente
if (
	!isset($_POST["documento"]) ||
	!isset($_POST["nombre"]) ||
	!isset($_POST["empresa"]) ||
	!isset($_POST["codigoEmpresa"])
) exit();
#Si todo va bien, se ejecuta esta parte del código...

include_once "../../Model/base_de_datos.php";

$documento = $_POST["documento"];
$nombre = $_POST["nombre"];
$empresa = $_POST["empresa"];
$codigoEmpresa = $_POST["codigoEmpresa"];

$sentencia = $base_de_datos->prepare("INSERT INTO proveedores(documentoProveedor, nombreProveedor, empresaProveedor, codigoEmpresa) VALUES (?,?,?,?);");
$resultado = $sentencia->execute([$documento, $nombre, $empresa, $codigoEmpresa]);

if ($resultado === TRUE) {
	header("Location: ../../View/proveedores/read.php");
	exit;
} else echo "Algo salió mal.";
