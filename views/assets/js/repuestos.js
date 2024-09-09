$(document).ready(function () {

   // Cargar el código automáticamente al cargar la página
   obtenerCodigoRepuesto();


  if ($.fn.DataTable.isDataTable("#tablaRepuestos")) {
    $("#tablaRepuestos").DataTable().destroy();
  }

  $("#tablaRepuestos").DataTable({
    ajax: "ajax/datatable-repuestos.ajax.php",
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
      sInfoPostFix: "",
      sSearch: "Buscar:",
      sUrl: "",
      sInfoThousands: ",",
      sLoadingRecords: "Cargando...",
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
      { data: "numero", className: "text-center" },
      { data: "codigo_tienda_repuesto", className: "text-truncate" },
      { data: "nombre_repuesto", className: "text-truncate" },
      { data: "precio_repuesto", className: "text-center" },
      { data: "marca_repuesto", className: "text-truncate" },
      { data: "stock_repuesto", className: "text-center" },
      { data: "nombre_categoria", className: "text-truncate" }, // Categoría
      { data: "estado_repuesto", className: "text-center" },
      { data: "acciones", className: "text-center" }
      
    ],
    destroy: true, // Asegura la destrucción previa de la tabla
  });

  /*=============================================
  Editar Repuesto
  =============================================*/
  $(document).on("click", ".btnEditarRepuesto", function() {
    var idRepuesto = $(this).attr("idRepuesto");
    window.location.href = "crear-repuestos?id_repuesto=" + idRepuesto;
  });

/*=============================================
  Eliminar Repuesto
=============================================*/
$(document).on("click", ".btnEliminarRepuesto", function() {
  var idRepuesto = $(this).attr("idRepuesto");

  Swal.fire({
      title: '¿Está seguro de eliminar este repuesto?',
      text: "¡No podrás revertir esto!",
      icon: 'warning',
      showCancelButton: true,
      confirmButtonColor: '#3085d6',
      cancelButtonColor: '#d33',
      confirmButtonText: 'Sí, eliminarlo!'
  }).then((result) => {
      if (result.isConfirmed) {
          $.ajax({
              url: "ajax/repuestos.ajax.php",
              method: "POST",
              data: { idRepuestoEliminar: idRepuesto },
              success: function(respuesta) {
                  if (respuesta == "ok") {
                      Swal.fire(
                          'Eliminado!',
                          'El repuesto ha sido eliminado.',
                          'success'
                      ).then(function() {
                          window.location.reload();
                      });
                  } else {
                      Swal.fire(
                          'Error!',
                          'No se pudo eliminar el repuesto.',
                          'error'
                      );
                  }
              }
          });
      }
  });
});



  /*=============================================
  ACTIVAR REPUESTO
  =============================================*/
  $(document).on("click", ".btnActivarRepuesto", function () {
    var idRepuesto = $(this).attr("idRepuesto");
    var estadoRepuesto = $(this).attr("estadoRepuesto");

    var datos = new FormData();
    datos.append("activarId", idRepuesto);
    datos.append("activarRepuesto", estadoRepuesto);

    $.ajax({
      url: "ajax/repuestos.ajax.php",
      method: "POST",
      data: datos,
      cache: false,
      contentType: false,
      processData: false,
      success: function (respuesta) {
        // Mostrar alerta de éxito si la pantalla es pequeña
        if (window.matchMedia("(max-width:767px)").matches) {
          swal({
            title: "El repuesto ha sido actualizado",
            type: "success",
            confirmButtonText: "¡Cerrar!",
          }).then(function (result) {
            if (result.value) {
              window.location = "repuestos";
            }
          });
        }
      },
    });

    // Actualizar el estado del botón
    if (estadoRepuesto == 0) {
      $(this).removeClass("btn-success").addClass("btn-danger").html("Inactivo").attr("estadoRepuesto", 1);
    } else {
      $(this).removeClass("btn-danger").addClass("btn-success").html("Activo").attr("estadoRepuesto", 0);
    }
  });

  /*=============================================
  Capturando categoria para asignar codigo de repuesto
  =============================================*/

  function obtenerCodigoRepuesto() {
    $.ajax({
      url: "ajax/repuestos.codigo.ajax.php",
      method: "POST",
      data: {}, // No necesitamos enviar datos específicos
      cache: false,
      contentType: false,
      processData: false,
      dataType: "json",
      success: function (respuesta) {
        console.log(respuesta);
        if (respuesta && respuesta["codigo_tienda_repuesto"]) {
          // Extraer el número del último código "R-XXXX"
          var ultimoCodigo = respuesta["codigo_tienda_repuesto"];
          var numeroCodigo = parseInt(ultimoCodigo.split('-')[1]);
  
          // Generar el nuevo código incrementando el número
          var nuevoCodigo = "R-" + (numeroCodigo + 1);
          $("#nuevoCodigoRepuesto").val(nuevoCodigo);
        } else {
          // Si no hay un código existente, iniciar con R-1000
          var nuevoCodigo = "R-1000";
          $("#nuevoCodigoRepuesto").val(nuevoCodigo);
        }
      },
      error: function (jqXHR, textStatus, errorThrown) {
        console.log("Error al asignar código de repuesto: " + textStatus + " - " + errorThrown);
        alert("Hubo un error al generar el código de repuesto.");
      }
    });
  }
/*=============================================
Cargar modelos al seleccionar marca
=============================================*/
$("#agregarMarcaVehiculo").change(function () {
  var idMarca = $(this).val();
  var datos = new FormData();
  datos.append("idMarca", idMarca);

  $.ajax({
    url: "ajax/repuestos.ajax.php",
    method: "POST",
    data: datos,
    cache: false,
    contentType: false,
    processData: false,
    dataType: "json",
    success: function (response) {
      var modeloSelect = $("#agregarModeloVehiculo");
      modeloSelect.empty();
      modeloSelect.append("<option selected disabled>Elije un Modelo</option>");
      response.forEach(function (modelo) {
        modeloSelect.append(
          '<option value="' + modelo.id_modelo + '">' + modelo.nombre_modelo + ' ' + modelo.version_modelo + '</option>'
        );
      });
    },
    error: function (jqXHR, textStatus, errorThrown) {
      console.log("Error al cargar modelos: " + textStatus + " - " + errorThrown);
    }
  });
});

/*=============================================
Cargar motores al seleccionar modelo
=============================================*/
$("#agregarModeloVehiculo").change(function () {
  var idModelo = $(this).val();
  var datos = new FormData();
  datos.append("idModelo", idModelo);

  $.ajax({
    url: "ajax/repuestos.ajax.php",
    method: "POST",
    data: datos,
    cache: false,
    contentType: false,
    processData: false,
    dataType: "json",
    success: function (response) {
      var motorSelect = $("#agregarMotor");
      motorSelect.empty();
      motorSelect.append("<option selected disabled>Elije un Motor</option>");
      response.forEach(function (motor) {
        motorSelect.append(
          '<option value="' + motor.id_motor + '">' + motor.nombre_motor + '</option>'
        );
      });
    },
    error: function (jqXHR, textStatus, errorThrown) {
      console.log("Error al cargar motores: " + textStatus + " - " + errorThrown);
    }
  });
});

});



