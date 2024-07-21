<?php

class ControladorRepuestos
{

  /*=============================================
    MOSTRAR REPUESTOS
    =============================================*/

  static public function ctrMostrarRepuestos($item, $valor)
  {

    $tabla = "repuestos";

    $respuesta = ModeloRepuestos::mdlMostrarRepuestos($tabla, $item, $valor);

    return $respuesta;
  }
  /*=============================================
  ACTUALIZAR ESTADO REPUESTO
  =============================================*/
  static public function ctrActualizarEstadoRepuesto($item, $valor, $estado)
  {
    $tabla = "repuestos";

    $respuesta = ModeloRepuestos::mdlActualizarEstadoRepuesto($tabla, $item, $valor, $estado);

    return $respuesta;
  }

      /*=============================================
    CREAR REPUESTO
    =============================================*/
    public static function ctrCrearRepuesto()
    {
        if (isset($_POST["nuevoCodigoRepuesto"])) {

            // Validar los campos usando preg_match
            if (
                preg_match('/^[a-zA-Z0-9ñÑáéíóúÁÉÍÓÚ ]+$/', $_POST["nuevaDescripcionRepuesto"]) &&
                preg_match('/^[0-9]+$/', $_POST["nuevoStockRepuesto"]) &&
                preg_match('/^[0-9]+(\.[0-9]{1,2})?$/', $_POST["nuevoPrecioCompraRepuesto"]) &&
                preg_match('/^[0-9]+(\.[0-9]{1,2})?$/', $_POST["nuevoPrecioVentaRepuesto"])
            ) {

                // Inserción en la tabla de repuestos
                $tabla = "repuestos";
                $datos = array(
                    "id_categoria" => $_POST["agregarCategoria"],
                    "nombre_repuesto" => $_POST["nuevoNombreRepuesto"],
                    "descripcion_repuesto" => $_POST["nuevaDescripcionRepuesto"],
                    "codigo_tienda_repuesto" => $_POST["nuevoCodigoRepuesto"],
                    "stock_repuesto" => $_POST["nuevoStockRepuesto"],
                    "precio_repuesto" => $_POST["nuevoPrecioVentaRepuesto"],
                    "precio_compra" => $_POST["nuevoPrecioCompraRepuesto"],
                    "marca_repuesto" => $_POST["nuevaMarcaRepuesto"],
                    "estado_repuesto" => 1
                );

                $respuesta = ModeloRepuestos::mdlIngresarRepuesto($tabla, $datos);

                // Inserción en la tabla de modelo_repuestos y motor_repuestos
                if ($respuesta == "ok") {
                    $idRepuesto = ModeloRepuestos::mdlObtenerUltimoID("repuestos");

                    $tablaModelos = "modelo_repuestos";
                    $datosModelos = array(
                        "id_modelo" => $_POST["agregarModeloVehiculo"],
                        "id_repuesto" => $idRepuesto
                    );
                    ModeloRepuestos::mdlIngresarModeloRepuesto($tablaModelos, $datosModelos);

                    $tablaMotores = "motor_repuestos";
                    $datosMotores = array(
                        "id_motor" => $_POST["agregarMotor"],
                        "id_repuesto" => $idRepuesto
                    );
                    ModeloRepuestos::mdlIngresarMotorRepuesto($tablaMotores, $datosMotores);

                    // Redirigir con mensaje de éxito
                    echo '<script>
                        fncSweetAlert("success", "¡El repuesto ha sido guardado correctamente!", "/repuestos");
                    </script>';
                } else {
                    // Redirigir con mensaje de error en la base de datos
                    echo '<script>
                        fncSweetAlert("error", "Hubo un problema al guardar el repuesto en la base de datos.", "");
                    </script>';
                }
            } else {
                // Redirigir con mensaje de error de validación
                echo '<script>
                    fncSweetAlert("error", "Por favor, complete los campos correctamente. No se permiten caracteres especiales.", "");
                </script>';
            }
        }
    }
}
