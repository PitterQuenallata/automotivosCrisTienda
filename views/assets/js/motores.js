$(document).ready(function () {
  $("#marcaSelec").change(function () {
    var idMarca = $(this).val();
    console.log("idMarca", idMarca);
    var datos = new FormData();
    datos.append("idMarca", idMarca);

    $.ajax({
      url: "ajax/motores.ajax.php",
      method: "POST",
      data: datos,
      cache: false,
      contentType: false,
      processData: false,
      dataType: "json",
      success: function (respuesta) {
        console.log("respuesta", respuesta); // Verifica la respuesta en la consola
        if (Array.isArray(respuesta)) {
          $("#modeloSelec").empty();
          $("#modeloSelec").append(
            "<option selected disabled>Elije un modelo</option>"
          );
          respuesta.forEach(function (modelo) {
            $("#modeloSelec").append(
              '<option value="' +
                modelo.id_modelo +
                '">' +
                modelo.nombre_modelo +
                " " +
                modelo.version_modelo +
                "</option>"
            );
          });
        } else {
          console.error("La respuesta no es un array.");
        }
      },
    });
  });
});

/*=============================================
Editar
=============================================*/
// Función para llenar el formulario de edición de motor
$(document).on("click", ".btnEditarMotor", function() {
  var idMotor = $(this).attr("idMotor");

  // Realizar la petición AJAX para obtener los datos del motor
  $.ajax({
      url: "ajax/motores.ajax.php",
      method: "POST",
      data: { idMotor: idMotor },
      dataType: "json",
      success: function(respuesta) {
          // Llenar los campos del modal con los datos del motor
          $("#idMotor").val(respuesta.id_motor);
          $("#editarMotor").val(respuesta.nombre_motor);
          $("#editarCilindrada").val(respuesta.cilindrada_motor);
          $("#editarEspecificaciones").val(respuesta.especificaciones_motor);
          
          // Llenar los inputs ocultos con los valores originales
          $("#nombreMotorActual").val(respuesta.nombre_motor);
          $("#cilindradaActual").val(respuesta.cilindrada_motor);
          $("#especificacionesActuales").val(respuesta.especificaciones_motor);
          $("#idModeloActual").val(respuesta.id_modelo);
      }
  });
});

/*=============================================
añadir modelos a un motor
=============================================*/
// Función para cargar modelos basados en la marca seleccionada al añadir modelos a un motor
$("#marcaSelecAñadirModelos").change(function () {
  var idMarca = $(this).val();
  var datos = new FormData();
  datos.append("idMarca", idMarca);

  $.ajax({
    url: "ajax/motores.ajax.php",
    method: "POST",
    data: datos,
    cache: false,
    contentType: false,
    processData: false,
    dataType: "json",
    success: function (data) {
      var modeloSelect = $("#modelosSelecAñadir");
      modeloSelect.empty();
      modeloSelect.append("<option selected disabled>Elije un modelo</option>");
      data.forEach(function (modelo) {
        modeloSelect.append(
          '<option value="' +
            modelo.id_modelo +
            '">' +
            modelo.nombre_modelo +
            " " +
            modelo.version_modelo +
            "</option>"
        );
      });
    },
  });
});

// Función para abrir el modal de añadir modelos a un motor
$(".btnAñadirModelosMotor").click(function () {
  var idMotor = $(this).attr("idMotor");
  $("#idMotorAñadir").val(idMotor);
});

/*=============================================
ELIMINAR Modelo
=============================================*/
// Función para eliminar un motor
$(".btnEliminarMotor").click(function () {
  var idMotor = $(this).attr("idMotor");
  var baseURL = "motores?idMotor=" + idMotor;

  // Llamar a la función personalizada de SweetAlert
  fncSweetAlert("confirm", "¡Está seguro de borrar el motor?", baseURL);
});
