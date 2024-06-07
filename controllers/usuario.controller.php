<?php


class ControladorUsuarios
{


    /*=============================================
	INGRESO DE USUARIO
	=============================================*/

    static public function ctrIngresoUsuario()
    {
        if (isset($_POST["ingUsuario"])) {
            echo '<script>
            fncMatPreloader("on");
            fncSweetAlert("loading", "", "");
        </script>';

            if (
                preg_match('/^[a-zA-Z0-9]+$/', $_POST["ingUsuario"]) &&
                preg_match('/^[a-zA-Z0-9]+$/', $_POST["ingPassword"])
            ) {
                $crypt = crypt($_POST["ingPassword"], '$2a$07$azybxcags23425sdg23sdfhsd$');

                $tabla = "usuarios";
                $item = "user_usuario";
                $valor = $_POST["ingUsuario"];

                $respuesta = ModeloUsuarios::MdlMostrarUsuarios($tabla, $item, $valor);


                if (is_array($respuesta) && isset($respuesta["user_usuario"]) && isset($respuesta["password_usuario"])) {
                    if ($respuesta["user_usuario"] == $_POST["ingUsuario"] && $respuesta["password_usuario"] == $crypt) {
                        if ($respuesta["estado_usuario"] == 1) { // Verificar si el usuario está activo

                            date_default_timezone_set('America/La_Paz');


                            $fecha = date('Y-m-d');
                            $hora = date('H:i:s');

                            $fechaActual = $fecha . ' ' . $hora;

                            $item1 = "date_updated_usuario";
                            $valor1 = $fechaActual;

                            $item2 = "id_usuario";
                            $valor2 = $respuesta["id_usuario"];

                            $ultimoLogin = ModeloUsuarios::mdlActualizarUsuario($tabla, $item1, $valor1, $item2, $valor2);

                            if ($ultimoLogin == "ok") {
                                $_SESSION["users"] = $respuesta;
                                echo '<script>
															window.location = "inicio";
											</script>';
                            }
                        } else {
                            echo '<div class="alert alert-danger mt-3">El usuario está inactivo</div>
                        <script>
                            fncToastr("error", "El usuario está inactivo");
                            fncMatPreloader("off");
                            fncFormatInputs();
                        </script>';
                        }
                    } else {
                        echo '<div class="alert alert-danger mt-3">Usuario y contraseña incorrectos</div>
                    <script>
                        fncToastr("error", "Usuario y contraseña incorrectos");
                        fncMatPreloader("off");
                        fncFormatInputs();
                    </script>';
                    }
                } else {
                    echo '<div class="alert alert-danger mt-3">Usuario y contraseña incorrectos</div>
                <script>
                    fncToastr("error", "Usuario y contraseña incorrectos");
                    fncMatPreloader("off");
                    fncFormatInputs();
                </script>';
                }
            }
        }
    }


