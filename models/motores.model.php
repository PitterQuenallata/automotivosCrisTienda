<?php

require_once "conexion.php";

class ModeloMotores
{
  /*=============================================
MOSTRAR motores POR MODELO Y MARCA
=============================================*/
  static public function mdlMostrarModelos($tabla, $item, $valor)
  {
    if ($item != null) {
      $stmt = Conexion::conectar()->prepare("SELECT * FROM $tabla WHERE $item = :$item");
      $stmt->bindParam(":" . $item, $valor, PDO::PARAM_STR);
      $stmt->execute();
      return $stmt->fetchAll();
    } else {
      $stmt = Conexion::conectar()->prepare("SELECT * FROM $tabla");
      $stmt->execute();
      return $stmt->fetchAll();
    }

    $stmt = null;
  }

  /*=============================================
MOSTRAR MOTORES
=============================================*/

  static public function mdlMostrarMotores($tabla, $item, $valor)
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
MOSTRAR MOTORES POR MODELO
=============================================*/
  static public function mdlMostrarMotoresPorModelo($tabla, $idModelo)
  {
    $stmt = Conexion::conectar()->prepare("SELECT motores.* FROM motores JOIN modelo_motores ON motores.id_motor = modelo_motores.id_motor WHERE modelo_motores.id_modelo = :id_modelo");
    $stmt->bindParam(":id_modelo", $idModelo, PDO::PARAM_INT);
    $stmt->execute();
    return $stmt->fetchAll();
  }

  /*=============================================
MOSTRAR MODELOS POR MOTOR
=============================================*/
  static public function mdlMostrarModelosPorMotor($tabla, $idMotor)
  {
    $stmt = Conexion::conectar()->prepare("SELECT mo.nombre_modelo, mo.version_modelo FROM $tabla mm JOIN modelos mo ON mm.id_modelo = mo.id_modelo WHERE mm.id_motor = :idMotor");
    $stmt->bindParam(":idMotor", $idMotor, PDO::PARAM_INT);
    $stmt->execute();
    return $stmt->fetchAll();
  }


  /*=============================================
  CREAR MOTOR
  =============================================*/
  static public function mdlIngresarMotor($tabla, $datos)
  {

    try {
      $link = Conexion::conectar();
      $link->beginTransaction();

      $stmt = $link->prepare("INSERT INTO $tabla (nombre_motor, cilindrada_motor, especificaciones_motor) VALUES (:nombre_motor, :cilindrada_motor, :especificaciones_motor)");

      $stmt->bindParam(":nombre_motor", $datos["nombre_motor"], PDO::PARAM_STR);
      $stmt->bindParam(":cilindrada_motor", $datos["cilindrada_motor"], PDO::PARAM_STR);
      $stmt->bindParam(":especificaciones_motor", $datos["especificaciones_motor"], PDO::PARAM_STR);

      if ($stmt->execute()) {
        $idMotor = $link->lastInsertId();
        $link->commit();
        return $idMotor;
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
  REGISTRAR MODELO Y MOTOR
  =============================================*/
  static public function mdlRegistrarModeloMotor($tabla, $idModelo, $idMotor)
  {

    $stmt = Conexion::conectar()->prepare("INSERT INTO $tabla (id_modelo, id_motor) VALUES (:id_modelo, :id_motor)");

    $stmt->bindParam(":id_modelo", $idModelo, PDO::PARAM_INT);
    $stmt->bindParam(":id_motor", $idMotor, PDO::PARAM_INT);

    if ($stmt->execute()) {
      return "ok";
    } else {
      return "error";
    }

    $stmt = null;
  }

  /*=============================================
  EDITAR MOTOR
  =============================================*/

  static public function mdlEditarMotor($tabla, $datos)
  {
    $stmt = Conexion::conectar()->prepare("UPDATE $tabla SET nombre_motor = :nombre_motor, cilindrada_motor = :cilindrada_motor, especificaciones_motor = :especificaciones_motor WHERE id_motor = :id_motor");

    $stmt->bindParam(":nombre_motor", $datos["nombre_motor"], PDO::PARAM_STR);
    $stmt->bindParam(":cilindrada_motor", $datos["cilindrada_motor"], PDO::PARAM_STR);
    $stmt->bindParam(":especificaciones_motor", $datos["especificaciones_motor"], PDO::PARAM_STR);
    $stmt->bindParam(":id_motor", $datos["id_motor"], PDO::PARAM_INT);

    if ($stmt->execute()) {
      return "ok";
    } else {
      return "error";
    }

    $stmt = null;
  }



  /*=============================================
    ACTUALIZAR MODELO-MOTOR
    =============================================*/
  static public function mdlActualizarModeloMotor($tabla, $idModelo, $idMotor)
  {
    $stmt = Conexion::conectar()->prepare("UPDATE $tabla SET id_modelo = :id_modelo WHERE id_motor = :id_motor");

    $stmt->bindParam(":id_modelo", $idModelo, PDO::PARAM_INT);
    $stmt->bindParam(":id_motor", $idMotor, PDO::PARAM_INT);

    if ($stmt->execute()) {
      return "ok";
    } else {
      return "error";
    }

    $stmt = null;
  }

  /*=============================================
ELIMINAR MOTOR
=============================================*/
  static public function mdlBorrarMotor($tabla, $idMotor)
  {
    $stmt = Conexion::conectar()->prepare("DELETE FROM $tabla WHERE id_motor = :id_motor");
    $stmt->bindParam(":id_motor", $idMotor, PDO::PARAM_INT);

    if ($stmt->execute()) {
      return "ok";
    } else {
      return "error";
    }

    $stmt = null;
  }

  /*=============================================
ELIMINAR RELACIONES DE MODELOS CON EL MOTOR
=============================================*/
  static public function mdlBorrarModeloMotor($tabla, $idMotor)
  {
    $stmt = Conexion::conectar()->prepare("DELETE FROM $tabla WHERE id_motor = :id_motor");
    $stmt->bindParam(":id_motor", $idMotor, PDO::PARAM_INT);

    if ($stmt->execute()) {
      return "ok";
    } else {
      return "error";
    }

    $stmt = null;
  }
}
