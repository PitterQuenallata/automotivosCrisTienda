/*=============================================
EDITAR MARCA
=============================================*/
$(".btnEditarMarca").click(function () {
  var idMarca = $(this).attr("idMarca");
  //console.log("idMarca", idMarca);  
  var datos = new FormData();
  datos.append("idMarca", idMarca);

  $.ajax({
    url: "/ajax/marcas.ajax.php",
    method: "POST",
    data: datos,
    cache: false,
    contentType: false,
    processData: false,
    dataType: "json",
    success: function (respuesta) {
      console.log("respuesta", respuesta);
      $("#editarMarca").val(respuesta["nombre_marca"]);
      $("#idMarca").val(respuesta["id_marca"]);
    },
  });
});


/*=============================================
ELIMINAR Marca
=============================================*/
$(".btnElininarMarca").click(function () {
  var idMarca = $(this).attr("idMarca");
  
  var baseURL = "marcas?ruta=marca&idMarca=" + idMarca;


  // Llamar a la función personalizada de SweetAlert
  fncSweetAlert("confirm", "¡Está seguro de borrar la Marca", baseURL);
});