    /*=============================================
Crear Usuario
=============================================*/
    static public function ctrCrearUsuario()
    {
        if (isset($_POST["user_usuario"])) {

            if (
                preg_match('/^[a-zA-Z0-9ñÑáéíóúÁÉÍÓÚ ]+$/', $_POST["user_usuario"]) &&
                preg_match('/^[*\\$\\!\\¡\\?\\¿\\.\\_\\#\\-\\0-9A-Za-z]{1,}$/', $_POST["password_usuario"]) &&
                preg_match('/^[.a-zA-Z0-9_]+([.][.a-zA-Z0-9_]+)*[@][a-zA-Z0-9_]+([.][.a-zA-Z0-9_]+)*[.][a-zA-Z]{2,4}$/', $_POST["email_usuario"])
            ) {

                /*=============================================
            VALIDAR IMAGEN
            =============================================*/

                // Asignar una imagen predeterminada si no se selecciona ninguna
                $defaultImagePath = 'views/assets/media/avatars/avatar0.jpg';
                $ruta = $defaultImagePath;

                // CREAMOS EL DIRECTORIO DONDE VAMOS A GUARDAR LA FOTO DEL USUARIO
                $directorio = "views/assets/media/avatars/usuarios/" . $_POST["user_usuario"];
                if (!file_exists($directorio)) {
                    mkdir($directorio, 0755);
                }

                if (isset($_FILES["nuevaFoto"]["tmp_name"]) && !empty($_FILES["nuevaFoto"]["tmp_name"])) {

                    list($ancho, $alto) = getimagesize($_FILES["nuevaFoto"]["tmp_name"]);

                    $nuevoAncho = 500;
                    $nuevoAlto = 500;

                    /*=============================================
                DE ACUERDO AL TIPO DE IMAGEN APLICAMOS LAS FUNCIONES POR DEFECTO DE PHP
                =============================================*/

                    if ($_FILES["nuevaFoto"]["type"] == "image/jpeg") {

                        /*=============================================
                    GUARDAMOS LA IMAGEN EN EL DIRECTORIO
                    =============================================*/

                        $aleatorio = mt_rand(100, 999);

                        $ruta = "views/assets/media/avatars/usuarios/" . $_POST["user_usuario"] . "/" . $aleatorio . ".jpg";

                        $origen = imagecreatefromjpeg($_FILES["nuevaFoto"]["tmp_name"]);

                        $destino = imagecreatetruecolor($nuevoAncho, $nuevoAlto);

                        imagecopyresized($destino, $origen, 0, 0, 0, 0, $nuevoAncho, $nuevoAlto, $ancho, $alto);

                        imagejpeg($destino, $ruta);
                    } elseif ($_FILES["nuevaFoto"]["type"] == "image/png") {

                        /*=============================================
                    GUARDAMOS LA IMAGEN EN EL DIRECTORIO
                    =============================================*/

                        $aleatorio = mt_rand(100, 999);

                        $ruta = "views/assets/media/avatars/usuarios/" . $_POST["user_usuario"] . "/" . $aleatorio . ".png";

                        $origen = imagecreatefrompng($_FILES["nuevaFoto"]["tmp_name"]);

                        $destino = imagecreatetruecolor($nuevoAncho, $nuevoAlto);

                        imagecopyresized($destino, $origen, 0, 0, 0, 0, $nuevoAncho, $nuevoAlto, $ancho, $alto);

                        imagepng($destino, $ruta);
                    }
                } else {
                    // Copiar la imagen predeterminada al directorio del usuario
                    $aleatorio = mt_rand(100, 999);
                    $ruta = $directorio . "/" . $aleatorio . ".jpg";
                    copy($defaultImagePath, $ruta);
                }

                $_POST["nombre_usuario"] = strtolower($_POST["nombre_usuario"]);
                $_POST["apellido_usuario"] = strtolower($_POST["apellido_usuario"]);

                $crypt = crypt($_POST["password_usuario"], '$2a$07$azybxcags23425sdg23sdfhsd$');

                $tabla = "usuarios";
                $datos = array(
                    "nombre_usuario" => $_POST["nombre_usuario"],
                    "apellido_usuario" => $_POST["apellido_usuario"],
                    "user_usuario" => $_POST["user_usuario"],
                    "password_usuario" => $crypt,
                    "email_usuario" => $_POST["email_usuario"],
                    "rol_usuario" => $_POST["rol_usuario"],
                    "foto_usuario" => $ruta
                );

                $respuesta = ModeloUsuarios::mdlIngresarUsuario($tabla, $datos);

                if ($respuesta == "ok") {
                    echo '<script>
                    fncSweetAlert("success", "Usuario guardado correctamente", "/usuarios");
                </script>';
                } else {
                    echo '<script>
                    fncSweetAlert("error", "Error al guardar el usuario");
                </script>';
                }
            } else {
                echo '<script>
                fncSweetAlert("error", "El usuario no debe estar vacio o llevar caracteres especiales");
                fncFormatInputs();
            </script>';
            }
        } 
    }



    /*=============================================
	MOSTRAR USUARIO
	=============================================*/

    static public function ctrMostrarUsuarios($item, $valor)
    {

        $tabla = "usuarios";

        $respuesta = ModeloUsuarios::MdlMostrarUsuarios($tabla, $item, $valor);

        return $respuesta;
    }


    /*=============================================
	EDITAR USUARIO
	=============================================*/

