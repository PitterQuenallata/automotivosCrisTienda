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
        // Inicializar contador
        $contador = 1;

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

      // Obtener la categoría del repuesto
      $itemCategoria = "id_categoria";
      $valorCategoria = $repuestos[$i]["id_categoria"];
      $categoria = ControladorCategorias::ctrMostrarCategorias($itemCategoria, $valorCategoria);

      //print_r($categoria);

      $acciones = "<div class='btn-group'><button class='btn btn-sm btn-secondary js-bs-tooltip-enabled btnEditarRepuesto' idRepuesto='" . $repuestos[$i]["id_repuesto"] . "' data-bs-toggle='modal' data-bs-target='#modalEditarRepuesto' aria-label='Edit' data-bs-original-title='Edit'><i class='fa fa-pencil-alt'></i></button><button class='btn btn-sm btn-secondary js-bs-tooltip-enabled btnEliminarRepuesto' idRepuesto='" . $repuestos[$i]["id_repuesto"] . "' codigo='" . $repuestos[$i]["codigo_tienda_repuesto"] . "' data-bs-toggle='tooltip' aria-label='Delete' data-bs-original-title='Delete'><i class='fa fa-times'></i></button></div>";

      $datosJson .= '{
        "numero": "' . $contador . '",
        "codigo_tienda_repuesto": "' . $repuestos[$i]["codigo_tienda_repuesto"] . '",
        "nombre_repuesto": "' . $repuestos[$i]["nombre_repuesto"] . '",
        
        "precio_repuesto": "' . $repuestos[$i]["precio_repuesto"] . '",
        "marca_repuesto": "' . $repuestos[$i]["fabricante_repuesto"] . '",
        "stock_repuesto": "' . $stock . '",
        "nombre_categoria": "' . $categoria["nombre_categoria"] . '",
        "estado_repuesto": "' . $estado . '",
        "acciones": "' . $acciones . '"
      },';
            // Incrementar el contador
            $contador++;
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
