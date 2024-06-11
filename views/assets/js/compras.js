$(document).ready(function() {
  var detallesCompra = [];
  var totalCompra = 0;


  // Función para añadir repuesto a la tabla de detalles
  $("#añadirRepuesto").click(function(event) {
    event.preventDefault();

    var idRepuesto = $("#repuestoSelect").val();
    var nombreRepuesto = $("#repuestoSelect option:selected").text();
    var cantidad = $("#cantidadRepuesto").val();
    var precioUnitario = $("#precioRepuesto").val();
    var proveedor = $("#proveedorSelect").val();
    var fechaCompra = $("#fechaCompra").val();

    // Validar que el proveedor y la fecha estén seleccionados
    if (!proveedor || !fechaCompra) {
      fncSweetAlert("error", "Por favor, seleccione un proveedor y una fecha de compra antes de añadir un repuesto.");
      return;
    }

    // Validar que el precio y la cantidad sean mayores que los valores mínimos permitidos
    if (idRepuesto && cantidad > 0 && precioUnitario >= 0.1 && cantidad >= 1) {
      var detalle = {
        idRepuesto: idRepuesto,
        nombreRepuesto: nombreRepuesto,
        cantidad: cantidad,
        precioUnitario: parseFloat(precioUnitario)
      };

      detallesCompra.push(detalle);
      actualizarTablaDetalles();
      limpiarFormulario();
    } else {
      fncSweetAlert("error", "Por favor, ingrese una cantidad y un precio válidos.");
    }
  });

  // Función para actualizar la tabla de detalles
  function actualizarTablaDetalles() {
    var tablaDetalles = $("#tablaDetallesCompra tbody");
    tablaDetalles.empty();

    totalCompra = 0;

    detallesCompra.forEach(function(detalle, index) {
      var precioTotal = detalle.cantidad * detalle.precioUnitario;
      totalCompra += precioTotal;

      var fila = `
        <tr>
          <td>${detalle.idRepuesto}</td>
          <td>${detalle.nombreRepuesto}</td>
          <td>${detalle.cantidad}</td>
          <td class="text-end">${detalle.precioUnitario.toFixed(2)} BS</td>
          <td class="text-end">${precioTotal.toFixed(2)} BS</td>
          <td class="text-center">
            <button type="button" class="btn btn-sm btn-secondary js-bs-tooltip-enabled btnEliminarDetalle" data-index="${index}" data-bs-toggle="tooltip" aria-label="Delete" data-bs-original-title="Delete">
              <i class="fa fa-times"></i>
            </button>
          </td>
        </tr>
      `;

      tablaDetalles.append(fila);
    });

    $("#totalCompra").text(`${totalCompra.toFixed(2)} BS`);


  }

  // Función para limpiar el formulario de repuestos
  function limpiarFormulario() {
    $("#repuestoSelect").val("");
    $("#cantidadRepuesto").val("");
    $("#precioRepuesto").val("");
  }

  // Función para limpiar la tabla de detalles de compras
  function limpiarTablaDetalles() {
    detallesCompra = [];
    actualizarTablaDetalles();
  }
  // Evento para limpiar la tabla cuando se hace clic en el botón de limpiar
  $("#limpiarTabla").click(function() {
    limpiarTablaDetalles();
  });
  // Función para eliminar un detalle de la tabla
  $(document).on("click", ".btnEliminarDetalle", function() {
    var index = $(this).data("index");
    detallesCompra.splice(index, 1);
    actualizarTablaDetalles();
  });


  // Función para confirmar la compra y enviar los datos al servidor
  $("#confirmarCompra").click(function() {
    var proveedor = $("#proveedorSelect").val();
    var fechaCompra = $("#fechaCompra").val();
    var usuario = $("#usuarioSelect").val(); // Verificar si se está configurando correctamente en la sesión

    if (proveedor && fechaCompra && detallesCompra.length > 0) {
        var datosCompra = {
            proveedor: proveedor,
            fechaCompra: fechaCompra,
            usuario: usuario,
            montoTotal: totalCompra, // Incluye el total de la compra
            detalles: detallesCompra
        };

        // Enviar los datos al servidor
        $.ajax({
            url: "ajax/compras.ajax.php",
            method: "POST",
            data: JSON.stringify(datosCompra),
            contentType: "application/json",
            success: function(response) {
                try {
                    var res = JSON.parse(response);
                    if (res.success) {
                        fncSweetAlert("success", "Compra registrada con éxito.");
                        limpiarTablaDetalles(); // Limpiar la tabla de detalles
                    } else {
                        fncSweetAlert("error", "Error al registrar la compra: " + res.error);
                        console.error("Detalle del error:", res.error);
                    }
                } catch (e) {
                    console.error("Error al analizar la respuesta JSON: ", e);
                    console.error("Respuesta recibida: ", response);
                    fncSweetAlert("error", "Error inesperado al registrar la compra.");
                }
            },
            error: function(error) {
                fncSweetAlert("error", "Error al registrar la compra.");
                console.error("Error en la solicitud AJAX: ", error);
            }
        });

        // Por ahora, solo mostramos los datos en la consola para propósitos de demostración
        // console.log(datosCompra);
    } else {
        fncSweetAlert("error", "Por favor, complete todos los campos y añada al menos un repuesto.");
    }
  });
});


