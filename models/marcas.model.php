<?php

require_once "conexion.php";

class ModeloMarcas
{

	/*=============================================
	CREAR Marca
	=============================================*/

	static public function mdlIngresarMarca($tabla, $datos)
	{

		$stmt = Conexion::conectar()->prepare("INSERT INTO $tabla(nombre_marca) VALUES (:marca)");

		$stmt->bindParam(":marca", $datos, PDO::PARAM_STR);

		if ($stmt->execute()) {

			return "ok";
		} else {

			return "error";
		}


		$stmt = null;
	}

	/*=============================================
	MOSTRAR MarcaS
	=============================================*/

	static public function mdlMostrarMarcas($tabla, $item, $valor)
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
	EDITAR Marca
	=============================================*/

	static public function mdlEditarMarca($tabla, $datos) {

		$stmt = Conexion::conectar()->prepare("UPDATE $tabla SET nombre_marca = :nombre_marca WHERE id_marca = :id_marca");

		$stmt -> bindParam(":nombre_marca", $datos["nombre_marca"], PDO::PARAM_STR);
		$stmt -> bindParam(":id_marca", $datos["id_marca"], PDO::PARAM_INT);

		if($stmt->execute()) {
				return "ok";
		} else {
				return "error";
		}

		$stmt = null;
}

	/*=============================================
	BORRAR Marca
	=============================================*/

	static public function mdlBorrarMarca($tabla, $datos){

		$stmt = Conexion::conectar()->prepare("DELETE FROM $tabla WHERE id_marca = :id");

		$stmt -> bindParam(":id", $datos, PDO::PARAM_INT);

		if($stmt -> execute()){

			return "ok";

		}else{

			return "error";	

		}


		$stmt = null;

	}

}
