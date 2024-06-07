<!-- Main Container -->
<main id="main-container">
  <!-- Page Content -->
  <div class="content">
    <div class="block block-rounded">
      <div class="block-content block-content-full">
        <div class="text-center">
          <h2 class="h4 fw-extrabold mb-0">
            USUARIOS
          </h2>
        </div>
      </div>
    </div>

    <div class="block block-rounded">
      <div class="block-header block-header-default">
      <button type="button" class="btn btn-success me-1 mb-1" data-bs-toggle="modal" data-bs-target="#modal-agregar-usuario">
        <i class="fa fa-plus opacity-50 me-1"></i> Añadir Usuario
      </button>

        
      </div>
      <div class="block-content">
        <table id="tablass" class="table table-vcenter">
          <thead>
            <tr>
              <th class="text-center" style="width: 50px;"></th>
              <th class="text-center" style="width: 50px;"></th>
              <th>Nombre</th>
              <th>Usuario</th>
              <th>Correo</th>
              <th>Rol</th>
              <th class="d-none d-sm-table-cell" style="width: 15%;">Estado</th>
              <th>Ultimo Ingreso</th>
              <th class="text-center" style="width: 100px;">Actions</th>
            </tr>
          </thead>
          <tbody>
            <?php
            $item = null;
            $valor = null;
            $usuarios = ControladorUsuarios::ctrMostrarUsuarios($item, $valor);

            foreach ($usuarios as $key => $value) {
              echo '
              <tr>
                  <th class="text-center" scope="row">' . ($key + 1) . '</th>
                  <td class="text-center" scope="row">
                      <img class="img-avatar img-avatar48" src="' . $path . $value["foto_usuario"] . '" alt="">
                  </td>
                  <td>' . $value["nombre_usuario"] . " " . $value["apellido_usuario"] . '</td>
                  <td>' . $value["user_usuario"] . '</td>
                  <td>' . $value["email_usuario"] . '</td>
                  <td>' . $value["rol_usuario"] . '</td>';
          
              if ($value["estado_usuario"] != 0) {
                  echo '
                  <td class="d-none d-sm-table-cell">
                      <button type="button" class="btnActivar badge btn btn-success" idUsuario="' . $value["id_usuario"] . '" estadoUsuario="0">Activado</button>
                  </td>';
              } else {
                  echo '
                  <td class="d-none d-sm-table-cell">
                      <button type="button" class="btnActivar badge btn btn-danger" idUsuario="' . $value["id_usuario"] . '" estadoUsuario="1">Desactivado</button>
                  </td>';
              }
          
              echo '
                  <td>' . $value["date_updated_usuario"] . '</td>
                  <td class="text-center">
                      <div class="btn-group">
                          <button type="button" class="btn btn-sm btn-secondary js-bs-tooltip-enabled btnEditarUsuario" idUsuario="' . $value["id_usuario"] . '" data-bs-target="#modal-large" data-bs-toggle="modal" aria-label="Edit" data-bs-original-title="Edit">
                              <i class="fa fa-pencil-alt"></i>
                          </button>
                          <button type="button" class="btn btn-sm btn-secondary js-bs-tooltip-enabled btnElininarUsuario" idUsuario="' . $value["id_usuario"] . '" fotoUsuario="' . $value["foto_usuario"] . '" usuario="'.$value["user_usuario"].'" data-bs-toggle="tooltip" aria-label="Delete" data-bs-original-title="Delete">
                              <i class="fa fa-times"></i>
                          </button>
                      </div>
                  </td>
              </tr>';
          }
          
            ?>
          </tbody>
        </table>
      </div>
    </div>


    <!-- Modal Agregar Usuario -->
    <div class="modal" id="modal-agregar-usuario" tabindex="-1" role="dialog" aria-labelledby="modal-agregar-usuario" aria-hidden="true">
      <div class="modal-dialog modal-lg" role="document">
        <div class="modal-content">
          <div class="block block-rounded shadow-none mb-0">
            <div class="block-header block-header-default">
              <h3 class="block-title">Agregar Usuario</h3>
              <div class="block-options">
                <button type="button" class="btn-block-option" data-bs-dismiss="modal" aria-label="Close">
                  <i class="fa fa-times"></i>
                </button>
              </div>
            </div>
            <div class="block-content fs-sm">
              <form method="post" enctype="multipart/form-data" class="needs-validation">
                <div class="mb-4">
                  <div class="input-group">
                    <span class="input-group-text btn btn-outline-primary">Nombre</span>
                    <input type="text" class="form-control" id="nombre_usuario" name="nombre_usuario" onchange="validateJS(event,'text')" required autocomplete="username">
                    <div class="valid-feedback">Válido.</div>
                    <div class="invalid-feedback">Por favor llena este campo correctamente.</div>
                  </div>
                </div>

                <div class="mb-4">
                  <div class="input-group">
                    <span class="input-group-text btn btn-outline-primary">Apellido</span>
                    <input type="text" class="form-control" id="apellido_usuario" name="apellido_usuario" onchange="validateJS(event,'text')" required autocomplete="userapellido">
                    <div class="valid-feedback">Válido.</div>
                    <div class="invalid-feedback">Por favor llena este campo correctamente.</div>
                  </div>
                </div>

                <div class="mb-4">
                  <div class="input-group">
                    <span class="input-group-text btn btn-outline-primary">Usuario</span>
                    <input type="text" class="form-control" id="nuevoUsuario" name="user_usuario" onchange="validateJS(event,'complete')" required>
                    <div class="valid-feedback">Válido.</div>
                    <div class="invalid-feedback">Por favor llena este campo correctamente.</div>
                  </div>
                </div>

                <div class="mb-4">
                  <div class="input-group">
                    <span class="input-group-text btn btn-outline-primary">Email</span>
                    <input type="email" class="form-control" id="email_usuario" name="email_usuario" onchange="validateJS(event,'email')" required autocomplete="email">
                    <div class="valid-feedback">Válido.</div>
                    <div class="invalid-feedback">Por favor llena este campo correctamente.</div>
                  </div>
                </div>

                <div class="mb-4">
                  <div class="input-group">
                    <span class="input-group-text btn btn-outline-primary">Contraseña</span>
                    <input type="password" class="form-control" id="password_usuario" name="password_usuario" onchange="validateJS(event,'password')" required autocomplete="current-password">
                    <div class="valid-feedback">Válido.</div>
                    <div class="invalid-feedback">Por favor llena este campo correctamente.</div>
                  </div>
                </div>

                <div class="mb-4">
                  <div class="input-group">
                    <span class="input-group-text btn btn-outline-primary">Rol</span>
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
                      <input class="form-control" type="hidden" name="defaultFoto" value="views/assets/media/avatars/avatar0.jpg">
                    </div>
                    <div class="ms-4 mt-2">
                      <img class="img-avatar previsualizar" src="<?php echo $path ?>views/assets/media/avatars/avatar0.jpg" alt="fotoUser">
                    </div>
                    <div class="valid-feedback">Válido.</div>
                    <div class="invalid-feedback">Por favor llena este campo correctamente.</div>
                  </div>
                </div>

                <div class="d-flex justify-content-end mb-4">
                  <button type="button" class="btn btn-alt-danger me-2" data-bs-dismiss="modal">
                    Cancelar
                  </button>
                  <button type="submit" class="btn btn-alt-primary">Guardar</button>
                </div>
                <?php
                $crearUsuario = new ControladorUsuarios();
                $crearUsuario->ctrCrearUsuario();
                ?>
              </form>
            </div>
          </div>
        </div>
      </div>
    </div>
      


    <!-- Large Modal Editar-->
    <div class="modal" id="modal-large" tabindex="-1" role="dialog" aria-labelledby="modal-large" aria-hidden="true">
      <div class="modal-dialog modal-lg" role="document">
        <div class="modal-content">
          <div class="block block-rounded shadow-none mb-0">
            <div class="block-header block-header-default">
              <h3 class="block-title">Editar Usuario</h3>
              <div class="block-options">
                <button type="button" class="btn-block-option" data-bs-dismiss="modal" aria-label="Close">
                  <i class="fa fa-times"></i>
                </button>
              </div>
            </div>
            <div class="block-content fs-sm">
              <form method="post" enctype="multipart/form-data" class="needs-validation" novalidate>

                <input type="hidden" id="passwordActual" name="passwordActual" value="">
                <input type="hidden" id="fotoActual" name="fotoActual" value="">

                <div class="mb-4">
                  <div class="input-group">
                    <span class="input-group-text btn btn-outline-primary">Nombre</span>
                    <input type="text" class="form-control" id="editarNombre" name="editarNombre" required>
                    <div class="valid-feedback">Válido.</div>
                    <div class="invalid-feedback">Por favor llena este campo correctamente.</div>
                  </div>
                </div>

                <div class="mb-4">
                  <div class="input-group">
                    <span class="input-group-text btn btn-outline-primary">Apellido</span>
                    <input type="text" class="form-control" id="editarApellido" name="editarApellido" required>
                    <div class="valid-feedback">Válido.</div>
                    <div class="invalid-feedback">Por favor llena este campo correctamente.</div>
                  </div>
                </div>

                <div class="mb-4">
                  <div class="input-group">
                    <span class="input-group-text btn btn-outline-primary">Usuario</span>
                    <input type="text" class="form-control" id="editarUsuario" name="editarUsuario" required readonly>
                    <div class="valid-feedback">Válido.</div>
                    <div class="invalid-feedback">Por favor llena este campo correctamente.</div>
                  </div>
                </div>

                <div class="mb-4">
                  <div class="input-group">
                    <span class="input-group-text btn btn-outline-primary">Email</span>
                    <input type="email" class="form-control" id="editarEmail" name="editarEmail" required>
                    <div class="valid-feedback">Válido.</div>
                    <div class="invalid-feedback">Por favor llena este campo correctamente.</div>
                  </div>
                </div>

                <div class="mb-4">
                  <div class="input-group">
                    <span class="input-group-text btn btn-outline-primary">Contraseña</span>
                    <input type="password" class="form-control" name="editarPassword" placeholder="Ingresar nueva contraseña">

                    <div class="valid-feedback">Válido.</div>
                    <div class="invalid-feedback">Por favor llena este campo correctamente.</div>
                  </div>
                </div>

                <div class="mb-4">
                  <div class="input-group">
                    <span class="input-group-text btn btn-outline-primary">Rol</span>
                    <select class="form-select" id="editarPerfil" name="editarPerfil" >
                      <option selected="" id="editarPerfilV">Elije un rol</option>
                      <option value="administrador">Administrador</option>
                      <option value="caja">Caja</option>
                      <option value="venta">Venta</option>
                      <option value="envio">Envio</option>
                      <option value="publicidad">Publicidad</option>
                    </select>
                    
                  </div>
                </div>


                <div class="mb-4">
                  <label class="form-label" for="example-file-input">Seleccionar Foto</label>
                  <div class="input-group d-flex align-items-center">
                    <div class="me-3">
                      <input class="form-control nuevaFoto" name="editarFoto" type="file" id="example-file-input" style="width: 300px">
                    </div>
                    <div class="ms-4 mt-2">
                      <img class="img-avatar previsualizar" src="path_a_foto" alt="fotoUser">

                    </div>
                    <div class="valid-feedback">Válido.</div>
                    <div class="invalid-feedback">Por favor llena este campo correctamente.</div>
                  </div>
                </div>

                <div class="d-flex justify-content-end mb-4">
                  <button type="button" class="btn btn-alt-danger me-2" data-bs-dismiss="modal">
                    Cancelar
                  </button>
                  <button type="submit" class="btn btn-alt-primary">Guardar</button>
                </div>
                <?php
                $editarUsuario = new ControladorUsuarios();
                $editarUsuario->ctrEditarUsuario();

                ?>
              </form>
            </div>
          </div>
        </div>
      </div>
    </div>


    
  </div>
</main>
<?php
$eliminarUsuario = new ControladorUsuarios();
$eliminarUsuario->ctrBorrarUsuario();
