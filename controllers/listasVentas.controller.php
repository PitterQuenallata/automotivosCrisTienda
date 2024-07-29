<?php

class ControladorListasVentas {

  /*=============================================
  MOSTRAR VENTAS
  =============================================*/
  public static function ctrMostrarVentas($item, $valor) {
    $tabla = "ventas";
    $respuesta = ModeloListasVentas::mdlMostrarVentas($tabla, $item, $valor);
    return $respuesta;
  }

  /*=============================================
  MOSTRAR CLIENTE
  =============================================*/
  public static function ctrMostrarCliente($item, $valor) {
    $tabla = "clientes";
    $respuesta = ModeloListasVentas::mdlMostrarCliente($tabla, $item, $valor);
    return $respuesta;
  }

  /*=============================================
  MOSTRAR USUARIO
  =============================================*/
  public static function ctrMostrarUsuario($item, $valor) {
    $tabla = "usuarios";
    $respuesta = ModeloListasVentas::mdlMostrarUsuario($tabla, $item, $valor);
    return $respuesta;
  }
/*=============================================
  MOSTRAR DETALLE VENTAS
  =============================================*/
  public static function ctrMostrarDetalleVentas($item, $valor) {
    $tabla = "detalles_ventas";
    $respuesta = ModeloListasVentas::mdlMostrarDetalleVentas($tabla, $item, $valor);
    return $respuesta;
  }

  /*=============================================
  MOSTRAR REPUESTO
  =============================================*/
  public static function ctrMostrarRepuesto($item, $valor) {
    $tabla = "repuestos";
    $respuesta = ModeloListasVentas::mdlMostrarRepuesto($tabla, $item, $valor);
    return $respuesta;
  }

  /*=============================================
  MOSTRAR VENTA
  =============================================*/
  public static function ctrMostrarVenta($item, $valor) {
    $tabla = "ventas";
    $respuesta = ModeloListasVentas::mdlMostrarVenta($tabla, $item, $valor);
    return $respuesta;
  }
}
?>
