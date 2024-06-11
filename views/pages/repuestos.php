<!-- Main Container -->
<main id="main-container">
  <!-- Page Content -->
  <div class="content">
    <div class="row justify-content-center">
      <div class="col-10">
        <div class="justify-content-center">

          <div class="block block-rounded">
            <div class="block-content block-content-full">
              <div class="text-center">
                <h2 class="h4 fw-extrabold mb-0">
                  Compras
                </h2>
              </div>
            </div>
          </div>

          <div class="block block-rounded">
            <div class="block-header block-header-default">
              <button type="button" class="btn btn-success me-1 mb-1" data-bs-toggle="modal" data-bs-target="#modal-Compras">
                <i class="fa fa-plus opacity-50 me-1"></i> Añadir Compra
              </button>
            </div>

            <div class="block-content block-content-full overflow-x-auto">
              <table  class="table table-sm table-striped table-vcenter js-dataTable-responsive">
                <thead>
                  <tr>
                    <th class="text-center" style="width: 50px;"></th>
                    <th>Código Compra</th>
                    <th>Fecha Compra</th>
                    <th>Proveedor</th>
                    <th>Usuario</th>
                    <th class="text-center" style="width: 100px;">Actions</th>
                  </tr>
                </thead>
                <tbody>
                  <?php
                  $item = null;
                  $valor = null;
                  $Usuarios = ControladorUsuarios::ctrMostrarUsuarios($item, $valor);

                  foreach ($Usuarios as $key => $value) {
                    // Obtener nombre del proveedor
                    $itemProveedor = null;
                    $valorProveedor = null;
                    $proveedor = ControladorProveedores::ctrMostrarProveedores($itemProveedor, $valorProveedor);
                    echo '<script>console.log(' . json_encode($proveedor) . ')</script>';

                    // Obtener nombre del usuario
                    $itemUsuario = "id_usuario";
                    $valorUsuario = $value["id_usuario"];
                    $usuario = ControladorUsuarios::ctrMostrarUsuarios($itemUsuario, $valorUsuario);

                    echo '
                <tr>
                    <th class="text-center" scope="row">' . ($key + 1) . '</th>
                    <td>' . $value["codigo_compra"] . '</td>
                    <td>' . $value["fecha_compra"] . '</td>
                    <td>' . $proveedor["nombre_proveedor"] . '</td>
                    <td>' . $usuario["nombre_usuario"] . '</td>
                    <td class="text-center">
                        <div class="btn-group">
                            <button type="button" class="btn btn-sm btn-secondary js-bs-tooltip-enabled btnDetalleUsuario" idUsuario="' . $value["id_isuario"] . '" data-bs-target="#modalDetalleUsuario" data-bs-toggle="modal" aria-label="Detail" data-bs-original-title="Detail">
                                <i class="fa fa-eye"></i>
                            </button>
                            <button type="button" class="btn btn-sm btn-secondary js-bs-tooltip-enabled btnEditarUsuario" idUsuario="' . $value["id_Usuario"] . '" data-bs-target="#modalEditarUsuario" data-bs-toggle="modal" aria-label="Edit" data-bs-original-title="Edit">
                                <i class="fa fa-pencil-alt"></i>
                            </button>
                            <button type="button" class="btn btn-sm btn-secondary js-bs-tooltip-enabled btnEliminarUsuario" idUsuario="' . $value["id_Usuario"] . '" data-bs-toggle="tooltip" aria-label="Delete" data-bs-original-title="Delete">
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


        </div>
      </div>
    </div>

<!-- Modal Añadir Compra -->
<div class="modal" id="modal-Compras" tabindex="-1" role="dialog" aria-labelledby="modal-normal" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="block block-rounded shadow-none mb-0">
        <div class="block-header block-header-default">
          <h3 class="block-title">Añadir Compra</h3>
          <div class="block-options">
            <button type="button" class="btn-block-option" data-bs-dismiss="modal" aria-label="Close">
              <i class="fa fa-times"></i>
            </button>
          </div>
        </div>
        <form method="post" class="needs-validation" novalidate>
          <div class="block-content fs-sm">
            <div class="mb-4">
              <div class="input-group">
                <span class="input-group-text btn btn-outline-primary">Codigo</span>
                <input type="text" class="form-control" name="nuevoCodigoCompra" placeholder="Codigo de Compra" autocomplete="off" required>
                <div class="valid-feedback">Válido.</div>
                <div class="invalid-feedback">Por favor llena este campo correctamente.</div>
              </div>
            </div>

            <div class="mb-4">
              <div class="input-group">
                <span class="input-group-text btn btn-outline-primary">Fecha</span>
                <input type="text" class="form-control js-flatpickr" id="fechaCompra" name="fechaCompra" placeholder="YYYY-MM-DD" autocomplete="off" required>
                <div class="valid-feedback">Válido.</div>
                <div class="invalid-feedback">Por favor llena este campo correctamente.</div>
              </div>
            </div>

            <div class="mb-4">
              <div class="input-group">
                <span class="input-group-text btn btn-outline-primary">Proveedor</span>
                <select class="form-select" name="proveedorSelect" id="proveedorSelect" required>
                  <option selected disabled>Elije un Proveedor</option>
                  <?php
                  $item = null;
                  $valor = null;
                  $proveedores = ControladorProveedores::ctrMostrarProveedores($item, $valor);
                  foreach ($proveedores as $key => $value) {
                    echo '<option value="' . $value["id_proveedor"] . '">' . $value["nombre_proveedor"] . '</option>';
                  }
                  ?>
                </select>
                <div class="valid-feedback">Válido.</div>
                <div class="invalid-feedback">Por favor selecciona un proveedor.</div>
              </div>
            </div>

            <div class="mb-4">
              <div class="input-group">
                <span class="input-group-text btn btn-outline-primary">Usuario</span>
                <select class="form-select" name="usuarioSelect" id="usuarioSelect" required>
                  <option selected disabled>Elije un Usuario</option>
                  <?php
                  $item = null;
                  $valor = null;
                  $usuarios = ControladorUsuarios::ctrMostrarUsuarios($item, $valor);
                  foreach ($usuarios as $key => $value) {
                    echo '<option value="' . $value["id_usuario"] . '">' . $value["nombre_usuario"] . '</option>';
                  }
                  ?>
                </select>
                <div class="valid-feedback">Válido.</div>
                <div class="invalid-feedback">Por favor selecciona un usuario.</div>
              </div>
            </div>

          </div>
          <div class="block-content block-content-full block-content-sm text-end border-top">
            <button type="button" class="btn btn-alt-secondary" data-bs-dismiss="modal">Salir</button>
            <button type="submit" class="btn btn-alt-primary">Guardar</button>
          </div>
          <?php
          $crearCompra = new ControladorCompras();
          $crearCompra->ctrCrearCompra();
          ?>
        </form>
      </div>
    </div>
  </div>
</div>



    <!-- Modal editar Usuario-->
    <div class="modal" id="modalEditarUsuario" tabindex="-1" role="dialog" aria-labelledby="modal-normal" aria-hidden="true">
      <div class="modal-dialog" role="document">
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
            <form method="post">
              <div class="block-content fs-sm">
                <div class="mb-4">
                  <div class="input-group">
                    <span class="input-group-text btn btn-outline-primary">Usuario</span>
                    <input type="text" class="form-control" id="editarUsuario" name="editarUsuario">
                    <input type="hidden" name="idUsuario" id="idUsuario" required>

                  </div>
                </div>
              </div>
              <div class="block-content block-content-full block-content-sm text-end border-top">
                <button type="button" class="btn btn-alt-secondary" data-bs-dismiss="modal">
                  Salir
                </button>
                <button type="submit" class="btn btn-alt-primary" data-bs-dismiss="modal">
                  Guardar Cambios
                </button>
              </div>
              <?php
              // $editarUsuario = new ControladorUsuarios();
              // $editarUsuario->ctrEditarUsuario();
              ?>
            </form>

          </div>
        </div>
      </div>
    </div>

</script>

  </div>
</main>


<?php
// $borrarUsuario = new ControladorUsuarios();
// $borrarUsuario->ctrBorrarUsuario();
?>