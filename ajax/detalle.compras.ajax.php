<?php
error_reporting(E_ALL);
ini_set('display_errors', 1);

session_start(); // Asegúrate de iniciar la sesión

require_once "../controllers/compras.controller.php";
require_once "../controllers/proveedores.controller.php"; // Asegúrate de incluir este controlador
require_once "../models/compras.model.php";
require_once "../models/proveedores.model.php";
require_once "../models/detalles_compras.model.php";

/*=============================================
Acciones para la gestión de detalles de compras
=============================================*/
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
            exit;

        case 'updateDetalleCompra':
            $respuesta = ControladorCompras::ctrActualizarDetalleCompra();
            header('Content-Type: application/json');
            if ($respuesta == 'ok') {
                echo json_encode(['success' => true]);
            } else {
                echo json_encode(['success' => false, 'error' => 'Error al actualizar el detalle']);
            }
            exit;

        case 'deleteDetalleCompra':
            $idDetalle = $_POST['idDetalle'];
            $respuesta = ControladorCompras::ctrEliminarDetalleCompra($idDetalle);
            header('Content-Type: application/json');
            if ($respuesta == 'ok') {
                echo json_encode(['success' => true]);
            } else {
                echo json_encode(['success' => false, 'error' => 'Error al eliminar el detalle']);
            }
            exit;
    }
}
?>
