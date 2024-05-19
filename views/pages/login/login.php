
    <div id="page-container" class="main-content-boxed">

      <!-- Main Container -->
      <main id="main-container">
        <!-- Page Content -->
        <div class="bg-gd-dusk">
          <div class="hero-static content content-full bg-body-extra-light">
            <!-- Header -->
            <div class="py-4 px-1 text-center mb-4">
              <a class="link-fx fw-bold" href="#">
                <i class="fa fa-fire"></i>
                <span class="fs-4 text-body-color">Automotivos</span><span class="fs-4">Cris</span>
              </a>
              <h1 class="h3 fw-bold mt-5 mb-2">Bienvenido</h1>
              <h2 class="h5 fw-medium text-muted mb-0">Ingrese sus datos de Usuario</h2>
            </div>
            <!-- END Header -->

            <!-- Sign In Form -->
            <div class="row justify-content-center px-1">
              <div class="col-sm-8 col-md-6 col-xl-4">

                <form class="js-validation-signin needs-validation"  method="POST">
                <div class="form-floating mb-4">
                    <input class="form-control" 
                    onchange="validateJS(event, 'user')"
                    type="text" 
                    id="ingUsuario" 
                    name="ingUsuario" 
                    required placeholder="Usuario@gmail.com" 
                    autocomplete="userAdmin">
                    <label class="form-label" for="loginUserEmail">Usuario</label>
                    <div class="valid-feedback">Válido.</div>
                    <div class="invalid-feedback">Campo inválido.</div>
                </div>
                  <div class="form-floating mb-4">
                    <input type="password" class="form-control" 
                  type="password" 
                  id="ingPassword" 
                  name="ingPassword" 
                  required autocomplete="current-password" 
                  placeholder="*****">
                    <label class="form-label" for="login-password">Contraseña</label>
                  </div>

                  <div class="form-check pb-3">
                      <input type="checkbox" class="form-check-input" 
                      id="remember" 
                      onchange="rememberEmail(event)">
                      <label class="form-check-label" for="remember">Recordar Usuario</label>
                  </div>
                  <div class="row g-sm mb-4">
                    <div class="col-12 mb-2">
                      <button type="submit" class="btn btn-lg btn-alt-primary w-100 py-3 fw-semibold">
                        Ingresar
                      </button>
                    </div>

                  </div>
                  <?php
                require_once "controllers/usuario.controller.php";
                $loginAdmins = new ControladorUsuarios();
                $loginAdmins->ctrIngresoUsuario();
                ?>
                </form>
              </div>
            </div>
            <!-- END Sign In Form -->
          </div>
        </div>
        <!-- END Page Content -->
      </main>
      <!-- END Main Container -->
    </div>


    <script src="<?php echo $path ?>views/assets/js/forms/forms.js"></script>