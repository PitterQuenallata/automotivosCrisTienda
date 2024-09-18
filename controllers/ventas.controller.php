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
    VENTA EN EFECTIVO
=============================================*/
    public static function ctrVentaEfectivo()
    {
        try {
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

            // Iniciar la transacción
            $db = Conexion::conectar();
            $db->beginTransaction();

            // Verificar si el cliente existe o registrar un nuevo cliente
            $datosCliente = [
                "nombre" => !empty($_POST["nombreCliente"]) ? $_POST["nombreCliente"] : null,
                "nit" => !empty($_POST["nitCliente"]) ? $_POST["nitCliente"] : null,
                "celular" => !empty($_POST["celularCliente"]) ? $_POST["celularCliente"] : null
            ];
            //print_r($datosCliente);
            if ($datosCliente["nit"] !== null) {
                $clienteExistente = ControladorRazonSocial::ctrVerificarNitParaVenta($datosCliente["nit"]);

                if ($clienteExistente && isset($clienteExistente["id_razon_social"])) {
                    $idCliente = $clienteExistente["id_razon_social"];
                } else {
                    $respuestaCliente = ControladorRazonSocial::ctrRegistrarRazonSocial($datosCliente);
                    if ($respuestaCliente["status"] === "success") {
                        $idCliente = $respuestaCliente["id_razon_social"];
                    } else {
                        throw new Exception($respuestaCliente["message"]);
                    }
                    
                }
            } else {
                $idCliente = null;
            }

            // Datos de la venta
            $datosVenta = [
                "codigo" => $_POST["codigoVenta"],
                "id_usuario" => $_POST["idUsuario"],
                "id_razon_social" => $idCliente,
                "total" => $_POST["VentaTotal"],
                "metodo_pago" => "efectivo"
            ];

            // Guardar la venta en la tabla ventas
            $idVenta = ModeloVentas::mdlRegistrarVenta("ventas", $datosVenta);
            //print_r($idVenta);
            if ($idVenta === "error" || empty($idVenta)) {
                throw new Exception("Error al registrar la venta.");
            }

            // Guardar el detalle de la venta usando el ID correcto
            $listaRepuestos = json_decode($_POST["listaRepuestosVenta"], true);
            foreach ($listaRepuestos as $repuesto) {
                $datosDetalle = [
                    "id_venta" => $idVenta, // Aquí usamos el ID retornado
                    "id_repuesto" => $repuesto["id"],
                    "cantidad" => $repuesto["cantidad"],
                    "precio" => $repuesto["precio"]
                ];

                // Guardar el detalle de la venta en la tabla detalle_ventas
                $respuestaDetalle = ModeloVentas::mdlRegistrarDetalleVenta("detalles_ventas", $datosDetalle);
                if ($respuestaDetalle !== "ok") {
                    throw new Exception("Error al registrar el detalle de la venta.");
                }

                // Actualizar el stock de los repuestos
                $nuevoStock = $repuesto["stock"];
                $respuestaStock = ModeloVentas::mdlActualizarStock("repuestos", $repuesto["id"], $nuevoStock);
                if ($respuestaStock !== "ok") {
                    throw new Exception("Error al actualizar el stock del repuesto.");
                }
            }


            // Confirmar la transacción si todo sale bien
            $db->commit();

            return ["status" => "success", "messageVenta" => "Venta guardada correctamente"];
        } catch (Exception $e) {
            // Hacer rollback en caso de error
            $db->rollBack();
            return ["status" => "error", "message" => $e->getMessage()];
        }
    }


