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

/*=============================================
  REGISTRAR CLIENTE
  =============================================*/
  public static function ctrRegistrarCliente($datos) {
    $tabla = "clientes";
    $respuesta = ModeloClientes::mdlRegistrarCliente($tabla, $datos);

    if (is_numeric($respuesta) && $respuesta > 0) {
        return ["status" => "success", "id_cliente" => $respuesta];
    } else {
        return ["status" => "error"];
    }
}



  /*=============================================
  MOSTRAR CLIENTE POR NIT
  =============================================*/
  public static function ctrVerificarClientePorNit($nit) {
    $tabla = "clientes";
    return ModeloClientes::mdlMostrarClientePorNit($tabla, $nit);
  }
  /*=============================================
  ACTUALIZAR CONTADOR DE COMPRAS
  =============================================*/
  public static function ctrActualizarContadorCompras($idCliente, $comprasCliente) {
    $tabla = "clientes";
    return ModeloClientes::mdlActualizarContadorCompras($tabla, $idCliente, $comprasCliente);
  }


}
?>
