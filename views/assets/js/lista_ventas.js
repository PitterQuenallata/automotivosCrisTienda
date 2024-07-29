$(document).ready(function () {
  // Inicializar DataTables para tablaVentasRealizadas si existe
  if ($('#tablaVentasRealizadas').length) {
    $('#tablaVentasRealizadas').DataTable({
      ajax: "ajax/datatable-lista-ventas.ajax.php",
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
        sSearch: "Buscar:",
        oPaginate: {
          sFirst: "Primero",
          sLast: "Último",
          sNext: "Siguiente",
          sPrevious: "Anterior",
        },
        oAria: {
          sSortAscending: ": Activar para ordenar la columna de manera ascendente",
          sSortDescending: ": Activar para ordenar la columna de manera descendente",
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
      ],
    });
  }

  // Inicializar DataTables para tablaDetalleVentasRealizadas si existe
  if ($('#tablaDetalleVentasRealizadas').length) {
    $('#tablaDetalleVentasRealizadas').DataTable({
      ajax: "ajax/datatable-detalle-ventas.ajax.php",
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
        sSearch: "Buscar:",
        oPaginate: {
          sFirst: "Primero",
          sLast: "Último",
          sNext: "Siguiente",
          sPrevious: "Anterior",
        },
        oAria: {
          sSortAscending: ": Activar para ordenar la columna de manera ascendente",
          sSortDescending: ": Activar para ordenar la columna de manera descendente",
        },
      },
      columns: [
        { data: "0", className: "text-center" },
        { data: "1", className: "text-center" },
        { data: "2", className: "text-center" },
        { data: "3", className: "text-center" },
        { data: "4", className: "text-center" },
        { data: "5", className: "text-center" },
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
