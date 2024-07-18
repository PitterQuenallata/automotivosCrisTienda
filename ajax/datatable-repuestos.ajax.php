<?php
require_once "../controllers/repuestos.controller.php";
require_once "../models/repuestos.model.php";
require_once "../controllers/categorias.controller.php";
require_once "../models/categorias.model.php";

class TablaRepuestos {
  /*=============================================
  MOSTRAR LA TABLA DE REPUESTOS
  =============================================*/
  public function mostrarTablaRepuestos() {
    $item = null;
    $valor = null;
    $repuestos = ControladorRepuestos::ctrMostrarRepuestos($item, $valor);

    $datosJson = '{ "data": [ ';

    for ($i = 0; $i < count($repuestos); $i++) {
      if($repuestos[$i]["stock_repuesto"] <= 10) {
        $stock = "<span class='badge bg-danger'>".$repuestos[$i]["stock_repuesto"]."</span>";
      } else if($repuestos[$i]["stock_repuesto"] > 10 && $repuestos[$i]["stock_repuesto"] <= 15) {
        $stock = "<span class='badge bg-warning'>".$repuestos[$i]["stock_repuesto"]."</span>";
      } else {
        $stock = "<span class='badge bg-primary'>".$repuestos[$i]["stock_repuesto"]."</span>";
      }

      $estado = $repuestos[$i]["estado_repuesto"] == 1 ? "<span class='badge bg-success'>Activo</span>" : "<span class='badge bg-danger'>Inactivo</span>";

      // Obtener la categoría del vehículo
      $itemCategoria = "id_categoria";
      $valorCategoria = $repuestos[$i]["id_categoria"];
      $categoria = ControladorCategorias::ctrMostrarCategorias($itemCategoria, $valorCategoria);

      $acciones = "<div class='btn-group'><button class='btn btn-warning btnEditarRepuesto' idRepuesto='".$repuestos[$i]["id_repuesto"]."' data-toggle='modal' data-target='#modalEditarRepuesto'><i class='fa fa-pencil'></i></button><button class='btn btn-danger btnEliminarRepuesto' idRepuesto='".$repuestos[$i]["id_repuesto"]."' codigo='".$repuestos[$i]["codigo_tienda_repuesto"]."'><i class='fa fa-times'></i></button></div>";

      $datosJson .= '[
        "'.($i+1).'",
        "<span class=\"text-truncate\" style=\"max-width: 100px;\">'.$repuestos[$i]["codigo_tienda_repuesto"].'</span>",
        "<span class=\"text-truncate\" style=\"max-width: 200px;\">'.$repuestos[$i]["nombre_repuesto"].'</span>",
        "<span class=\"text-truncate\" style=\"max-width: 100px;\">'.$repuestos[$i]["precio_repuesto"].'</span>",
        "<span class=\"text-truncate\" style=\"max-width: 100px;\">'.$repuestos[$i]["marca_repuesto"].'</span>",
        "'.$stock.'",
        "<span class=\"text-truncate\" style=\"max-width: 150px;\">'.$categoria["nombre_categoria"].'</span>",
        "'.$estado.'",
        "'.$acciones.'"
      ],';
    }

    $datosJson = substr($datosJson, 0, -1);
    $datosJson .= ']}';

    echo $datosJson;
  }
}

/*=============================================
ACTIVAR TABLA DE REPUESTOS
=============================================*/
$activarRepuestos = new TablaRepuestos();
$activarRepuestos -> mostrarTablaRepuestos();
