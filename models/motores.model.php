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
    // Modificar la consulta para obtener motores directamente
    $stmt = Conexion::conectar()->prepare("SELECT * FROM $tabla WHERE id_modelo = :id_modelo");
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

      // Insertamos el motor junto con su id_modelo
      $stmt = $link->prepare("INSERT INTO $tabla (nombre_motor, cilindrada_motor, especificaciones_motor, id_modelo) VALUES (:nombre_motor, :cilindrada_motor, :especificaciones_motor, :id_modelo)");

      $stmt->bindParam(":nombre_motor", $datos["nombre_motor"], PDO::PARAM_STR);
      $stmt->bindParam(":cilindrada_motor", $datos["cilindrada_motor"], PDO::PARAM_STR);
      $stmt->bindParam(":especificaciones_motor", $datos["especificaciones_motor"], PDO::PARAM_STR);
      $stmt->bindParam(":id_modelo", $datos["id_modelo"], PDO::PARAM_INT);

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
EDITAR MOTOR
=============================================*/
public static function mdlEditarMotor($tabla, $datos)
{
    try {
        // Conectar a la base de datos
        $stmt = Conexion::conectar()->prepare("UPDATE $tabla 
            SET nombre_motor = :nombre_motor, cilindrada_motor = :cilindrada_motor, especificaciones_motor = :especificaciones_motor, id_modelo = :id_modelo 
            WHERE id_motor = :id_motor");

        // Vincular parámetros
        $stmt->bindParam(":nombre_motor", $datos["nombre_motor"], PDO::PARAM_STR);
        $stmt->bindParam(":cilindrada_motor", $datos["cilindrada_motor"], PDO::PARAM_STR);
        $stmt->bindParam(":especificaciones_motor", $datos["especificaciones_motor"], PDO::PARAM_STR);
        $stmt->bindParam(":id_modelo", $datos["id_modelo"], PDO::PARAM_INT);
        $stmt->bindParam(":id_motor", $datos["id_motor"], PDO::PARAM_INT);

        // Ejecutar la consulta y verificar si fue exitosa
        if ($stmt->execute()) {
            return "ok";
        } else {
            return "error";
        }

        // Cerrar conexión
        $stmt = null;
    } catch (PDOException $e) {
        return "error";
    }
}



/*=============================================
  ELIMINAR MOTOR
=============================================*/
static public function mdlBorrarMotor($tabla, $idMotor) {
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



