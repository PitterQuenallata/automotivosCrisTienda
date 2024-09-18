$(document).ready(function () {
  if ($.fn.DataTable.isDataTable("#tablaVentas")) {
    $("#tablaVentas").DataTable().destroy();
  }

  $("#tablaVentas").DataTable({
    ajax: "ajax/datatable-ventas.ajax.php",
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
      { data: "0", className: "text-center" },
      { data: "1", className: "text-center" },
      { data: "2", className: "text-truncate" },
      { data: "3", className: "text-center" },
      { data: "4", className: "text-center" },
      { data: "5", className: "text-truncate" },
      { data: "6", className: "text-truncate" },
      { data: "7", className: "text-center" },
    ],
    destroy: true, // Asegura la destrucción previa de la tabla
  });

  // Agregar repuesto a la venta
  $("#tablaVentas tbody").on("click", "button.agregarRepuesto", function () {
    var idRepuesto = $(this).attr("idRepuesto");

    $(this).removeClass("btn-primary agregarRepuesto");
    $(this).addClass("btn-default");

    var datos = new FormData();
    datos.append("idRepuesto", idRepuesto);

    $.ajax({
      url: "ajax/repuestos.ventas.ajax.php",
      method: "POST",
      data: datos,
      cache: false,
      contentType: false,
      processData: false,
      dataType: "json",
      success: function (respuesta) {
        var nombreRepuesto = respuesta["nombre_repuesto"];
        var stock = respuesta["stock_repuesto"];
        var precio = respuesta["precio_repuesto"];

        if (stock == 0) {
          fncSweetAlert("error", "No hay stock disponible", "");

          $("button[idRepuesto='" + idRepuesto + "']").addClass(
            "btn-primary agregarRepuesto"
          );

          return;
        }

        $(".nuevaVenta").append(
          '<div class="row form-group mb-3">' +
            '<div class="col-6 border-end">' +
            '<div class="input-group">' +
            '<span class="input-group-text">' +
            '<button type="button" class="btn btn-sm btn-danger quitarRepuesto" idRepuesto="' +
            idRepuesto +
            '">' +
            '<i class="fa fa-times"></i>' +
            "</button>" +
            "</span>" +
            '<input type="text" class="form-control nuevaDescripcionRepuesto" idRepuesto="' +
            idRepuesto +
            '" name="agregarRepuesto" value="' +
            nombreRepuesto +
            '" readonly required>' +
            "</div>" +
            "</div>" +
            '<div class="col-3">' +
            '<div class="input-group">' +
            '<input type="number" class="form-control nuevaCantidadRepuesto" name="nuevaCantidadRepuesto" value="1" stock="' +
            stock +
            '" nuevoStock="' +
            (stock - 1) +
            '" required>' +
            "</div>" +
            "</div>" +
            '<div class="col-3">' +
            '<div class="input-group">' +
            '<input type="text" class="form-control nuevoPrecioRepuesto" precioReal="' +
            precio +
            '" name="nuevoPrecioRepuesto" value="' +
            precio +
            '" readonly required>' +
            '<span class="input-group-text input-group-text-alt">BS</span>' +
            "</div>" +
            "</div>" +
            "</div>"
        );

        // Actualizar el total de precios y la lista de repuestos en formato JSON
        sumarTotalPrecios();
        listarRepuestos();
      },
    });
  });

  // Quitar repuesto de la venta
  $(".formularioVenta").on("click", "button.quitarRepuesto", function () {
    $(this).parent().parent().parent().parent().remove();

    var idRepuesto = $(this).attr("idRepuesto");

    $("button.recuperarBoton[idRepuesto='" + idRepuesto + "']").removeClass(
      "btn-default"
    );
    $("button.recuperarBoton[idRepuesto='" + idRepuesto + "']").addClass(
      "btn-primary agregarRepuesto"
    );

    if ($(".nuevaVenta").children().length == 0) {
      $("#VentaTotal").val(0);
    } else {
      // Actualizar el total de precios y la lista de repuestos en formato JSON
      sumarTotalPrecios();
      listarRepuestos();
    }
  });

  // Actualizar precio al cambiar cantidad
  $(".formularioVenta").on(
    "input change",
    "input.nuevaCantidadRepuesto",
    function () {
      var stock = $(this).attr("stock");
      var cantidad = $(this).val();
      var precio = $(this)
        .closest(".row")
        .find(".nuevoPrecioRepuesto")
        .attr("precioReal");

      if (parseInt(cantidad) > parseInt(stock)) {
        fncSweetAlert("error", "La cantidad supera el stock", "");
        $(this).val(stock);
        cantidad = stock;
      } else if (parseInt(cantidad) < 1) {
        fncSweetAlert("error", "La cantidad no puede ser menor que 1", "");
        $(this).val(1);
        cantidad = 1;
      }

      var precioTotal = cantidad * precio;

      $(this)
        .closest(".row")
        .find(".nuevoPrecioRepuesto")
        .val(precioTotal.toFixed(2));

      // Actualizar el nuevo stock
      $(this).attr("nuevoStock", stock - cantidad);

      // Actualizar el total de precios y la lista de repuestos en formato JSON
      sumarTotalPrecios();
      listarRepuestos();
    }
  );

  // Funciones auxiliares
  function sumarTotalPrecios() {
    var precioItem = $(".nuevoPrecioRepuesto");
    var arraySumaPrecio = [];
    for (var i = 0; i < precioItem.length; i++) {
      arraySumaPrecio.push(Number($(precioItem[i]).val()));
    }
    function sumaArrayPrecios(total, numero) {
      return total + numero;
    }
    var sumaTotalPrecio = arraySumaPrecio.reduce(sumaArrayPrecios, 0);
    $("#VentaTotal").val(sumaTotalPrecio.toFixed(2)); // Limitar a 2 decimales
  }

  function listarRepuestos() {
    var listaRepuestos = [];
    var nombreRepuesto = $(".nuevaDescripcionRepuesto");
    var cantidad = $(".nuevaCantidadRepuesto");
    var precio = $(".nuevoPrecioRepuesto");
    for (var i = 0; i < nombreRepuesto.length; i++) {
      listaRepuestos.push({
        id: $(nombreRepuesto[i]).attr("idRepuesto"),
        nombreRepuesto: $(nombreRepuesto[i]).val(),
        cantidad: $(cantidad[i]).val(),
        stock: $(cantidad[i]).attr("nuevoStock"),
        precio: $(precio[i]).attr("precioReal"),
        total: $(precio[i]).val(),
      });
    }
    //console.log("lista", listaRepuestos);
    $("#listaRepuestosVenta").val(JSON.stringify(listaRepuestos));
  }

  // Llamar a obtenerNuevoCodigoVenta al cargar la página para establecer el código inicial
  obtenerNuevoCodigoVenta();

  // Verificar si el NIT ya existe en la tabla razon_social y autocompletar los datos
  $("#nitCliente").on("blur", function () {
    var nitCliente = $(this).val();

    if (nitCliente !== "") {
      $.ajax({
        url: "ajax/ventas.ajax.php", // Cambia esta URL al archivo que maneja la verificación del NIT
        method: "POST",
        data: { accion: "verificarNit", nitCliente: nitCliente },
        dataType: "json",
        success: function (respuesta) {
          if (respuesta.status === "success") {
            // Autocompletar los campos con los datos de la razón social si existe
            $("#nombreCliente").val(respuesta.datos.cliente_razon_social);
            $("#celularCliente").val(respuesta.datos.telefono_razon_social);
          }
        },
      });
    }
  });

  // Guardar venta cuando se haga clic en el botón "Guardar"
  $("#guardarVenta").click(function (e) {
    e.preventDefault(); // Evitar el envío del formulario por defecto

    var metodoPago = $("#metodoPago").val(); // Obtener el método de pago seleccionado

    if (metodoPago === "qr") {
      generarQR(); // Generar QR si el método de pago es QR
    } else if (metodoPago === "efectivo") {
      guardarVentaEfectivo(); // Guardar venta directamente si es en efectivo
    } else {
      fncSweetAlert("error", "Seleccione un método de pago válido.");
    }
  });

  $("#modalQr").modal({
    backdrop: "static", // Evita que se cierre al hacer clic fuera
    keyboard: false, // Evita que se cierre con "Esc"
  });
  //var intervalId;
  // // Detener la verificación del estado de pago si se cierra el modal
  // $("#modalQr").on("hidden.bs.modal", function () {
  //   clearInterval(intervalId); // Detener la verificación
  // });
});

