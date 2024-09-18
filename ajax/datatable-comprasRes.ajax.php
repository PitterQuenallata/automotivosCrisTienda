<?php
require_once "../controllers/repuestos.controller.php";
require_once "../models/repuestos.model.php";
require_once "../controllers/categorias.controller.php";
require_once "../models/categorias.model.php";

class TablaRepuestosCompra {
  /*=============================================
  MOSTRAR LA TABLA DE REPUESTOS
  =============================================*/
  public function mostrarTablaRepuestosCompra() {
    $item = null;
    $valor = null;
    $repuestos = ControladorRepuestos::ctrMostrarRepuestos($item, $valor);

    $datosJson = '{ "data": [ ';

    for ($i = 0; $i < count($repuestos); $i++) {
      if ($repuestos[$i]["stock_repuesto"] <= 10) {
        $stock = "<span class='badge bg-danger'>" . $repuestos[$i]["stock_repuesto"] . "</span>";
      } else if ($repuestos[$i]["stock_repuesto"] > 10 && $repuestos[$i]["stock_repuesto"] <= 15) {
        $stock = "<span class='badge bg-warning'>" . $repuestos[$i]["stock_repuesto"] . "</span>";
      } else {
        $stock = "<span class='badge bg-primary'>" . $repuestos[$i]["stock_repuesto"] . "</span>";
      }

      $estado = $repuestos[$i]["estado_repuesto"] == 1 ? 
        "<button class='badge btn btn-success btnActivarRepuesto' idRepuesto='" . $repuestos[$i]["id_repuesto"] . "' estadoRepuesto='0'>Activo</button>" : 
        "<button class='badge btn btn-danger btnActivarRepuesto' idRepuesto='" . $repuestos[$i]["id_repuesto"] . "' estadoRepuesto='1'>Inactivo</button>";

      // Obtener la categoría del vehículo
      $itemCategoria = "id_categoria";
      $valorCategoria = $repuestos[$i]["id_categoria"];
      $categoria = ControladorCategorias::ctrMostrarCategorias($itemCategoria, $valorCategoria);

      $acciones = "<button type='button' class='btn btn-alt-primary' id='añadirCompraRepuesto'>Añadir</button>";

      $datosJson .= '{
        "id_repuesto": "' . $repuestos[$i]["id_repuesto"] . '",
        "numero": "' . ($i + 1) . '",
        "codigo_tienda_repuesto": "' . $repuestos[$i]["codigo_tienda_repuesto"] . '",
        "nombre_repuesto": "' . $repuestos[$i]["nombre_repuesto"] . '",
        "nombre_categoria": "' . $categoria["nombre_categoria"] . '",
        "marca_repuesto": "' . $repuestos[$i]["fabricante_repuesto"] . '",
        "stock_repuesto": "' . $stock . '",
        "precio_repuesto": "' . $repuestos[$i]["precio_repuesto"] . '",
        "acciones": "' . $acciones . '"
      },';
    }

    $datosJson = substr($datosJson, 0, -1);
    $datosJson .= ']}';

    echo $datosJson;
  }
}

/*=============================================
ACTIVAR TABLA DE REPUESTOS PARA COMPRAS
=============================================*/
$activarRepuestosCompra = new TablaRepuestosCompra();
$activarRepuestosCompra -> mostrarTablaRepuestosCompra();
?>
