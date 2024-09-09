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

        $datos = array(
          "nombre_motor" => strtolower($_POST["nuevoMotor"]),
          "cilindrada_motor" => strtolower($_POST["cilindradaMotor"]),
          "especificaciones_motor" => $_POST["especificacionesMotor"]
        );

        $idMotor = ModeloMotores::mdlIngresarMotor($tabla, $datos);

        if ($idMotor != "error") {

          // Registrar en la tabla intermedia modelo_motores si se seleccionó un modelo
          if (isset($_POST["modeloSelect"]) && !empty($_POST["modeloSelect"])) {
            $tablaIntermedia = "modelo_motores";
            $idModelo = $_POST["modeloSelect"];
            ModeloMotores::mdlRegistrarModeloMotor($tablaIntermedia, $idModelo, $idMotor);
          }

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

  static public function ctrEditarMotor() {

    if (isset($_POST["editarMotor"])) {

      if (preg_match('/^[a-zA-Z0-9ñÑáéíóúÁÉÍÓÚ ]+$/', $_POST["editarMotor"]) &&
          preg_match('/^[a-zA-Z0-9ñÑáéíóúÁÉÍÓÚ. ]+$/', $_POST["editarCilindrada"])) {

        $tabla = "motores";

        $datos = array(
          "id_motor" => $_POST["idMotor"],
          "nombre_motor" => strtolower($_POST["editarMotor"]),
          "cilindrada_motor" => strtolower($_POST["editarCilindrada"]),
          "especificaciones_motor" => $_POST["editarEspecificaciones"]
        );

        $respuesta = ModeloMotores::mdlEditarMotor($tabla, $datos);

        if ($respuesta == "ok") {
          echo '<script>
          fncSweetAlert("success", "El motor ha sido actualizado correctamente", "/motores");
          </script>';
        } else {
          echo '<script>
          fncSweetAlert("error", "Error al actualizar el motor", "");
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
AÑADIR MODELOS A UN MOTOR
=============================================*/
static public function ctrAñadirModelosMotor() {
  if (isset($_POST["idMotorAñadir"])) {
      $idMotor = $_POST["idMotorAñadir"];
      $modelos = $_POST["modelosSelectAñadir"];
      
      $tabla = "modelo_motores";
      
      foreach ($modelos as $idModelo) {
          ModeloMotores::mdlRegistrarModeloMotor($tabla, $idModelo, $idMotor);
      }
      
      echo '<script>
      fncSweetAlert("success", "Los modelos han sido añadidos correctamente al motor", "/motores");
      </script>';
  }
}

/*=============================================
ELIMINAR MOTOR
=============================================*/
static public function ctrBorrarMotor() {
  if (isset($_GET["idMotor"])) {
      $tabla = "motores";
      $idMotor = $_GET["idMotor"];

      // Primero, eliminar las entradas de la tabla intermedia modelo_motores
      $tablaIntermedia = "modelo_motores";
      $respuestaIntermedia = ModeloMotores::mdlBorrarModeloMotor($tablaIntermedia, $idMotor);

      if ($respuestaIntermedia == "ok") {
          // Luego, eliminar el motor de la tabla motores
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
      } else {
          echo '<script>
          fncSweetAlert("error", "Error al borrar las relaciones del motor", "");
          </script>';
      }
  }
}

}
