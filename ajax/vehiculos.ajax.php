<?php

require_once "../controllers/vehiculos.controller.php";
require_once "../models/vehiculos.model.php";

class AjaxVehiculos{

	/*=============================================
	EDITAR CATEGORÍA
	=============================================*/	

	public $idVehiculo;

	public function ajaxEditarVehiculo(){

		$item = "id_vehiculo";
		$valor = $this->idVehiculo;

		$respuesta = ControladorVehiculos::ctrMostrarVehiculos($item, $valor);

		echo json_encode($respuesta);

	}
}

/*=============================================
EDITAR CATEGORÍA
=============================================*/	
if(isset($_POST["idVehiculo"])){

	$Vehiculo = new AjaxVehiculos();
	$Vehiculo -> idVehiculo = $_POST["idVehiculo"];
	$Vehiculo -> ajaxEditarVehiculo();
}
