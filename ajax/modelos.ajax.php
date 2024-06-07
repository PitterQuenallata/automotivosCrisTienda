<?php

require_once "../controllers/modelos.controller.php";
require_once "../models/modelos.model.php";

class AjaxModelos{

	/*=============================================
	EDITAR CATEGORÍA
	=============================================*/	

	public $idModelo;

	public function ajaxEditarModelo(){

		$item = "id_modelo";
		$valor = $this->idModelo;

		$respuesta = ControladorModelos::ctrMostrarModelos($item, $valor);

		echo json_encode($respuesta);

	}
}

/*=============================================
EDITAR CATEGORÍA
=============================================*/	
if(isset($_POST["idModelo"])){

	$Modelo = new AjaxModelos();
	$Modelo -> idModelo = $_POST["idModelo"];
	$Modelo -> ajaxEditarModelo();
}
