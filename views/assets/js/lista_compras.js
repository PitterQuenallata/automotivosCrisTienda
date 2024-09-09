$(document).ready(function () {
  // Inicializar la DataTable para las compras
  if ($.fn.DataTable.isDataTable("#tablaCompras")) {
    $("#tablaCompras").DataTable().destroy();
  }

  $("#tablaCompras").DataTable({
    ajax: "ajax/datatable-listaCompras.ajax.php?action=listarCompras",
    responsive: true,
    deferRender: true,
    retrieve: true,
    processing: true,
    language: {
      sProcessing: "Procesando...",
      sLengthMenu: "Mostrar _MENU_ registros",
      sZeroRecords: "No se encontraron resultados",
      sEmptyTable: "Ningún dato disponible en esta tabla",
      sInfo: "Mostrando registros del _START_ al _END_ de un total de _TOTAL_",
      sInfoEmpty: "Mostrando registros del 0 al 0 de un total de 0",
      sInfoFiltered: "(filtrado de un total de _MAX_ registros)",
      sInfoPostFix: "",
      sSearch: "Buscar:",
      sUrl: "",
      sInfoThousands: ",",
      sLoadingRecords: "Cargando...",
      oPaginate: {
        sFirst: "Primero",
        sLast: "Último",
        sNext: "Siguiente",
        sPrevious: "Anterior",
      },
      oAria: {
        sSortAscending:
          ": Activar para ordenar la columna de manera ascendente",
        sSortDescending:
          ": Activar para ordenar la columna de manera descendente",
      },
    },
    columns: [
      { data: "numero", className: "text-center" },
      { data: "codigo", className: "text-center" },
      { data: "fecha", className: "text-center" },
      { data: "proveedor" },
      { data: "usuario" },
      { data: "total", className: "text-center" },
      { data: "acciones", className: "text-center" },
      { data: "id_compra", visible: false }, // Campo oculto
      { data: "id_proveedor", visible: false }, // Campo oculto
      { data: "id_usuario", visible: false }, // Campo oculto
    ],
    destroy: true, // Asegura la destrucción previa de la tabla
  });
//------------------------------------------------------------------------------
//----------------------COMPRAs----------------------------------------

// Cargar datos en el modal de edición de compra
// Cargar datos en el modal de edición de compra
$("#tablaCompras").on("click", ".btnEditarCompra", function () {
  var idCompra = $(this).attr("idCompra");
  $.ajax({
    url: "ajax/datatable-listaCompras.ajax.php?action=obtenerCompra",
    method: "POST",
    data: { id_compra: idCompra },
    dataType: "json",
    success: function (respuesta) {
      // Llenar el modal con los datos de la compra
      $("#editIdCompraF").val(respuesta.id_compra);

      // Llenar el select de proveedores
      $.ajax({
        url: "ajax/datatable-listaCompras.ajax.php?action=listarProveedores",
        method: "GET",
        dataType: "json",
        success: function (proveedores) {
          var proveedorSelect = $("#editProveedorSelect");
          proveedorSelect.empty();
          proveedores.forEach(function (proveedor) {
            proveedorSelect.append(
              `<option value="${proveedor.id_proveedor}">${proveedor.nombre_proveedor}</option>`
            );
          });
          proveedorSelect.val(respuesta.id_proveedor);
          $("#modalEditarCompra").modal("show");
        },
      });
    },
  });
});

// Manejar la edición de compra
$("#formEditarCompra").submit(function (e) {
  e.preventDefault();
  var datos = $(this).serialize();
  $.ajax({
    url: "ajax/datatable-listaCompras.ajax.php?action=editarCompra",
    method: "POST",
    data: datos,
    success: function (respuesta) {
      if (respuesta.indexOf("ok") !== -1) {
        $("#modalEditarCompra").modal("hide");
        fncSweetAlert("success", "Compra actualizada con éxito.");
        $('#tablaCompras').DataTable().ajax.reload();
      } else {
        fncSweetAlert("error", "Error al editar la compra.");
      }
    },
  });
});

// Manejar la eliminación de compra
$("#tablaCompras").on("click", ".btnEliminarCompra", function () {
  var idCompra = $(this).attr("idCompra");
  fncSweetAlert("delete", "¿Está seguro de que desea eliminar esta compra?").then(function (confirmed) {
    if (confirmed) {
      $.ajax({
        url: "ajax/datatable-listaCompras.ajax.php?action=eliminarCompra",
        method: "POST",
        data: { id_compra: idCompra },
        success: function (respuesta) {
          if (respuesta.indexOf("ok") !== -1) {
            fncSweetAlert("success", "Compra eliminada con éxito.");
            $('#tablaCompras').DataTable().ajax.reload();
          } else {
            fncSweetAlert("error", "Error al eliminar la compra.");
          }
        },
      });
    }
  });
});






  //------------------------------------------------------------------------------
  //----------------------DETALLES DE COMPRA----------------------------------------
  // Manejar la apertura del modal de detalles de compra
  $("#tablaCompras").on("click", ".btnVerDetalleCompra", function () {
    var idCompra = $(this).data("idcompra");
    $.ajax({
      url: "ajax/detalleCompra.ajax.php?action=verDetallesCompra",
      method: "POST",
      data: { idCompra: idCompra },
      dataType: "json",
      success: function (respuesta) {
        var detalleBody = $("#detalleCompraBody");
        detalleBody.empty();
        respuesta.forEach(function (detalle, index) {
          var total = detalle.cantidad_detalleCompra * detalle.precio_unitario;
          var row = `<tr>
                        <td class="text-center">${index + 1}</td>
                        <td>${detalle.nombre_repuesto}</td>
                        <td>${detalle.cantidad_detalleCompra}</td>
                        <td>${detalle.precio_unitario}</td>
                        <td>${total.toFixed(2)}</td>
                        <td class="text-center">
                            <button type="button" class="btn btn-sm btn-secondary btnEditarDetalle" data-id="${
                              detalle.id_detalle_compra
                            }" data-compra="${
            detalle.id_compra
          }" data-cantidad="${detalle.cantidad_detalleCompra}" data-precio="${
            detalle.precio_unitario
          }" data-repuesto="${
            detalle.id_repuesto
          }" data-bs-toggle="modal" data-bs-target="#modalEditarDetalle">Editar</button>
                            <button type="button" class="btn btn-sm btn-danger btnEliminarDetalle" data-id="${
                              detalle.id_detalle_compra
                            }" data-compra="${
            detalle.id_compra
          }">Eliminar</button>
                        </td>
                    </tr>`;
          detalleBody.append(row);
        });
      },
    });
  });

// Manejar la apertura del modal de edición de detalle
$("#detalleCompraBody").on("click", ".btnEditarDetalle", function () {
  var idDetalle = $(this).data("id");
  var idCompra = $(this).data("compra");
  var cantidad = $(this).data("cantidad");
  var precio = $(this).data("precio");
  var repuesto = $(this).data("repuesto");

  $("#editIdDetalle").val(idDetalle);
  $("#editIdCompra").val(idCompra);
  $("#editCantidadDetalle").val(cantidad);
  $("#editPrecioUnitarioDetalle").val(precio);

  $.ajax({
    url: "ajax/detalleCompra.ajax.php?action=listarRepuestos",
    method: "GET",
    dataType: "json",
    success: function (repuestos) {
      var repuestoSelect = $("#editRepuestoSelect");
      repuestoSelect.empty();
      repuestos.forEach(function (repuesto) {
        repuestoSelect.append(
          `<option value="${repuesto.id_repuesto}">${repuesto.nombre_repuesto}</option>`
        );
      });
      repuestoSelect.val(repuesto);
      $("#modalEditarDetalle").modal("show");
    },
  });
});

// Manejar la edición del detalle de compra
$("#formEditarDetalleCompra").submit(function (e) {
  e.preventDefault();

  // Verificar si los campos están vacíos
  var cantidad = $("#editCantidadDetalle").val().trim();
  var precio = $("#editPrecioUnitarioDetalle").val().trim();
  var repuesto = $("#editRepuestoSelect").val();

  if (cantidad === "" || precio === "" || repuesto === "") {
    fncSweetAlert("error", "Todos los campos son obligatorios.");
    return;
  }

  var datos = $(this).serialize();
  var idCompra = $("#editIdCompra").val(); // Obtener el id_compra
  $.ajax({
    url: "ajax/detalleCompra.ajax.php?action=editarDetalleCompra",
    method: "POST",
    data: datos,
    success: function (respuesta) {
      console.log(respuesta);
      if (respuesta.indexOf("ok") !== -1) {
        $("#modalEditarDetalle").modal("hide");
        fncSweetAlert("success", "Detalle de compra actualizado con éxito.");
        // Actualizar la tabla de detalles y el monto total de la compra
        mostrarDetallesCompra(idCompra); // Recargar los detalles de la compra
        $('#tablaCompras').DataTable().ajax.reload();
      } else {
        fncSweetAlert("error", "Error al editar el detalle de compra.");
      }
    },
  });
});


  
// Manejar la eliminación del detalle de compra
$("#detalleCompraBody").on("click", ".btnEliminarDetalle", function () {
  var idDetalle = $(this).data("id");
  var idCompra = $(this).data("compra");
  fncSweetAlert("delete", "¿Está seguro de que desea eliminar este detalle de compra?").then(function (confirmed) {
    if (confirmed) {
      $.ajax({
        url: "ajax/detalleCompra.ajax.php?action=eliminarDetalleCompra",
        method: "POST",
        data: { id_detalle: idDetalle, id_compra: idCompra },
        success: function (respuesta) {
          console.log(respuesta);
          if (respuesta.indexOf("ok") !== -1) {
            fncSweetAlert("success", "El detalle ha sido eliminado.", "");
            // Actualizar la tabla de detalles y el monto total de la compra
            mostrarDetallesCompra(idCompra); // Recargar los detalles de la compra
            $('#tablaCompras').DataTable().ajax.reload();
            
          } else {
            fncSweetAlert("error", "Error al eliminar el detalle de compra.", "");
          }
        },
        error: function (xhr, status, error) {
          console.error("Error al eliminar el detalle de compra:", error);
          fncSweetAlert("error", "Error al eliminar el detalle de compra.", "");
        }
      });
    }
  });
});


function mostrarDetallesCompra(idCompra) {
  $.ajax({
    url: "ajax/detalleCompra.ajax.php?action=verDetallesCompra",
    method: "POST",
    data: { idCompra: idCompra },
    dataType: "json",
    success: function (respuesta) {
      var detalleBody = $("#detalleCompraBody");
      detalleBody.empty();
      respuesta.forEach(function (detalle, index) {
        var total = detalle.cantidad_detalleCompra * detalle.precio_unitario;
        var row = `<tr>
                      <td class="text-center">${index + 1}</td>
                      <td>${detalle.nombre_repuesto}</td>
                      <td>${detalle.cantidad_detalleCompra}</td>
                      <td>${detalle.precio_unitario}</td>
                      <td>${total.toFixed(2)}</td>
                      <td class="text-center">
                          <button type="button" class="btn btn-sm btn-secondary btnEditarDetalle" data-id="${detalle.id_detalle_compra}" data-compra="${detalle.id_compra}" data-cantidad="${detalle.cantidad_detalleCompra}" data-precio="${detalle.precio_unitario}" data-repuesto="${detalle.id_repuesto}" data-bs-toggle="modal" data-bs-target="#modalEditarDetalle">Editar</button>
                          <button type="button" class="btn btn-sm btn-danger btnEliminarDetalle" data-id="${detalle.id_detalle_compra}" data-compra="${detalle.id_compra}">Eliminar</button>
                      </td>
                  </tr>`;
        detalleBody.append(row);
      });
    },
  });
}


});