//Editar Compra
$(document).ready(function() {
  // Función para llenar el modal de edición con los datos de la compra
  function mostrarEditarCompra(idCompra) {
    $.ajax({
      url: 'ajax/compras.ajax.php',
      method: 'POST',
      data: { action: 'getCompra', idCompra: idCompra },
      dataType: 'json',
      success: function(response) {
        console.log('Datos recibidos:', response); // Log para verificar los datos recibidos
        if (response.success) {
          $('#editIdCompra').val(response.data.id_compra);
          $('#editFechaCompra').val(response.data.fecha_compra);
          $('#editMontoTotal').val(response.data.monto_total_compra);

          var proveedorSelect = $('#editProveedorSelect');
          proveedorSelect.empty();

          response.proveedores.forEach(function(proveedor) {
            proveedorSelect.append(new Option(proveedor.nombre_proveedor, proveedor.id_proveedor));
          });

          $('#editProveedorSelect').val(response.data.id_proveedor);

          $('#modalEditarCompra').modal('show');
        } else {
          fncSweetAlert('error', 'No se encontraron datos para la compra');
        }
      },
      error: function(xhr, status, error) {
        console.error('Error al obtener los datos de la compra:', error);
        console.error('Estado:', status);
        console.error('Respuesta del servidor:', xhr.responseText);
        fncSweetAlert('error', 'Error al obtener los datos de la compra');
      }
    });
  }

  // Evento para abrir el modal de edición de la compra
  $(document).on('click', '.btnEditarCompra', function() {
    var idCompra = $(this).attr('idCompra');
    mostrarEditarCompra(idCompra);
  });

  // Manejar el envío del formulario de edición
  $('#formEditarCompra').on('submit', function(event) {
    event.preventDefault();

    var formData = $(this).serialize();
    formData += '&action=updateCompra';

    $.ajax({
      url: 'ajax/compras.ajax.php',
      method: 'POST',
      data: formData,
      dataType: 'json',
      success: function(response) {
        if (response.success) {
          $('#modalEditarCompra').modal('hide');
          fncSweetAlert('success', 'Compra actualizada con éxito', '/lista-compras');
        } else {
          fncSweetAlert('error', 'Error al actualizar la compra: ' + response.error);
        }
      },
      error: function(error) {
        console.error('Error al enviar los datos de la compra:', error);
        fncSweetAlert('error', 'Error al enviar los datos de la compra');
      }
    });
  });
});




