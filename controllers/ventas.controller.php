<?php

class ControladorVentas
{

  /*=============================================
  MOSTRAR REPUESTOS PARA VENTAS
  =============================================*/
  public static function ctrMostrarRepuestosVentas($item, $valor)
  {
    $tabla = "repuestos";
    $respuesta = ModeloVentas::mdlMostrarRepuestosVentas($tabla, $item, $valor);
    return $respuesta;
  }

  /*=============================================
  MOSTRAR VENTAS
  =============================================*/
  public static function ctrMostrarVentas($item, $valor)
  {
    $tabla = "ventas";
    $respuesta = ModeloVentas::mdlMostrarVentas($tabla, $item, $valor);
    return $respuesta;
  }
  /*=============================================
  OBTENER NUEVO CÓDIGO DE VENTA
  =============================================*/
  public static function ctrObtenerNuevoCodigoVenta()
  {
    $tabla = "ventas";
    $ultimoCodigo = ModeloVentas::mdlObtenerUltimoCodigoVenta($tabla);

    if (!$ultimoCodigo) {
      return "00001";
    } else {
      $nuevoCodigo = str_pad((int)$ultimoCodigo["codigo_venta"] + 1, 5, "0", STR_PAD_LEFT);
      return $nuevoCodigo;
    }
  }

  /*=============================================
  CREAR VENTA
  =============================================*/
  public static function ctrCrearVenta() {
    // Validaciones iniciales
    if (!isset($_POST["codigoVenta"]) || empty($_POST["codigoVenta"])) {
        return ["status" => "error", "message" => "Código de venta no puede estar vacío"];
    }
    if (!isset($_POST["listaRepuestosVenta"]) || empty($_POST["listaRepuestosVenta"])) {
        return ["status" => "error", "message" => "La lista de repuestos no puede estar vacía"];
    }
    if (!isset($_POST["VentaTotal"]) || empty($_POST["VentaTotal"]) || $_POST["VentaTotal"] == 0) {
        return ["status" => "error", "message" => "El total de la venta no puede estar vacío o ser igual a 0"];
    }

    // Continuar con la lógica de registro de clientes y venta
    $datosCliente = [
        "nombre" => !empty($_POST["nombreCliente"]) ? $_POST["nombreCliente"] : null,
        "nit" => !empty($_POST["nitCliente"]) ? $_POST["nitCliente"] : null,
        "celular" => !empty($_POST["celularCliente"]) ? $_POST["celularCliente"] : null
    ];

    if ($datosCliente["nit"] !== null) {
        $clienteExistente = ControladorClientes::ctrVerificarClientePorNit($datosCliente["nit"]);
        if ($clienteExistente) {
            // Si el cliente existe, aumenta el contador de compras
            $nuevasCompras = $clienteExistente["compra_cliente"] + 1;
            $respuestaActualizar = ControladorClientes::ctrActualizarContadorCompras($clienteExistente["id_cliente"], $nuevasCompras);
            if ($respuestaActualizar !== true) {
                return ["status" => "error", "message" => "Error al actualizar el contador de compras del cliente."];
            } else {
                $mensajeCliente = "Cliente actualizado correctamente";
                $idCliente = $clienteExistente["id_cliente"];
            }
        } else {
            // Si el cliente no existe, lo crea y establece el contador de compras en 1
            $datosCliente["compra_cliente"] = 1;
            $respuestaCliente = ControladorClientes::ctrRegistrarCliente($datosCliente);
            if ($respuestaCliente["status"] !== "success") {
                return ["status" => "error", "message" => "Error al registrar cliente."];
            } else {
                $mensajeCliente = "Cliente guardado correctamente";
                $idCliente = $respuestaCliente["id_cliente"];
            }
        }
    } else {
        $mensajeCliente = $datosCliente["nombre"] !== null ? "Cliente no sera registrado por falta de NIT o CI" : "CLIENTE ANONIMO";
        $idCliente = null;
    }

    // Datos de la venta
    $datosVenta = [
        "codigo" => $_POST["codigoVenta"],
        "id_usuario" => $_POST["idUsuario"],
        "id_cliente" => $idCliente,
        "total" => $_POST["VentaTotal"]
    ];

    // Guardar la venta en la tabla ventas
    $respuestaVenta = ModeloVentas::mdlRegistrarVenta("ventas", $datosVenta);

    if ($respuestaVenta !== "ok") {
        return ["status" => "error", "message" => "Error al registrar la venta."];
    }

    // Guardar el detalle de la venta
    $listaRepuestos = json_decode($_POST["listaRepuestosVenta"], true);
    foreach ($listaRepuestos as $repuesto) {
        $datosDetalle = [
            "id_venta" => $datosVenta["codigo"],
            "id_repuesto" => $repuesto["id"],
            "cantidad" => $repuesto["cantidad"],
            "precio" => $repuesto["precio"]
        ];

        // Guardar el detalle de la venta en la tabla detalle_ventas
        $respuestaDetalle = ModeloVentas::mdlRegistrarDetalleVenta("detalles_ventas", $datosDetalle);
        if ($respuestaDetalle !== "ok") {
            return ["status" => "error", "message" => "Error al registrar el detalle de la venta."];
        }
        // Actualizar el stock de los repuestos
        $nuevoStock = $repuesto["stock"];
        $respuestaStock = ModeloVentas::mdlActualizarStock("repuestos", $repuesto["id"], $nuevoStock);
        if ($respuestaStock !== "ok") {
            return ["status" => "error", "message" => "Error al actualizar el stock del repuesto."];
        }
    }

    if ($respuestaVenta == "ok") {
        return ["status" => "success", "messageCliente" => $mensajeCliente, "messageVenta" => "Venta guardada correctamente"];
    } else {
        return ["status" => "error", "message" => "Error al guardar la venta"];
    }
}

  
}
