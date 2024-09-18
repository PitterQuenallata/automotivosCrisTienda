<?php

require_once "../controllers/motores.controller.php";
require_once "../models/motores.model.php";
require_once "../controllers/modelos.controller.php";
require_once "../models/modelos.model.php";

class AjaxMotores{

	/*=============================================
	añadir modelo a motor
	=============================================*/	
	public $idMarca;

  public function ajaxMostrarModelos() {
    $item = "id_marca";
    $valor = $this->idMarca;
    $respuesta = ControladorMotores::ctrMostrarModelos($item, $valor);
    echo json_encode($respuesta);
  }

    /*=============================================
    EDITAR MOTOR
    =============================================*/ 
    public $idMotor;

    public function ajaxEditarMotor() {
        $item = "id_motor";
        $valor = $this->idMotor;

        // Obtener los datos del motor
        $respuesta = ControladorMotores::ctrMostrarMotores($item, $valor);

        // Obtener el modelo relacionado
        $idModelo = $respuesta["id_modelo"];
        $modelo = ControladorModelos::ctrMostrarModelos("id_modelo", $idModelo);

        // Añadir el modelo a la respuesta
        $respuesta["modelo"] = $modelo;

        echo json_encode($respuesta);
    }
}

/*=============================================
mostrar modelos por marca
=============================================*/	

if (isset($_POST["idMarca"])) {
  $modelos = new AjaxMotores();
  $modelos->idMarca = $_POST["idMarca"];
  $modelos->ajaxMostrarModelos();
}

/*=============================================
EDITAR MOTOR
=============================================*/ 
if (isset($_POST["idMotor"])) {
	$editarMotor = new AjaxMotores();
	$editarMotor->idMotor = $_POST["idMotor"];
	$editarMotor->ajaxEditarMotor();
}