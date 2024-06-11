<?php
require_once "conexion.php";

class ModeloCompras
{

  /*=============================================
  MOSTRAR COMPRAS
  =============================================*/

  static public function mdlMostrarCompras($tabla, $item, $valor)
  {

    if ($item != null) {

      $stmt = Conexion::conectar()->prepare("SELECT * FROM $tabla WHERE $item = :$item");
      $stmt->bindParam(":" . $item, $valor, PDO::PARAM_STR);
      $stmt->execute();

      return $stmt->fetch();
    } else {

      $stmt = Conexion::conectar()->prepare("SELECT * FROM $tabla");
      $stmt->execute();

      return $stmt->fetchAll();
    }

    $stmt = null;
  }
  /*=============================================
  CREAR COMPRA
  =============================================*/
  public static function mdlRegistrarCompra($fechaCompra, $montoTotal, $idProveedor, $idUsuario)
  {
    try {
      $link = Conexion::conectar();
      $link->beginTransaction();

      $stmt = $link->prepare("INSERT INTO compras (fecha_compra, monto_total_compra, id_proveedor, id_usuario) VALUES (:fecha_compra, :monto_total_compra, :id_proveedor, :id_usuario)");

      $stmt->bindParam(":fecha_compra", $fechaCompra, PDO::PARAM_STR);
      $stmt->bindParam(":monto_total_compra", $montoTotal, PDO::PARAM_STR);
      $stmt->bindParam(":id_proveedor", $idProveedor, PDO::PARAM_INT);
      $stmt->bindParam(":id_usuario", $idUsuario, PDO::PARAM_INT);

      if ($stmt->execute()) {
        $idCompra = $link->lastInsertId();
        $link->commit();
        return $idCompra;
      } else {
        $link->rollBack();
        return "error";
      }

      $stmt = null;
    } catch (PDOException $e) {
      $link->rollBack();
      return "error";
    }
  }
  /*=============================================
 editar compra
  =============================================*/

  public static function mdlEditarCompra($tabla, $datos)
  {
    $stmt = Conexion::conectar()->prepare("UPDATE $tabla SET fecha_compra = :fecha_compra, monto_total_compra = :monto_total_compra, id_proveedor = :id_proveedor, id_usuario = :id_usuario WHERE id_compra = :id_compra");
    $stmt->bindParam(":fecha_compra", $datos['fecha_compra'], PDO::PARAM_STR);
    $stmt->bindParam(":monto_total_compra", $datos['monto_total_compra'], PDO::PARAM_STR);
    $stmt->bindParam(":id_proveedor", $datos['id_proveedor'], PDO::PARAM_INT);
    $stmt->bindParam(":id_usuario", $datos['id_usuario'], PDO::PARAM_INT);
    $stmt->bindParam(":id_compra", $datos['id_compra'], PDO::PARAM_INT);

    if ($stmt->execute()) {
      return "ok";
    } else {
      return "error";
    }

    $stmt = null;
  }
}
