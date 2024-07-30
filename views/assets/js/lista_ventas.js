$(document).ready(function () {
  // Inicializar DataTables para tablaVentasRealizadas si existe
  if ($("#tablaVentasRealizadas").length) {
    $("#tablaVentasRealizadas").DataTable({
      ajax: "ajax/datatable-lista-ventas.ajax.php",
      deferRender: true,
      retrieve: true,
      processing: true,
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
      ajax: "ajax/datatable-detalle-ventas.ajax.php",
      deferRender: true,
      retrieve: true,
      processing: true,
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
});

function mostrarTabla(tabla) {
  if (tabla === "ventasRealizadas") {
    window.location.href = "?action=ventasRealizadas";
  } else if (tabla === "detalleVentasRealizadas") {
    window.location.href = "?action=detalleVentasRealizadas";
  }
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

$("#daterange-btn").daterangepicker({

  ranges: {
    Hoy: [moment(), moment()],
    Ayer: [moment().subtract(1, "days"), moment().subtract(1, "days")],
    "Hace 7 Dias": [moment().subtract(6, "days"), moment()],
    "Últimos 30 días": [moment().subtract(29, "days"), moment()],
    "Este Mes": [moment().startOf("month"), moment().endOf("month")],
    "Ultimo Mes": [moment().subtract(1, "month").startOf("month"), moment().subtract(1, "month").endOf("month")]
  },
  starDate : moment().subtract(29, 'days'),
  enDate : moment()
},  
function (start,end){
  $('#daterange-btn span').html(start.format('MMMM D, YYYY') + ' - ' + end.format('MMMM D, YYYY'));
    var fechaInicio = start.format('YYYY-MM-DD');
    console.log(fechaInicio);
    var fechaFin = end.format('YYYY-MM-DD');
    console.log(fechaFin);
}
);


// $(document).ready(function() {
//   var start = moment().subtract(29, 'days');
//   var end = moment();

//   function cb(start, end) {
//     $("#reportrange span").html(start.format('MMMM D, YYYY') + ' - ' + end.format('MMMM D, YYYY'));
//   }

//   $("#reportrange").daterangepicker({
//     startDate: start,
//     endDate: end,
//     ranges: {
//       'Today': [moment(), moment()],
//       'Yesterday': [moment().subtract(1, 'days'), moment().subtract(1, 'days')],
//       'Last 7 Days': [moment().subtract(6, 'days'), moment()],
//       'Last 30 Days': [moment().subtract(29, 'days'), moment()],
//       'This Month': [moment().startOf('month'), moment().endOf('month')],
//       'Last Month': [moment().subtract(1, 'month').startOf('month'), moment().subtract(1, 'month').endOf('month')]
//     }
//   }, cb);

//   cb(start, end);
// });
