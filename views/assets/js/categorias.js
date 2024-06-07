/*=============================================
EDITAR CATEGORIA
=============================================*/
$(".btnEditarCategoria").click(function () {
  var idCategoria = $(this).attr("idCategoria");

  var datos = new FormData();
  datos.append("idCategoria", idCategoria);

  $.ajax({
    url: "ajax/categorias.ajax.php",
    method: "POST",
    data: datos,
    cache: false,
    contentType: false,
    processData: false,
    dataType: "json",
    success: function (respuesta) {
      
      $("#editarCategoria").val(respuesta["nombre_categoria"]);
      $("#idCategoria").val(respuesta["id_categoria"]);
    },
  });
});


/*=============================================
ELIMINAR CATEGORIA
=============================================*/
$(".btnElininarCategoria").click(function () {
  var idCategoria = $(this).attr("idCategoria");
  var baseURL = "categorias?ruta=categoria&idCategoria=" + idCategoria;


  // Llamar a la función personalizada de SweetAlert
  fncSweetAlert("confirm", "¡Está seguro de borrar la categoria", baseURL);
});
