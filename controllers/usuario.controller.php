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

				$tabla = "admins";
				$item = "user_admin";
				$valor = $_POST["ingUsuario"];

				$respuesta = ModeloUsuarios::MdlMostrarUsuarios($tabla, $item, $valor);
			
				// echo '<pre>';
				// print_r($respuesta);
				// echo '</pre>';

				if (is_array($respuesta) && isset($respuesta["user_admin"]) && isset($respuesta["password_admin"])) {
					if ($respuesta["user_admin"] == $_POST["ingUsuario"] && $respuesta["password_admin"] == $_POST["ingPassword"]) {
						$_SESSION["users"] = $respuesta;
						echo '<script>
									window.location = "inicio";
							</script>';
					} else {

						echo '<div class="alert alert-danger mt-3">Usuario y contraseña incorrecta</div>
						<script>
								fncToastr("error","error");
								fncMatPreloader("off");
								fncFormatInputs();
						</script>';

					}
				} else {
					echo '<div class="alert alert-danger mt-3">Usuario y contraseña incorrecta"</div>
					<script>
							fncToastr("Usuario y contraseña incorrecta","error");
							fncMatPreloader("off");
							fncFormatInputs();
					</script>';
				}
			}
		}


	}
	//$crypt = crypt($_POST["password_admin"], '$2a$07$azybxcags23425sdg23sdfhsd$');
	/*=============================================
	Crear Usuario
	=============================================*/
	static public function ctrCrearUsuario(){
		if (isset($_POST["user_admin"])){

			if(preg_match('/^[a-zA-Z0-9ñÑáéíóúÁÉÍÓÚ ]+$/', $_POST["user_admin"]) &&
				preg_match('/^[*\\$\\!\\¡\\?\\¿\\.\\_\\#\\-\\0-9A-Za-z]{1,}$/', $_POST["password_admin"]) &&
				preg_match('/^[.a-zA-Z0-9_]+([.][.a-zA-Z0-9_]+)*[@][a-zA-Z0-9_]+([.][a-zA-Z0-9_]+)*[.][a-zA-Z]{2,4}$/', $_POST["email_admin"])
			){

				$tabla = "admins";
				$datos = array("name_admin" => $_POST["name_admin"],
								"user_admin" => $_POST["user_admin"],
								"password_admin" => $_POST["password_admin"],
								"email_admin" => $_POST["email_admin"],
								"rol_admin" => $_POST["rol_admin"]
								);

				$respuesta = ModeloUsuarios::mdlIngresarUsuario($tabla, $datos);

				if($respuesta == "ok"){
					echo '<script>
						//toastr["success"]("Usuario guardado correctamente", "/usuarios");
						fncSweetAlert("success", "Usuario guardado correctamente", "/usuarios");
					</script>';
				}else{
					echo '<script>
						fncSweetAlert("error", "Error al guardar el usuario");
					</script>';
				}

			}else{
				echo '<script>
					fncSweetAlert("error", "El usuario no debe estar vacio o llevar caracteres especiales");
					fncFormatInputs();
				</script>';
			}

		}
	}

}