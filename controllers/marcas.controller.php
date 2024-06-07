<?php

class ControladorMarcas
{
  /*=============================================
	CREAR MarcaS
	=============================================*/

  static public function ctrCrearMarca()
  {

    if (isset($_POST["nuevaMarca"])) {

      if (preg_match('/^[a-zA-Z0-9ñÑáéíóúÁÉÍÓÚ ]+$/', $_POST["nuevaMarca"])) {

        $_POST["nuevaMarca"]=strtolower($_POST["nuevaMarca"]);
        $tabla = "marcas";

        $datos = $_POST["nuevaMarca"];

        $respuesta = ModeloMarcas::mdlIngresarMarca($tabla, $datos);

        if ($respuesta == "ok") {

          echo '<script>
          fncSweetAlert("success", "La marca ha sido guardada correctamente", "/marcas");
          </script>';
        }
      } else {
        echo '<script>
        fncSweetAlert("error", "¡La marca no puede ir vacía o llevar caracteres especiales!", "/marcas");
        fncFormatInputs();
        </script>';
      }
    }
  }
  /*=============================================
	MOSTRAR MarcaS
	=============================================*/

  static public function ctrMostrarMarcas($item, $valor)
  {

    $tabla = "Marcas";

    $respuesta = ModeloMarcas::mdlMostrarMarcas($tabla, $item, $valor);

    return $respuesta;
  }

  /*=============================================
	EDITAR Marca
	=============================================*/

  static public function ctrEditarMarca()
  {

    if (isset($_POST["editarMarca"])) {

      if (preg_match('/^[a-zA-Z0-9ñÑáéíóúÁÉÍÓÚ ]+$/', $_POST["editarMarca"])) {

        $_POST["editarMarca"]=strtolower($_POST["editarMarca"]);
        
        $tabla = "marcas";
       
        $datos = array(
          "nombre_marca" => $_POST["editarMarca"],
          "id_marca" => $_POST["idMarca"]
        );

        $respuesta = ModeloMarcas::mdlEditarMarca($tabla, $datos);
        echo 'script>console.log("respuesta", ' . json_encode($respuesta) . ')</script>';
        if ($respuesta == "ok") {

          echo '<script>
          fncSweetAlert("success", "La marca ha sido cambiada correctamente", "/marcas");
          </script>';
        } else {
          
          echo '<script>
          
        fncSweetAlert("error", "¡La marca no puede ir vacía o llevar caracteres especiales!");
        fncFormatInputs();
        </script>';
        }
      }else{
        echo '<script>
        fncSweetAlert("error", "¡La marca no puede ir vacía o llevar caracteres especiales!");
        fncFormatInputs();
        </script>';
      }
    }
  }
  /*=============================================
	BORRAR Marca
	=============================================*/

  static public function ctrBorrarMarca()
  {

    if (isset($_GET["idMarca"])) {

      $tabla = "marcas";
      $datos = $_GET["idMarca"];

      $respuesta = ModeloMarcas::mdlBorrarMarca($tabla, $datos);

      if ($respuesta == "ok") {

        echo '<script>
				fncSweetAlert("success", "La Marca ha sido borrado correctamente", "/marcas");
				</script>';

			}else {
				echo '<script>
						fncSweetAlert("error", "Error al borrar la Marca", "/marcas");
				</script>';
			}		
    }
  }
}
