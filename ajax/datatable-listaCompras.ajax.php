<?php
require_once "../controllers/compras.controller.php";
require_once "../models/compras.model.php";
require_once "../controllers/proveedores.controller.php";
require_once "../models/proveedores.model.php";
require_once "../controllers/usuario.controller.php";
require_once "../models/user.model.php";

if (isset($_GET['action'])) {
    $action = $_GET['action'];
    switch ($action) {
        case 'listarCompras':
            listarCompras();
            break;
        case 'obtenerCompra':
            obtenerCompra();
            break;
        case 'editarCompra':
            editarCompra();
            break;
        case 'eliminarCompra':
            eliminarCompra();
            break;
        case 'listarProveedores':
            listarProveedores();
            break;
    }
}

function listarCompras()
{
    $compras = ControladorCompras::ctrMostrarCompras(null, null);
    $data = [];

    for ($i = 0; $i < count($compras); $i++) {
        // Obtener nombre del proveedor
        $itemProveedor = "id_proveedor";
        $valorProveedor = $compras[$i]["id_proveedor"];
        $proveedor = ControladorProveedores::ctrMostrarProveedores($itemProveedor, $valorProveedor);

        if (!$proveedor) {
            $nombreProveedor = "Desconocido";
            $idProveedor = "";
        } else {
            $nombreProveedor = $proveedor["nombre_proveedor"];
            $idProveedor = $proveedor["id_proveedor"];
        }

        // Obtener nombre del usuario
        $itemUsuario = "id_usuario";
        $valorUsuario = $compras[$i]["id_usuario"];
        $usuario = ControladorUsuarios::ctrMostrarUsuarios($itemUsuario, $valorUsuario);

        if (!$usuario) {
            $nombreUsuario = "Desconocido";
            $idUsuario = "";
        } else {
            $nombreUsuario = $usuario["nombre_usuario"];
            $idUsuario = $usuario["id_usuario"];
        }

        // Acciones
        $acciones = '<div class="btn-group">' .
            '<button type="button" class="btn btn-sm btn-secondary btnVerDetalleCompra" data-idCompra="' . $compras[$i]["id_compra"] . '" data-bs-toggle="modal" data-bs-target="#modalDetalleCompra"><i class="fa fa-eye"></i></button>' .
            '<button type="button" class="btn btn-sm btn-secondary btnEditarCompra" idCompra="' . $compras[$i]["id_compra"] . '" data-bs-toggle="modal" data-bs-target="#modalEditarCompra"><i class="fa fa-pencil-alt"></i></button>' .
            '<button type="button" class="btn btn-sm btn-secondary btnEliminarCompra" idCompra="' . $compras[$i]["id_compra"] . '"><i class="fa fa-times"></i></button>' .
            '</div>';

        $data[] = [
            "numero" => ($i + 1),
            "codigo" => $compras[$i]["codigo_compra"],
            "fecha" => $compras[$i]["fecha_compra"],
            "proveedor" => $nombreProveedor,
            "usuario" => $nombreUsuario,
            "total" => $compras[$i]["monto_total_compra"] . " BS",
            "acciones" => $acciones,
            "id_compra" => $compras[$i]["id_compra"], // Campo oculto
            "id_proveedor" => $idProveedor, // Campo oculto
            "id_usuario" => $idUsuario     // Campo oculto
        ];
    }

    echo json_encode(["data" => $data], JSON_UNESCAPED_UNICODE | JSON_UNESCAPED_SLASHES);
}

function obtenerCompra() {
    $idCompra = $_POST['id_compra'];
    $compra = ControladorCompras::ctrObtenerCompra($idCompra);
    echo json_encode($compra);
}

function editarCompra() {
    $datos = [
        "id_compra" => $_POST["id_compra"],
        "id_proveedor" => $_POST["id_proveedor"]
    ];
    $respuesta = ControladorCompras::ctrEditarCompra($datos);
    echo $respuesta;
}

function eliminarCompra() {
    $idCompra = $_POST['id_compra'];
    $respuesta = ControladorCompras::ctrEliminarCompra($idCompra);
    echo $respuesta;
}

function listarProveedores() {
    $proveedores = ControladorCompras::ctrListarProveedores();
    echo json_encode($proveedores);
}
