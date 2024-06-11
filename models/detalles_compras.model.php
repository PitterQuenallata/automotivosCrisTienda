<?php
require_once "conexion.php";

class ModeloDetallesCompras
{
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

  public static function mdlMostrarDetallesCompra($tabla, $idCompra)
  {
    $stmt = Conexion::conectar()->prepare("SELECT dc.id_detalle_compra, dc.codigo_compra, r.nombre_repuesto, dc.cantidad_detalleCompra, dc.precio_unitario
    FROM $tabla dc
    JOIN repuestos r ON dc.id_repuesto = r.id_repuesto
    WHERE dc.id_compra = :id_compra");
    $stmt->bindParam(":id_compra", $idCompra, PDO::PARAM_INT);
    $stmt->execute();
    return $stmt->fetchAll();
  }


  public static function mdlEliminarDetalleCompra($tabla, $idDetalle)
  {
    $stmt = Conexion::conectar()->prepare("DELETE FROM $tabla WHERE id_detalle_compra = :id_detalle");
    $stmt->bindParam(":id_detalle", $idDetalle, PDO::PARAM_INT);

    if ($stmt->execute()) {
      return "ok";
    } else {
      return "error";
    }

    $stmt = null;
  }

  /*=============================================
    ACTUALIZAR DETALLE DE COMPRA
    =============================================*/
  static public function mdlActualizarDetalleCompra($tabla, $datos)
  {
    try {
      $stmt = Conexion::conectar()->prepare("UPDATE $tabla SET cantidad_detalleCompra = :cantidad_detalleCompra, precio_unitario = :precio_unitario WHERE id_detalle_compra = :id_detalle_compra");

      $stmt->bindParam(":cantidad_detalleCompra", $datos["cantidad_detalleCompra"], PDO::PARAM_INT);
      $stmt->bindParam(":precio_unitario", $datos["precio_unitario"], PDO::PARAM_STR);
      $stmt->bindParam(":id_detalle_compra", $datos["id_detalle_compra"], PDO::PARAM_INT);

      if ($stmt->execute()) {
        return "ok";
      } else {
        return "error";
      }

      $stmt = null;
    } catch (PDOException $e) {
      return "error: " . $e->getMessage();
    }
  }
      /*=============================================
    OBTENER DETALLES DE COMPRA
    =============================================*/
    static public function mdlObtenerDetallesCompra($tabla, $idCompra) {
      try {
          $stmt = Conexion::conectar()->prepare("SELECT dc.*, r.nombre_repuesto FROM $tabla dc INNER JOIN repuestos r ON dc.id_repuesto = r.id_repuesto WHERE dc.id_compra = :id_compra");
          $stmt->bindParam(":id_compra", $idCompra, PDO::PARAM_INT);
          $stmt->execute();
          return $stmt->fetchAll(PDO::FETCH_ASSOC);
      } catch (PDOException $e) {
          return "error: " . $e->getMessage();
      }
  }
}
