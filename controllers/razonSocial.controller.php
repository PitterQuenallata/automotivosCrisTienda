<?php
class ControladorRazonSocial
{
/*=============================================
    MOSTRAR RAZON SOCIAL
    =============================================*/
    public static function ctrMostrarRazonSocial($item, $valor) {
        $tabla = "razon_social"; // Nombre de la tabla en tu base de datos
        $respuesta = ModeloRazonSocial::mdlMostrarRazonSocial($tabla, $item, $valor);

        return $respuesta;
    }


    // Registrar una nueva razón social
    public static function ctrRegistrarRazonSocial($datos)
    {
        $tabla = "razon_social";
        return ModeloRazonSocial::mdlRegistrarRazonSocial($tabla, $datos);
    }


/*=============================================
  VERIFICAR NIT EN RAZON SOCIAL
=============================================*/
    public static function ctrVerificarNit($nitCliente)
    {
        $tabla = "razon_social";
        $item = "nit_ci_razon_social";
        $valor = $nitCliente;

        $respuesta = ModeloRazonSocial::mdlVerificarNit($tabla, $item, $valor);
        //print_r($respuesta);

        if ($respuesta) {
            return ["status" => "success", "datos" => $respuesta];
        } else {
            return ["status" => "error", "message" => "El NIT no existe."];
        }
    }


    /*=============================================
  VERIFICAR NIT PARA VENTA
=============================================*/
public static function ctrVerificarNitParaVenta($nitCliente)
{
    $tabla = "razon_social";
    $item = "nit_ci_razon_social";
    $valor = $nitCliente;

    $respuesta = ModeloRazonSocial::mdlVerificarNit($tabla, $item, $valor);

    if ($respuesta) {
        // Asegurarse de devolver un arreglo con la clave id_razon_social
        return ["id_razon_social" => $respuesta["id_razon_social"]];
    } else {
        return false; // O null para manejarlo después
    }
}


}
