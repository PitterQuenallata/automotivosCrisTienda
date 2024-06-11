<?php

class ControladorRepuestos {

    /*=============================================
    MOSTRAR REPUESTOS
    =============================================*/

    static public function ctrMostrarRepuestos($item, $valor) {

        $tabla = "repuestos";

        $respuesta = ModeloRepuestos::mdlMostrarRepuestos($tabla, $item, $valor);

        return $respuesta;
    }
}
?>
