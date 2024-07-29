<?php
class ControladorCompras
{

    /*=============================================
	Mostrar Compras
	=============================================*/
    public static function ctrMostrarCompras($item, $valor)
    {
        $tabla = "compras";
        $respuesta = ModeloCompras::mdlMostrarCompras($tabla, $item, $valor);
        return $respuesta;
    }
    /*=============================================
    CREAR COMPRA
    =============================================*/
    public static function ctrCrearCompra($datos)
    {
        if (empty($datos["codigoCompra"]) || empty($datos["montoTotal"]) || empty($datos["idUsuario"]) || empty($datos["lista_repuestos"])) {
            return "error_campos_vacios";
        }

        if (!is_numeric($datos["montoTotal"]) || $datos["montoTotal"] <= 0) {
            return "error_monto_total";
        }

        $tablaCompras = "compras";
        $listaRepuestos = $datos["lista_repuestos"];

        $idProveedor = $datos["idProveedor"];

        // Si se proporcionan datos del proveedor manualmente, primero inserta el proveedor
        if ($datos["proveedorManual"]) {

            $idProveedor = self::ctrCrearProveedor($datos["proveedorManual"]);
            if ($idProveedor == "error") {
                return "error_crear_proveedor";
            }
            $datos["idProveedor"] = $idProveedor;
        }

        $datosCompra = array(
            "codigo_compra" => $datos["codigoCompra"],
            "monto_total_compra" => $datos["montoTotal"],
            "id_proveedor" => $idProveedor,
            "id_usuario" => $datos["idUsuario"]
        );

        $idCompra = ModeloCompras::mdlCrearCompra($tablaCompras, $datosCompra);

        if ($idCompra != "error") {
            $respuestaDetalles = self::ctrCrearDetallesCompra($idCompra, $listaRepuestos);

            if ($respuestaDetalles == "ok") {
                return "ok";
            } else {
                return "error_detalles";
            }
        } else {
            return "error_compra";
        }
    }

    /*=============================================
    CREAR PROVEEDOR
    =============================================*/
    private static function ctrCrearProveedor($datosProveedor)
    {
        $tablaProveedores = "proveedores";

        if (empty($datosProveedor["nombre"]) || empty($datosProveedor["nit"]) || empty($datosProveedor["direccion"]) || empty($datosProveedor["email"]) || empty($datosProveedor["celular"])) {
            return "error_campos_vacios";
        }

        $datos = array(
            "nombre_proveedor" => $datosProveedor["nombre"],
            "nit_ci_proveedor" => $datosProveedor["nit"],
            "telefono_proveedor" => $datosProveedor["celular"],
            "direccion_proveedor" => $datosProveedor["direccion"],
            "email_proveedor" => $datosProveedor["email"]
        );

        $idProveedor = ModeloCompras::mdlCrearProveedor($tablaProveedores, $datos);
        // Debug: Ver contenido de $idProveedor
        // echo "<pre>";
        // print($idProveedor);
        // echo "</pre>";
        //exit(); // Detener ejecución para ver el resultado
        return $idProveedor;
    }

    /*=============================================
    CREAR DETALLES COMPRA
    =============================================*/
    private static function ctrCrearDetallesCompra($idCompra, $listaRepuestos)
    {
        $tabla = "detalles_compras";

        foreach ($listaRepuestos as $key => $value) {
            if (empty($value["cantidad_detalleCompra"]) || !preg_match('/^[0-9]+$/', $value["cantidad_detalleCompra"])) {
                return "error_cantidad_invalida";
            }

            if (empty($value["precio_unitario"]) || !preg_match('/^[0-9]+(\.[0-9]+)?$/', $value["precio_unitario"])) {
                return "error_precio_unitario";
            }

            $datos = array(
                "id_compra" => $idCompra,
                "id_repuesto" => $value["id_repuesto"],
                "cantidad_detalleCompra" => $value["cantidad_detalleCompra"],
                "precio_unitario" => $value["precio_unitario"]
            );

            $respuesta = ModeloCompras::mdlCrearDetalleCompra($tabla, $datos);

            if ($respuesta != "ok") {
                return "errorr";
            }
        }

        return "ok";
    }

