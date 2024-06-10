/*=============================================
EDITAR PROVEEDOR
=============================================*/
$(".btnEditarProveedor").click(function () {
  var idProveedor = $(this).attr("idProveedor");
  var datos = new FormData();
  datos.append("idProveedor", idProveedor);

  $.ajax({
    url: "ajax/proveedores.ajax.php",
    method: "POST",
    data: datos,
    cache: false,
    contentType: false,
    processData: false,
    dataType: "json",
    success: function (respuesta) {
      $("#editarNombreProveedor").val(respuesta["nombre_proveedor"]);
      $("#editarTelefonoProveedor").val(respuesta["telefono_proveedor"]);
      $("#editarDireccionProveedor").val(respuesta["direccion_proveedor"]);
      $("#idProveedor").val(respuesta["id_proveedor"]);
    },
  });
});

/*=============================================
ELIMINAR PROVEEDOR
=============================================*/
$(".btnEliminarProveedor").click(function () {
  var idProveedor = $(this).attr("idProveedor");
  
  var baseURL = "proveedores?ruta=proveedor&idProveedor=" + idProveedor;

  // Llamar a la función personalizada de SweetAlert
  fncSweetAlert("confirm", "¡Está seguro de borrar el proveedor?", baseURL);
});

