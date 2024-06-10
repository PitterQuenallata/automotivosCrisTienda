<!-- Main Container -->
<main id="main-container">
  <!-- Page Content -->
  <div class="content">

    <div class="row justify-content-center">
      <div class="col-8">
        <div class="justify-content-center">
          <div class="block block-rounded">
            <div class="block-content block-content-full">
              <div class="text-center">
                <h2 class="h4 fw-extrabold mb-0">
                  PROVEEDORES
                </h2>
              </div>
            </div>
          </div>

          <div class="block block-rounded">
            <div class="block-header block-header-default">
              <button type="button" class="btn btn-success me-1 mb-1" data-bs-toggle="modal" data-bs-target="#modal-agregar-Proveedor">
                <i class="fa fa-plus opacity-50 me-1"></i> Añadir Proveedor
              </button>
            </div>
            <div class="block-content">
              <table id="tablass" class="table table-vcenter">
                <thead>
                  <tr>
                    <th class="text-center" style="width: 50px;">#</th>
                    <th>Nombre</th>
                    <th>Contacto</th>
                    <th>Dirección</th>
                    <th class="text-center" style="width: 100px;">Acciones</th>
                  </tr>
                </thead>
                <tbody>
                  <?php
                  $item = null;
                  $valor = null;
                  $proveedores = ControladorProveedores::ctrMostrarProveedores($item, $valor);

                  foreach ($proveedores as $key => $value) {
                    echo '
        <tr>
            <th class="text-center" scope="row">' . ($key + 1) . '</th>
            <td>' . $value["nombre_proveedor"] . '</td>
            <td>' . $value["telefono_proveedor"] . '</td>
            <td>' . $value["direccion_proveedor"] . '</td>
            <td class="text-center">
                <div class="btn-group">
                    <button type="button" class="btn btn-sm btn-secondary js-bs-tooltip-enabled btnEditarProveedores" idProveedor="' . $value["id_proveedor"] . '" data-bs-target="#modalEditarProveedor" data-bs-toggle="modal" aria-label="Edit" data-bs-original-title="Edit">
                        <i class="fa fa-pencil-alt"></i>
                    </button>
                    <button type="button" class="btn btn-sm btn-secondary js-bs-tooltip-enabled btnEliminarProveedor" idProveedor="' . $value["id_proveedor"] . '" data-bs-toggle="tooltip" aria-label="Delete" data-bs-original-title="Delete">
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




    <!-- Modal Agregar Proveedor -->
    <div class="modal" id="modal-agregar-Proveedor" tabindex="-1" role="dialog" aria-labelledby="modal-agregar-Proveedor" aria-hidden="true">
      <div class="modal-dialog modal-lg" role="document">
        <div class="modal-content">
          <div class="block block-rounded shadow-none mb-0">
            <div class="block-header block-header-default">
              <h3 class="block-title">Agregar Proveedor</h3>
              <div class="block-options">
                <button type="button" class="btn-block-option" data-bs-dismiss="modal" aria-label="Close">
                  <i class="fa fa-times"></i>
                </button>
              </div>
            </div>
            <div class="block-content fs-sm">
              <form method="post" class="needs-validation" novalidate>
                <div class="mb-4">
                  <div class="input-group">
                    <span class="input-group-text btn btn-outline-primary">Nombre</span>
                    <input type="text" class="form-control" id="nombre_proveedor" name="nombre_proveedor" onchange="validateJS(event,'text')" required>
                    <div class="valid-feedback">Válido.</div>
                    <div class="invalid-feedback">Por favor llena este campo correctamente.</div>
                  </div>
                </div>

                <div class="mb-4">
                  <div class="input-group">
                    <span class="input-group-text btn btn-outline-primary">Teléfono</span>
                    <input type="text" class="form-control" id="telefono_proveedor" name="telefono_proveedor" onchange="validateJS(event,'complete')" required>
                    <div class="valid-feedback">Válido.</div>
                    <div class="invalid-feedback">Por favor llena este campo correctamente.</div>
                  </div>
                </div>

                <div class="mb-4">
                  <div class="input-group">
                    <span class="input-group-text btn btn-outline-primary">Dirección</span>
                    <input type="text" class="form-control" id="direccion_proveedor" name="direccion_proveedor" onchange="validateJS(event,'text')" required>
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
                $crearProveedor = new ControladorProveedores();
                $crearProveedor->ctrCrearProveedor();
                ?>
              </form>
            </div>
          </div>
        </div>
      </div>
    </div>

<!-- Modal Editar Proveedor -->
<div class="modal" id="modalEditarProveedor" tabindex="-1" role="dialog" aria-labelledby="modal-large" aria-hidden="true">
    <div class="modal-dialog modal-lg" role="document">
        <div class="modal-content">
            <div class="block block-rounded shadow-none mb-0">
                <div class="block-header block-header-default">
                    <h3 class="block-title">Editar Proveedor</h3>
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
                                <span class="input-group-text btn btn-outline-primary">Nombre</span>
                                <input type="text" class="form-control" id="editarNombreProveedor" name="editarNombreProveedor">
                                <input type="hidden" id="nombreActual" name="nombreActual">
                            </div>
                        </div>
                        <div class="mb-4">
                            <div class="input-group">
                                <span class="input-group-text btn btn-outline-primary">Teléfono</span>
                                <input type="text" class="form-control" id="editarTelefonoProveedor" name="editarTelefonoProveedor">
                                <input type="hidden" id="telefonoActual" name="telefonoActual">
                            </div>
                        </div>
                        <div class="mb-4">
                            <div class="input-group">
                                <span class="input-group-text btn btn-outline-primary">Dirección</span>
                                <input type="text" class="form-control" id="editarDireccionProveedor" name="editarDireccionProveedor">
                                <input type="hidden" id="direccionActual" name="direccionActual">
                            </div>
                        </div>
                        <input type="hidden" id="idProveedor" name="idProveedor">
                    </div>
                    <div class="block-content block-content-full block-content-sm text-end border-top">
                        <button type="button" class="btn btn-alt-secondary" data-bs-dismiss="modal">Salir</button>
                        <button type="submit" class="btn btn-alt-primary">Guardar Cambios</button>
                    </div>
                    <?php
                    $editarProveedor = new ControladorProveedores();
                    $editarProveedor->ctrEditarProveedor();
                    ?>
                </form>
            </div>
        </div>
    </div>
</div>








  </div>
</main>
<?php
$eliminarProveedor = new ControladorProveedores();
$eliminarProveedor->ctrEliminarProveedor();
