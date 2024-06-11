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
    static public function ctrMostrarDetallesCompra($idCompra) {
      $tabla = "detalles_compras";
      $respuesta = ModeloDetallesCompras::mdlObtenerDetallesCompra($tabla, $idCompra);
      return $respuesta;
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
  static public function ctrActualizarDetalleCompra()
  {
    if (isset($_POST["id_detalle_compra"])) {
      $tabla = "detalles_compras";
      $datos = array(
        "id_detalle_compra" => $_POST["id_detalle_compra"],
        "cantidad_detalleCompra" => $_POST["cantidad_detalleCompra"],
        "precio_unitario" => $_POST["precio_unitario"]
      );

      $respuesta = ModeloDetallesCompras::mdlActualizarDetalleCompra($tabla, $datos);

      if ($respuesta == "ok") {
        echo json_encode(array("success" => true));
      } else {
        echo json_encode(array("success" => false, "error" => $respuesta));
      }
    }
  }
  /*=============================================
    OBTENER DETALLES DE COMPRA
    =============================================*/
  static public function ctrObtenerDetallesCompra($idCompra)
  {
    if ($idCompra) {
      $tabla = "detalles_compras";
      $respuesta = ModeloDetallesCompras::mdlObtenerDetallesCompra($tabla, $idCompra);

      if (!empty($respuesta)) {
        echo json_encode(array("success" => true, "data" => $respuesta));
      } else {
        echo json_encode(array("success" => false, "error" => "No se encontraron detalles"));
      }
    }
  }

/*=============================================
    ELIMINAR DETALLE DE COMPRA
    =============================================*/
    static public function ctrEliminarDetalleCompra() {
      if (isset($_POST["idDetalle"])) {
          $tabla = "detalles_compras";
          $idDetalle = $_POST["idDetalle"];
          
          $respuesta = ModeloDetallesCompras::mdlEliminarDetalleCompra($tabla, $idDetalle);

          if ($respuesta == "ok") {
              echo json_encode(array("success" => true));
          } else {
              echo json_encode(array("success" => false, "error" => $respuesta));
          }
      }
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
}
