<?php
require_once "conexion.php";

class ModeloCompras {

  /*=============================================
  MOSTRAR COMPRAS
  =============================================*/

  static public function mdlMostrarCompras($tabla, $item, $valor) {

    if ($item != null) {

      $stmt = Conexion::conectar()->prepare("SELECT * FROM $tabla WHERE $item = :$item");
      $stmt -> bindParam(":".$item, $valor, PDO::PARAM_STR);
      $stmt -> execute();

      return $stmt -> fetch();

    } else {

      $stmt = Conexion::conectar()->prepare("SELECT * FROM $tabla");
      $stmt -> execute();

      return $stmt -> fetchAll();

    }

    $stmt = null;

  }
  /*=============================================
  CREAR COMPRA
  =============================================*/

  static public function mdlIngresarCompra($tabla, $datos) {

    $stmt = Conexion::conectar()->prepare("INSERT INTO $tabla(codigo_compra, fecha, id_proveedor, id_usuario) VALUES (:codigo_compra, :fecha, :id_proveedor, :id_usuario)");

    $stmt->bindParam(":codigo_compra", $datos["codigo_compra"], PDO::PARAM_STR);
    $stmt->bindParam(":fecha", $datos["fecha"], PDO::PARAM_STR);
    $stmt->bindParam(":id_proveedor", $datos["id_proveedor"], PDO::PARAM_INT);
    $stmt->bindParam(":id_usuario", $datos["id_usuario"], PDO::PARAM_INT);

    if ($stmt->execute()) {
      return "ok";
    } else {
      return "error";
    }

    $stmt = null;
  }

}
