<?php
class ControladorCompras {

  /*=============================================
  MOSTRAR COMPRAS
  =============================================*/

  static public function ctrMostrarCompras($item, $valor) {

    $tabla = "compras";

    $respuesta = ModeloCompras::mdlMostrarCompras($tabla, $item, $valor);

    return $respuesta;

  }
  /*=============================================
  CREAR COMPRA
  =============================================*/

  static public function ctrCrearCompra() {

    if (isset($_POST["nuevoCodigoCompra"])) {

      if (preg_match('/^[a-zA-Z0-9]+$/', $_POST["nuevoCodigoCompra"]) &&
          preg_match('/^[0-9-]+$/', $_POST["fechaCompra"])) {

        $tabla = "compras";

        $datos = array(
          "codigo_compra" => $_POST["nuevoCodigoCompra"],
          "fecha" => $_POST["fechaCompra"],
          "id_proveedor" => $_POST["proveedorSelect"],
          "id_usuario" => $_POST["usuarioSelect"]
        );

        $respuesta = ModeloCompras::mdlIngresarCompra($tabla, $datos);

        if ($respuesta == "ok") {
          echo '<script>
          fncSweetAlert("success", "La compra ha sido guardada correctamente", "/compras");
          </script>';
        } else {
          echo '<script>
          fncSweetAlert("error", "Error al guardar la compra", "");
          fncFormatInputs();
          </script>';
        }
      } else {
        echo '<script>
        fncSweetAlert("error", "¡La compra no puede llevar caracteres especiales!");
        fncFormatInputs();
        </script>';
      }
    }
  }

}
