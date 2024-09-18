<?php

require_once "../controllers/marcas.controller.php";
require_once "../models/marcas.model.php";

class AjaxMarcas{

	/*=============================================
	EDITAR CATEGORÍA
	=============================================*/	

	public $idMarca;

	public function ajaxEditarMarca(){

		$item = "id_marca";
		$valor = $this->idMarca;

		$respuesta = ControladorMarcas::ctrMostrarMarcas($item, $valor);
		
		echo json_encode($respuesta);

	}
}

/*=============================================
EDITAR CATEGORÍA
=============================================*/	
if(isset($_POST["idMarca"])){

	$Marca = new AjaxMarcas();
	$Marca -> idMarca = $_POST["idMarca"];
	$Marca -> ajaxEditarMarca();
}