/*=============================================
    VENTA CON QR
=============================================*/
public static function ctrVentaQr()
{
    try {
        // Validaciones iniciales
        if (!isset($_POST["VentaTotal"]) || empty($_POST["VentaTotal"]) || $_POST["VentaTotal"] == 0) {
            return ["status" => "error", "message" => "El total de la venta no puede estar vacío o ser igual a 0"];
        }

        // Llamada a la API de VeriPagos para generar el QR
        $ch = curl_init("https://veripagos.com/api/bcp/generar-qr");
        $postData = [
            "secret_key" => "9cbacd0a-85a7-4bba-a9a1-2efa77712fbc",  // Llave secreta proporcionada
            "monto" => $_POST["VentaTotal"],  // Monto a cobrar
            "vigencia" => "0/00:15",  // Vigencia de 15 minutos para el QR
            "uso_unico" => true,  // Solo para un uso
            "detalle" => "Venta de repuestos"
        ];

        curl_setopt($ch, CURLOPT_POSTFIELDS, json_encode($postData));
        curl_setopt($ch, CURLOPT_HTTPHEADER, array('Content-Type:application/json'));
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
        curl_setopt($ch, CURLOPT_USERPWD, "AutomotivosCris:xAU+8G%z+e"); // Autenticación básica

        $response = curl_exec($ch);
        curl_close($ch);

        $respuestaApi = json_decode($response, true);

        // Verificar si la API generó correctamente el QR
        if ($respuestaApi["Codigo"] === 0) {
            // Devolver el QR en base64 y el movimiento_id para verificar el pago después
            return [
                "status" => "success",
                "qr" => $respuestaApi["Data"]["qr"],  // El código QR en base64
                "movimiento_id" => $respuestaApi["Data"]["movimiento_id"],  // ID para la verificación del pago
            ];
        } else {
            return ["status" => "error", "message" => "Error al generar el código QR"];
        }
    } catch (Exception $e) {
        return ["status" => "error", "message" => $e->getMessage()];
    }
}


/*=============================================
    VENTA CON QR TRAS VERIFICACIÓN
=============================================*/
public static function ctrGuardarVentaQR()
{
    try {
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

        // Iniciar la transacción
        $db = Conexion::conectar();
        $db->beginTransaction();

        // Verificar si el cliente existe o registrar un nuevo cliente
        $datosCliente = [
            "nombre" => !empty($_POST["nombreCliente"]) ? $_POST["nombreCliente"] : null,
            "nit" => !empty($_POST["nitCliente"]) ? $_POST["nitCliente"] : null,
            "celular" => !empty($_POST["celularCliente"]) ? $_POST["celularCliente"] : null
        ];
        //print_r($datosCliente);
        if ($datosCliente["nit"] !== null) {
            $clienteExistente = ControladorRazonSocial::ctrVerificarNitParaVenta($datosCliente["nit"]);

            if ($clienteExistente && isset($clienteExistente["id_razon_social"])) {
                $idCliente = $clienteExistente["id_razon_social"];
            } else {
                $respuestaCliente = ControladorRazonSocial::ctrRegistrarRazonSocial($datosCliente);
                if ($respuestaCliente["status"] === "success") {
                    $idCliente = $respuestaCliente["id_razon_social"];
                } else {
                    throw new Exception($respuestaCliente["message"]);
                }
                
            }
        } else {
            $idCliente = null;
        }

        // Datos de la venta
        $datosVenta = [
            "codigo" => $_POST["codigoVenta"],
            "id_usuario" => $_POST["idUsuario"],
            "id_razon_social" => $idCliente,
            "total" => $_POST["VentaTotal"],
            "metodo_pago" => "qr"
        ];

        // Guardar la venta en la tabla ventas
        $idVenta = ModeloVentas::mdlRegistrarVenta("ventas", $datosVenta);
        //print_r($idVenta);
        if ($idVenta === "error" || empty($idVenta)) {
            throw new Exception("Error al registrar la venta.");
        }

        // Guardar el detalle de la venta usando el ID correcto
        $listaRepuestos = json_decode($_POST["listaRepuestosVenta"], true);
        foreach ($listaRepuestos as $repuesto) {
            $datosDetalle = [
                "id_venta" => $idVenta, // Aquí usamos el ID retornado
                "id_repuesto" => $repuesto["id"],
                "cantidad" => $repuesto["cantidad"],
                "precio" => $repuesto["precio"]
            ];

            // Guardar el detalle de la venta en la tabla detalle_ventas
            $respuestaDetalle = ModeloVentas::mdlRegistrarDetalleVenta("detalles_ventas", $datosDetalle);
            if ($respuestaDetalle !== "ok") {
                throw new Exception("Error al registrar el detalle de la venta.");
            }

            // Actualizar el stock de los repuestos
            $nuevoStock = $repuesto["stock"];
            $respuestaStock = ModeloVentas::mdlActualizarStock("repuestos", $repuesto["id"], $nuevoStock);
            if ($respuestaStock !== "ok") {
                throw new Exception("Error al actualizar el stock del repuesto.");
            }
        }


        // Confirmar la transacción si todo sale bien
        $db->commit();

        return ["status" => "success", "messageVenta" => "Venta guardada correctamente"];
    } catch (Exception $e) {
        // Hacer rollback en caso de error
        $db->rollBack();
        return ["status" => "error", "message" => $e->getMessage()];
    }
}




}











