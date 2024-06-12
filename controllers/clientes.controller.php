<?php

class ControladorClientes {

  /*=============================================
  MOSTRAR CLIENTES
  =============================================*/
  public static function ctrMostrarClientes($item, $valor) {
    $tabla = "clientes";
    $respuesta = ModeloClientes::mdlMostrarClientes($tabla, $item, $valor);
    return $respuesta;
  }
}
?>
