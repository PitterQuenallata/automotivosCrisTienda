<?php
require_once "conexion.php";

class ModeloDetallesCompras
{

  /*=============================================
    REGISTRAR DETALLE DE COMPRA
    =============================================*/
  public static function mdlRegistrarDetalleCompra($idCompra, $idRepuesto, $cantidad, $codigoCompra, $precioUnitario)
  {
    try {
      $stmt = Conexion::conectar()->prepare("INSERT INTO detalles_compras (id_compra, id_repuesto, cantidad_detalleCompra, codigo_compra, precio_unitario) VALUES (:id_compra, :id_repuesto, :cantidad_detalleCompra, :codigo_compra, :precio_unitario)");

      $stmt->bindParam(":id_compra", $idCompra, PDO::PARAM_INT);
      $stmt->bindParam(":id_repuesto", $idRepuesto, PDO::PARAM_INT);
      $stmt->bindParam(":cantidad_detalleCompra", $cantidad, PDO::PARAM_INT);
      $stmt->bindParam(":codigo_compra", $codigoCompra, PDO::PARAM_STR);
      $stmt->bindParam(":precio_unitario", $precioUnitario, PDO::PARAM_STR);

      if ($stmt->execute()) {
        return true;
      } else {
        return $stmt->errorInfo(); // Devuelve el error si no se puede ejecutar
      }
    } catch (Exception $e) {
      return "Error en la base de datos: " . $e->getMessage();
    }


    $stmt = null;
  }
  /*=============================================
    MOSTRAR DETALLES DE COMPRA
    =============================================*/
  static public function mdlMostrarDetallesCompra($tabla, $idCompra)
  {
    $stmt = Conexion::conectar()->prepare("SELECT * FROM $tabla WHERE id_compra = :id_compra");
    $stmt->bindParam(":id_compra", $idCompra, PDO::PARAM_INT);
    $stmt->execute();
    return $stmt->fetchAll();
  }


  /*=============================================
    ELIMINAR DETALLE DE COMPRA
    =============================================*/
  static public function mdlEliminarDetalleCompra($tabla, $idDetalle)
  {
    $stmt = Conexion::conectar()->prepare("DELETE FROM $tabla WHERE id_detalle_compra = :id_detalle_compra");
    $stmt->bindParam(":id_detalle_compra", $idDetalle, PDO::PARAM_INT);

    if ($stmt->execute()) {
      return "ok";
    } else {
      return "error";
    }

    $stmt = null;
  }

  /*=============================================
    ACTUALIZAR DETALLE DE COMPRA EN EL MODELO
    =============================================*/
  static public function mdlActualizarDetalleCompra($tabla, $datos)
  {
    $stmt = Conexion::conectar()->prepare("UPDATE $tabla SET cantidad_detalleCompra = :cantidad_detalleCompra, precio_unitario = :precio_unitario, id_repuesto = :id_repuesto WHERE id_detalle_compra = :id_detalle_compra");
    $stmt->bindParam(":cantidad_detalleCompra", $datos["cantidad_detalleCompra"], PDO::PARAM_INT);
    $stmt->bindParam(":precio_unitario", $datos["precio_unitario"], PDO::PARAM_STR);
    $stmt->bindParam(":id_repuesto", $datos["id_repuesto"], PDO::PARAM_INT);
    $stmt->bindParam(":id_detalle_compra", $datos["id_detalle_compra"], PDO::PARAM_INT);

    if ($stmt->execute()) {
      return "ok";
    } else {
      return "error";
    }

    $stmt = null;
  }

  /*=============================================
OBTENER ID DE COMPRA
=============================================*/
  static public function mdlObtenerIdCompra($idDetalle)
  {
    $stmt = Conexion::conectar()->prepare("SELECT id_compra FROM detalles_compras WHERE id_detalle_compra = :id_detalle_compra");
    $stmt->bindParam(":id_detalle_compra", $idDetalle, PDO::PARAM_INT);
    $stmt->execute();
    return $stmt->fetch(PDO::FETCH_COLUMN);
  }




  /*=============================================
    MOSTRAR DETALLE DE COMPRA POR ID
    =============================================*/
  static public function mdlMostrarDetalleCompraPorId($tabla, $idDetalle)
  {
    $stmt = Conexion::conectar()->prepare("SELECT * FROM $tabla WHERE id_detalle_compra = :id_detalle_compra");
    $stmt->bindParam(":id_detalle_compra", $idDetalle, PDO::PARAM_INT);
    $stmt->execute();
    return $stmt->fetch();
  }

  /*=============================================
    ELIMINAR COMPRA
    =============================================*/
  static public function mdlEliminarCompra($tabla, $idCompra)
  {
    $stmt = Conexion::conectar()->prepare("DELETE FROM $tabla WHERE id_compra = :id_compra");
    $stmt->bindParam(":id_compra", $idCompra, PDO::PARAM_INT);

    if ($stmt->execute()) {
      return "ok";
    } else {
      return "error";
    }

    $stmt = null;
  }
  /*=============================================
    ELIMINAR DETALLES POR COMPRA
    =============================================*/
  static public function mdlEliminarDetallesPorCompra($tabla, $idCompra)
  {
    $stmt = Conexion::conectar()->prepare("DELETE FROM $tabla WHERE id_compra = :id_compra");
    $stmt->bindParam(":id_compra", $idCompra, PDO::PARAM_INT);

    if ($stmt->execute()) {
      return "ok";
    } else {
      return "error";
    }

    $stmt = null;
  }

      /*=============================================
    CALCULAR MONTO TOTAL DE COMPRA
    =============================================*/
    public static function mdlCalcularMontoTotalCompra($idCompra)
    {
        $stmt = Conexion::conectar()->prepare("SELECT SUM(cantidad_detalleCompra * precio_unitario) as total FROM detalles_compras WHERE id_compra = :id_compra");
        $stmt->bindParam(":id_compra", $idCompra, PDO::PARAM_INT);
        $stmt->execute();
        return $stmt->fetch(PDO::FETCH_COLUMN);
    }

    /*=============================================
    MOSTRAR DETALLES DE COMPRA
    =============================================*/
    public static function mdlMostrarDetallesCompraModal($tabla, $idCompra)
    {
        $stmt = Conexion::conectar()->prepare("SELECT d.*, r.nombre_repuesto
        FROM $tabla d
        INNER JOIN repuestos r ON d.id_repuesto = r.id_repuesto
        WHERE d.id_compra = :id_compra");
        $stmt->bindParam(":id_compra", $idCompra, PDO::PARAM_INT);
        $stmt->execute();
        return $stmt->fetchAll();
    }
}