    static public function ctrEditarUsuario()
    {

        if (isset($_POST["editarUsuario"])) {

            if (
                preg_match('/^[a-zA-Z0-9ñÑáéíóúÁÉÍÓÚ ]+$/', $_POST["editarNombre"]) &&
                preg_match('/^[a-zA-Z0-9ñÑáéíóúÁÉÍÓÚ ]+$/', $_POST["editarApellido"]) &&
                filter_var($_POST["editarEmail"], FILTER_VALIDATE_EMAIL)
            ) {



                /*=============================================
            VALIDAR IMAGEN
            =============================================*/

                $ruta = $_POST["fotoActual"];

                if (isset($_FILES["editarFoto"]["tmp_name"]) && !empty($_FILES["editarFoto"]["tmp_name"])) {

                    list($ancho, $alto) = getimagesize($_FILES["editarFoto"]["tmp_name"]);

                    $nuevoAncho = 500;
                    $nuevoAlto = 500;

                    /*=============================================
                CREAMOS EL DIRECTORIO DONDE VAMOS A GUARDAR LA FOTO DEL USUARIO
                =============================================*/

                    $directorio = "views/assets/media/avatars/usuarios/" . $_POST["editarUsuario"];

                    /*=============================================
                PRIMERO PREGUNTAMOS SI EXISTE OTRA IMAGEN EN LA BD
                =============================================*/

                    if (!empty($_POST["fotoActual"])) {
                        unlink($_POST["fotoActual"]);
                    } else {
                        if (!file_exists($directorio)) {
                            mkdir($directorio, 0755);
                        }
                    }

                    /*=============================================
                DE ACUERDO AL TIPO DE IMAGEN APLICAMOS LAS FUNCIONES POR DEFECTO DE PHP
                =============================================*/

                    if ($_FILES["editarFoto"]["type"] == "image/jpeg") {

                        /*=============================================
                    GUARDAMOS LA IMAGEN EN EL DIRECTORIO
                    =============================================*/

                        $aleatorio = mt_rand(100, 999);

                        $ruta = "views/assets/media/avatars/usuarios/" . $_POST["editarUsuario"] . "/" . $aleatorio . ".jpg";

                        $origen = imagecreatefromjpeg($_FILES["editarFoto"]["tmp_name"]);

                        $destino = imagecreatetruecolor($nuevoAncho, $nuevoAlto);

                        imagecopyresized($destino, $origen, 0, 0, 0, 0, $nuevoAncho, $nuevoAlto, $ancho, $alto);

                        imagejpeg($destino, $ruta);
                    } else if ($_FILES["editarFoto"]["type"] == "image/png") {

                        /*=============================================
                    GUARDAMOS LA IMAGEN EN EL DIRECTORIO
                    =============================================*/

                        $aleatorio = mt_rand(100, 999);

                        $ruta = "views/assets/media/avatars/usuarios/" . $_POST["editarUsuario"] . "/" . $aleatorio . ".png";

                        $origen = imagecreatefrompng($_FILES["editarFoto"]["tmp_name"]);

                        $destino = imagecreatetruecolor($nuevoAncho, $nuevoAlto);

                        imagecopyresized($destino, $origen, 0, 0, 0, 0, $nuevoAncho, $nuevoAlto, $ancho, $alto);

                        imagepng($destino, $ruta);
                    }
                }

                $tabla = "usuarios";

                if ($_POST["editarPassword"] != "") {

                    if (preg_match('/^[a-zA-Z0-9]+$/', $_POST["editarPassword"])) {

                        $encriptar = crypt($_POST["editarPassword"], '$2a$07$azybxcags23425sdg23sdfhsd$');
                    } else {

                        echo '<script>
                    fncSweetAlert("error", "¡La contraseña no puede ir vacía o llevar caracteres especiales!");
                    fncFormatInputs();
                    </script>';
                        return;
                    }
                } else {

                    $encriptar = $_POST["passwordActual"];
                }
                $_POST["editarNombre"] = strtolower($_POST["editarNombre"]);
                $_POST["editarApellido"] = strtolower($_POST["editarApellido"]);

                $datos = array(
                    "nombre_usuario" => $_POST["editarNombre"],
                    "apellido_usuario" => $_POST["editarApellido"],
                    "email_usuario" => $_POST["editarEmail"],
                    "user_usuario" => $_POST["editarUsuario"],
                    "password_usuario" => $encriptar,
                    "rol_usuario" => $_POST["editarPerfil"],
                    "foto_usuario" => $ruta
                );

                $respuesta = ModeloUsuarios::mdlEditarUsuario($tabla, $datos);

                if ($respuesta == "ok") {

                    echo '<script>
                fncSweetAlert("success", "El usuario ha sido editado correctamente", "/usuarios");
                </script>';
                } else {

                    echo '<script>
                fncSweetAlert("error", "¡Error al editar el usuario!");
                fncFormatInputs();
                </script>';
                }
            } else {

                echo '<script>
            fncSweetAlert("error", "¡El nombre no puede ir vacío o llevar caracteres especiales!");
            fncFormatInputs();
            </script>';
            }
        }
    }

    /*=============================================
	BORRAR USUARIO
	=============================================*/

    static public function ctrBorrarUsuario()
    {

        if (isset($_GET["idUsuario"])) {

            $tabla = "usuarios";
            $datos = $_GET["idUsuario"];

            // Decodificar la URL para obtener la ruta correcta de la foto
            $fotoUsuario = urldecode($_GET["fotoUsuario"]);
            $usuario = $_GET["usuario"];

            if (!empty($fotoUsuario)) {
                unlink($fotoUsuario);
                rmdir('views/assets/media/avatars/usuarios/' . $usuario);
            }

            // if($_GET["fotoUsuario"] != ""){

            // 	unlink($_GET["fotoUsuario"]);
            // 	rmdir('views/assets/media/avatars/usuarios/'.$_GET["usuario"]);

            // }

            $respuesta = ModeloUsuarios::mdlBorrarUsuario($tabla, $datos);

            if ($respuesta == "ok") {

                echo '<script>
				fncSweetAlert("success", "El usuario ha sido borrado correctamente", "usuarios");
				</script>';
            } else {
                echo '<script>
						fncSweetAlert("error", "Error al borrar el usuario", "");
				</script>';
            }
        }
    }
}
