$(document).ready(function () {
	// Mostrar detalles de compra en el modal
	function mostrarDetallesCompra(idCompra) {
			console.log("ID de compra para ver detalles:", idCompra);
			$.ajax({
					url: "ajax/detalle.compra.ajax.php",
					method: "POST",
					data: { action: "getDetallesCompra", idCompra: idCompra },
					dataType: "json",
					success: function (response) {
							console.log("Datos recibidos:", response);
							if (response.success) {
									var detallesCompra = response.data;
									var detalleCompraBody = $("#detalleCompraBody");
									detalleCompraBody.empty();
									detallesCompra.forEach(function (detalle, index) {
											var fila = `
													<tr>
															<td class="text-center">${index + 1}</td>
															<td class="text-center">${detalle.codigo_compra}</td>
															<td>${detalle.nombre_repuesto}</td>
															<td>${detalle.cantidad_detalleCompra}</td>
															<td>${detalle.precio_unitario}</td>
															<td>${(detalle.cantidad_detalleCompra * detalle.precio_unitario).toFixed(2)}</td>
															<td class="text-center">
																	<button type="button" class="btn btn-sm btn-secondary btnEditarDetalle" data-id="${detalle.id_detalle_compra}" data-compra="${detalle.id_compra}" data-cantidad="${detalle.cantidad_detalleCompra}" data-precio="${detalle.precio_unitario}" data-repuesto="${detalle.id_repuesto}">Editar</button>
																	<button type="button" class="btn btn-sm btn-danger btnEliminarDetalle" data-id="${detalle.id_detalle_compra}" data-compra="${detalle.id_compra}">Eliminar</button>
															</td>
													</tr>
											`;
											detalleCompraBody.append(fila);
									});
							} else {
									fncSweetAlert("error", "No se encontraron detalles para la compra");
							}
					},
					error: function (xhr, status, error) {
							console.error("Error al obtener los detalles de la compra:", error);
							console.error("Estado:", status);
							console.error("Respuesta del servidor:", xhr.responseText);
							fncSweetAlert("error", "Error al obtener los detalles de la compra");
					},
			});
	}

	// Evento para abrir el modal de detalles de compra
	$(document).on("click", ".btnVerDetalleCompra", function () {
			var idCompra = $(this).data("idcompra");
			mostrarDetallesCompra(idCompra);
	});

	// Manejar el envío del formulario de edición de detalles de compra
	$("#formEditarDetalleCompra").on("submit", function (event) {
			event.preventDefault();

			var formData = $(this).serialize();
			formData += "&action=updateDetalleCompra";
			console.log("Datos de formulario enviados para actualización:", formData);

			$.ajax({
					url: "ajax/detalle.compra.ajax.php",
					method: "POST",
					data: formData,
					dataType: "json",
					success: function (response) {
							console.log("Respuesta del servidor:", response);
							if (response.success) {
									$("#modalEditarDetalle").modal("hide");
									fncSweetAlert("success", "Detalle de compra actualizado con éxito", "/lista-compras");
							} else {
									fncSweetAlert("error", "Error al actualizar el detalle: " + response.error);
							}
					},
					error: function (xhr, status, error) {
							console.error("Error al enviar los datos del detalle:", error);
							fncSweetAlert("error", "Error al enviar los datos del detalle");
					},
			});
	});

	// Manejar la eliminación de un detalle de compra
	$(document).on('click', '.btnEliminarDetalle', function() {
			var idDetalle = $(this).data('id');
			var idCompra = $(this).data('compra');
			console.log('ID del detalle a eliminar:', idDetalle);
			console.log('ID de la compra:', idCompra);
			// Llamar a la función personalizada de SweetAlert
			fncSweetAlert("delete", "¿Está seguro que desea eliminar este detalle de compra?").then(function(confirmed) {
					if (confirmed) {
							$.ajax({
									url: 'ajax/detalle.compra.ajax.php',
									method: 'POST',
									data: { action: 'deleteDetalleCompra', idDetalle: idDetalle },
									dataType: 'json',
									success: function(response) {
											if (response.success) {
													mostrarDetallesCompra(idCompra);
													fncSweetAlert('success', 'El detalle ha sido eliminado',"/lista-compras");
											} else {
													fncSweetAlert('error', 'Error al eliminar el detalle: ' + response.error);
											}
									},
									error: function(error) {
											console.error('Error al eliminar el detalle:', error);
											fncSweetAlert('error', 'Error al eliminar el detalle');
									}
							});
					}
			});
	});

	// Evento para abrir el modal de edición de detalles de compra
	$(document).on("click", ".btnEditarDetalle", function () {
			var idDetalle = $(this).data("id");
			var cantidad = $(this).data("cantidad");
			var precio = $(this).data("precio");
			var idCompra = $(this).data("compra");
			var idRepuesto = $(this).data("repuesto");
			
			$("#editIdDetalle").val(idDetalle);
			$("#editCantidadDetalle").val(cantidad);
			$("#editPrecioUnitarioDetalle").val(precio);
			$("#editIdCompra").val(idCompra);  // Asegúrate de que el campo oculto de id_compra se actualice
			$("#editRepuestoSelect").val(idRepuesto);

			$("#modalEditarDetalle").modal("show");
	});

	// Llenar el select de repuestos
	function llenarRepuestoSelect() {
			$.ajax({
					url: 'ajax/detalle.compra.ajax.php',
					method: 'POST',
					data: { action: 'getRepuestos' },
					dataType: 'json',
					success: function(response) {
							if (response.success) {
									var repuestos = response.data;
									var repuestoSelect = $('#editRepuestoSelect');
									repuestoSelect.empty();
									repuestos.forEach(function(repuesto) {
											repuestoSelect.append(new Option(repuesto.nombre_repuesto, repuesto.id_repuesto));
									});
							} else {
									console.error("Error al obtener los repuestos:", response.error);
							}
					},
					error: function(xhr, status, error) {
							console.error("Error al obtener los repuestos:", error);
					}
			});
	}

	// Llamar a la función para llenar el select de repuestos al cargar la página
	llenarRepuestoSelect();
});
