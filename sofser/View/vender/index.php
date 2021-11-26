<html id="prueba">
<!-- <link rel="icon" type="image/png" href="Recursos/Imagenes/LOGO PASION DEPORTIVA COMPLETO2.png"/> -->
<?php
include_once "Modelo/base_de_datos.php";
$sentencia = $base_de_datos->query("SELECT * FROM productos INNER JOIN iva ON iva.`id`=productos.id_iva INNER JOIN productos_vendidos ON productos_vendidos.`id_venta`");
$productos = $sentencia->fetchAll(PDO::FETCH_OBJ);
?>

<?php
// <!-- Headers -->
include_once './Vista/HeadersDashboard.php';

require 'Modelo/Conexion.php';
require 'Controladores/funcs.php';

// print_r($la);die;
if (!isset($_SESSION["id_usuario"])) {
    header('Location:index.php');
}
require 'Controladores//Cont_Perfil_User.php';
?>
<?php
include_once './Vista/MenuNav.php';
?>


<body style="background-color: #fff;overflow: hidden !important;">

    <div class="container-fluid">
        <div class="row">
            <div class="col">
                <br>
            </div>
        </div>
        <div class="row">

            <?php include './Vista/MenuLateral.php';?>
            <div class="col-8">
                <div class="container-fluid">
                    <h4 style="background-color: #006666; color:#ffffff; padding:13px; text-align:center;">BUSQUEDA DE PRODUCTOS</h4>
                    <br>
                    <?php
                    if (!isset($_SESSION["carrito"])) $_SESSION["carrito"] = [];
                    $granTotal = 0;
                    ?>

                    <?php
                    if (isset($_GET["status"])) {
                        if ($_GET["status"] === "1") {
                    ?>
                            <div class="alert alert-success">
                                <strong>¡Correcto!</strong> Venta realizada correctamente
                            </div>
                        <?php
                        } else if ($_GET["status"] === "2") {
                        ?>
                            <div class="alert alert-info">
                                <strong>Venta cancelada</strong>
                            </div>
                        <?php
                        } else if ($_GET["status"] === "3") {
                        ?>
                            <div class="alert alert-info">
                                <strong>Ok</strong> Producto quitado de la lista
                            </div>
                        <?php
                        } else if ($_GET["status"] === "4") {
                        ?>
                            <div class="alert alert-warning">
                                <strong>Error:</strong> El producto que buscas no existe
                            </div>
                        <?php
                        } else if ($_GET["status"] === "5") {
                        ?>
                            <div class="alert alert-danger">
                                <strong>Error: </strong>El producto está agotado
                            </div>
                        <?php
                        } else {
                        ?>
                            <div class="alert alert-danger">
                                <strong>Error:</strong> Algo salió mal mientras se realizaba la venta
                            </div>
                    <?php
                        }
                    }
                    ?>
                    <form method="post" action="Controladores/agregarAlCarrito.php">
                        <!-- <label for="codigo">Código de barras:</label> -->
                        <input autocomplete="off" autofocus class="form-control" name="codigo" required type="text" id="codigo" placeholder="Escribe el código de Barras...">
                    </form>

                    <table class="table">
                        <thead class="thead-dark">
                            <tr>
                                <th>Código</th>
                                <th>Descripción</th>
                                <th>Precio de venta</th>
                                <th>Cantidad</th>
                                <th>Total</th>
                                <th>Quitar</th>
                            </tr>
                        </thead>
                        <tbody>
                            <?php foreach ($_SESSION["carrito"] as $indice => $producto) {
                                $granTotal += $producto->total;

                            ?>
                                <tr>
                                    <td><?php echo $producto->codigo ?></td>
                                    <td><?php echo $producto->descripcion ?></td>
                                    <td><?php echo $producto->precioVenta ?></td>
                                    <td><?php echo $producto->cantidad ?></td>
                                    <td><?php echo $producto->total ?></td>
                                    <td><a class="btn btn-danger" href="<?php echo "quitarDelCarrito.php?indice=" . $indice ?>"><i class="fa fa-trash"></i></a></td>
                                </tr>
                            <?php } ?>
                        </tbody>
                    </table>

                    <h4>TOTAL: <?php echo $granTotal; ?></h4>
                    <form action="Controladores/terminarVenta.php" method="POST">
                        <input name="total" type="hidden" value="<?php echo $granTotal; ?>">
                        <button type="submit" class="btn btn text-white" style="background-color: #006666;">Terminar venta</button>
                        <a href="./cancelarVenta.php" class="btn btn-dark">Cancelar venta</a>
                    </form>
                </div>
            </div>
        </div>
    </div>
    </div>
    <!-- Footer -->
    <?php include 'Vista/Footer_Princ.php'; ?>
    <!-- Footer Principal -->

</body>

</html>