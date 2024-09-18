<?php
// Incluir el controlador y modelo necesarios
require_once "../controllers/ventas.controller.php";
require_once "../models/ventas.model.php";

// Verificar si el método es POST y si tenemos un movimiento_id
if ($_SERVER["REQUEST_METHOD"] == "POST" && isset($_POST['movimiento_id'])) {

    // Obtener el movimiento_id
    $movimientoId = $_POST['movimiento_id'];

    // Configurar la solicitud cURL a la API de VeriPagos para verificar el estado del QR
    $ch = curl_init("https://veripagos.com/api/bcp/verificar-estado-qr");

    $postData = [
        "secret_key" => "9cbacd0a-85a7-4bba-a9a1-2efa77712fbc", // Llave secreta proporcionada por VeriPagos
        "movimiento_id" => $movimientoId
    ];

    curl_setopt($ch, CURLOPT_POSTFIELDS, json_encode($postData));
    curl_setopt($ch, CURLOPT_HTTPHEADER, array('Content-Type:application/json'));
    curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
    curl_setopt($ch, CURLOPT_USERPWD, "AutomotivosCris:xAU+8G%z+e"); // Autenticación básica

    // Ejecutar la solicitud y capturar la respuesta
    $response = curl_exec($ch);

    if ($response === false) {
        echo json_encode([
            "status" => "error",
            "message" => "Error en la solicitud cURL: " . curl_error($ch)
        ]);
        curl_close($ch);
        exit;
    }

    curl_close($ch);

    // Decodificar la respuesta JSON
    $respuesta = json_decode($response, true);

    // Verificar si la consulta fue exitosa y si el estado del pago es "Completado"
    if ($respuesta['Codigo'] == 0 && $respuesta['Data']['estado'] === 'Completado') {
        echo json_encode([
            "status" => "success",
            "estado" => $respuesta['Data']['estado'],
            "detalle" => $respuesta['Data']['detalle']
        ]);
    } elseif (isset($respuesta['Data']['estado']) && $respuesta['Data']['estado'] !== 'Completado') {
        echo json_encode([
            "status" => "pendiente",
            "message" => "El pago aún no se ha completado."
        ]);
    } else {
        echo json_encode([
            "status" => "error",
            "message" => isset($respuesta['Mensaje']) ? $respuesta['Mensaje'] : "Error al verificar el estado del pago."
        ]);
    }
} else {
    echo json_encode([
        "status" => "error",
        "message" => "No se ha proporcionado el movimiento_id"
    ]);
}
?>
