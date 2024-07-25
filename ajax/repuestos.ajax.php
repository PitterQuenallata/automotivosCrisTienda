<?php

require_once "../controllers/repuestos.controller.php";
require_once "../models/repuestos.model.php";
require_once "../controllers/marcas.controller.php";
require_once "../models/marcas.model.php";
require_once "../controllers/modelos.controller.php";
require_once "../models/modelos.model.php";
require_once "../controllers/motores.controller.php";
require_once "../models/motores.model.php";


class AjaxRepuestos
{
    public $idCategoria;
    public $idMarca;
    public $idModelo;

    public function ajaxAsignarCodigoRepuesto()
    {
        $item = "id_categoria";
        $valor = $this->idCategoria;

        $respuestaCodigo = ControladorRepuestos::ctrMostrarRepuestos($item, $valor);

        echo json_encode($respuestaCodigo);
    }

    public function ajaxMostrarModelos()
    {
        $item = "id_marca";
        $valor = $this->idMarca;
        $respuesta = ControladorModelos::ctrMostrarModelosConMarca($item, $valor);
        echo json_encode($respuesta);
    }

    public function ajaxMostrarMotores()
    {
        $item = "id_modelo";
        $valor = $this->idModelo;
        $respuesta = ControladorMotores::ctrMostrarMotores($item, $valor);
        echo json_encode($respuesta);
    }
}

/*=============================================
Activar repuesto
=============================================*/
if (isset($_POST["activarId"])) {
    $item = "id_repuesto";
    $valor = $_POST["activarId"];
    $estado = $_POST["activarRepuesto"];

    $respuesta = ControladorRepuestos::ctrActualizarEstadoRepuesto($item, $valor, $estado);

    echo $respuesta;
}

/*=============================================
Activar función para asignar código de repuesto
=============================================*/
if (isset($_POST["idCategoria"])) {
    $codigoRepuesto = new AjaxRepuestos();
    $codigoRepuesto->idCategoria = $_POST["idCategoria"];
    $codigoRepuesto->ajaxAsignarCodigoRepuesto();
}

/*=============================================
Mostrar modelos por marca
=============================================*/
if (isset($_POST["idMarca"])) {
    $modelos = new AjaxRepuestos();
    $modelos->idMarca = $_POST["idMarca"];
    $modelos->ajaxMostrarModelos();
}

/*=============================================
Mostrar motores por modelo
=============================================*/
if (isset($_POST["idModelo"])) {
    $motores = new AjaxRepuestos();
    $motores->idModelo = $_POST["idModelo"];
    $motores->ajaxMostrarMotores();
}

/*=============================================
Validar existencia de repuesto
=============================================*/
if (isset($_POST['nombreRepuesto'])) {
    $item = "nombre_repuesto";
    $valor = $_POST['nombreRepuesto'];
    $repuestos = ControladorRepuestos::ctrMostrarRepuestos($item, $valor);

    if (!empty($repuestos)) {
        echo json_encode(['exists' => true]);
    } else {
        echo json_encode(['exists' => false]);
    }
    return;
}

/*=============================================
Eliminar repuesto
=============================================*/
if (isset($_POST["idRepuestoEliminar"])) {
    $eliminarRepuesto = new ControladorRepuestos();
    $eliminarRepuesto->ctrEliminarRepuesto();
}