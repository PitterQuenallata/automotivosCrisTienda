<?php

require_once "conexion.php";

class ModeloVentas {

  /*=============================================
  MOSTRAR VENTAS
  =============================================*/
  public static function mdlMostrarVentas($tabla, $item, $valor) {
    if ($item != null) {
      $stmt = Conexion::conectar()->prepare("SELECT * FROM $tabla WHERE $item = :$item ORDER BY codigo_venta DESC");
      $stmt->bindParam(":" . $item, $valor, PDO::PARAM_STR);
      $stmt->execute();
      return $stmt->fetch();
    } else {
      $stmt = Conexion::conectar()->prepare("SELECT * FROM $tabla ORDER BY codigo_venta DESC");
      $stmt->execute();
      return $stmt->fetchAll();
    }
  }
}
?>
