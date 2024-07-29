<?php

require_once "conexion.php";

class ModeloClientes
{

  /*=============================================
  MOSTRAR CLIENTES
  =============================================*/
  public static function mdlMostrarClientes($tabla, $item, $valor)
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
  }
  /*=============================================
  REGISTRAR CLIENTE
  =============================================*/
  public static function mdlRegistrarCliente($tabla, $datos) {
    try {
        $conexion = Conexion::conectar();
        $stmt = $conexion->prepare("INSERT INTO $tabla (nombre_cliente, nit_ci_cliente, telefono_cliente, compra_cliente) VALUES (:nombre, :nit, :celular, :compra)");

        $stmt->bindParam(":nombre", $datos["nombre"], PDO::PARAM_STR);
        $stmt->bindParam(":nit", $datos["nit"], PDO::PARAM_STR);
        $stmt->bindParam(":celular", $datos["celular"], PDO::PARAM_STR);
        $stmt->bindParam(":compra", $datos["compra"], PDO::PARAM_INT);


        if ($stmt->execute()) {
            return $conexion->lastInsertId();
        } else {
            return "error";
        }

        $stmt = null;
    } catch (Exception $e) {
        return "error: " . $e->getMessage();
    }
}


  /*=============================================
  Mostrar cliente por NIT
  =============================================*/
  public static function mdlMostrarClientePorNit($tabla, $nit)
  {
    $stmt = Conexion::conectar()->prepare("SELECT * FROM $tabla WHERE nit_ci_cliente = :nit");
    $stmt->bindParam(":nit", $nit, PDO::PARAM_STR);
    $stmt->execute();
    return $stmt->fetch();
  }
  /*=============================================
  ACTUALIZAR CONTADOR DE COMPRAS
  =============================================*/
  public static function mdlActualizarContadorCompras($tabla, $idCliente, $comprasCliente)
  {
    $stmt = Conexion::conectar()->prepare("UPDATE $tabla SET compra_cliente = :compras WHERE id_cliente = :id");
    $stmt->bindParam(":compras", $comprasCliente, PDO::PARAM_INT);
    $stmt->bindParam(":id", $idCliente, PDO::PARAM_INT);
    return $stmt->execute();
  }
}
