<?php

require_once "conexion.php";

class ModeloListasVentas
{

  /*=============================================
  MOSTRAR VENTAS
  =============================================*/
  public static function mdlMostrarVentas($tabla, $item, $valor)
  {
    if ($item != null) {
      $stmt = Conexion::conectar()->prepare("SELECT * FROM $tabla WHERE $item = :$item ORDER BY id_venta DESC");
      $stmt->bindParam(":" . $item, $valor, PDO::PARAM_STR);
      $stmt->execute();
      return $stmt->fetchAll();
    } else {
      $stmt = Conexion::conectar()->prepare("SELECT * FROM $tabla ORDER BY id_venta DESC");
      $stmt->execute();
      return $stmt->fetchAll();
    }

    $stmt = null;
  }

  /*=============================================
  MOSTRAR CLIENTE
  =============================================*/
  public static function mdlMostrarCliente($tabla, $item, $valor)
  {
    $stmt = Conexion::conectar()->prepare("SELECT * FROM $tabla WHERE $item = :$item");
    $stmt->bindParam(":" . $item, $valor, PDO::PARAM_STR);
    $stmt->execute();
    return $stmt->fetch();

    $stmt = null;
  }

  /*=============================================
  MOSTRAR USUARIO
  =============================================*/
  public static function mdlMostrarUsuario($tabla, $item, $valor)
  {
    $stmt = Conexion::conectar()->prepare("SELECT * FROM $tabla WHERE $item = :$item");
    $stmt->bindParam(":" . $item, $valor, PDO::PARAM_STR);
    $stmt->execute();
    return $stmt->fetch();

    $stmt = null;
  }


  /*=============================================
MOSTRAR DETALLE VENTAS
=============================================*/
  public static function mdlMostrarDetalleVentas($tabla, $item, $valor)
  {
    if ($item != null) {
      $stmt = Conexion::conectar()->prepare("SELECT * FROM $tabla WHERE $item = :$item ORDER BY id_detalleVenta DESC");
      $stmt->bindParam(":" . $item, $valor, PDO::PARAM_STR);
      $stmt->execute();
      return $stmt->fetchAll();
    } else {
      $stmt = Conexion::conectar()->prepare("SELECT * FROM $tabla ORDER BY id_detalleVenta DESC");
      $stmt->execute();
      return $stmt->fetchAll();
    }
    $stmt = null;
  }


  /*=============================================
  MOSTRAR REPUESTO
  =============================================*/
  public static function mdlMostrarRepuesto($tabla, $item, $valor)
  {
    $stmt = Conexion::conectar()->prepare("SELECT * FROM $tabla WHERE $item = :$item");
    $stmt->bindParam(":" . $item, $valor, PDO::PARAM_STR);
    $stmt->execute();
    return $stmt->fetch();
    $stmt = null;
  }

  /*=============================================
  MOSTRAR VENTA
  =============================================*/
  public static function mdlMostrarVenta($tabla, $item, $valor)
  {
    $stmt = Conexion::conectar()->prepare("SELECT * FROM $tabla WHERE $item = :$item");
    $stmt->bindParam(":" . $item, $valor, PDO::PARAM_STR);
    $stmt->execute();
    return $stmt->fetch();
    $stmt = null;
  }

  /*=============================================
  MOSTRAR VENTA POR RANGO DE FECHA
  =============================================*/
  public static function mdlRangoFechasVentas($fechaInicial, $fechaFinal)
  {

      if($fechaInicial == $fechaFinal){
          $stmt = Conexion::conectar()->prepare("SELECT * FROM ventas WHERE date_created_venta LIKE :fechaInicial ORDER BY id_venta DESC");
          $fechaParam = "%".$fechaInicial."%";
          $stmt->bindParam(":fechaInicial", $fechaParam, PDO::PARAM_STR);
          $stmt->execute();
          return $stmt->fetchAll();
      } else {
          $stmt = Conexion::conectar()->prepare("SELECT * FROM ventas WHERE date_created_venta BETWEEN :fechaInicial AND :fechaFinal ORDER BY id_venta DESC");
          $stmt->bindParam(":fechaInicial", $fechaInicial, PDO::PARAM_STR);
          $stmt->bindParam(":fechaFinal", $fechaFinal, PDO::PARAM_STR);
          $stmt->execute();
          return $stmt->fetchAll();
      }
      $stmt = null;
  }
  

  /*=============================================
  MOSTRAR Detalles VENTA POR RANGO DE FECHAS
  =============================================*/
  public static function mdlRangoFechasDetalleVentas($fechaInicial, $fechaFinal)
  {
      if ($fechaInicial == $fechaFinal) {
          $stmt = Conexion::conectar()->prepare("SELECT * FROM detalles_ventas WHERE date_created_detalleVenta LIKE :fechaInicial ORDER BY id_detalleVenta DESC");
          $fechaParam = "%".$fechaInicial."%";
          $stmt->bindParam(":fechaInicial", $fechaParam, PDO::PARAM_STR);
          $stmt->execute();
          return $stmt->fetchAll();
      } else {
          $stmt = Conexion::conectar()->prepare("SELECT * FROM detalles_ventas WHERE date_created_detalleVenta BETWEEN :fechaInicial AND :fechaFinal ORDER BY id_detalleVenta DESC");
          $stmt->bindParam(":fechaInicial", $fechaInicial, PDO::PARAM_STR);
          $stmt->bindParam(":fechaFinal", $fechaFinal, PDO::PARAM_STR);
          $stmt->execute();
          return $stmt->fetchAll();
      }
      $stmt = null;
  }
  
  
}
