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
      { data: "3", className: "text-truncate" },
      { data: "4", className: "text-center" },
      { data: "5", className: "text-center" },
      { data: "6", className: "text-truncate" },
      { data: "7", className: "text-truncate" },
      { data: "8", className: "text-center" },
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
    console.log("lista", listaRepuestos);
    $("#listaRepuestosVenta").val(JSON.stringify(listaRepuestos));
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

  // Llamar a obtenerNuevoCodigoVenta al cargar la página para establecer el código inicial
  obtenerNuevoCodigoVenta();
  // Guardar venta
  $("#guardarVenta").click(function (e) {
    e.preventDefault(); // Evitar el envío del formulario por defecto

    var datosVenta = $("#formIniciarVenta").serialize();
    console.log(datosVenta);

    $.ajax({
      url: "ajax/ventas.ajax.php", // URL del archivo PHP que manejará la solicitud
      method: "POST",
      data: datosVenta,
      dataType: "json",
      success: function (respuesta) {
        if (respuesta.status === "success") {
          // Mostrar el mensaje de cliente registrado
          if (respuesta.messageCliente) {
            if (
              respuesta.messageCliente === "Cliente registrado con éxito" ||
              respuesta.messageCliente === "Cliente actualizado con éxito"
            ) {
              fncToastr("success", respuesta.messageCliente);
            } else {
              fncToastr("info", respuesta.messageCliente);
            }
          }
          // Mostrar el mensaje de venta guardada
          fncSweetAlert("success", respuesta.messageVenta, "", function () {
            // Recargar la tabla
            $("#tablaVentas").DataTable().ajax.reload();
            // Limpiar el formulario
            $("#formIniciarVenta")[0].reset();
            // Limpiar los repuestos seleccionados
            $(".nuevaVenta").empty();
            // Obtener y actualizar el nuevo código de venta
            obtenerNuevoCodigoVenta();
          });
        } else {
          fncSweetAlert("error", respuesta.message, "", function () {
            location.reload(); // Recargar la página en caso de error
          });
        }
      },
      error: function () {
        fncSweetAlert(
          "error",
          "Hubo un problema con la petición.",
          "",
          function () {
            location.reload(); // Recargar la página también en caso de error
          }
        );
      },
    });
  });
});
