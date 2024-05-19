 
 <?php 

if(isset($_GET["user"])){

	$select = "id_admin,name_admin,email_admin,password_admin,rol_admin,state_admin";
	$url = "admins?linkTo=id_admin&equalTo=".base64_decode($_GET["user"])."&select=".$select;
	$method = "GET";
	$fields = array();

	//$user = CurlController::request($url, $method, $fields);
  // echo "<pre>";
  // print_r($_POST);
  // echo "</pre>";
	if($user->status == 200){

		$user = $user->results[0];

	}else{

		$user = null;

	}

}else{

	$user = null;
}


// $url ="admins?select=name_admin&equalTo=".urlencode($_POST["name_admin"])."&linkTo=name_admin";
// $method = "GET";
// $fields = array();

// $dataname = CurlController::request($url, $method, $fields);


 ?>


<!-- Main Container -->
<main id="main-container">
  <!-- Page Content -->
  <div class="content">
    <!-- Heading -->
    <div class="block block-rounded">
      <div class="block-content block-content-full">
        <div class=" text-center">
          <!-- <h1 class="h3 fw-extrabold mb-1">
            Usuarios
          </h1> -->
          <h2 class="h4 fw-extrabold  mb-0">
            <?php echo $user != null ? "EDITAR USUARIO" : "AGREGAR USUARIOS " ?>
            
          </h2>
        </div>
      </div>
    </div>
    <!-- END Heading -->

    <!-- With Text -->
    <div class="block block-rounded">

      <div class="block-content">
        <div class="row">
          <div class="col-lg-8 col-xl-5 mx-auto  ">
          <?php 

            // require_once "controllers/users.controller.php";
            // $manage = new UsersControllers();
            // $manage -> userManage();
            
            ?>
            <form  method="post"  class="needs-validation"  novalidate>
            <?php if (!empty($user)): ?>
            
            
            <input type="hidden" name="idUser" value="<?php echo base64_encode($user->id_admin) ?>">
            <input type="hidden" name="oldPassword" value="<?php echo $user->password_admin ?>">

            <?php endif ?>
              <div class="mb-4">
                <div class="input-group ">
                  <span class="input-group-text btn btn-outline-primary">
                    Nombre
                  </span>
                  <input type="text" class="form-control"  
                  
                  id="name_admin"
                  name="name_admin"
                  onchange="validateJS(event,'text')"
                  required
                  value="<?php if (!empty($user)): ?><?php echo $user->name_admin ?><?php endif ?>"
                  autocomplete="username"
                  >
                  <div class="valid-feedback">Válido.</div>
 									<div class="invalid-feedback">Por favor llena este campo correctamente.</div>
                </div>
              </div>

              <div class="mb-4">
                <div class="input-group ">

                  <input type="text" class="form-control"  
                  
                  id="user_admin"
                  name="user_admin"
                  onchange="validateJS(event,'text')"
                  required
                  value="<?php if (!empty($user)): ?><?php echo $user->user_admin ?><?php endif ?>"
                  autocomplete="useruser"
                  >
                  <span class="input-group-text btn btn-outline-primary">
                    Usuario
                  </span>
                  <div class="valid-feedback">Válido.</div>
 									<div class="invalid-feedback">Por favor llena este campo correctamente.</div>
                </div>
              </div>


              <div class="mb-4">
                <div class="input-group">
                <span class="input-group-text btn btn-outline-primary"">
                    Email
                  </span>
                  <input type="email" class="form-control" 
                  id="email_admin" 
                  name="email_admin" 
                  onchange="validateJS(event,'email')"
                  required
                  value="<?php if (!empty($user)): ?><?php echo $user->email_admin ?><?php endif ?>"
                  autocomplete="email"
                  >

                  <div class="valid-feedback">Válido.</div>
                  <div class="invalid-feedback">Por favor llena este campo correctamente.</div>
                </div>
              </div>

              <div class=" mb-4">
                    <div class="input-group ">
                      
                        <input type="password" class="form-control" 
                        id="password_admin"
                        name="password_admin"
                        onchange="validateJS(event,'password')"
                        <?php if (empty($user)): ?> required <?php endif ?>
                        autocomplete="current-password"
                        >

                        <span class="input-group-text btn btn-outline-primary">Contraseña</span>
                        <div class="valid-feedback">Válido.</div>
                        <div class="invalid-feedback">Por favor llena este campo correctamente.</div>
                    </div>
                </div>

                <div class="mb-4">
                  <div class="input-group">
                  <span class="input-group-text btn btn-outline-primary">
                    Rol
                    </span>
                    <select class="form-select" name="rol_admin" id="rol_admin" required>
                      <option selected="">Elije un rol</option>
                      <option value="administrador"<?php if (!empty($user) && $user->rol_admin == "administrador"): ?> selected <?php endif ?>>Administrador</option>
                      <option value="caja"<?php if (!empty($user) && $user->rol_admin == "caja"): ?> selected <?php endif ?>>Caja</option>
                      <option value="ventas"<?php if (!empty($user) && $user->rol_admin == "ventas"): ?> selected <?php endif ?>>Ventas</option>
                      <option value="envio"<?php if (!empty($user) && $user->rol_admin == "envio"): ?> selected <?php endif ?>>Envios</option>

                    </select>

                    <div class="valid-feedback">Válido.</div>
                    <div class="invalid-feedback">Por favor llena este campo correctamente.</div>
                  </div>
                </div>

                <div class="mb-4">
                    <label class="form-label" for="example-file-input">Seleccionar Foto</label>
                    
                        <div class="input-group d-flex align-items-center">
                            <div class="me-3">
                                <input class="form-control" type="file" id="example-file-input" style="width: 300px">
                            </div>
                            <div class="ms-4 mt-2">
                                <img class="img-avatar" src="<?php echo $path ?>views/assets/media/avatars/avatar8.jpg" alt="">
                            </div>
                            <div class="valid-feedback">Válido.</div>
                            <div class="invalid-feedback">Por favor llena este campo correctamente.</div>
                        </div>
                    
                </div>
                  
                  
                </div>


                </div>
                <div class="d-flex justify-content-end mb-4">
                    <a href="/usuarios" class="btn btn-alt-danger me-2" onchange="fncFormatInputs()">
                      <i class=""></i> Cancelar
                    </a>
                    <button type="submit" class="btn btn-alt-primary">Guardar</button>

                </div>
                <?php
                $crearUsuario = new ControladorUsuarios();
                $crearUsuario -> ctrCrearUsuario();
                ?>
            </form>
          </div>
        </div>

      </div>
    </div>
    <!-- END With Text -->


  </div>
  <!-- END Page Content -->
</main>
<!-- END Main Container -->