    /*=============================================
    MOSTRAR LA ÚLTIMA COMPRA Y GENERAR NUEVO CÓDIGO
    =============================================*/
    public static function ctrMostrarNuevoCodigoCompra()
    {
        $tabla = "compras";
        $respuesta = ModeloCompras::mdlMostrarUltimaCompra($tabla);

        if ($respuesta) {
            $ultimoCodigo = $respuesta["codigo_compra"];
            $numero = intval(substr($ultimoCodigo, 3)) + 1;
            $nuevoCodigo = "COM" . str_pad($numero, 4, "0", STR_PAD_LEFT);
        } else {
            $nuevoCodigo = "COM0001";
        }

        return $nuevoCodigo;
    }


    /*=============================================
    MOSTRAR DETALLES DE COMPRA
    =============================================*/
    public static function ctrMostrarDetallesCompra($idCompra)
    {
        $tabla = "detalles_compras";
        $respuesta = ModeloCompras::mdlMostrarDetallesCompra($tabla, $idCompra);
        return $respuesta;
    }


    /*=============================================
    EDITAR DETALLE DE COMPRA
    =============================================*/
    public static function ctrEditarDetalleCompra($datos)
    {
        if (!empty($datos['id_detalle_compra']) && !empty($datos['cantidad_detalleCompra']) && !empty($datos['precio_unitario']) && !empty($datos['id_repuesto'])) {
            $tabla = "detalles_compras";
            $respuesta = ModeloCompras::mdlEditarDetalleCompra($tabla, $datos);
            return $respuesta;
        } else {
            return "error_campos_vacios";
        }
    }

    /*=============================================
    ELIMINAR DETALLE DE COMPRA
    =============================================*/
    public static function ctrEliminarDetalleCompra($idDetalle)
    {
        $tabla = "detalles_compras";
        $respuesta = ModeloCompras::mdlEliminarDetalleCompra($tabla, $idDetalle);
        return $respuesta;
    }

    /*=============================================
    MOSTRAR REPUESTOS SIMPLE
    =============================================*/
    public static function ctrMostrarRepuestosSimple($item, $valor)
    {
        $tabla = "repuestos";
        $respuesta = ModeloCompras::mdlMostrarRepuestosSimple($tabla, $item, $valor);
        return $respuesta;
    }

    /*=============================================
    ACTUALIZAR MONTO TOTAL DE COMPRA
    =============================================*/
    public static function ctrActualizarMontoTotalCompra($idCompra) {
        $montoTotal = ModeloDetallesCompras::mdlCalcularMontoTotalCompra($idCompra);
        return ModeloCompras::mdlActualizarMontoTotalCompra("compras", $idCompra, $montoTotal);
    }


    /*=============================================COMPRAS=============================================*/
    public static function ctrObtenerCompra($idCompra)
    {
        $tabla = "compras";
        return ModeloCompras::mdlObtenerCompra($tabla, $idCompra);
    }
    
    public static function ctrEditarCompra($datos)
    {
        $tabla = "compras";
        return ModeloCompras::mdlEditarCompra($tabla, $datos);
    }
    
    public static function ctrEliminarCompra($idCompra)
    {
        $tabla = "compras";
        $tablaDetalles = "detalles_compras";
    
        // Eliminar detalles de compra primero
        $eliminarDetalles = ModeloCompras::mdlEliminarDetallesCompra($tablaDetalles, $idCompra);
    
        if ($eliminarDetalles == "ok") {
            // Si se eliminaron los detalles correctamente, eliminar la compra
            return ModeloCompras::mdlEliminarCompra($tabla, $idCompra);
        } else {
            return "error";
        }
    }
    
    public static function ctrListarProveedores()
    {
        $tabla = "proveedores";
        return ModeloProveedores::mdlMostrarProveedores($tabla, null, null);
    }
    
    

}
