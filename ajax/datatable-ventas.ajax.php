<?php

require_once "../controllers/repuestos.controller.php";
require_once "../models/repuestos.model.php";

class TablaRepuestosVentas {

  public function mostrarTablaRepuestosVentas() {

    $item = null;
    $valor = null;
    $repuestos = ControladorRepuestos::ctrMostrarRepuestos($item, $valor);

    if(count($repuestos) == 0) {
      echo '{"data": []}';
      return;
    }

    $datosJson = '{"data": [';

    for($i = 0; $i < count($repuestos); $i++) {
      if($repuestos[$i]["stock_repuesto"] <= 10) {
        $stock = "<button class='btn btn-sm btn-danger me-1 mb-1'>".$repuestos[$i]["stock_repuesto"]."</button>";
      } else if($repuestos[$i]["stock_repuesto"] > 11 && $repuestos[$i]["stock_repuesto"] <= 15) {
        $stock = "<button class='btn btn-sm btn-warning me-1 mb-1'>".$repuestos[$i]["stock_repuesto"]."</button>";
      } else {
        $stock = "<button class='btn btn-sm btn-success me-1 mb-1'>".$repuestos[$i]["stock_repuesto"]."</button>";
      }

      $botones = "<div class='btn-group'><button class='btn btn-sm btn-secondary me-1 mb-1 agregarRepuesto recuperarBoton' idRepuesto='".$repuestos[$i]["id_repuesto"]."'>Agregar</button></div>";

      $datosJson .= '[
        "'.($i+1).'",
        "'.$repuestos[$i]["oem_repuesto"].'",
        "'.$repuestos[$i]["nombre_repuesto"].'",
        "'.$repuestos[$i]["id_categoria"].'",
        "'.$repuestos[$i]["marca_repuesto"].'",
        "'.$stock.'",
        "'.$repuestos[$i]["precio_repuesto"].'",
        "'.$botones.'"
      ],';
    }

    $datosJson = substr($datosJson, 0, -1);
    $datosJson .= ']}';

    echo $datosJson;
  }
}

$activarRepuestosVentas = new TablaRepuestosVentas();
$activarRepuestosVentas -> mostrarTablaRepuestosVentas();
?>
