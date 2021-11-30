<html id="prueba">

<?php
include_once '../../Resource/Header/Header_Index2.php';
include_once '../../Resource/Header/Menu_Nav2.php';
require '../../Model/Conexion.php';
require '../../Model/base_de_datos.php';
require '../../Model/Conexion2.php';
include_once '../../Controller/userInfo.php';
include_once '../../Controller/funcs.php';
?>
<?php

$sentencia = $base_de_datos->query("SELECT venta.totalVenta, venta.fechaVenta, venta.idVenta, GROUP_CONCAT(	producto.codigoBarras, '..',  producto.nombre, '..', producto_venta.cantidad SEPARATOR '__') AS producto FROM venta INNER JOIN producto_venta ON producto_venta.venta_idventa = venta.idVenta INNER JOIN producto ON producto.idProducto = producto_venta.producto_idProducto GROUP BY venta.idVenta ORDER BY venta.idVenta;");
$venta = $sentencia->fetchAll(PDO::FETCH_OBJ);
?>

<body style="background-color: #fff;overflow: hidden !important;">
	<?php
	?>
	<div class="container-fluid">
		<div class="row">
			<div class="col">
				<br>
			</div>
		</div>
		<div class="row">
			<div class="col-8">
				<div class="container-fluid">

					<div class="col-xs-12">
						<h4 style="background-color: #006666; color:#ffffff; padding:13px; text-align:center;">REGISTRO DE VENTAS</h4>
						<br>
						<table class="table">
							<thead class="thead-dark">
								<tr>
									<th>Número</th>
									<th>Fecha</th>
									<th>producto vendidos</th>
									<th>Total</th>
									<th>Descargar</th>
									<th>Eliminar</th>
								</tr>
							</thead>
							<tbody>
								<?php foreach ($venta as $venta) { ?>
									<tr>
										<td><?php echo $venta->id ?></td>
										<td><?php echo $venta->fecha ?></td>
										<td>
											<table class="table ">
												<thead class="thead-dark">
													<tr>
														<th>Código</th>
														<th>Descripción</th>
														<th>Cantidad</th>
													</tr>
												</thead>
												<tbody>
													<?php foreach (explode("__", $venta->producto) as $productoConcatenados) {
														$producto = explode("..", $productoConcatenados)
													?>
														<tr>
															<td><?php echo $producto[0] ?></td>
															<td><?php echo $producto[1] ?></td>
															<td><?php echo $producto[2] ?></td>
														</tr>
													<?php } ?>
												</tbody>
											</table>
										</td>
										<td><?php echo $venta->total ?></td>
										<td><a class="btn btn-primary" href="<?php echo "pdf/index.php?id=" . $venta->id ?>"><i class="fa fa-file-pdf-o" aria-hidden="true"></i></a></td>
										<td><a class="btn btn-danger" href="<?php echo "Controladores/producto/eliminarVenta.php?id=" . $venta->id ?>"><i class="fa fa-trash"></i></a></td>
									</tr>
								<?php } ?>
							</tbody>
						</table>
						<div>
							<a class="btn btn-success   btn-block" href="create.php" style="background-color: #006666;">NUEVO </a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

</body>

</html>