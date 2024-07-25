<?php
error_reporting(E_ALL);
ini_set('display_errors', 1);

session_start(); // Asegúrate de iniciar la sesión

require_once "../controllers/compras.controller.php";
require_once "../controllers/repuestos.controller.php";
require_once "../models/compras.model.php";
require_once "../models/repuestos.model.php";
require_once "../models/detalles_compras.model.php";
require_once "../models/proveedores.model.php"; // Asegúrate de incluir este modelo 

if (isset($_POST['action'])) {
    switch ($_POST['action']) {
        case 'getDetallesCompra':
            $idCompra = $_POST['idCompra'];
            $detalles = ControladorCompras::ctrMostrarDetallesCompra($idCompra);
            header('Content-Type: application/json');
            if ($detalles) {
                echo json_encode(['success' => true, 'data' => $detalles]);
            } else {
                echo json_encode(['success' => false, 'error' => 'No se encontraron detalles']);
            }
            break;

        case 'updateDetalleCompra':
            // Recuperar id_compra del detalle
            $idDetalle = $_POST['id_detalle_compra'];
            $detalle = ModeloDetallesCompras::mdlMostrarDetalleCompraPorId("detalles_compras", $idDetalle);
            if ($detalle) {
                $_POST['id_compra'] = $detalle['id_compra'];
            }

            $respuesta = ControladorCompras::ctrActualizarDetalleCompra($_POST);
            header('Content-Type: application/json');
            if ($respuesta == 'ok') {
                echo json_encode(['success' => true]);
            } else {
                echo json_encode(['success' => false, 'error' => 'Error al actualizar el detalle']);
            }
            break;

        case 'deleteDetalleCompra':
            $idDetalle = $_POST['idDetalle'];
            $respuesta = ControladorCompras::ctrEliminarDetalleCompra($idDetalle);
            header('Content-Type: application/json');
            if ($respuesta == 'ok') {
                echo json_encode(['success' => true]);
            } else {
                echo json_encode(['success' => false, 'error' => 'Error al eliminar el detalle']);
            }
            break;

        case 'getRepuestos':
            $repuestos = ControladorRepuestos::ctrMostrarRepuestos(null, null);
            header('Content-Type: application/json');
            if ($repuestos) {
                echo json_encode(['success' => true, 'data' => $repuestos]);
            } else {
                echo json_encode(['success' => false, 'error' => 'No se encontraron repuestos']);
            }
            break;

        default:
            header('Content-Type: application/json');
            echo json_encode(['success' => false, 'error' => 'Acción no válida']);
            break;
    }
    exit;
}

header('Content-Type: application/json');
echo json_encode(['success' => false, 'error' => 'No se especificó ninguna acción']);
