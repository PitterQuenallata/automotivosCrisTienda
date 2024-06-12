<?php
error_reporting(E_ALL);
ini_set('display_errors', 1);

session_start();

require_once "../controllers/compras.controller.php";
require_once "../controllers/proveedores.controller.php"; // Asegúrate de incluir este controlador
require_once "../models/compras.model.php";
require_once "../models/proveedores.model.php";
require_once "../models/detalles_compras.model.php";
require_once "../models/repuestos.model.php";
require_once "../models/user.model.php";
// Registrar Compras
if ($_SERVER['REQUEST_METHOD'] === 'POST' && !isset($_POST['action'])) {
    $data = json_decode(file_get_contents("php://input"), true);

    // Capturar el id_usuario desde la sesión
    if (isset($_SESSION['id_usuario'])) {
        $data['usuario'] = $_SESSION['id_usuario'];
    } else {
        echo json_encode(["success" => false, "error" => "Usuario no autenticado"]);
        exit;
    }

    $respuesta = ControladorCompras::ctrRegistrarCompra($data);

    if ($respuesta === true) {
        echo json_encode(["success" => true]);
    } else {
        echo json_encode(["success" => false, "error" => $respuesta]);
    }
    exit;
}

// Acciones para la gestión de compras
if (isset($_POST['action'])) {
    switch ($_POST['action']) {
        case 'getCompra':
            $idCompra = $_POST['idCompra'];
            error_log("ID de compra recibida para obtener: $idCompra");
            $compra = ControladorCompras::ctrMostrarCompras('id_compra', $idCompra);
            $proveedores = ControladorProveedores::ctrMostrarProveedores(null, null);
            header('Content-Type: application/json');
            if ($compra) {
                echo json_encode(['success' => true, 'data' => $compra, 'proveedores' => $proveedores]);
            } else {
                echo json_encode(['success' => false, 'error' => 'No se encontraron datos']);
            }
            exit;

        case 'updateCompra':
            error_log("Datos recibidos para actualizar: " . json_encode($_POST));
            // Verificar si id_compra se ha proporcionado
            if (!isset($_POST['id_compra']) || empty($_POST['id_compra'])) {
                echo json_encode(['success' => false, 'error' => 'ID de compra no proporcionado']);
                exit;
            }

            $datos = [
                'id_compra' => $_POST['id_compra'],
                'fecha_compra' => $_POST['fecha_compra'],
                'monto_total_compra' => $_POST['monto_total_compra'],
                'id_proveedor' => $_POST['id_proveedor'],
                'id_usuario' => $_SESSION['id_usuario']
            ];
            error_log("Datos enviados al controlador para actualizar: " . json_encode($datos));
            $respuesta = ControladorCompras::ctrEditarCompra($datos);
            header('Content-Type: application/json');
            if ($respuesta == 'ok') {
                echo json_encode(['success' => true]);
            } else {
                echo json_encode(['success' => false, 'error' => 'Error al actualizar la compra']);
            }
            exit;

        case 'deleteCompra':
            $idCompra = $_POST['idCompra'];
            error_log("ID de compra recibida para eliminar: $idCompra");
            $respuesta = ControladorCompras::ctrEliminarCompra($idCompra);
            header('Content-Type: application/json');
            if ($respuesta == 'ok') {
                echo json_encode(['success' => true]);
            } else {
                echo json_encode(['success' => false, 'error' => 'Error al eliminar la compra']);
            }
            exit;
    }
}

?>