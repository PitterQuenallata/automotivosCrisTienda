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

      $estado = $repuestos[$i]["estado_repuesto"] == 1 ? 
      "<button class='badge btn btn-success btnActivarRepuesto' idRepuesto='".$repuestos[$i]["id_repuesto"]."' estadoRepuesto='0'>Activo</button>" : 
      "<button class='badge btn btn-danger btnActivarRepuesto' idRepuesto='".$repuestos[$i]["id_repuesto"]."' estadoRepuesto='1'>Inactivo</button>";

      // Obtener la categoría del vehículo
      $itemCategoria = "id_categoria";
      $valorCategoria = $repuestos[$i]["id_categoria"];
      $categoria = ControladorCategorias::ctrMostrarCategorias($itemCategoria, $valorCategoria);

      $acciones = "<div class='btn-group'><button class='btn btn-sm btn-secondary js-bs-tooltip-enabled btnEditarRepuesto' idRepuesto='".$repuestos[$i]["id_repuesto"]."' data-bs-toggle='modal' data-bs-target='#modalEditarRepuesto' aria-label='Edit' data-bs-original-title='Edit'><i class='fa fa-pencil-alt'></i></button><button class='btn btn-sm btn-secondary js-bs-tooltip-enabled btnEliminarRepuesto' idRepuesto='".$repuestos[$i]["id_repuesto"]."' codigo='".$repuestos[$i]["codigo_tienda_repuesto"]."' data-bs-toggle='tooltip' aria-label='Delete' data-bs-original-title='Delete'><i class='fa fa-times'></i></button></div>";

      $datosJson .= '[
        "'.($i+1).'",
        "<span class=\"text-center\" style=\"max-width: 100px;\">'.$repuestos[$i]["codigo_tienda_repuesto"].'</span>",
        "<span class=\"text-truncate\" style=\"max-width: 200px;\">'.$repuestos[$i]["nombre_repuesto"].'</span>",
        "<span class=\"text-truncate\" style=\"max-width: 200px;\">'.$repuestos[$i]["descripcion_repuesto"].'</span>",
        "<span class=\"text-center\" style=\"max-width: 100px;\">'.$repuestos[$i]["precio_compra"].'</span>",
        "<span class=\"text-center\" style=\"max-width: 100px;\">'.$repuestos[$i]["precio_repuesto"].'</span>",
        "<span class=\"text-truncate\" style=\"max-width: 100px;\">'.$repuestos[$i]["marca_repuesto"].'</span>",
        "'.$stock.'",
        "<span class=\"text-truncate\" style=\"max-width: 150px;\">'.$categoria["nombre_categoria"].'</span>",
        "'.$estado.'",
        "<span class=\"text-center\">'.$acciones.'"
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