// Función para generar QR y mostrarlo en el modal
function generarQR() {
  var datosVenta = $("#formIniciarVenta").serialize() + "&accion=qr"; // Añadimos la acción "qr"

  $.ajax({
    url: "ajax/ventas.ajax.php",
    method: "POST",
    data: datosVenta, // Enviamos los datos de la venta y la acción 'qr'
    dataType: "json",
    success: function (respuesta) {
      if (respuesta.status === "success") {
        // Mostrar el QR en el modal
        $("#modalQr").modal("show");
        $("#qrImage").attr("src", "data:image/png;base64," + respuesta.qr);

        // Guardar movimiento_id para luego verificar el estado del pago
        $("#movimientoId").val(respuesta.movimiento_id);

        // Iniciar la verificación del pago cada 10 segundos
        verificarEstadoQR();
      } else {
        fncSweetAlert("error", respuesta.message);
      }
    },
    error: function () {
      fncSweetAlert("error", "Hubo un problema con la generación del QR.");
    },
  });
}

// Función para verificar el pago de QR cada 10 segundos
function verificarEstadoQR() {
  var movimientoId = $("#movimientoId").val(); // Obtener el movimiento_id guardado

  if (!movimientoId) {
    fncSweetAlert(
      "error",
      "No se ha encontrado el movimiento ID para verificar el pago."
    );
    return;
  }

  $.ajax({
    url: "ajax/verificarPago.ajax.php", // AJAX para manejar la verificación del pago
    method: "POST",
    data: { movimiento_id: movimientoId },
    dataType: "json",
    success: function (respuesta) {
      if (respuesta.status === "success" && respuesta.estado === "Completado") {
        // Si el pago se completó correctamente
        //fncToastr("success", "Pago completado con éxito.");
        console.log("Pago completado con éxito.");
        // Cerrar el modal de QR
        $(".modalQr").modal("hide");
        //clearInterval(intervalId); // Detener la verificación una vez que se completó el pago
        guardarVentaQR(); // Llamar a la función para guardar la venta con QR
      } else if (respuesta.status === "pendiente") {
        // Si el pago aún no se ha completado
        //fncToastr("info", "El pago aún no se ha completado. Verificando nuevamente...");
        console.log("Pago pendiente, mostrando Toast...");
      } else {
        // Si hubo un error en la verificación del estado
        fncSweetAlert("error", respuesta.message);
        //clearInterval(intervalId); // Detener verificación en caso de error
      }
    },
    error: function () {
      fncSweetAlert(
        "error",
        "Hubo un problema al verificar el estado del pago."
      );
      //clearInterval(intervalId); // Detener verificación en caso de error
    },
  });
}

