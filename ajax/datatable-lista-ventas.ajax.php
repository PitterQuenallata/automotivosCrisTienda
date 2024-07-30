<?php
session_start();
require_once "../controllers/listasVentas.controller.php";
require_once "../models/listasVentas.model.php";

class TablaVentasRealizadas
{
  public function mostrarTablaVentasRealizadas()
  {
    $item = null;
    $valor = null;
    $ventas = ControladorListasVentas::ctrMostrarVentas($item, $valor);

    if (count($ventas) == 0) {
      echo '{"data": []}';
      return;
    }

    $datosJson = '{"data": [';

    for ($i = 0; $i < count($ventas); $i++) {
      $cliente = ControladorListasVentas::ctrMostrarCliente("id_cliente", $ventas[$i]["id_cliente"]);
      $usuario = ControladorListasVentas::ctrMostrarUsuario("id_usuario", $ventas[$i]["id_usuario"]);

      $nitCiCliente = $cliente ? $cliente["nit_ci_cliente"] : "ANONIMO";
      $nombreCliente = $cliente ? $cliente["nombre_cliente"] : "ANONIMO";

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
        "' . $usuario["nombre_usuario"] . '",
        "' . $ventas[$i]["date_updated_venta"] . '",
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
