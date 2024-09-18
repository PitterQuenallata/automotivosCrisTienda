<?php
session_start();
require_once "../controllers/listasVentas.controller.php";
require_once "../models/listasVentas.model.php";
require_once "../controllers/razonSocial.controller.php";
require_once "../models/razonSocial.model.php";

class TablaVentasRealizadas
{
  public function mostrarTablaVentasRealizadas()
  {

  
    // Capturar rutas de la URL limpiando las queries
$routesArray = explode("/", $_SERVER["REQUEST_URI"]);
array_shift($routesArray);
foreach ($routesArray as $key => $value) {
    $routesArray[$key] = explode("?", $value)[0];
}

    // echo "<pre>";
    // echo print_r($routesArray);
    // echo "</pre>";

    if (isset($_GET["fechaInicio"])) {
      $fechaInicial = $_GET["fechaInicio"];
      $fechaFinal = $_GET["fechaFin"];
      // echo  var_dump($fechaInicial);
      // echo  var_dump($fechaFinal);
      $ventas = ControladorListasVentas::ctrRangoFechasVentas($fechaInicial, $fechaFinal);
    } else {
      $item = null;
      $valor = null;
      $ventas = ControladorListasVentas::ctrMostrarVentas($item, $valor);
    }



    if (count($ventas) == 0) {
      echo '{"data": []}';
      return;
    }

    $datosJson = '{"data": [';

    for ($i = 0; $i < count($ventas); $i++) {
      $cliente = ControladorRazonSocial::ctrMostrarRazonSocial("id_razon_social", $ventas[$i]["id_razon_social"]);
      //print_r($cliente);
      //$usuario = ControladorListasVentas::ctrMostrarUsuario("id_usuario", $ventas[$i]["id_usuario"]);

      $nitCiCliente = $cliente ? $cliente["nit_ci_razon_social"] : "ANONIMO";
      $nombreCliente = $cliente ? $cliente["cliente_razon_social"] : "ANONIMO";
      
      // Verificar si el usuario en la sesión es administrador
      $esAdministrador = isset($_SESSION["users"]["rol_usuario"]) && $_SESSION["users"]["rol_usuario"] === "administrador";
      $botonesAccion = "<div class='btn-group'>";

      if ($esAdministrador) {
        $botonesAccion .= "<button type='button' class='btn btn-sm btn-secondary btnImprimirFactura'  idVentaRealizada='" . $ventas[$i]["id_venta"] . "' )'><i class='fa fa-print'></i></button>";
        $botonesAccion .= "<button type='button' class='btn btn-sm btn-secondary' data-id='" . $ventas[$i]["id_venta"] . "' onclick='editSaleDetail(" . $ventas[$i]["id_venta"] . ")'><i class='fa fa-pencil-alt'></i></button>";
        $botonesAccion .= "<button type='button' class='btn btn-sm btn-secondary' data-id='" . $ventas[$i]["id_venta"] . "' onclick='deleteSaleDetail(" . $ventas[$i]["id_venta"] . ")'><i class='fa fa-times'></i></button>";
      } else {
        $botonesAccion .= "<button type='button' class='btn btn-sm btn-secondary btnImprimirFactura'  idVentaRealizada='" . $ventas[$i]["id_venta"] . "' )'><i class='fa fa-print'></i></button>";
      }
      $botonesAccion .= "</div>";
      $datosJson .= '[
        "' . ($i + 1) . '",
        "' . $ventas[$i]["codigo_venta"] . '",
        "' . $ventas[$i]["monto_total_venta"] . '",
        "' . $nombreCliente . '",
        "' . $nitCiCliente . '",
        "' . $ventas[$i]["metodo_pago_venta"] . '",
        "' . $ventas[$i]["date_created_venta"] . '",
        "' . $botonesAccion . '"
      ],';
    }

    $datosJson = substr($datosJson, 0, -1);
    $datosJson .= ']}';

    echo $datosJson;
  }
}

$activarVentasRealizadas = new TablaVentasRealizadas();
$activarVentasRealizadas->mostrarTablaVentasRealizadas();
