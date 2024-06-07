<?php

require_once "conexion.php";

class ModeloModelos
{

	/*=============================================
	CREAR Modelo
	=============================================*/

	static public function mdlIngresarModelo($tabla, $datos)
	{

 		$stmt = Conexion::conectar()->prepare("INSERT INTO $tabla(nombre_modelo,id_marca_modelo) VALUES (:nombre_modelo, :id_marca_modelo)");

		$stmt->bindParam(":nombre_modelo", $datos["nombre_modelo"], PDO::PARAM_STR);
		$stmt->bindParam(":id_marca_modelo", $datos["id_marca_modelo"], PDO::PARAM_STR);
		if ($stmt->execute()) {

			return "ok";
		} else {

			return "error";
		}


		$stmt = null;
	}

	/*=============================================
	MOSTRAR ModeloS
	=============================================*/

	static public function mdlMostrarModelos($tabla, $item, $valor) {
		if ($item != null) {
				$stmt = Conexion::conectar()->prepare("SELECT m.*, ma.nombre_marca FROM $tabla m JOIN marcas ma ON m.id_marca_modelo = ma.id_marca WHERE m.$item = :$item");
				$stmt->bindParam(":" . $item, $valor, PDO::PARAM_STR);
		} else {
				$stmt = Conexion::conectar()->prepare("SELECT m.*, ma.nombre_marca FROM $tabla m JOIN marcas ma ON m.id_marca_modelo = ma.id_marca");
		}
		$stmt->execute();
		return $item != null ? $stmt->fetch() : $stmt->fetchAll();
}

/*=============================================
  EDITAR MODELO
  =============================================*/

  static public function mdlEditarModelo($tabla, $datos) {

    $stmt = Conexion::conectar()->prepare("UPDATE $tabla SET nombre_modelo = :nombre_modelo, id_marca_modelo = :id_marca_modelo WHERE id_modelo = :id_modelo");

    $stmt->bindParam(":nombre_modelo", $datos["nombre_modelo"], PDO::PARAM_STR);
    $stmt->bindParam(":id_modelo", $datos["id_modelo"], PDO::PARAM_INT);
    $stmt->bindParam(":id_marca_modelo", $datos["id_marca_modelo"], PDO::PARAM_INT);

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
