<?php
require_once "../controllers/ventas.controller.php";
require_once "../models/ventas.model.php";
require_once "../controllers/clientes.controller.php";
require_once "../models/clientes.model.php";

// Inicia la sesión si es necesario
if (session_status() == PHP_SESSION_NONE) {
  session_start();
}

// Verifica si la solicitud es POST
if ($_SERVER["REQUEST_METHOD"] == "POST") {
  // Verifica si se solicita un nuevo código de venta
  if (isset($_POST['action'])) {
    if ($_POST['action'] === 'obtenerNuevoCodigoVenta') {
      $nuevoCodigo = ControladorVentas::ctrObtenerNuevoCodigoVenta();
      echo json_encode(['codigoVenta' => $nuevoCodigo]);
      return;
    }
  }
  // Ejecuta la lógica del controlador
  $guardarVenta = new ControladorVentas();
  $respuesta = $guardarVenta->ctrCrearVenta();

  if ($respuesta["status"] === "success") {
    echo json_encode([
      "status" => "success",
      "messageCliente" => $respuesta["messageCliente"],
      "messageVenta" => $respuesta["messageVenta"]
    ]);
  } else {
    echo json_encode(["status" => "error", "message" => $respuesta["message"]]);
  }
}
?>
