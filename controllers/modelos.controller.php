<?php

class ControladorModelos
{
  /*=============================================
	CREAR ModeloS
	=============================================*/

  static public function ctrCrearModelo()
  {

    if (isset($_POST["nuevoModelo"])) {

      if (preg_match('/^[a-zA-Z0-9ñÑáéíóúÁÉÍÓÚ ]+$/', $_POST["nuevoModelo"])) {

        echo '<script> alert("'.$_POST["nuevoModelo"].'"); </script>';
        echo '<script> alert("'.$_POST["marcaSelec"].'"); </script>';
        $tabla = "modelos";
        $datos = array(
          "nombre_modelo" => $_POST["nuevoModelo"],
          "id_marca_modelo" => $_POST["marcaSelect"]

      );

        

        $respuesta = ModeloModelos::mdlIngresarModelo($tabla, $datos);

        if ($respuesta == "ok") {

          echo '<script>
          fncSweetAlert("success", "El Modelo ha sido guardada correctamente", "/modelos");
          </script>';
        }
      } else {
        echo '<script>
        fncSweetAlert("error", "¡El Modelo no puede ir vacía o llevar caracteres especiales!", "/modelos");
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

        $tabla = "modelos"; // Asegúrate de que el nombre de la tabla esté en minúsculas si así está en la base de datos

        $datos = array(
          "nombre_modelo" => $_POST["editarModelo"], // Corrige el nombre de la clave para que coincida con el nombre en la base de datos
          "id_modelo" => $_POST["idModelo"], // Corrige el nombre de la clave para que coincida con el nombre en la base de datos
          "id_marca_modelo" => $_POST["marcaSelectEditar"] // Asegúrate de agregar el ID de la marca si es necesario
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
