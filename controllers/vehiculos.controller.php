<?php

class ControladorVehiculos
{
  /*=============================================
	CREAR VehiculoS
	=============================================*/

  static public function ctrCrearVehiculo()
  {

    if (isset($_POST["nuevaVehiculo"])) {

      if (preg_match('/^[a-zA-Z0-9ñÑáéíóúÁÉÍÓÚ ]+$/', $_POST["nuevaVehiculo"])) {

        $_POST["nuevaVehiculo"]=strtolower($_POST["nuevaVehiculo"]);
        $tabla = "vehiculos";

        $datos = $_POST["nuevaVehiculo"];

        $respuesta = ModeloVehiculos::mdlIngresarVehiculo($tabla, $datos);

        if ($respuesta == "ok") {

          echo '<script>
          fncSweetAlert("success", "El Vehiculo ha sido guardada correctamente", "/vehiculos");
          </script>';
        }
      } else {
        echo '<script>
        fncSweetAlert("error", "¡El Vehiculo no puede ir vacía o llevar caracteres especiales!", "/vehiculos");
        fncFormatInputs();
        </script>';
      }
    }
  }
  /*=============================================
	MOSTRAR VehiculoS
	=============================================*/

  static public function ctrMostrarVehiculos($item, $valor)
  {

    $tabla = "vehiculos";

    $respuesta = ModeloVehiculos::mdlMostrarVehiculos($tabla, $item, $valor);

    return $respuesta;
  }

  /*=============================================
	EDITAR Vehiculo
	=============================================*/

  static public function ctrEditarVehiculo()
  {

    if (isset($_POST["editarVehiculo"])) {

      if (preg_match('/^[a-zA-Z0-9ñÑáéíóúÁÉÍÓÚ ]+$/', $_POST["editarVehiculo"])) {

        $_POST["editarVehiculo"]=strtolower($_POST["editarVehiculo"]);
        
        $tabla = "vehiculos";
       
        $datos = array(
          "nombre_vehiculo" => $_POST["editarVehiculo"],
          "id_vehiculo" => $_POST["idVehiculo"]
        );

        $respuesta = ModeloVehiculos::mdlEditarVehiculo($tabla, $datos);
        echo 'script>console.log("respuesta", ' . json_encode($respuesta) . ')</script>';
        if ($respuesta == "ok") {

          echo '<script>
          fncSweetAlert("success", "El Vehiculo ha sido cambiada correctamente", "/vehiculos");
          </script>';
        } else {
          
          echo '<script>
          
        fncSweetAlert("error", "¡El Vehiculo no puede ir vacía o llevar caracteres especiales!");
        fncFormatInputs();
        </script>';
        }
      }else{
        echo '<script>
        fncSweetAlert("error", "¡El Vehiculo no puede ir vacía o llevar caracteres especiales!");
        fncFormatInputs();
        </script>';
      }
    }
  }
  /*=============================================
	BORRAR Vehiculo
	=============================================*/

  static public function ctrBorrarVehiculo()
  {

    if (isset($_GET["idVehiculo"])) {

      $tabla = "vehiculos";
      $datos = $_GET["idVehiculo"];

      $respuesta = ModeloVehiculos::mdlBorrarVehiculo($tabla, $datos);

      if ($respuesta == "ok") {

        echo '<script>
				fncSweetAlert("success", "El Vehiculo ha sido borrado correctamente", "/vehiculos");
				</script>';

			}else {
				echo '<script>
						fncSweetAlert("error", "Error al borrar El Vehiculo", "/vehiculos");
				</script>';
			}		
    }
  }
}
