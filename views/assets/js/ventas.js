/*=============================================
  CARGAR LA TABLA DINÁMICA DE VENTAS
  =============================================*/
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
      { data: "0" },
      { data: "1" },
      { data: "2" },
      { data: "3" },
      { data: "4" },
      { data: "5" },
      { data: "6" },
      { data: "7" },
    ],
    destroy: true, // Asegura la destrucción previa de la tabla
  });

  /*=============================================
    AGREGANDO REPUESTOS A LA VENTA DESDE LA TABLA
    =============================================*/

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
        var descripcion = respuesta["nombre_repuesto"];
        var stock = respuesta["stock_repuesto"];
        var precio = respuesta["precio_repuesto"];

        if (stock == 0) {
          swal({
            title: "No hay stock disponible",
            type: "error",
            confirmButtonText: "¡Cerrar!",
          });

          $("button[idRepuesto='" + idRepuesto + "']").addClass(
            "btn-primary agregarRepuesto"
          );

          return;
        }

        $(".nuevoRepuesto").append(
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
            descripcion +
            '" readonly required>' +
            "</div>" +
            "</div>" +
            '<div class="col-3">' +
            '<div class="input-group">' +
            '<input type="number" class="form-control nuevaCantidadRepuesto" name="nuevaCantidadRepuesto" min="1" value="1" stock="' +
            stock +
            '" nuevoStock="' +
            (stock - 1) +
            '" required>' +
            '<span class="input-group-text input-group-text-alt">+</span>' +
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

        // Actualizar el total de precios
        sumarTotalPrecios();

        // Agrupar repuestos en formato JSON
        listarRepuestos();
      },
    });
  });

  /*=============================================
  QUITAR REPUESTOS DE LA VENTA Y RECUPERAR BOTÓN
  =============================================*/

  $(".formularioVenta").on("click", "button.quitarRepuesto", function () {
    $(this).parent().parent().parent().parent().remove();

    var idRepuesto = $(this).attr("idRepuesto");

    $("button.recuperarBoton[idRepuesto='" + idRepuesto + "']").removeClass(
      "btn-default"
    );
    $("button.recuperarBoton[idRepuesto='" + idRepuesto + "']").addClass(
      "btn-primary agregarRepuesto"
    );

    if ($(".nuevoRepuesto").children().length == 0) {
      $("#ventaTotal").val(0);
    } else {
      // Actualizar el total de precios
      sumarTotalPrecios();

      // Agrupar repuestos en formato JSON
      listarRepuestos();
    }
  });

  /*=============================================
  ACTUALIZAR PRECIO AL CAMBIAR CANTIDAD
  =============================================*/

  $(".formularioVenta").on(
    "change",
    "input.nuevaCantidadRepuesto",
    function () {
      var precio = $(this)
        .closest(".row")
        .find(".nuevoPrecioRepuesto")
        .attr("precioReal");
      var cantidad = $(this).val();
      var precioTotal = cantidad * precio;

      $(this).closest(".row").find(".nuevoPrecioRepuesto").val(precioTotal);

      // Actualizar el total de precios
      sumarTotalPrecios();

      // Agrupar repuestos en formato JSON
      listarRepuestos();
    }
  );

  /*=============================================
  FUNCIONES AUXILIARES
  =============================================*/

  function sumarTotalPrecios() {
    var precioItem = $(".nuevoPrecioRepuesto");
    var arraySumaPrecio = [];
    for (var i = 0; i < precioItem.length; i++) {
      arraySumaPrecio.push(Number($(precioItem[i]).val()));
    }
    function sumaArrayPrecios(total, numero) {
      return total + numero;
    }
    var sumaTotalPrecio = arraySumaPrecio.reduce(sumaArrayPrecios);
    $("#ventaTotal").val(sumaTotalPrecio);
  }

  function listarRepuestos() {
    var listaRepuestos = [];
    var descripcion = $(".nuevaDescripcionRepuesto");
    var cantidad = $(".nuevaCantidadRepuesto");
    var precio = $(".nuevoPrecioRepuesto");
    for (var i = 0; i < descripcion.length; i++) {
      listaRepuestos.push({
        id: $(descripcion[i]).attr("idRepuesto"),
        descripcion: $(descripcion[i]).val(),
        cantidad: $(cantidad[i]).val(),
        stock: $(cantidad[i]).attr("nuevoStock"),
        precio: $(precio[i]).attr("precioReal"),
        total: $(precio[i]).val(),
      });
    }
    $("#listaRepuestos").val(JSON.stringify(listaRepuestos));
  }
});
