<?php

class ControladorModelos
{
/*=============================================
CREAR MODELO
=============================================*/
static public function ctrCrearModelo()
{
  if (isset($_POST["nuevoModelo"])) {
    if (
      preg_match('/^[a-zA-Z0-9ñÑáéíóúÁÉÍÓÚ ]+$/', $_POST["nuevoModelo"]) &&
      preg_match('/^[0-9]+$/', $_POST["anioInicio"]) &&
      ($_POST["anioFin"] == '' || preg_match('/^[0-9]+$/', $_POST["anioFin"]))
    ) {
      $tabla = "modelos";
      $datos = array(
        "id_marca" => $_POST["marcaSelect"],
        "nombre_modelo" => strtolower($_POST["nuevoModelo"]),
        "version_modelo" => strtolower($_POST["nuevaVersion"]),
        "anio_inicio_modelo" => $_POST["anioInicio"],
        "anio_fin_modelo" => $_POST["anioFin"]
      );
      $respuesta = ModeloModelos::mdlIngresarModelo($tabla, $datos);
      if ($respuesta == "ok") {
        echo '<script>
        fncSweetAlert("success", "El modelo ha sido guardado correctamente", "/modelos");
        </script>';
      }
    } else {
      echo '<script>
      fncSweetAlert("error", "¡El modelo no puede llevar caracteres especiales y los años deben ser numéricos!");
      fncFormatInputs();
      </script>';
    }
  }
}
  /*=============================================
	MOSTRAR ModeloS
	=============================================*/

  static public function ctrMostrarModelos($item, $valor)
  {

    $tabla = "modelos";

    $respuesta = ModeloModelos::mdlMostrarModelos($tabla, $item, $valor);

    return $respuesta;
  }

/*=============================================
EDITAR MODELO
=============================================*/

static public function ctrEditarModelo() {

  if (isset($_POST["editarModelo"])) {

    if (preg_match('/^[a-zA-Z0-9ñÑáéíóúÁÉÍÓÚ ]+$/', $_POST["editarModelo"])) {

      $_POST["editarModelo"] = strtolower($_POST["editarModelo"]);

      $tabla = "modelos";

      $datos = array(
        "nombre_modelo" => $_POST["editarModelo"],
        "id_modelo" => $_POST["idModelo"],
        "id_marca" => $_POST["marcaSelectEditar"],
        "version_modelo" => $_POST["editarVersion"],
        "anio_inicio_modelo" => $_POST["editarAnioInicio"],
        "anio_fin_modelo" => $_POST["editarAnioFin"]
      );

      $respuesta = ModeloModelos::mdlEditarModelo($tabla, $datos);

      if ($respuesta == "ok") {

        echo '<script>
        fncSweetAlert("success", "El modelo ha sido actualizado correctamente", "/modelos");
        </script>';

      } else {

        echo '<script>
        fncSweetAlert("error", "Error al actualizar el modelo", "");
        fncFormatInputs();
        </script>';
      }

    } else {

      echo '<script>
      fncSweetAlert("error", "El nombre del modelo no puede ir vacío o llevar caracteres especiales", "");
      fncFormatInputs();
      </script>';
    }
  }
}

  /*=============================================
  BORRAR MODELO
  =============================================*/

  static public function ctrBorrarModelo() {

    if (isset($_GET["idModelo"])) {

      $tabla = "modelos"; // Asegúrate de que el nombre de la tabla esté en minúsculas si así está en la base de datos
      $datos = $_GET["idModelo"];

      $respuesta = ModeloModelos::mdlBorrarModelo($tabla, $datos);

      if ($respuesta == "ok") {

        echo '<script>
        fncSweetAlert("success", "El modelo ha sido borrado correctamente", "/modelos");
        </script>';

      } else {

        echo '<script>
        fncSweetAlert("error", "Error al borrar el modelo", "/modelos");
        </script>';
      }
    }
  }
}
