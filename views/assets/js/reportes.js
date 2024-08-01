$(document).ready(function () { 
/*=============================================
Capturar local storage
  =============================================*/
if (localStorage.getItem("capturarRangoReport") != null) {
  $("#daterange-btn-report span").html(
    localStorage.getItem("capturarRangoReport")
  );
} else {
  $("#daterange-btn-report span").html('Rango de Fechas <i class="fa fa-caret-down ms-1"></i>');
}


  // // Verificar el estado del checkbox y el rango de fechas desde localStorage
  if (localStorage.getItem("activeRangoFechaReport") === "true") {
    $("#activeRangoFechaReport").prop("checked", true);
    $("#daterange-btn-report").show();
  }
  if (localStorage.getItem("capturarRangoReport")) {
    $("#daterange-btn-report span").html(
      JSON.parse(localStorage.getItem("capturarRangoReport"))
    );
  }


/*=============================================
Evento del cambio del checkbox
=============================================*/

  $("#activeRangoFechaReport").on("change", function () {
    if ($(this).is(":checked")) {
      $("#daterange-btn-report").show();
      localStorage.setItem("activeRangoFechaReport", "true");
      
      //window.location="reportes?fechaInicio="+fechaInicio+"&fechaFin="+fechaFin;
    } else {
      $("#daterange-btn-report").hide();
      localStorage.removeItem("capturarRangoReport");
      localStorage.removeItem("activeRangoFechaReport");
      $("#daterange-btn-report span").html('Rango de Fechas <i class="fa fa-caret-down ms-1"></i>'); // Borrar el contenido del rango de fechas
      localStorage.clear();
      window.location="reportes";
    }
  });


    //capturar hoy
    $(" .daterangepicker.openscenter .ranges li").on("click", function () {
      var hoy = $(this).text();
      if (hoy === "Hoy") {
        var d = moment();
        var fechaInicio = d.format('YYYY-MM-DD');
        var fechaFin = d.format('YYYY-MM-DD');
        localStorage.setItem("fechaInicio", fechaInicio);
        localStorage.setItem("fechaFin", fechaFin);
        localStorage.setItem("capturarRango", JSON.stringify(hoy));
        window.location="reportes?fechaInicio="+fechaInicio+"&fechaFin="+fechaFin;

      }
    })

});




/*=============================================
Rango Fechas
=============================================*/
// Inicializar el date range picker
$("#daterange-btn-report").daterangepicker( 
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
    opens: 'center',
    startDate: moment(),
    endDate: moment(),
  },
  function (start, end) {
    $("#daterange-btn-report span").html(
      start.format("MMMM D, YYYY") + " - " + end.format("MMMM D, YYYY")
    );
    var fechaInicio = start.format("YYYY-MM-DD");

    var fechaFin = end.format("YYYY-MM-DD");

    var capturarRango = $("#daterange-btn-report span").html();

    localStorage.setItem("capturarRangoReport", JSON.stringify(capturarRango));
    localStorage.setItem("fechaInicioReport", fechaInicio);
    localStorage.setItem("fechaFinReport", fechaFin);
    window.location="reportes?fechaInicio="+fechaInicio+"&fechaFin="+fechaFin;

  }
);
