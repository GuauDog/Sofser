<?php
if (!isset($_POST["codigo"]) || !isset($_POST["proveedor"]) || !isset($_POST["cantidad"])) {
    return;
}
require '../../Model/base_de_datos.php';
$codigo = $_POST["codigo"];
$cantidad = $_POST["cantidad"];
$prov = $_POST["proveedor"];
$sentencia = $base_de_datos->prepare("SELECT * FROM producto  WHERE codigoBarras = ?  LIMIT 1;");
$sentencia->execute([$codigo]);
$producto = $sentencia->fetch(PDO::FETCH_OBJ);

// print_r($prov);die;
if ($prov) {
    $sentencia = $base_de_datos->prepare("SELECT * FROM proveedores WHERE idProveedor = ?  LIMIT 1;");
    $sentencia->execute([$prov]);
    $proveedor = $sentencia->fetch(PDO::FETCH_OBJ);
}
// print_r($idv);die;
# Si no existe, salimos y lo indicamos
if (!$producto) {
    header("Location: ../../View/vender/create.php?status=4");
    exit;
}
# Si no hay existencia...
if ($producto->existencia < $cantidad) {
    header("Location: ../../View/vender/create.php?status=5");
    exit;
}
session_start();
# Buscar producto dentro del cartito
$indice = false;
for ($i = 0; $i < count($_SESSION["carrito"]); $i++) {
    if ($_SESSION["carrito"][$i]->codigoBarras === $codigo) {
        $indice = $i;
        break;
    }
}
# Si no existe, lo agregamos como nuevo
if ($indice === false) {
    $producto->cantidad = $cantidad;
    $total = $producto->precio * $cantidad;
    $producto->total = $total;

    array_push($_SESSION["carrito"], $producto);
} else {
    # Si ya existe, se agrega la cantidad
    # Pero espera, tal vez ya no haya
    $cantidadExistente = $_SESSION["carrito"][$indice]->cantidad;
    # si al sumarle uno supera lo que existe, no se agrega
    if ($cantidadExistente + 1 > $producto->existencia) {
        header("Location: ../../View/vender/create.php?status=5");
        exit;
    }
    $_SESSION["carrito"][$indice]->cantidad++;
    $_SESSION["carrito"][$indice]->total = $_SESSION["carrito"][$indice]->total + $_SESSION["carrito"][$indice]->valor_uno;
}
header("Location: ../../View/vender/create.php");
