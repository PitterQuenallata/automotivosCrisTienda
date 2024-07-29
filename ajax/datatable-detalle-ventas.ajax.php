<?php

require_once "../controllers/listasVentas.controller.php";
require_once "../models/listasVentas.model.php";

class TablaDetalleVentas {
  public function mostrarTablaDetalleVentas() {
    $item = null;
    $valor = null;
    $detalles = ControladorListasVentas::ctrMostrarDetalleVentas($item, $valor);

    if (count($detalles) == 0) {
      echo '{"data": []}';
      return;
    }

    $datosJson = '{"data": [';

    for ($i = 0; $i < count($detalles); $i++) {
      $venta = ControladorListasVentas::ctrMostrarVenta("codigo_venta", $detalles[$i]["id_venta"]);
      $repuesto = ControladorListasVentas::ctrMostrarRepuesto("id_repuesto", $detalles[$i]["id_repuesto"]);

      $datosJson .= '[
        "' . ($i + 1) . '",
        "' . $detalles[$i]["id_venta"] . '",
        "' . $repuesto["nombre_repuesto"] . '",
        "' . $detalles[$i]["cantidad_detalleVenta"] . '",
        "' . $detalles[$i]["precio_unitario_detalleVenta"] . '",
        "' . $venta["date_updated_venta"] . '"
      ],';
    }

    $datosJson = substr($datosJson, 0, -1);
    $datosJson .= ']}';

    echo $datosJson;
  }
}

$activarDetalleVentas = new TablaDetalleVentas();
$activarDetalleVentas->mostrarTablaDetalleVentas();
?>