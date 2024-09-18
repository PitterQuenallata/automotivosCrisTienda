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
                preg_match('/^[a-zA-Z0-9ñÑáéíóúÁÉÍÓÚ \-]+$/', $_POST["nuevaDescripcionRepuesto"]) && // Validar descripción con guion
                preg_match('/^[0-9.]+$/', $_POST["nuevoPrecioVentaRepuesto"]) && // Validar precio
                preg_match('/^[0-9]+$/', $_POST["nuevoStockRepuesto"]) && // Validar stock
                (empty($_POST["pesoRepuesto"]) || preg_match('/^[0-9.]+$/', $_POST["pesoRepuesto"])) && // Validar peso (puede estar vacío o contener un número)
                !empty($_POST["agregarCategoria"]) // Asegurarse de que la categoría no esté vacía
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
                    "fabricante_repuesto" => $_POST["nuevaMarcaRepuesto"],
                    "stock_repuesto" => $_POST["nuevoStockRepuesto"],
                    "peso_repuesto" => $_POST["pesoRepuesto"], // Añadir el campo peso al array de datos
                    "id_categoria" => $_POST["agregarCategoria"], // Verificar que la categoría no esté vacía
                    "id_marca" => $marcaVehiculo,   // Añadir el id_marca
                    "id_modelo" => $modeloVehiculo, // Añadir el id_modelo
                    "id_motor" => $motorVehiculo,   // Añadir el id_motor
                    "estado_repuesto" => 1 // Asegurar que el estado sea 1 (activo)
                );

                // Verificar los datos antes de enviarlos a la base de datos
                //print_r($datos);

                $idRepuesto = ModeloRepuestos::mdlIngresarRepuesto($tabla, $datos);

                if ($idRepuesto != "error") {
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
                    fncSweetAlert("error", "Error en la validación de los campos o categoría no seleccionada", "");
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
                preg_match('/^[a-zA-Z0-9ñÑáéíóúÁÉÍÓÚ \-.,]+$/', $_POST["nuevaDescripcionRepuesto"]) &&
                preg_match('/^[0-9.]+$/', $_POST["nuevoPrecioVentaRepuesto"]) && // Validar precio de venta
                preg_match('/^[0-9]+$/', $_POST["nuevoStockRepuesto"]) && // Validar stock
                (isset($_POST["pesoRepuesto"]) && preg_match('/^[0-9.]+$/', $_POST["pesoRepuesto"])) &&

                !empty($_POST["agregarCategoria"]) // Validar que se seleccione una categoría
            ) {

                $tabla = "repuestos";

                // Verificar si los campos están definidos y no están vacíos
                $marcaVehiculo = isset($_POST["agregarMarcaVehiculo"]) && !empty($_POST["agregarMarcaVehiculo"]) ? $_POST["agregarMarcaVehiculo"] : null;
                $modeloVehiculo = isset($_POST["agregarModeloVehiculo"]) && !empty($_POST["agregarModeloVehiculo"]) ? $_POST["agregarModeloVehiculo"] : null;
                $motorVehiculo = isset($_POST["agregarMotor"]) && !empty($_POST["agregarMotor"]) ? $_POST["agregarMotor"] : null;

                $datos = array(
                    "id_repuesto" => $_POST["idRepuesto"], // El ID del repuesto que se va a editar
                    "codigo_tienda_repuesto" => $_POST["nuevoCodigoRepuesto"],
                    "nombre_repuesto" => $_POST["nuevoNombreRepuesto"],
                    "descripcion_repuesto" => $_POST["nuevaDescripcionRepuesto"],
                    "precio_repuesto" => $_POST["nuevoPrecioVentaRepuesto"],
                    "fabricante_repuesto" => $_POST["nuevaMarcaRepuesto"],
                    "stock_repuesto" => $_POST["nuevoStockRepuesto"],
                    "peso_repuesto" => $_POST["pesoRepuesto"], // Añadir el campo peso al array de datos
                    "id_categoria" => $_POST["agregarCategoria"], // Verificar que la categoría no esté vacía
                    "id_marca" => $marcaVehiculo,   // Añadir el id_marca
                    "id_modelo" => $modeloVehiculo, // Añadir el id_modelo
                    "id_motor" => $motorVehiculo,   // Añadir el id_motor
                    "estado_repuesto" => 1 // Asegurar que el estado sea 1 (activo)
                );

                // Verificar los datos antes de enviarlos a la base de datos
                //print_r($datos);

                // Enviar los datos para la actualización
                $respuesta = ModeloRepuestos::mdlEditarRepuesto($tabla, $datos);

                if ($respuesta == "ok") {
                    // Alerta de éxito
                    echo '<script>
                        fncSweetAlert("success", "El repuesto ha sido actualizado correctamente", "/repuestos");
                      </script>';
                } else {
                    // Alerta de error en el servidor
                    echo '<script>
                        fncSweetAlert("error", "Error al actualizar el repuesto", "");
                      </script>';
                }
            } else {
                //print_r($_POST);
                // Alerta de error en la validación de campos
                echo '<script>
                    fncSweetAlert("error", "Error en la validación de los campos o categoría no seleccionada", "");
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
    public static function ctrEliminarRepuesto()
    {
        if (isset($_POST["idRepuestoEliminar"])) {
            $tabla = "repuestos";
            $datos = $_POST["idRepuestoEliminar"];

            // Eliminar el repuesto directamente
            $respuesta = ModeloRepuestos::mdlEliminarRepuesto($tabla, $datos);

            if ($respuesta == "ok") {
                echo "ok";
            } else {
                echo "error";
            }
        }
    }
}
