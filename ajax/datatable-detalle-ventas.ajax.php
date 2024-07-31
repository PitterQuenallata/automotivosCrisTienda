<?php
session_start();
require_once "../controllers/listasVentas.controller.php";
require_once "../models/listasVentas.model.php";

class TablaDetalleVentas
{
  public function mostrarTablaDetalleVentas()
  {
    // Capturar rutas de la URL limpiando las queries
    $routesArray = explode("/", $_SERVER["REQUEST_URI"]);
    array_shift($routesArray);
    foreach ($routesArray as $key => $value) {
      $routesArray[$key] = explode("?", $value)[0];
    }

    if (isset($_GET["fechaInicio"])) {
      $fechaInicial = $_GET["fechaInicio"];
      $fechaFinal = $_GET["fechaFin"];
      // echo  var_dump($fechaInicial);
      // echo  var_dump($fechaFinal);
      $detalles = ControladorListasVentas::ctrRangoFechasDetalleVentas($fechaInicial, $fechaFinal);
    } else {
      $item = null;
      $valor = null;
      $detalles = ControladorListasVentas::ctrMostrarDetalleVentas($item, $valor);
    }

    if (count($detalles) == 0) {
      echo '{"data": []}';
      return;
    }

    $datosJson = '{"data": [';

    for ($i = 0; $i < count($detalles); $i++) {
      $venta = ControladorListasVentas::ctrMostrarVenta("id_venta", $detalles[$i]["id_venta"]);
      // echo '<pre>';
      // var_dump($venta);
      // echo '</pre>';
      $repuesto = ControladorListasVentas::ctrMostrarRepuesto("id_repuesto", $detalles[$i]["id_repuesto"]);

      $usuario = ControladorListasVentas::ctrMostrarUsuario("id_usuario", $venta["id_usuario"]);



      $total = $detalles[$i]["cantidad_detalleVenta"] * $detalles[$i]["precio_unitario_detalleVenta"];


      // Verificar si el usuario en la sesión es administrador
      $esAdministrador = $_SESSION["users"]["rol_usuario"] === "administrador";

      if ($esAdministrador) {
        $botonesAccion = "<div class='btn-group'>";
        $botonesAccion .= "<button type='button' class='btn btn-sm btn-secondary' data-id='" . $detalles[$i]["id_detalleVenta"] . "' onclick='editSaleDetail(" . $detalles[$i]["id_detalleVenta"] . ")'><i class='fa fa-pencil-alt'></i></button>";
        $botonesAccion .= "<button type='button' class='btn btn-sm btn-secondary' data-id='" . $detalles[$i]["id_detalleVenta"] . "' onclick='deleteSaleDetail(" . $detalles[$i]["id_detalleVenta"] . ")'><i class='fa fa-times'></i></button>";
        $botonesAccion .= "</div>";
      } else {
        $botonesAccion = "SIN";
      }

      $datosJson .= '[
        "' . ($i + 1) . '",
        "' . $venta["codigo_venta"] . '",
        "' . $repuesto["nombre_repuesto"] . '",
        "' . $detalles[$i]["cantidad_detalleVenta"] . '",
        "' . $detalles[$i]["precio_unitario_detalleVenta"] . '",
        "' . $total . '",
        "' . $venta["date_created_venta"] . '",
        "' . $botonesAccion . '"
      ],';
    }

    $datosJson = substr($datosJson, 0, -1);
    $datosJson .= ']}';

    echo $datosJson;
  }
}

$activarDetalleVentas = new TablaDetalleVentas();
$activarDetalleVentas->mostrarTablaDetalleVentas();
