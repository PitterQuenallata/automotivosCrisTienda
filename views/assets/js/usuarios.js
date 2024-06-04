/*=============================================
SUBIENDO LA FOTO DEL USUARIO
=============================================*/
$(".nuevaFoto").change(function () {
  var imagen = this.files[0];

  if (!imagen) {
    return; // Salir si no hay archivo seleccionado
  }

  /*=============================================
  VALIDAMOS EL FORMATO DE LA IMAGEN SEA JPG O PNG
  =============================================*/
  if (imagen.type != "image/jpeg" && imagen.type != "image/png") {
    $(".nuevaFoto").val("");
    fncSweetAlert("error", "¡La imagen debe estar en formato JPG o PNG!");
  } else if (imagen.size > 2000000) {
    $(".nuevaFoto").val("");
    fncSweetAlert("error", "¡La imagen no debe pesar más de 2MB!");
  } else {
    var datosImagen = new FileReader();
    datosImagen.readAsDataURL(imagen);

    datosImagen.onload = function (event) {
      var rutaImagen = event.target.result;
      $(".previsualizar").attr("src", rutaImagen);
    };
  }
});


/*=============================================
EDITAR USUARIO
=============================================*/
$(document).on("click", ".btnEditarUsuario", function(){
  var idUsuario = $(this).attr("idUsuario");

  var datos = new FormData();
  datos.append("idUsuario", idUsuario);

  $.ajax({
      url: "ajax/usuarios.ajax.php",
      method: "POST",
      data: datos,
      cache: false,
      contentType: false,
      processData: false,
      dataType: "json",
      success: function(respuesta){
        console.log(respuesta);
          
        $("#editarNombre").val(respuesta["nombre_usuario"]);
        $("#editarApellido").val(respuesta["apellido_usuario"]);
        $("#editarUsuario").val(respuesta["user_usuario"]);
        $("#editarEmail").val(respuesta["email_usuario"]);
        $("#editarPassword").val(respuesta["password_usuario"]);
        $("#fotoActual").val(respuesta["foto_usuario"]);
        $("#passwordActual").val(respuesta["password_usuario"]);

        // Establecer el valor del rol en el campo de selección
        $("#editarPerfil").val(respuesta["rol_usuario"]);

          if (respuesta["foto_usuario"] != "") {
              $(".previsualizar").attr("src", respuesta["foto_usuario"]);
          }

          // Mostrar el modal
          $("#modal-large").modal("show");
      },
      error: function (jqXHR, textStatus, errorThrown) {
          console.log("Error: " + textStatus, errorThrown);
          console.log("Response: " + jqXHR.responseText);
      }
  });
});



/*=============================================
ACTIVAR USUARIO
=============================================*/
$(document).on("click", ".btnActivar", function () {
  var idUsuario = $(this).attr("idUsuario");
  var estadoUsuario = $(this).attr("estadoUsuario");

  var datos = new FormData();
  datos.append("activarId", idUsuario);
  datos.append("activarUsuario", estadoUsuario);

  $.ajax({
    url: "ajax/usuarios.ajax.php",
    method: "POST",
    data: datos,
    cache: false,
    contentType: false,
    processData: false,
    success: function (respuesta) {
      // Mostrar alerta de éxito si la pantalla es pequeña
      if (window.matchMedia("(max-width:767px)").matches) {
        swal({
          title: "El usuario ha sido actualizado",
          type: "success",
          confirmButtonText: "¡Cerrar!"
        }).then(function (result) {
          if (result.value) {
            window.location = "usuarios";
          }
        });
      }
    }
  });

  // Actualizar el estado del botón
  if (estadoUsuario == 0) {
    $(this).removeClass('btn-success').addClass('btn-danger').html('Desactivado').attr('estadoUsuario', 1);
  } else {
    $(this).removeClass('btn-danger').addClass('btn-success').html('Activado').attr('estadoUsuario', 0);
  }
});



/*=============================================
REVISAR SI EL USUARIO YA ESTÁ REGISTRADO
=============================================*/
$("#nuevoUsuario").change(function(){

	$(".alert").remove();

	var usuario = $(this).val();

	var datos = new FormData();
	datos.append("validarUsuario", usuario);

	 $.ajax({
	    url:"ajax/usuarios.ajax.php",
	    method:"POST",
	    data: datos,
	    cache: false,
	    contentType: false,
	    processData: false,
	    dataType: "json",
	    success:function(respuesta){
	    	
	    	if(respuesta){

	    		$("#nuevoUsuario").parent().after('<div class="alert alert-warning">Este usuario ya existe en la base de datos</div>');

	    		$("#nuevoUsuario").val("");

	    	}

	    }

	})
})




/*=============================================
ELIMINAR USUARIO
=============================================*/
$(document).on("click", ".btnElininarUsuario", function () {
  
  var idUsuario = $(this).attr("idUsuario");
  var fotoUsuario = $(this).attr("fotoUsuario");
  var usuario = $(this).attr("usuario");
  fncSweetAlert("confirm", "¡Está seguro de borrar el usuario?", "usuarios&idUsuario=" + idUsuario + "&usuario=" + usuario + "&fotoUsuario=" + fotoUsuario);
  // swal({
  //   title: "¿Está seguro de borrar el usuario?",
  //   text: "¡Si no lo está puede cancelar la accíón!",
  //   type: "warning",
  //   showCancelButton: true,
  //   confirmButtonColor: "#3085d6",
  //   cancelButtonColor: "#d33",
  //   cancelButtonText: "Cancelar",
  //   confirmButtonText: "Si, borrar usuario!",
  // }).then(function (result) {
  //   if (result.value) {
  //     window.location =
  //       "index.php?ruta=usuarios&idUsuario=" +
  //       idUsuario +
  //       "&usuario=" +
  //       usuario +
  //       "&fotoUsuario=" +
  //       fotoUsuario;
  //   }
  // });
});
