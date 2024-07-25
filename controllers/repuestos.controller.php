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
        if (isset($_POST["nuevoNombreRepuesto"])) {

            // Validar entradas
            if (
                preg_match('/^[a-zA-Z0-9ñÑáéíóúÁÉÍÓÚ ]+$/', $_POST["nuevaDescripcionRepuesto"]) &&
                preg_match('/^[0-9.]+$/', $_POST["nuevoPrecioCompraRepuesto"]) &&
                preg_match('/^[0-9.]+$/', $_POST["nuevoPrecioVentaRepuesto"]) &&
                preg_match('/^[0-9]+$/', $_POST["nuevoStockRepuesto"])
            ) {

                $tabla = "repuestos";

                // Verificar si los campos están definidos y no están vacíos
                $marcaVehiculo = isset($_POST["agregarMarcaVehiculo"]) && !empty($_POST["agregarMarcaVehiculo"]) ? $_POST["agregarMarcaVehiculo"] : null;
                $modeloVehiculo = isset($_POST["agregarModeloVehiculo"]) && !empty($_POST["agregarModeloVehiculo"]) ? $_POST["agregarModeloVehiculo"] : null;
                $motorVehiculo = isset($_POST["agregarMotor"]) && !empty($_POST["agregarMotor"]) ? $_POST["agregarMotor"] : null;

                $datos = array(
                    "codigo_tienda_repuesto" => $_POST["nuevoCodigoRepuesto"],
                    "nombre_repuesto" => $_POST["nuevoNombreRepuesto"],
                    "descripcion_repuesto" => $_POST["nuevaDescripcionRepuesto"],
                    "precio_repuesto" => $_POST["nuevoPrecioVentaRepuesto"],
                    "precio_compra" => $_POST["nuevoPrecioCompraRepuesto"],
                    "marca_repuesto" => $_POST["nuevaMarcaRepuesto"],
                    "stock_repuesto" => $_POST["nuevoStockRepuesto"],
                    "id_categoria" => $_POST["agregarCategoria"],
                    "estado_repuesto" => 1 // Asegurar que el estado sea 1 (activo)
                );

                $idRepuesto = ModeloRepuestos::mdlIngresarRepuesto($tabla, $datos);

                if ($idRepuesto != "error") {
                    // Insertar en motor_repuestos si se proporcionó un motor
                    if ($motorVehiculo != null) {
                        $tablaMotorRepuesto = "motor_repuestos";
                        $datosMotorRepuesto = array(
                            "id_motor" => $motorVehiculo,
                            "id_repuesto" => $idRepuesto
                        );
                        ModeloRepuestos::mdlIngresarMotorRepuesto($tablaMotorRepuesto, $datosMotorRepuesto);
                    }

                    // Insertar en modelo_repuestos si se proporcionó un modelo
                    if ($modeloVehiculo != null) {
                        $tablaModeloRepuesto = "modelo_repuestos";
                        $datosModeloRepuesto = array(
                            "id_modelo" => $modeloVehiculo,
                            "id_repuesto" => $idRepuesto
                        );
                        ModeloRepuestos::mdlIngresarModeloRepuesto($tablaModeloRepuesto, $datosModeloRepuesto);
                    }

                    // Alerta de éxito
                    echo '<script>
                            fncSweetAlert("success", "El repuesto ha sido guardado correctamente", "/repuestos");
                          </script>';
                } else {
                    // Alerta de error en el servidor
                    echo '<script>
                            fncSweetAlert("error", "Error al guardar el repuesto", "");
                          </script>';
                }
            } else {
                // Alerta de error en la validación de campos
                echo '<script>
                        fncSweetAlert("error", "Error en la validación de los campos", "");
                      </script>';
            }
        }
    }



    /*=============================================
    EDITAR REPUESTO
    =============================================*/
    public static function ctrEditarRepuesto()
    {
        if (isset($_POST["idRepuesto"])) {
            // Validar entradas
            if (
                !empty($_POST["nuevoNombreRepuesto"]) &&
                preg_match('/^[a-zA-Z0-9ñÑáéíóúÁÉÍÓÚ ]+$/', $_POST["nuevoNombreRepuesto"]) &&
                preg_match('/^[a-zA-Z0-9ñÑáéíóúÁÉÍÓÚ ]+$/', $_POST["nuevaDescripcionRepuesto"]) &&
                preg_match('/^[0-9.]+$/', $_POST["nuevoPrecioCompraRepuesto"]) &&
                preg_match('/^[0-9.]+$/', $_POST["nuevoPrecioVentaRepuesto"]) &&
                preg_match('/^[0-9]+$/', $_POST["nuevoStockRepuesto"])
            ) {

                $tabla = "repuestos";

                $marcaVehiculo = isset($_POST["agregarMarcaVehiculo"]) && !empty($_POST["agregarMarcaVehiculo"]) ? $_POST["agregarMarcaVehiculo"] : null;
                $modeloVehiculo = isset($_POST["agregarModeloVehiculo"]) && !empty($_POST["agregarModeloVehiculo"]) ? $_POST["agregarModeloVehiculo"] : null;
                $motorVehiculo = isset($_POST["agregarMotor"]) && !empty($_POST["agregarMotor"]) ? $_POST["agregarMotor"] : null;

                $datos = array(
                    "id_repuesto" => $_POST["idRepuesto"],
                    "codigo_tienda_repuesto" => $_POST["nuevoCodigoRepuesto"],
                    "nombre_repuesto" => $_POST["nuevoNombreRepuesto"],
                    "descripcion_repuesto" => $_POST["nuevaDescripcionRepuesto"],
                    "precio_repuesto" => $_POST["nuevoPrecioVentaRepuesto"],
                    "precio_compra" => $_POST["nuevoPrecioCompraRepuesto"],
                    "marca_repuesto" => $_POST["nuevaMarcaRepuesto"],
                    "stock_repuesto" => $_POST["nuevoStockRepuesto"],
                    "id_categoria" => $_POST["agregarCategoria"],
                    "marca_vehiculo" => $marcaVehiculo,
                    "modelo_vehiculo" => $modeloVehiculo,
                    "motor_vehiculo" => $motorVehiculo,
                    "estado_repuesto" => 1 // Asegurar que el estado sea 1 (activo)
                );

                $respuesta = ModeloRepuestos::mdlEditarRepuesto($tabla, $datos);

                if ($respuesta == "ok") {
                    echo '<script>
                    fncSweetAlert("success", "El repuesto ha sido actualizado correctamente", "/repuestos");
                </script>';
                } else {
                    echo '<script>
                    fncSweetAlert("error", "Error al actualizar el repuesto", "");
                </script>';
                }
            } else {
                echo '<script>
                fncSweetAlert("error", "Error en la validación de los campos", "");
            </script>';
            }
        }
    }




    /*=============================================
    MOSTRAR ASOCIACIONES DE REPUESTO
    =============================================*/
    public static function ctrMostrarAsociacionesRepuesto($idRepuesto)
    {
        return ModeloRepuestos::mdlMostrarAsociacionesRepuesto($idRepuesto);
    }

    /*=============================================
    ELIMINAR REPUESTO
    =============================================*/
    public static function ctrEliminarRepuesto() {
        if (isset($_POST["idRepuestoEliminar"])) {
            $tabla = "repuestos";
            $datos = $_POST["idRepuestoEliminar"];
    
            // Eliminar relaciones en otras tablas
            $respuestaMotor = ModeloRepuestos::mdlEliminarMotorRepuesto("motor_repuestos", $datos);
            $respuestaModelo = ModeloRepuestos::mdlEliminarModeloRepuesto("modelo_repuestos", $datos);
    
            if ($respuestaMotor == "ok" && $respuestaModelo == "ok") {
                $respuesta = ModeloRepuestos::mdlEliminarRepuesto($tabla, $datos);
    
                if ($respuesta == "ok") {
                    echo "ok";
                } else {
                    echo "error";
                }
            } else {
                echo "error";
            }
        }
    }
}
