function mostrarTabla(tabla) {

    if (tabla === "ventasRealizadas") {
      window.location.href = "?action=ventasRealizadas";
    } else if (tabla === "detalleVentasRealizadas") {
      window.location.href = "?action=detalleVentasRealizadas";
    }
  

}

$(document).ready(function () {
  // Verificar el estado del checkbox y el rango de fechas desde localStorage
  if (localStorage.getItem("activeRangoFecha") === "true") {
    $("#activeRangoFecha").prop("checked", true);
    $("#daterange-btn").show();
  }
  if (localStorage.getItem("capturarRango")) {
    $("#daterange-btn span").html(
      JSON.parse(localStorage.getItem("capturarRango"))
    );
  }


// Inicializar DataTables para tablaVentasRealizadas si existe
  if ($("#tablaVentasRealizadas").length) {
    $("#tablaVentasRealizadas").DataTable({
      ajax: {
        url: "ajax/datatable-lista-ventas.ajax.php",
        data: function(d) {
          if (localStorage.getItem("activeRangoFecha") === "true") {
            d.fechaInicio = localStorage.getItem("fechaInicio");
            d.fechaFin = localStorage.getItem("fechaFin");
          }
        },
        deferRender: true,
        retrieve: true,
        processing: true
      },
      language: {
        sProcessing: "Procesando...",
        sLengthMenu: "Mostrar _MENU_ registros",
        sZeroRecords: "No se encontraron resultados",
        sEmptyTable: "Ningún dato disponible en esta tabla",
        sInfo:
          "Mostrando registros del _START_ al _END_ de un total de _TOTAL_",
        sInfoEmpty: "Mostrando registros del 0 al 0 de un total de 0",
        sInfoFiltered: "(filtrado de un total de _MAX_ registros)",
        sSearch: "Buscar:",
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
        { data: "2", className: "text-center" },
        { data: "3", className: "text-center" },
        { data: "4", className: "text-center" },
        { data: "5", className: "text-center" },
        { data: "6", className: "text-center" },
        { data: "7", className: "text-center" },
      ],
    });
  }

// Inicializar DataTables para tablaDetalleVentasRealizadas si existe
if ($("#tablaDetalleVentasRealizadas").length) {
  $("#tablaDetalleVentasRealizadas").DataTable({
    ajax: {
      url: "ajax/datatable-detalle-ventas.ajax.php",
      data: function(d) {
        if (localStorage.getItem("activeRangoFecha") === "true") {
          d.fechaInicio = localStorage.getItem("fechaInicio");
          d.fechaFin = localStorage.getItem("fechaFin");
        }
      },
      deferRender: true,
      retrieve: true,
      processing: true
    },
    language: {
      sProcessing: "Procesando...",
      sLengthMenu: "Mostrar _MENU_ registros",
      sZeroRecords: "No se encontraron resultados",
      sEmptyTable: "Ningún dato disponible en esta tabla",
      sInfo:
        "Mostrando registros del _START_ al _END_ de un total de _TOTAL_",
      sInfoEmpty: "Mostrando registros del 0 al 0 de un total de 0",
      sInfoFiltered: "(filtrado de un total de _MAX_ registros)",
      sSearch: "Buscar:",
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
      { data: "2", className: "text-center" },
      { data: "3", className: "text-center" },
      { data: "4", className: "text-center" },
      { data: "5", className: "text-center" },
      { data: "6", className: "text-center" },
      { data: "7", className: "text-center" },
    ],
  });
}
  //Imprimir factura
  $("#tablaVentasRealizadas").on("click", ".btnImprimirFactura", function () {
    //console.log("Imprimir factura");
    var idVentaRealizada = $(this).attr("idVentaRealizada");
    window.open(
      "extensions/TCPDF-main/pdf/recibo.php?codigo=" + idVentaRealizada,
      "_blank"
    );
  });



  // Evento de cambio para el checkbox
  $("#activeRangoFecha").on("change", function () {
    if ($(this).is(":checked")) {
      $("#daterange-btn").show();
      localStorage.setItem("activeRangoFecha", "true");
    } else {
      $("#daterange-btn").hide();
      localStorage.removeItem("capturarRango");
      localStorage.removeItem("activeRangoFecha");
      $("#daterange-btn span").html(""); // Borrar el contenido del rango de fechas
      localStorage.clear();

      if ($("#tablaVentasRealizadas").length) {
        window.location.href = `?action=ventasRealizadas`;
      } else if ($("#tablaDetalleVentasRealizadas").length) {
        window.location.href = `?action=detalleVentasRealizadas`;
      }
    }
  });
  
    //capturar hoy
    $(" .daterangepicker.opensright .ranges li").on("click", function () {
      var hoy = $(this).text();
      if (hoy === "Hoy") {
        var d = moment();
        var fechaInicio = d.format('YYYY-MM-DD');
        var fechaFin = d.format('YYYY-MM-DD');
        localStorage.setItem("fechaInicio", fechaInicio);
        localStorage.setItem("fechaFin", fechaFin);
        localStorage.setItem("capturarRango", JSON.stringify(hoy));
        $("#daterange-btn span").html("HOY");
        if ($("#tablaVentasRealizadas").length) {
          $("#tablaVentasRealizadas").DataTable().ajax.reload();
        } else if ($("#tablaDetalleVentasRealizadas").length) {
          $("#tablaDetalleVentasRealizadas").DataTable().ajax.reload();
        }
      }
    })


});

  // Inicializar el date range picker
  $("#daterange-btn").daterangepicker(
    {
      ranges: {
        Hoy: [moment(), moment()],
        Ayer: [moment().subtract(1, "days"), moment().subtract(1, "days")],
        "Hace 7 Dias": [moment().subtract(6, "days"), moment()],
        "Últimos 30 días": [moment().subtract(29, "days"), moment()],
        "Este Mes": [moment().startOf("month"), moment().endOf("month")],
        "Ultimo Mes": [
          moment().subtract(1, "month").startOf("month"),
          moment().subtract(1, "month").endOf("month"),
        ],
      },
      opens: 'right',
      startDate: moment(),
      endDate: moment(),
    },
    function (start, end) {
      $("#daterange-btn span").html(
        start.format("MMMM D, YYYY") + " - " + end.format("MMMM D, YYYY")
      );
      var fechaInicio = start.format("YYYY-MM-DD");

      var fechaFin = end.format("YYYY-MM-DD");
     
      var capturarRango = $("#daterange-btn span").html();
      
      localStorage.setItem("capturarRango", JSON.stringify(capturarRango));
      localStorage.setItem("fechaInicio", fechaInicio);
      localStorage.setItem("fechaFin", fechaFin);

      if ($("#tablaVentasRealizadas").length) {
        $("#tablaVentasRealizadas").DataTable().ajax.reload();
      } else if ($("#tablaDetalleVentasRealizadas").length) {
        $("#tablaDetalleVentasRealizadas").DataTable().ajax.reload();
      }
    });


