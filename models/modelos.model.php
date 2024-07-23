<?php

require_once "conexion.php";

class ModeloModelos
{

/*=============================================
CREAR MODELO
=============================================*/

static public function mdlIngresarModelo($tabla, $datos)
{
    $stmt = Conexion::conectar()->prepare("INSERT INTO $tabla(nombre_modelo, id_marca, version_modelo, anio_inicio_modelo, anio_fin_modelo) VALUES (:nombre_modelo, :id_marca, :version_modelo, :anio_inicio_modelo, :anio_fin_modelo)");

    $stmt->bindParam(":nombre_modelo", $datos["nombre_modelo"], PDO::PARAM_STR);
    $stmt->bindParam(":id_marca", $datos["id_marca"], PDO::PARAM_INT);
    $stmt->bindParam(":version_modelo", $datos["version_modelo"], PDO::PARAM_STR);
    $stmt->bindParam(":anio_inicio_modelo", $datos["anio_inicio_modelo"], PDO::PARAM_INT);
    $stmt->bindParam(":anio_fin_modelo", $datos["anio_fin_modelo"], PDO::PARAM_INT);

    if ($stmt->execute()) {
        return "ok";
    } else {
        return "error";
    }

    $stmt = null;
}

/*=============================================
    MOSTRAR MODELOS
    =============================================*/
    static public function mdlMostrarModelos($tabla, $item, $valor)
    {
        if ($item != null) {
            $stmt = Conexion::conectar()->prepare("SELECT * FROM $tabla WHERE $item = :$item ORDER BY id_modelo DESC");
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
    MOSTRAR MODELOS CON MARCA
    =============================================*/
    static public function mdlMostrarModelosConMarca($tabla, $item, $valor)
    {
      if ($item != null) {
        $stmt = Conexion::conectar()->prepare("SELECT m.*, ma.nombre_marca FROM $tabla m JOIN marcas ma ON m.id_marca = ma.id_marca WHERE m.$item = :$item");
        $stmt->bindParam(":" . $item, $valor, PDO::PARAM_STR);
        $stmt->execute();
        return $stmt->fetchAll(); // Cambiado a fetchAll para devolver siempre un array
    } else {
        $stmt = Conexion::conectar()->prepare("SELECT m.*, ma.nombre_marca FROM $tabla m JOIN marcas ma ON m.id_marca = ma.id_marca");
        $stmt->execute();
        return $stmt->fetchAll();
    }
    }

/*=============================================
EDITAR MODELO
=============================================*/

static public function mdlEditarModelo($tabla, $datos) {

  $stmt = Conexion::conectar()->prepare("UPDATE $tabla SET nombre_modelo = :nombre_modelo, id_marca = :id_marca, version_modelo = :version_modelo, anio_inicio_modelo = :anio_inicio_modelo, anio_fin_modelo = :anio_fin_modelo WHERE id_modelo = :id_modelo");

  $stmt->bindParam(":nombre_modelo", $datos["nombre_modelo"], PDO::PARAM_STR);
  $stmt->bindParam(":id_marca", $datos["id_marca"], PDO::PARAM_INT);
  $stmt->bindParam(":version_modelo", $datos["version_modelo"], PDO::PARAM_STR);
  $stmt->bindParam(":anio_inicio_modelo", $datos["anio_inicio_modelo"], PDO::PARAM_INT);
  $stmt->bindParam(":anio_fin_modelo", $datos["anio_fin_modelo"], PDO::PARAM_INT);
  $stmt->bindParam(":id_modelo", $datos["id_modelo"], PDO::PARAM_INT);

  if ($stmt->execute()) {
    return "ok";
  } else {
    return "error";
  }

  $stmt = null;
}


/*=============================================
  BORRAR MODELO
  =============================================*/

  static public function mdlBorrarModelo($tabla, $datos) {

    $stmt = Conexion::conectar()->prepare("DELETE FROM $tabla WHERE id_modelo = :id_modelo");

    $stmt->bindParam(":id_modelo", $datos, PDO::PARAM_INT);

    if ($stmt->execute()) {
      return "ok";
    } else {
      return "error";
    }

    $stmt = null;
  }

}
