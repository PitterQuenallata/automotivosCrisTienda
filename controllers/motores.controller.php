<?php

class ControladorMotores
{
/*=============================================
  CREAR MOTOR
  =============================================*/
  static public function ctrCrearMotor()
  {
    if (isset($_POST["nuevoMotor"])) {

      if (
        preg_match('/^[a-zA-Z0-9ñÑáéíóúÁÉÍÓÚ. ]+$/', $_POST["nuevoMotor"]) &&
        preg_match('/^[a-zA-Z0-9ñÑáéíóúÁÉÍÓÚ. ]+$/', $_POST["cilindradaMotor"])
      ) {

        $tabla = "motores";

        // Verificamos si el modelo está seleccionado
        if (isset($_POST["modeloSelect"]) && !empty($_POST["modeloSelect"])) {
          $idModelo = $_POST["modeloSelect"];
        } else {
          $idModelo = null; // En caso de que no se seleccione ningún modelo
        }

        // Preparamos los datos para el nuevo motor
        $datos = array(
          "nombre_motor" => strtolower($_POST["nuevoMotor"]),
          "cilindrada_motor" => strtolower($_POST["cilindradaMotor"]),
          "especificaciones_motor" => $_POST["especificacionesMotor"],
          "id_modelo" => $idModelo // Incluimos el id_modelo directamente en los datos
        );

        // Llamada al modelo para insertar el motor
        $idMotor = ModeloMotores::mdlIngresarMotor($tabla, $datos);

        if ($idMotor != "error") {
          echo '<script>
          fncSweetAlert("success", "El motor ha sido guardado correctamente", "/motores");
          </script>';
        } else {
          echo '<script>
          fncSweetAlert("error", "Error al guardar el motor", "");
          fncFormatInputs();
          </script>';
        }
      } else {
        echo '<script>
        fncSweetAlert("error", "¡El motor no puede ir vacío o llevar caracteres especiales!");
        fncFormatInputs();
        </script>';
      }
    }
  }


/*=============================================
MOSTRAR MOTORES POR MODELO
=============================================*/
static public function ctrMostrarMotores($item, $valor)
{
    if ($item == "id_modelo") {
        $tabla = "motores";
        $respuesta = ModeloMotores::mdlMostrarMotoresPorModelo($tabla, $valor);
    } else {
        $tabla = "motores";
        $respuesta = ModeloMotores::mdlMostrarMotores($tabla, $item, $valor);
    }
    return $respuesta;
}


  /*=============================================
MOSTRAR MODELOS POR MOTOR
=============================================*/
  static public function ctrMostrarModelosPorMotor($idMotor)
  {
    $tabla = "modelo_motores";
    return ModeloMotores::mdlMostrarModelosPorMotor($tabla, $idMotor);
  }

  /*=============================================
mostrar modelos por marca en select
=============================================*/
  static public function ctrMostrarModelos($item, $valor)
  {
    $tabla = "modelos";
    $respuesta = ModeloMotores::mdlMostrarModelos($tabla, $item, $valor);
    return $respuesta;
  }


/*=============================================
EDITAR MOTOR
=============================================*/
public static function ctrEditarMotor()
{
    if (isset($_POST["idMotor"])) {
        // Validar entradas
        if (
            preg_match('/^[a-zA-Z0-9ñÑáéíóúÁÉÍÓÚ. ]+$/', $_POST["editarMotor"]) &&
            preg_match('/^[a-zA-Z0-9ñÑáéíóúÁÉÍÓÚ. ]+$/', $_POST["editarCilindrada"])
        ) {

            $tabla = "motores";

            // Si el campo no fue modificado, utilizamos el valor original
            $datos = array(
                "id_motor" => $_POST["idMotor"],
                "nombre_motor" => !empty($_POST["editarMotor"]) ? strtolower($_POST["editarMotor"]) : $_POST["nombreMotorActual"],
                "cilindrada_motor" => !empty($_POST["editarCilindrada"]) ? strtolower($_POST["editarCilindrada"]) : $_POST["cilindradaActual"],
                "especificaciones_motor" => !empty($_POST["editarEspecificaciones"]) ? $_POST["editarEspecificaciones"] : $_POST["especificacionesActuales"],
                "id_modelo" => !empty($_POST["modeloSelect"]) ? $_POST["modeloSelect"] : $_POST["idModeloActual"]
            );

            // Llamada al modelo para actualizar los datos
            $respuesta = ModeloMotores::mdlEditarMotor($tabla, $datos);

            if ($respuesta == "ok") {
                echo '<script>
                    fncSweetAlert("success", "El motor ha sido actualizado correctamente", "/motores");
                    </script>';
            } else {
                echo '<script>
                    fncSweetAlert("error", "Error al actualizar el motor", "");
                    </script>';
            }
        } else {
            echo '<script>
                fncSweetAlert("error", "¡El nombre y la cilindrada no pueden estar vacíos o contener caracteres especiales!");
                </script>';
        }
    }
}





/*=============================================
  ELIMINAR MOTOR
=============================================*/
static public function ctrBorrarMotor() {
  if (isset($_GET["idMotor"])) {
      $tabla = "motores";
      $idMotor = $_GET["idMotor"];

      // Eliminar directamente el motor de la tabla motores
      $respuesta = ModeloMotores::mdlBorrarMotor($tabla, $idMotor);

      if ($respuesta == "ok") {
          echo '<script>
          fncSweetAlert("success", "El motor ha sido borrado correctamente", "/motores");
          </script>';
      } else {
          echo '<script>
          fncSweetAlert("error", "Error al borrar el motor", "");
          </script>';
      }
  }
}


}