/*=============================================
Función para verificar si el repuesto ya existe
=============================================*/
function verificarRepuesto() {
  var nombreRepuesto = $("#nuevoNombreRepuesto").val();
  var datos = new FormData();
  datos.append("nombreRepuesto", nombreRepuesto);

  $.ajax({
    url: "ajax/repuestos.ajax.php",
    method: "POST",
    data: datos,
    cache: false,
    contentType: false,
    processData: false,
    dataType: "json",
    success: function(response) {
      var inputElement = $("#nuevoNombreRepuesto");
      var validFeedbackElement = inputElement.parent().children(".valid-feedback");
      var invalidFeedbackElement = inputElement.parent().children(".invalid-feedback");

      inputElement.removeClass("is-invalid is-valid");
      validFeedbackElement.hide();
      invalidFeedbackElement.hide();

      if (response.exists) {
        invalidFeedbackElement.html("Repuesto ya registrado");
        invalidFeedbackElement.show();
        inputElement.addClass("is-invalid");
      } else {
        validFeedbackElement.html("Válido");
        validFeedbackElement.show();
        inputElement.addClass("is-valid");
      }
    },
    error: function(jqXHR, textStatus, errorThrown) {
      console.log("Error al verificar repuesto: " + textStatus + " - " + errorThrown);
    }
  });
}


// /*=============================================
// Función para verificar si el código de repuesto ya existe
// =============================================*/
// function verificarCodigoRepuesto(codigoRepuesto) {
//   var datos = new FormData();
//   datos.append("codigoRepuesto", codigoRepuesto);

//   $.ajax({
//     url: "ajax/repuestos.ajax.php",
//     method: "POST",
//     data: datos,
//     cache: false,
//     contentType: false,
//     processData: false,
//     dataType: "json",
//     success: function(response) {
//       if (response.exists) {
//         // Si el código ya existe, muestra una alerta o maneja el caso adecuadamente
//         alert("El código de repuesto ya existe. Por favor, genere un nuevo código.");
//         $("#nuevoCodigoRepuesto").val('');
//       }
//     },
//     error: function(jqXHR, textStatus, errorThrown) {
//       console.log("Error al verificar código de repuesto: " + textStatus + " - " + errorThrown);
//     }
//   });
// }