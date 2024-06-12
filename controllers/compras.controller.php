<?php


class ControladorCompras
{
  /*=============================================
	Editar Compra
	=============================================*/
  public static function ctrEditarCompra($datos)
  {
    $tabla = "compras";
    $respuesta = ModeloCompras::mdlEditarCompra($tabla, $datos);
    return $respuesta;
  }
    /*=============================================
    MOSTRAR DETALLES DE COMPRA
    =============================================*/
    public static function ctrMostrarDetallesCompra($idCompra) {
      $detalles = ModeloDetallesCompras::mdlMostrarDetallesCompra("detalles_compras", $idCompra);

      // Obtener el nombre del repuesto para cada detalle de compra
      foreach ($detalles as &$detalle) {
          $repuesto = ModeloRepuestos::mdlMostrarRepuestos("repuestos", "id_repuesto", $detalle["id_repuesto"]);
          $detalle["nombre_repuesto"] = $repuesto["nombre_repuesto"];
      }

      return $detalles;
  }
  /*=============================================
	Mostrar Compras
	=============================================*/
  public static function ctrMostrarCompras($item, $valor)
  {
    $tabla = "compras";
    $respuesta = ModeloCompras::mdlMostrarCompras($tabla, $item, $valor);
    return $respuesta;
  }

    /*=============================================
    ACTUALIZAR DETALLE DE COMPRA
    =============================================*/
    static public function ctrActualizarDetalleCompra($datos) {
      $respuesta = ModeloDetallesCompras::mdlActualizarDetalleCompra("detalles_compras", $datos);
      
      if ($respuesta == "ok") {
          // Actualizar monto total de la compra
          $actualizacionMonto = self::ctrActualizarMontoTotalCompra($datos["id_compra"]);
          if ($actualizacionMonto == "ok") {
              return "ok";
          } else {
              return $actualizacionMonto;
          }
      } else {
          return $respuesta;
      }
  }


    /*=============================================
    ELIMINAR DETALLE DE COMPRA
    =============================================*/
    static public function ctrEliminarDetalleCompra($idDetalle) {
      $detalle = ModeloDetallesCompras::mdlMostrarDetalleCompraPorId("detalles_compras", $idDetalle);
      if ($detalle) {
          $idCompra = $detalle["id_compra"];
          $respuesta = ModeloDetallesCompras::mdlEliminarDetalleCompra("detalles_compras", $idDetalle);
          if ($respuesta == "ok") {
              // Actualizar monto total de la compra
              return self::ctrActualizarMontoTotalCompra($idCompra);
          } else {
              return $respuesta;
          }
      } else {
          return "error";
      }
  }
    /*=============================================
    ACTUALIZAR MONTO TOTAL DE COMPRA
    =============================================*/
    static public function ctrActualizarMontoTotalCompra($idCompra) {
      $montoTotal = ModeloDetallesCompras::mdlCalcularMontoTotalCompra($idCompra);
      return ModeloCompras::mdlActualizarMontoTotalCompra("compras", $idCompra, $montoTotal);
  }
  /*=============================================
	Registrar Compras
	=============================================*/
  public static function ctrRegistrarCompra($data)
  {

    $fechaCompra = $data['fechaCompra'];
    $montoTotal = $data['montoTotal'];
    $idProveedor = $data['proveedor'];
    $idUsuario = $data['usuario']; // Ajustar según tu lógica de usuarios

    // Registrar la compra
    $idCompra = ModeloCompras::mdlRegistrarCompra($fechaCompra, $montoTotal, $idProveedor, $idUsuario);


    if ($idCompra) {
      foreach ($data['detalles'] as $detalle) {
        $idRepuesto = $detalle['idRepuesto'];
        $cantidad = $detalle['cantidad'];
        $precioUnitario = $detalle['precioUnitario'];
        $codigoCompra = uniqid();

        $detalleRespuesta = ModeloDetallesCompras::mdlRegistrarDetalleCompra($idCompra, $idRepuesto, $cantidad, $codigoCompra, $precioUnitario);

        if ($detalleRespuesta !== true) {
          return "Error al registrar el detalle de la compra: " . json_encode($detalleRespuesta);
        }
      }
      return true;
    } else {
      return "Error al registrar la compra.";
    }
  }
      /*=============================================
    ELIMINAR COMPRA Y SUS DETALLES
    =============================================*/
    static public function ctrEliminarCompra($idCompra) {
      // Eliminar detalles de la compra
      $respuestaDetalles = ModeloDetallesCompras::mdlEliminarDetallesPorCompra("detalles_compras", $idCompra);
      if ($respuestaDetalles == "ok") {
          // Eliminar la compra
          $respuestaCompra = ModeloCompras::mdlEliminarCompra("compras", $idCompra);
          return $respuestaCompra;
      } else {
          return "error";
      }
  }
}