// Función para guardar la venta después de confirmar el pago con QR
function guardarVentaQR() {
  var datosVenta = $("#formIniciarVenta").serialize() + "&accion=guardarQr";

  $.ajax({
    url: "ajax/ventas.ajax.php",
    method: "POST",
    data: datosVenta,
    dataType: "json",
    success: function (respuesta) {
      if (respuesta.status === "success") {
        fncSweetAlert("success", respuesta.messageVenta, "", function () {
          // Recargar la tabla y restablecer el formulario
          $("#tablaVentas").DataTable().ajax.reload();
          $("#formIniciarVenta")[0].reset();
          $(".nuevaVenta").empty();
          obtenerNuevoCodigoVenta();
        });
      } else {
        fncSweetAlert("error", respuesta.message);
      }
    },
    error: function () {
      fncSweetAlert("error", "Hubo un problema al guardar la venta.");
    },
  });
}

// Función para guardar la venta en efectivo
function guardarVentaEfectivo() {
  var datosVenta = $("#formIniciarVenta").serialize() + "&accion=efectivo";

  $.ajax({
    url: "ajax/ventas.ajax.php", // URL del archivo PHP que manejará la solicitud
    method: "POST",
    data: datosVenta,
    dataType: "json",
    success: function (respuesta) {
      if (respuesta.status === "success") {
        fncSweetAlert("success", respuesta.messageVenta, "", function () {
          // Recargar la tabla y restablecer el formulario
          $("#tablaVentas").DataTable().ajax.reload();
          $("#formIniciarVenta")[0].reset();
          $(".nuevaVenta").empty();
          obtenerNuevoCodigoVenta();
        });
      } else {
        fncSweetAlert("error", respuesta.message);
      }
    },
    error: function () {
      fncSweetAlert("error", "Hubo un problema con la petición.");
    },
  });
}

// Función para obtener el nuevo código de venta
function obtenerNuevoCodigoVenta() {
  $.ajax({
    url: "ajax/ventas.ajax.php",
    method: "POST",
    data: { action: "obtenerNuevoCodigoVenta" },
    dataType: "json",
    success: function (respuesta) {
      if (respuesta.codigoVenta) {
        $("#codigoVenta").val(respuesta.codigoVenta);
      }
    },
    error: function () {
      fncSweetAlert(
        "error",
        "Hubo un problema al obtener el nuevo código de venta."
      );
    },
  });
}
