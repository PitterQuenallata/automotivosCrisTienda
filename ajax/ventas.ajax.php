<?php
require_once "../controllers/ventas.controller.php";
require_once "../models/ventas.model.php";
require_once "../controllers/razonSocial.controller.php";
require_once "../models/razonSocial.model.php";

// Inicia la sesión si es necesario
if (session_status() == PHP_SESSION_NONE) {
  session_start();
}

// Verifica si la solicitud es POST
if ($_SERVER["REQUEST_METHOD"] == "POST") {

  // Verifica si se solicita un nuevo código de venta
  if (isset($_POST['action']) && $_POST['action'] === 'obtenerNuevoCodigoVenta') {
    $nuevoCodigo = ControladorVentas::ctrObtenerNuevoCodigoVenta();
    echo json_encode(['codigoVenta' => $nuevoCodigo]);
    return;
  }

  // Verifica el NIT para autocompletar los campos
  if (isset($_POST['accion']) && $_POST['accion'] === 'verificarNit') {
    $respuesta = ControladorRazonSocial::ctrVerificarNit($_POST['nitCliente']);
    echo json_encode($respuesta);
    return;
  }
  if ($_POST['accion'] === 'guardarQr') {
    $respuesta = ControladorVentas::ctrGuardarVentaQR();
  }
  // Realiza la venta según el método de pago (Efectivo o QR)
  if (isset($_POST['accion'])) {
    if ($_POST['accion'] === 'efectivo') {
      $respuesta = ControladorVentas::ctrVentaEfectivo();
    } elseif ($_POST['accion'] === 'qr') {
      $respuesta = ControladorVentas::ctrVentaQr();
    }

    // Respuesta del controlador para venta
    if ($respuesta["status"] === "success") {

      // Si es una venta por QR, solo devolvemos el QR en base64
      if ($_POST['accion'] === 'qr') {
        echo json_encode([
          "status" => "success",
          "qr" => $respuesta["qr"],  // Código QR en base64
          "movimiento_id" => $respuesta["movimiento_id"] // ID para verificar el estado del pago
        ]);
      } else {
        echo json_encode([
          "status" => "success",
          "messageVenta" => $respuesta["messageVenta"]
        ]);
      }
    } else {
      echo json_encode(["status" => "error", "message" => $respuesta["message"]]);
    }
  }


}
