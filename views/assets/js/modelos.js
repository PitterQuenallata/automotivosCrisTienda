/*=============================================
EDITAR Modelo
=============================================*/
$(".btnEditarModelo").click(function () {
  var idModelo = $(this).attr("idModelo");

  var datos = new FormData();
  datos.append("idModelo", idModelo);

  $.ajax({
    url: "/ajax/modelos.ajax.php",
    method: "POST",
    data: datos,
    cache: false,
    contentType: false,
    processData: false,
    dataType: "json",
    success: function (respuesta) {
      console.log("respuesta", respuesta);
      $("#editarModelo").val(respuesta["nombre_modelo"]);
      $("#idModelo").val(respuesta["id_modelo"]);
      $("#marcaSelecEditar").val(respuesta["id_marca"]);
      $("#editarVersion").val(respuesta["version_modelo"]);
      $("#editarAnioInicio").val(respuesta["anio_inicio_modelo"]);
      $("#editarAnioFin").val(respuesta["anio_fin_modelo"]);
    },
  });
});

/*=============================================
ELIMINAR Modelo
=============================================*/
$(".btnElininarModelo").click(function () {
  var idModelo = $(this).attr("idModelo");
  
  var baseURL = "modelos?ruta=&idModelo=" + idModelo;

  // Llamar a la función personalizada de SweetAlert
  fncSweetAlert("confirm", "¡Está seguro de borrar el modelo?", baseURL);
});
