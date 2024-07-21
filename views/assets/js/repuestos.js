$(document).ready(function () {
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
      { data: "0", className: "text-center" },
      { data: "1", className: "text-truncate" },
      { data: "2", className: "text-truncate" },
      { data: "3", className: "text-truncate" }, // Descripción
      { data: "4", className: "text-center" }, // Precio
      { data: "5", className: "text-center" }, // Precio por cantidad
      { data: "6", className: "text-truncate" },
      { data: "7", className: "text-center" },
      { data: "8", className: "text-truncate" },
      { data: "9", className: "text-center" },
      { data: "10", className: "text-center" },
      
    ],
    destroy: true, // Asegura la destrucción previa de la tabla
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

  $("#agregarCategoria").change(function () {
    var idCategoria = $(this).val();
    var datos = new FormData();
    datos.append("idCategoria", idCategoria);
    $.ajax({
      url:"ajax/repuestos.ajax.php",
      method: "POST",
      data: datos,
      cache: false,
      contentType: false,
      processData: false,
      dataType:"json",
      success: function (respuesta) {
        if(!respuesta){
          var nuevoCodigo=idCategoria+"0000";
          $("#nuevoCodigoRepuesto").val(nuevoCodigo);
        }else{
          console.log("respu",respuesta);
          var nuevoCodigo = Number(respuesta["codigo_tienda_repuesto"])+1;
          console.log("nuevoCodigo",nuevoCodigo);
          $("#nuevoCodigoRepuesto").val(nuevoCodigo);
        }
        
      },
    })
  });

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
      success: function (data) {
          var modeloSelect = $("#agregarModeloVehiculo");
          modeloSelect.empty();
          modeloSelect.append("<option selected disabled>Elije un Modelo</option>");
          data.forEach(function (modelo) {
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
      success: function (data) {
          var motorSelect = $("#agregarMotor");
          motorSelect.empty();
          motorSelect.append("<option selected disabled>Elije un Motor</option>");
          data.forEach(function (motor) {
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
