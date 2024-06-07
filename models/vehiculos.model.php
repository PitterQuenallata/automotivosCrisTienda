<?php

require_once "conexion.php";

class ModeloVehiculos
{

	/*=============================================
	CREAR Vehiculo
	=============================================*/

	static public function mdlIngresarVehiculo($tabla, $datos)
	{

		$stmt = Conexion::conectar()->prepare("INSERT INTO $tabla(nombre_vehiculo) VALUES (:vehiculo)");

		$stmt->bindParam(":vehiculo", $datos, PDO::PARAM_STR);

		if ($stmt->execute()) {

			return "ok";
		} else {

			return "error";
		}


		$stmt = null;
	}

	/*=============================================
	MOSTRAR VehiculoS
	=============================================*/

	static public function mdlMostrarVehiculos($tabla, $item, $valor)
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
	EDITAR Vehiculo
	=============================================*/

	static public function mdlEditarVehiculo($tabla, $datos) {

		$stmt = Conexion::conectar()->prepare("UPDATE $tabla SET nombre_vehiculo = :nVehiculo WHERE id_vehiculo = :id");

		$stmt -> bindParam(":nVehiculo", $datos["nombre_vehiculo"], PDO::PARAM_STR);
		$stmt -> bindParam(":id", $datos["id_vehiculo"], PDO::PARAM_INT);

		if($stmt->execute()) {
				return "ok";
		} else {
				return "error";
		}

		$stmt = null;
}

	/*=============================================
	BORRAR Vehiculo
	=============================================*/

	static public function mdlBorrarVehiculo($tabla, $datos){

		$stmt = Conexion::conectar()->prepare("DELETE FROM $tabla WHERE id_vehiculo = :id");

		$stmt -> bindParam(":id", $datos, PDO::PARAM_INT);

		if($stmt -> execute()){

			return "ok";

		}else{

			return "error";	

		}


		$stmt = null;

	}

}
