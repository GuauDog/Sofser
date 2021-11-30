<html id="prueba">
<!-- <link rel="icon" type="image/png" href="Recursos/Imagenes/LOGO PASION DEPORTIVA COMPLETO2.png"/> -->

<?php
include_once '../../Resource/Header/Header_Index2.php';
include_once '../../Resource/Header/Menu_Nav2.php';
require '../../Model/Conexion.php';
require '../../Model/base_de_datos.php';
require '../../Model/Conexion2.php';
include_once '../../Controller/userInfo.php';
include_once '../../Controller/funcs.php';
?>




<body style="background-color: #fff;overflow: hidden !important;">

    <div class="container-fluid">
        <div class="row">
            <div class="col">
                <br>
            </div>
        </div>
        <div class="row">

            <div class="col-2">

            </div>

            <div class="col-8">
                <div class="container-fluid">
                    <h4 style="background-color: #006666; color:#ffffff; padding:13px; text-align:center;">BUSQUEDA DE PRODUCTOS</h4>
                    <br>
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


                    <form method="post" action="../../Controller/vender/agregarAlCarrito.php">

                        <label for="codigo">Codigo de barras:</label>
                        <input autocomplete="off" autofocus class="form-control" name="codigo" required type="text" id="codigo">

                        <label for="proveedor">Proveedor:</label>
                        <input type="text" name="proveedor" id="proveedor" class="form-control" required>

                        <label for="cantidad">Cantidad:</label>
                        <input type="text" name="cantidad" id="cantidad" class="form-control" required>

                        <br>
                        <button type="submit" class="btn btn-primary">Agregar</button>
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
                                    <td><?php echo $producto->codigoBarras ?></td>
                                    <td><?php echo $producto->nombre ?></td>
                                    <td><?php echo $producto->precio ?></td>
                                    <td><?php echo $producto->cantidad ?></td>
                                    <td><?php echo $producto->total ?></td>
                                    <td><a class="btn btn-danger" href="<?php echo "../../Controller/vender/quitarDelCarrito.php?indice=" . $indice ?>"><i class="fa fa-trash"></i></a></td>
                                </tr>
                            <?php } ?>
                        </tbody>
                    </table>

                    <h4>TOTAL: <?php if (!isset($granTotal)) {
                                    $granTotal = 0;
                                    echo $granTotal;
                                } else {
                                    echo $granTotal;
                                }  ?></h4>
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


</body>

</html>