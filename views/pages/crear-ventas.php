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

								<form id="formIniciarVenta">
									<div class="mb-4">
										<div class="input-group">
											<span class="input-group-text">
												Usuario
											</span>
											<input type="text" class="form-control" id="nuevoVendedor" name="nuevoVendedor" value="UsuarioAdministrador" readonly>
										</div>
									</div>

									<div class="mb-4">
										<div class="input-group">
											<span class="input-group-text">
												Código Venta
											</span>
											<input type="text" class="form-control" id="codigoVenta" name="codigoVenta" value="1000" readonly>
										</div>
									</div>

									<div class="mb-4">
										<div class="input-group">
											<span class="input-group-text">
												Cliente
											</span>

											<select class="form-select" id="agregarCliente" name="agregarCliente" required>
												<option selected disabled>Elije un Cliente</option>
												<!-- Opciones de clientes llenadas dinámicamente -->
											</select>
											<span class="input-group-text"><button type="button" class="btn btn-sm btn-secondary me-1 mb-1">Agregar</button></span>
										</div>
									</div>

									<div class="row form-group mb-3">
										<div class="col-6 border-end">
											<div class="input-group">
												<span class="input-group-text">
													<button type="button" class="btn btn-sm btn-secondary js-bs-tooltip-enabled">
														<i class="fa fa-times"></i>
													</button>
												</span>
												<input type="text" class="form-control" id="agregarRepuesto" name="agregarRepuesto" required readonly>
											</div>
										</div>
										<!-- Cantidad -->
										<div class="col-3">
											<div class="input-group">
												<input type="text" class="form-control form-control-alt text-center" id="nuevaCantidadProducto" name="nuevaCantidadProducto">
												<span class="input-group-text input-group-text-alt">+</span>
											</div>
										</div>
										<!-- Precio total -->
										<div class="col-3 border-end">
											<div class="input-group">
												<input type="text" class="form-control form-control-alt text-center" id="nuevoPrecioRepuesto" name="nuevoPrecioRepuesto" placeholder="00">
												<span class="input-group-text input-group-text-alt">BS</span>
											</div>
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
									<table class="table table-sm table-striped table-vcenter js-dataTable-responsive">
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
											<?php
											$item = null;
											$valor = null;
											$repuestos = ControladorRepuestos::ctrMostrarRepuestos($item, $valor);

											foreach ($repuestos as $key => $value) {
												echo '
												<tr>
												<td class="text-center" scope="row">' . ($key + 1) . '</td>
												<td class="text-center">' . $value["oem_repuesto"] . '</td>
												<td>' . $value["nombre_repuesto"] . '</td>
												<td>' . $value["id_categoria"] . '</td>
												<td>' . $value["marca_repuesto"] . '</td>
												<td>' . $value["stock_repuesto"] . '</td>
												<td>' . $value["precio_repuesto"] . '</td>
												<td class="text-center">
                      <div class="btn-group">
                       <button type="button" class="btn btn-sm btn-secondary me-1 mb-1">Agregar</button>
                      </div>
                    </td>
												</tr>
												';
											}
											?>
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