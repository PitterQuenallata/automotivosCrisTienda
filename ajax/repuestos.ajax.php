<?php

require_once "../controllers/repuestos.controller.php";
require_once "../models/repuestos.model.php";

/*=============================================
Acciones para la gestión de repuestos
=============================================*/
if (isset($_POST['action'])) {
    switch ($_POST['action']) {
        case 'getRepuestos':
            $item = null;
            $valor = null;
            $repuestos = ControladorRepuestos::ctrMostrarRepuestos($item, $valor);
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
