<?php

require_once "../controllers/repuestos.controller.php";
require_once "../models/repuestos.model.php";

class AjaxRepuestos {

  /*=============================================
  EDITAR REPUESTO
  =============================================*/ 

  public $idRepuesto;

  public function ajaxEditarRepuesto() {

    $item = "id_repuesto";
    $valor = $this->idRepuesto;

    $respuesta = ControladorRepuestos::ctrMostrarRepuestos($item, $valor);

    echo json_encode($respuesta);

  }
}

/*=============================================
OBJETO REPUESTO
=============================================*/ 

if(isset($_POST["idRepuesto"])) {
  
  $repuesto = new AjaxRepuestos();
  $repuesto -> idRepuesto = $_POST["idRepuesto"];
  $repuesto -> ajaxEditarRepuesto();
  
}

?>
