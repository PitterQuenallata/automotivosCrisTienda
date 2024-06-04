
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
          <h2 class="h4 fw-extrabold  mb-0">AGREGAR USUARIOS</h2>
        </div>
      </div>
    </div>
    <!-- END Heading -->

    <!-- With Text -->
    <div class="block block-rounded">

      <div class="block-content">
        <div class="row">
          <div class="col-lg-8 col-xl-5 mx-auto">
          
            <form  method="post" enctype="multipart/form-data" class="needs-validation"  novalidate>
              <div class="mb-4">
                <div class="input-group ">
                  <span class="input-group-text btn btn-outline-primary">
                    Nombre
                  </span>
                  <input type="text" class="form-control"  
                  
                  id="nombre_usuario"
                  name="nombre_usuario"
                  onchange="validateJS(event,'text')"
                  required
                  
                  autocomplete="username"
                  >
                  <div class="valid-feedback">Válido.</div>
 									<div class="invalid-feedback">Por favor llena este campo correctamente.</div>
                </div>
              </div>

              <div class="mb-4">
                <div class="input-group ">
                  <span class="input-group-text btn btn-outline-primary">
                    Apellido
                  </span>
                  <input type="text" class="form-control"  
                  
                  id="apellido_usuario"
                  name="apellido_usuario"
                  onchange="validateJS(event,'text')"
                  required
                 
                  autocomplete="userapellido"
                  >
                  <div class="valid-feedback">Válido.</div>
 									<div class="invalid-feedback">Por favor llena este campo correctamente.</div>
                </div>
              </div>

              <div class="mb-4">
                <div class="input-group">
                  <span class="input-group-text btn btn-outline-primary">
                    Usuario
                  </span>
                  <input type="text" class="form-control"  
                        id="nuevoUsuario"
                        name="user_usuario"
                        onchange="validateJS(event,'complete')"
                        required
                        >

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
                  id="email_usuario" 
                  name="email_usuario" 
                  onchange="validateJS(event,'email')"
                  required
                  value="<?php if (!empty($user)): ?><?php echo $user->email_usuario ?><?php endif ?>"
                  autocomplete="email"
                  >

                  <div class="valid-feedback">Válido.</div>
                  <div class="invalid-feedback">Por favor llena este campo correctamente.</div>
                </div>
              </div>

              <div class=" mb-4">
                    <div class="input-group ">
                    <span class="input-group-text btn btn-outline-primary">Contraseña</span>
                        <input type="password" class="form-control" 
                        id="password_usuario"
                        name="password_usuario"
                        onchange="validateJS(event,'password')"
                        required
                        autocomplete="current-password"
                        >

                        <div class="valid-feedback">Válido.</div>
                        <div class="invalid-feedback">Por favor llena este campo correctamente.</div>
                    </div>
                </div>

                <div class="mb-4">
                  <div class="input-group">
                  <span class="input-group-text btn btn-outline-primary">
                    Rol
                    </span>
                    <select class="form-select" name="rol_usuario" id="rol_usuario" required>
                      <option selected="">Elije un rol</option>
                      <option value="administrador">administrador</option>
                      <option value="caja">Caja</option>
                      <option value="venta">Ventas</option>
                      <option value="envio">Envios</option>
                      <option value="publicidad">Publicidad</option>

                    </select>

                    <div class="valid-feedback">Válido.</div>
                    <div class="invalid-feedback">Por favor llena este campo correctamente.</div>
                  </div>
                </div>
                
                <div class="mb-4">
                    <label class="form-label" for="example-file-input">Seleccionar Foto</label>
                    
                        <div class="input-group d-flex align-items-center">
                            <div class="me-3">
                                
                                <input class="form-control nuevaFoto" name="nuevaFoto" type="file" id="example-file-input" style="width: 300px">
                            </div>
                            <div class="ms-4 mt-2">
                                <img class="img-avatar previsualizar" src="<?php echo $path ?>views/assets/media/avatars/avatar8.jpg" alt="fotoUser">
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