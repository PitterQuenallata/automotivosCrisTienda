$(document).ready(function () {
  console.log("crear_compras.js ready");
  // Inicializar la DataTable para los repuestos
  if ($.fn.DataTable.isDataTable("#tablaRepuestosCompra")) {
    $("#tablaRepuestosCompra").DataTable().destroy();
  }

  var tablaRepuestosCompra = $("#tablaRepuestosCompra").DataTable({
    ajax: "ajax/datatable-comprasRes.ajax.php",
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
      { data: "codigo_tienda_repuesto", className: "text-truncate" },
      { data: "nombre_repuesto", className: "text-truncate" },
      { data: "nombre_categoria", className: "text-truncate" },
      { data: "marca_repuesto", className: "text-truncate" },
      { data: "stock_repuesto", className: "text-center" },
      { data: "precio_repuesto", className: "text-center" },
      { data: "acciones", className: "text-center" },
      { data: "id_repuesto", visible: false }, // Oculto pero disponible en los datos
    ],
    destroy: true, // Asegura la destrucción previa de la tabla
  });

  // Manejar la adición de repuestos al formulario de compras
  $("#tablaRepuestosCompra tbody").on(
    "click",
    "button#añadirCompraRepuesto",
    function () {
      var data = tablaRepuestosCompra.row($(this).parents("tr")).data();
      agregarRepuesto(data);
    }
  );

  function agregarRepuesto(data) {
    var nuevoRepuesto = `
      <div class="row nuevoRepuestoItem" idRepuesto="${data.id_repuesto}">
        <div class="col-6 mb-2">
          <input type="text" class="form-control" name="nombreRepuesto[]" value="${data.nombre_repuesto}" readonly>
        </div>
        <div class="col-2 mb-2">
          <input type="number" class="form-control cantidadRepuesto" name="cantidadRepuesto[]" min="1" value="1">
        </div>
        <div class="col-3 mb-2">
          <div class="input-group">
            <input type="text" class="form-control precioRepuesto" name="precioRepuesto[]" value="" required>
            <span class="input-group-text input-group-text-alt">BS</span>
          </div>
        </div>
        <div class="col-1 mt-1">
          <button class="btn btn-danger btn-sm quitarRepuesto" idRepuesto="${data.id_repuesto}">X</button>
        </div>
      </div>
    `;

    $(".nuevaCompra").append(nuevoRepuesto);

    // Actualizar el total de la compra
    actualizarTotalCompra();
  }

  // Manejar la eliminación de repuestos del formulario de compras
  $(".nuevaCompra").on("click", "button.quitarRepuesto", function () {
    $(this).parent().parent().remove();
    actualizarTotalCompra();
  });

  // Actualizar el total de la compra
  function actualizarTotalCompra() {
    var total = 0;
    $(".nuevaCompra .nuevoRepuestoItem").each(function () {
      var cantidad = $(this).find(".cantidadRepuesto").val();
      var precio = $(this).find(".precioRepuesto").val();
      total += cantidad * precio;
    });
    $("#compraTotal").val(total.toFixed(2));
  }

  // Mostrar/ocultar campos de proveedor manualmente
  $("#toggleDatosProveedor").on("click", function () {
    var datosProveedor = $("#datosProveedor");
    datosProveedor.toggle();
    $(
      "#nombreProveedor, #nitProveedor, #direccionProveedor, #gmailProveedor, #celularProveedor"
    ).prop("disabled", !datosProveedor.is(":visible"));
  });

  // Actualizar el precio total cuando se cambie la cantidad
  $(".nuevaCompra").on(
    "input change",
    "input.cantidadRepuesto, input.precioRepuesto",
    function () {
      actualizarTotalCompra();
    }
  );

  // Obtener nuevo código de compra al seleccionar un proveedor o hacer clic en el botón manual
  $("#agregarProveedor, #toggleDatosProveedor").on("change click", function () {
    $.ajax({
      url: "ajax/compras.ajax.php",
      method: "POST",
      data: { accion: "generarCodigoCompra" },
      dataType: "json",
      success: function (response) {
        if (response.codigo) {
          $("#codigoCompra").val(response.codigo);
        } else {
          console.error(
            "Error al generar el código de compra: " + response.error
          );
        }
      },
      error: function (jqXHR, textStatus, errorThrown) {
        console.error(
          "Error al generar el código de compra: " +
            textStatus +
            " - " +
            errorThrown
        );
      },
    });
  });

  $(document).ready(function () {
    // Obtener nuevo código de compra al seleccionar un proveedor o hacer clic en el botón manual
    $("#agregarProveedor, #toggleDatosProveedor").on(
      "change click",
      function () {
        $.ajax({
          url: "ajax/compras.ajax.php",
          method: "POST",
          data: { accion: "generarCodigoCompra" },
          dataType: "json",
          success: function (response) {
            if (response.codigo) {
              $("#codigoCompra").val(response.codigo);
            } else {
              console.error(
                "Error al generar el código de compra: " + response.error
              );
            }
          },
          error: function (jqXHR, textStatus, errorThrown) {
            console.error(
              "Error al generar el código de compra: " +
                textStatus +
                " - " +
                errorThrown
            );
          },
        });
      }
    );

    // Guardar la compra manualmente
    $("#guardarCompra").click(function () {
      var esManual = !$("#nombreProveedor").prop("disabled");
      var datosProveedor = {};

      if (esManual) {
        datosProveedor = {
          nombre: $("#nombreProveedor").val(),
          nit: $("#nitProveedor").val(),
          direccion: $("#direccionProveedor").val(),
          email: $("#gmailProveedor").val(),
          celular: $("#celularProveedor").val(),
        };

        // Validar datos del proveedor
        if (
          !datosProveedor.nombre ||
          !datosProveedor.nit ||
          !datosProveedor.direccion ||
          !datosProveedor.email ||
          !datosProveedor.celular
        ) {
          fncSweetAlert(
            "error",
            "Todos los campos del proveedor manual deben estar llenos."
          );
          return;
        }
      }

      var listaRepuestos = [];
      $(".nuevaCompra .nuevoRepuestoItem").each(function () {
        var idRepuesto = $(this).attr("idRepuesto");
        var cantidad = $(this).find(".cantidadRepuesto").val();
        var precio = $(this).find(".precioRepuesto").val();

        listaRepuestos.push({
          id_repuesto: idRepuesto,
          cantidad_detalleCompra: cantidad,
          precio_unitario: precio,
        });
      });

      var datos = {
        codigoCompra: $("#codigoCompra").val(),
        montoTotal: $("#compraTotal").val(),
        idProveedor: esManual ? null : $("#agregarProveedor").val(),
        idUsuario: $("#idUsuario").val(),
        lista_repuestos: listaRepuestos,
        proveedorManual: esManual ? datosProveedor : null,
      };

      $.ajax({
        url: "ajax/compras.ajax.php",
        method: "POST",
        data: JSON.stringify(datos),
        contentType: "application/json",
        success: function(respuesta) {
            if (respuesta.indexOf("ok") !== -1) {
                fncSweetAlert("success", "Compra guardada correctamente.", "/lista-compras");
            } else {
                fncSweetAlert("error", respuesta);
            }
        },
        error: function(jqXHR, textStatus, errorThrown) {
            fncSweetAlert("error", "Error al guardar la compra: " + textStatus + " - " + errorThrown);
        }
    });
    });
  });
});
