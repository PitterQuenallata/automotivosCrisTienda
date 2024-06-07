/*=============================================
EDITAR Vehiculo
=============================================*/
$(".btnEditarVehiculo").click(function () {
  var idVehiculo = $(this).attr("idVehiculo");

  var datos = new FormData();
  datos.append("idVehiculo", idVehiculo);

  $.ajax({
    url: "ajax/vehiculos.ajax.php",
    method: "POST",
    data: datos,
    cache: false,
    contentType: false,
    processData: false,
    dataType: "json",
    success: function (respuesta) {
      
      $("#editarVehiculo").val(respuesta["nombre_Vehiculo"]);
      $("#idVehiculo").val(respuesta["id_Vehiculo"]);
    },
  });
});


/*=============================================
ELIMINAR Vehiculo
=============================================*/
$(".btnElininarVehiculo").click(function () {
  var idVehiculo = $(this).attr("idVehiculo");
  
  var baseURL = "Vehiculos?ruta=Vehiculo&idVehiculo=" + idVehiculo;


  // Llamar a la función personalizada de SweetAlert
  fncSweetAlert("confirm", "¡Está seguro de borrar la Vehiculo", baseURL);
});
