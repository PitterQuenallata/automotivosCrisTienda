<?php
require_once "conexion.php"; // Asegúrate de que la ruta sea correcta
class ModeloProveedores {

      /*=============================================
  MOSTRAR PROVEEDORES
  =============================================*/
  static public function mdlMostrarProveedores($tabla, $item, $valor) {
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
  INGRESAR PROVEEDOR
  =============================================*/
  static public function mdlIngresarProveedor($tabla, $datos) {
    $stmt = Conexion::conectar()->prepare("INSERT INTO $tabla (nombre_proveedor, telefono_proveedor, direccion_proveedor) VALUES (:nombre_proveedor, :telefono_proveedor, :direccion_proveedor)");

    $stmt->bindParam(":nombre_proveedor", $datos["nombre_proveedor"], PDO::PARAM_STR);
    $stmt->bindParam(":telefono_proveedor", $datos["telefono_proveedor"], PDO::PARAM_STR);
    $stmt->bindParam(":direccion_proveedor", $datos["direccion_proveedor"], PDO::PARAM_STR);

    if ($stmt->execute()) {
      return "ok";
    } else {
      return "error";
    }

    $stmt = null;
  }

  /*=============================================
  EDITAR PROVEEDOR
  =============================================*/
  static public function mdlEditarProveedor($tabla, $datos) {
    $stmt = Conexion::conectar()->prepare("UPDATE $tabla SET nombre_proveedor = :nombre_proveedor, telefono_proveedor = :telefono_proveedor, direccion_proveedor = :direccion_proveedor WHERE id_proveedor = :id_proveedor");
    $stmt->bindParam(":nombre_proveedor", $datos["nombre_proveedor"], PDO::PARAM_STR);
    $stmt->bindParam(":telefono_proveedor", $datos["telefono_proveedor"], PDO::PARAM_STR);
    $stmt->bindParam(":direccion_proveedor", $datos["direccion_proveedor"], PDO::PARAM_STR);
    $stmt->bindParam(":id_proveedor", $datos["id_proveedor"], PDO::PARAM_INT);

    if ($stmt->execute()) {
      return "ok";
    } else {
      return "error";
    }
    $stmt = null;
  }
  /*=============================================
  ELIMINAR PROVEEDOR
  =============================================*/
  static public function mdlEliminarProveedor($tabla, $item, $valor) {
    $stmt = Conexion::conectar()->prepare("DELETE FROM $tabla WHERE $item = :$item");
    $stmt->bindParam(":" . $item, $valor, PDO::PARAM_INT);

    if ($stmt->execute()) {
      return "ok";
    } else {
      return "error";
    }
    $stmt = null;
  }
}
