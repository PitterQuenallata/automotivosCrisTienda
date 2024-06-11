$(document).ready(function() {
  console.log('Archivo detalle_compra.js cargado correctamente');

  function mostrarDetallesCompra(idCompra) {
      console.log('Mostrar detalles de compra:', idCompra);
      $.ajax({
          url: 'ajax/detalle_compras.ajax.php',
          method: 'POST',
          data: { action: 'getDetallesCompra', idCompra: idCompra },
          dataType: 'json',
          success: function(response) {
              console.log('Datos recibidos:', response); // Log para verificar los datos recibidos
              if (response.success) {
                  $('#detalleCompraBody').empty();
                  response.data.forEach(function(detalle, index) {
                      console.log('Detalle:', detalle); // Log para verificar la estructura de detalle
                      var precioUnitario = parseFloat(detalle.precio_unitario); // Asegurarse de que es un número
                      var total = (detalle.cantidad_detalleCompra * precioUnitario).toFixed(2);
                      var row = `
                          <tr>
                              <td class="text-center">${index + 1}</td>
                              <td class="text-center">${detalle.codigo_compra}</td>
                              <td>${detalle.nombre_repuesto}</td>
                              <td>${detalle.cantidad_detalleCompra}</td>
                              <td>${precioUnitario.toFixed(2)}</td>
                              <td>${total}</td>
                              <td class="text-center">
                                  <button type="button" class="btn btn-sm btn-secondary btnEditarDetalle" data-id="${detalle.id_detalle_compra}" data-cantidad="${detalle.cantidad_detalleCompra}" data-precio="${detalle.precio_unitario}" data-idcompra="${idCompra}" data-bs-toggle="tooltip" title="Editar">
                                      <i class="fa fa-pencil-alt"></i>
                                  </button>
                                  <button type="button" class="btn btn-sm btn-danger btnEliminarDetalle" data-id="${detalle.id_detalle_compra}" data-idcompra="${idCompra}" data-bs-toggle="tooltip" title="Eliminar">
                                      <i class="fa fa-times"></i>
                                  </button>
                              </td>
                          </tr>
                      `;
                      $('#detalleCompraBody').append(row);
                  });
              } else {
                  console.error('Error: No se encontraron detalles para la compra');
                  fncSweetAlert('error', 'No se encontraron detalles para la compra: ' + response.error, null);
              }
          },
          error: function(xhr, status, error) {
              console.error('Error al obtener los detalles de la compra:', error);
              console.error('Estado:', status);
              console.error('Respuesta del servidor:', xhr.responseText);
              fncSweetAlert('error', 'Error al obtener los detalles de la compra', null);
          }
      });
  }

  $(document).on('click', '.btnVerDetalleCompra', function() {
      var idCompra = $(this).data('idcompra');
      console.log('ID de compra para ver detalles:', idCompra);
      $('#editIdCompra').val(idCompra); // Guardar idCompra en un campo oculto
      mostrarDetallesCompra(idCompra);
  });

  $(document).on('click', '.btnEditarDetalle', function() {
      var idDetalle = $(this).data('id');
      var cantidad = $(this).data('cantidad');
      var precio = $(this).data('precio');
      var idCompra = $(this).data('idcompra'); // Obtener idCompra

      console.log('ID de detalle para editar:', idDetalle);

      $('#editIdDetalle').val(idDetalle);
      $('#editCantidadDetalle').val(cantidad);
      $('#editPrecioUnitarioDetalle').val(precio);
      $('#editIdCompra').val(idCompra); // Guardar idCompra en un campo oculto

      $('#modalEditarDetalle').modal('show');
  });

  $('#formEditarDetalleCompra').on('submit', function(event) {
      event.preventDefault();

      var formData = $(this).serialize();
      formData += '&action=updateDetalleCompra';

      console.log('Datos de formulario enviados para actualización:', formData);

      $.ajax({
          url: 'ajax/detalle_compras.ajax.php',
          method: 'POST',
          data: formData,
          dataType: 'json',
          success: function(response) {
              console.log('Respuesta del servidor:', response);
              if (response.success) {
                  $('#modalEditarDetalle').modal('hide');
                  fncSweetAlert('success', 'Detalle actualizado con éxito', '/lista-compras');
                  mostrarDetallesCompra($('#editIdCompra').val()); // Usar el idCompra almacenado
              } else {
                  console.error('Error al actualizar el detalle:', response.error);
                  fncSweetAlert('error', 'Error al actualizar el detalle: ' + response.error, '/lista-compras');
              }
          },
          error: function(xhr, status, error) {
              console.error('Error al enviar los datos del detalle:', error);
              console.error('Estado:', status);
              console.error('Respuesta del servidor:', xhr.responseText);
              fncSweetAlert('error', 'Error al enviar los datos del detalle', '/lista-compras');
          }
      });
  });

  $(document).on('click', '.btnEliminarDetalle', function() {
      var idDetalle = $(this).data('id');
      var idCompra = $(this).data('idcompra'); // Obtener idCompra
      console.log('ID de detalle para eliminar:', idDetalle);
      Swal.fire({
          title: '¿Estás seguro?',
          text: "¡No podrás revertir esto!",
          icon: 'warning',
          showCancelButton: true,
          confirmButtonColor: '#3085d6',
          cancelButtonColor: '#d33',
          confirmButtonText: 'Sí, eliminarlo'
      }).then((result) => {
          if (result.isConfirmed) {
              $.ajax({
                  url: 'ajax/detalle_compras.ajax.php',
                  method: 'POST',
                  data: { action: 'deleteDetalleCompra', idDetalle: idDetalle },
                  dataType: 'json',
                  success: function(response) {
                      console.log('Respuesta del servidor al eliminar detalle:', response);
                      if (response.success) {
                          fncSweetAlert('success', 'Detalle eliminado con éxito', '/lista-compras');
                          mostrarDetallesCompra(idCompra); // Actualizar detalles después de eliminar
                      } else {
                          console.error('Error al eliminar el detalle:', response.error);
                          fncSweetAlert('error', 'Error al eliminar el detalle: ' + response.error, '/lista-compras');
                      }
                  },
                  error: function(xhr, status, error) {
                      console.error('Error al eliminar el detalle:', error);
                      console.error('Estado:', status);
                      console.error('Respuesta del servidor:', xhr.responseText);
                      fncSweetAlert('error', 'Error al eliminar el detalle', '/lista-compras');
                  }
              });
          }
      });
  });
});
