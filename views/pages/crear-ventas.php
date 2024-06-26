<!-- Main Container -->
<main id="main-container">
	<!-- Page Content -->
	<div class="content">
		<div class="text-center mb-3">
			<h1 class="h3 fw-extrabold mb-1">Añadir Ventas</h1>
			<h2 class="fs-sm fw-medium text-muted mb-0">Repuestos</h2>
		</div>

		<div class="row justify-content-center">
			<div class="col-12">
				<div class="row">

					<!-- Lado izquierdo form -->
					<!-- Formulario para Iniciar la Venta -->
					<div class="col-md-5">
						<div class="block block-rounded block-bordered">
							<div class="block-content">
								<form id="formIniciarVenta" class="formularioVenta">
									<div class="mb-4">
										<div class="input-group">
											<span class="input-group-text">Usuario</span>
											<input type="text" class="form-control" id="nuevoVendedor" name="nuevoVendedor" value="<?php echo $_SESSION["users"]["nombre_usuario"] ?>" readonly>
											<input type="hidden" id="idVendedor" name="idVendedor" value="<?php echo $_SESSION["users"]["id_usuario"] ?>">
										</div>
									</div>
									<div class="mb-4">
										<div class="input-group">
											<span class="input-group-text">Código Venta</span>
											<?php
											$item = null;
											$valor = null;
											$ventas = ControladorVentas::ctrMostrarVentas($item, $valor);
											if (!$ventas) {
												echo '<input type="text" class="form-control" id="codigoVenta" name="codigoVenta" value="1001" readonly>';
											} else {
												$codigo = $ventas[0]["codigo_venta"] + 1;
												echo '<input type="text" class="form-control" id="codigoVenta" name="codigoVenta" value="' . $codigo . '" readonly>';
											}
											?>
										</div>
									</div>
									<div class="mb-4">
										<div class="input-group">
											<span class="input-group-text">Cliente</span>
											<select class="form-select" id="agregarCliente" name="agregarCliente" required>
												<option selected disabled>Elije un Cliente</option>
												<?php
												$item = null;
												$valor = null;
												$clientes = ControladorClientes::ctrMostrarClientes($item, $valor);
												foreach ($clientes as $key => $value) {
													echo '<option value="' . $value["id_cliente"] . '">' . $value["nombre_cliente"] . ' - DNI: ' . $value["dni_cliente"] . ' - NIT: ' . $value["nit_cliente"] . '</option>';
												}
												?>
											</select>
											<span class="input-group-text"><button type="button" class="btn btn-sm btn-secondary me-1 mb-1">Agregar</button></span>
										</div>
									</div>
									<!-- Repuestos a vender añadidos -->
									<div class="nuevoRepuesto"></div>
									<!-- total de toda la venta -->
									<div class="mb-4">
										<div class="input-group">
											<span class="input-group-text">Monto a pagar</span>
											<input type="text" class="form-control form-control-alt text-center" id="ventaTotal" name="ventaTotal" readonly>
											<span class="input-group-text input-group-text-alt">BS</span>
										</div>
									</div>
									<div class="block-content block-content-full block-content-sm text-end border-top">
										<button type="button" class="btn btn-alt-primary" id="guardarVenta">Guardar Venta</button>
									</div>
								</form>
							</div>
						</div>
					</div>


					<!-- Lado derecho tabla -->
					<div class="col-md-7">
						<div class="block block-rounded">
							<div class="block-content block-content-full">
								<div class="table-responsive">
									<h3 class="block-title">Repuestos Disponibles</h3>
									<table id="tablaVentas" class="table table-sm table-striped table-vcenter js-dataTable-responsive">
										<thead>
											<tr>
												<th class="text-center" style="width: 50px;">N.</th>
												<th class="text-center" style="width: 100px;">COD.</th>
												<th>Nombre</th>
												<th>Categoría</th>
												<th>Marca</th>
												<th>Stock</th>
												<th>Precio</th>
												<th class="text-center" style="width: 100px;">Action</th>
											</tr>
										</thead>
										<tbody>
										</tbody>
									</table>
								</div>
							</div>
						</div>
					</div>

				</div>
			</div>
		</div>
	</div>
</main>