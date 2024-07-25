<?php
require_once "../controllers/compras.controller.php";
require_once "../models/compras.model.php";

class AjaxCompras {

    public $codigoCompra;
    public $montoTotal;
    public $idProveedor;
    public $idUsuario;
    public $listaRepuestos;
    public $proveedorManual;

    public function ajaxGuardarCompra() {
        $datos = array(
            "codigoCompra" => $this->codigoCompra,
            "montoTotal" => $this->montoTotal,
            "idProveedor" => $this->idProveedor,
            "idUsuario" => $this->idUsuario,
            "lista_repuestos" => $this->listaRepuestos,
            "proveedorManual" => $this->proveedorManual
        );

        $respuesta = ControladorCompras::ctrCrearCompra($datos);

        echo json_encode($respuesta);
    }
}

/*=============================================
GENERAR CÓDIGO DE COMPRA
=============================================*/
if (isset($_POST["accion"]) && $_POST["accion"] == "generarCodigoCompra") {
    $codigoCompra = ControladorCompras::ctrMostrarNuevoCodigoCompra();

    if ($codigoCompra) {
        echo json_encode(array("codigo" => $codigoCompra));
    } else {
        echo json_encode(array("error" => "No se pudo generar el código de compra."));
    }
    exit();
}

/*=============================================
GUARDAR COMPRA
=============================================*/
// Guardar compra
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $input = json_decode(file_get_contents('php://input'), true);

    if (isset($input["codigoCompra"])) {
        $guardarCompra = new AjaxCompras();
        $guardarCompra->codigoCompra = $input["codigoCompra"];
        $guardarCompra->montoTotal = $input["montoTotal"];
        $guardarCompra->idProveedor = $input["idProveedor"];
        $guardarCompra->idUsuario = $input["idUsuario"];
        $guardarCompra->listaRepuestos = isset($input["lista_repuestos"]) ? $input["lista_repuestos"] : [];
        $guardarCompra->proveedorManual = isset($input["proveedorManual"]) ? $input["proveedorManual"] : null;
        $guardarCompra->ajaxGuardarCompra();
    }
}
