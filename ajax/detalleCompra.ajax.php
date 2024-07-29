<?php
require_once "../controllers/compras.controller.php";
require_once "../models/compras.model.php";
require_once "../models/detalles_compras.model.php";

if (isset($_GET['action'])) {
  $action = $_GET['action'];
  switch ($action) {
    case 'verDetallesCompra':
      verDetallesCompra();
      break;
    case 'listarRepuestos':
      listarRepuestos();
      break;
    case 'editarDetalleCompra':
      editarDetalleCompra();
      break;
    case 'eliminarDetalleCompra':
      eliminarDetalleCompra();
      break;
  }
}

function verDetallesCompra()
{
  $idCompra = $_POST['idCompra'];
  $detalles = ControladorCompras::ctrMostrarDetallesCompra($idCompra);

  echo json_encode($detalles);
}

function listarRepuestos()
{
  $item = null;
  $valor = null;
  $repuestos = ControladorCompras::ctrMostrarRepuestosSimple($item, $valor);

  echo json_encode($repuestos);
}

function editarDetalleCompra()
{
  $datos = [
    "id_detalle_compra" => $_POST["id_detalle_compra"],
    "id_compra" => $_POST["id_compra"],
    "cantidad_detalleCompra" => $_POST["cantidad_detalleCompra"],
    "precio_unitario" => $_POST["precio_unitario"],
    "id_repuesto" => $_POST["id_repuesto"]
  ];

  $respuesta = ControladorCompras::ctrEditarDetalleCompra($datos);
  if ($respuesta == "ok") {
    ControladorCompras::ctrActualizarMontoTotalCompra($_POST["id_compra"]);
  }
  ControladorCompras::ctrActualizarMontoTotalCompra($_POST["id_compra"]);
  echo $respuesta;
}

function eliminarDetalleCompra()
{
  $idDetalle = $_POST['id_detalle'];
  $idCompra = $_POST['id_compra'];

  $respuesta = ControladorCompras::ctrEliminarDetalleCompra($idDetalle);
  if ($respuesta == "ok") {
    ControladorCompras::ctrActualizarMontoTotalCompra($idCompra);
  }
  ControladorCompras::ctrActualizarMontoTotalCompra($idCompra);
  echo $respuesta;
}
?>
