<?php
require_once "../controllers/listasVentas.controller.php";
require_once "../models/listasVentas.model.php";

class TablaVentasRealizadas {
  public function mostrarTablaVentasRealizadas() {
    $item = null;
    $valor = null;
    $ventas = ControladorListasVentas::ctrMostrarVentas($item, $valor);

    //var_dump($ventas); // var_dump para ver las ventas obtenidas

    if (count($ventas) == 0) {
      echo '{"data": []}';
      return;
    }

    $datosJson = '{"data": [';

    for ($i = 0; $i < count($ventas); $i++) {
      $cliente = ControladorListasVentas::ctrMostrarCliente("id_cliente", $ventas[$i]["id_cliente"]);
      $usuario = ControladorListasVentas::ctrMostrarUsuario("id_usuario", $ventas[$i]["id_usuario"]);

      // echo "<pre>";
      // var_dump($cliente); // var_dump para ver los datos del cliente
      // //var_dump($usuario); // var_dump para ver los datos del usuario
      // echo "</pre>";
      $nitCiCliente = $cliente ? $cliente["nit_ci_cliente"] : "ANONIMO";
      $nombreCliente = $cliente ? $cliente["nombre_cliente"] : "ANONIMO";

      $datosJson .= '[
        "' . ($i + 1) . '",
        "' . $ventas[$i]["codigo_venta"] . '",
        "' . $ventas[$i]["monto_total_venta"] . '",
        "' . $nombreCliente . '",
        "' . $nitCiCliente . '",
        "' . $usuario["nombre_usuario"] . '",
        "' . $ventas[$i]["date_updated_venta"] . '"
      ],';
    }

    $datosJson = substr($datosJson, 0, -1);
    $datosJson .= ']}';

    //var_dump($datosJson); // var_dump para ver el JSON final

    echo $datosJson;
  }
}

$activarVentasRealizadas = new TablaVentasRealizadas();
$activarVentasRealizadas->mostrarTablaVentasRealizadas();
?>
