<?php

class ControladorCategorias
{
  /*=============================================
	CREAR CATEGORIAS
	=============================================*/

  static public function ctrCrearCategoria()
  {
      if (isset($_POST["nuevaCategoria"])) {
          
          // Convertir a minúsculas antes de validar
          $_POST["nuevaCategoria"] = strtolower($_POST["nuevaCategoria"]);
  
          // Validar que no contiene caracteres especiales no permitidos
          if (preg_match('/^[a-zA-Z0-9ñÑáéíóúÁÉÍÓÚ ]+$/', $_POST["nuevaCategoria"])) {
  
              $tabla = "categorias";
              $datos = $_POST["nuevaCategoria"];
  
              $respuesta = ModeloCategorias::mdlIngresarCategoria($tabla, $datos);
  
              if ($respuesta == "ok") {
                  echo '<script>
                  fncSweetAlert("success", "La categoría ha sido guardada correctamente", "/categorias");
                  </script>';
              }
          } else {
              echo '<script>
              fncSweetAlert("error", "¡La categoría no puede ir vacía o llevar caracteres especiales!");
             
              fncFormatInputs();
              </script>';
              return; // Asegúrate de que el script no sigue ejecutándose
          }
      }
  }
  

  /*=============================================
	MOSTRAR CATEGORIAS
	=============================================*/

  static public function ctrMostrarCategorias($item, $valor)
  {

    $tabla = "categorias";

    $respuesta = ModeloCategorias::mdlMostrarCategorias($tabla, $item, $valor);

    return $respuesta;
  }

  /*=============================================
	EDITAR CATEGORIA
	=============================================*/

  static public function ctrEditarCategoria()
  {

    if (isset($_POST["editarCategoria"])) {

      if (preg_match('/^[a-zA-Z0-9ñÑáéíóúÁÉÍÓÚ ]+$/', $_POST["editarCategoria"])) {
        $_POST["editarCategoria"] = strtolower($_POST["editarCategoria"]);
        $tabla = "categorias";

        $datos = array(
          "nombre_categoria" => $_POST["editarCategoria"],
          "id_categoria" => $_POST["idCategoria"]
        );

        $respuesta = ModeloCategorias::mdlEditarCategoria($tabla, $datos);
        echo 'script>console.log("respuesta", ' . json_encode($respuesta) . ')</script>';
        if ($respuesta == "ok") {

          echo '<script>
          fncSweetAlert("success", "La categoría ha sido cambiada correctamente", "/categorias");
          </script>';
        } else {

          echo '<script>
          
        fncSweetAlert("error", "¡La categoría no puede ir vacía o llevar caracteres especiales!");
        fncFormatInputs();
        </script>';
        }
      } else {
        echo '<script>
        fncSweetAlert("error", "¡La categoría no puede ir vacía o llevar caracteres especiales!");
        fncFormatInputs();
        </script>';
      }
    }
  }
  /*=============================================
	BORRAR CATEGORIA
	=============================================*/

  static public function ctrBorrarCategoria()
  {
    print_r($_GET);
    if (isset($_GET["idCategoria"])) {

      $tabla = "categorias";
      $datos = $_GET["idCategoria"];
      //print_r($datos);
      $respuesta = ModeloCategorias::mdlBorrarCategoria($tabla, $datos);
      //print_r($respuesta);
      if ($respuesta == "ok") {

        echo '<script>
				fncSweetAlert("success", "La categoria ha sido borrado correctamente", "/categorias");
				</script>';
      } else {
        echo '<script>
						fncSweetAlert("error", "Error al borrar la categoria", "");
				</script>';
      }
    }
  }
}
