<?php
class ControladorProveedores
{

  /*=============================================
  MOSTRAR PROVEEDORES
  =============================================*/
  static public function ctrMostrarProveedores($item, $valor)
  {
    $tabla = "proveedores";
    $respuesta = ModeloProveedores::mdlMostrarProveedores($tabla, $item, $valor);
    return $respuesta;
  }
  /*=============================================
  CREAR PROVEEDOR
  =============================================*/
  static public function ctrCrearProveedor()
  {
    if (isset($_POST["nombre_proveedor"])) {
      if (
        preg_match('/^[a-zA-Z0-9ñÑáéíóúÁÉÍÓÚ ]+$/', $_POST["nombre_proveedor"]) &&
        preg_match('/^[0-9]+$/', $_POST["telefono_proveedor"]) &&
        preg_match('/^[a-zA-Z0-9ñÑáéíóúÁÉÍÓÚ ]+$/', $_POST["direccion_proveedor"])
      ) {

        $tabla = "proveedores";

        $datos = array(
          "nombre_proveedor" => $_POST["nombre_proveedor"],
          "telefono_proveedor" => $_POST["telefono_proveedor"],
          "direccion_proveedor" => $_POST["direccion_proveedor"]
        );

        $respuesta = ModeloProveedores::mdlIngresarProveedor($tabla, $datos);

        if ($respuesta == "ok") {
          echo '<script>
          fncSweetAlert("success", "El proveedor ha sido agregado correctamente", "/proveedores");
          </script>';
        } else {
          echo '<script>
          fncSweetAlert("error", "Error al agregar el proveedor", "");
          fncFormatInputs();
          </script>';
        }
      } else {
        echo '<script>
        fncSweetAlert("error", "¡El proveedor no puede ir vacío o llevar caracteres especiales!");
        fncFormatInputs();
        </script>';
      }
    }
  }

  /*=============================================
    EDITAR PROVEEDOR
    =============================================*/

  static public function ctrEditarProveedor()
  {

    if (isset($_POST["idProveedor"])) {

      if (
        preg_match('/^[a-zA-Z0-9ñÑáéíóúÁÉÍÓÚ ]+$/', $_POST["editarNombreProveedor"]) &&
        preg_match('/^[0-9]+$/', $_POST["editarTelefonoProveedor"]) &&
        preg_match('/^[a-zA-Z0-9ñÑáéíóúÁÉÍÓÚ.,# ]+$/', $_POST["editarDireccionProveedor"])
      ) {

        $tabla = "proveedores";

        $datos = array(
          "id_proveedor" => $_POST["idProveedor"],
          "nombre_proveedor" => $_POST["editarNombreProveedor"],
          "telefono_proveedor" => $_POST["editarTelefonoProveedor"],
          "direccion_proveedor" => $_POST["editarDireccionProveedor"]
        );

        $respuesta = ModeloProveedores::mdlEditarProveedor($tabla, $datos);

        if ($respuesta == "ok") {
          echo '<script>
                  fncSweetAlert("success", "El proveedor ha sido actualizado correctamente", "/proveedores");
                  </script>';
        } else {
          echo '<script>
                  fncSweetAlert("error", "Error al actualizar el proveedor", "");
                  fncFormatInputs();
                  </script>';
        }
      } else {
        echo '<script>
              fncSweetAlert("error", "¡El proveedor no puede ir vacío o llevar caracteres especiales inválidos!", "");
              fncFormatInputs();
              </script>';
      }
    }
  }
  
/*=============================================
  ELIMINAR PROVEEDOR
  =============================================*/
  public function ctrEliminarProveedor() {
    if (isset($_GET["idProveedor"])) {
      $tabla = "proveedores";
      $item = "id_proveedor";
      $valor = $_GET["idProveedor"];

      $respuesta = ModeloProveedores::mdlEliminarProveedor($tabla, $item, $valor);

      if ($respuesta == "ok") {
        echo '<script>
        fncSweetAlert("success", "El proveedor ha sido eliminado correctamente", "/proveedores");
        </script>';
      } else {
        echo '<script>
        fncSweetAlert("error", "Error al eliminar el proveedor", "");
        </script>';
      }
    }
  }
}
