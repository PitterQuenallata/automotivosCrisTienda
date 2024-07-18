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
                  Modelos de Vehiculos
                </h2>
              </div>
            </div>
          </div>

          <div class="block block-rounded">
            <div class="block-header block-header-default">
              <button type="button" class="btn btn-success me-1 mb-1" data-bs-toggle="modal" data-bs-target="#modal-Modelos">
                <i class="fa fa-plus opacity-50 me-1"></i> Añadir Modelo
              </button>
            </div>

            <div class="block-content block-content-full overflow-x-auto">
            <div class="">
            <table id="" class="table table-sm table-striped table-vcenter js-dataTable-responsive">
                <thead>
                  <tr>
                    <th class="text-center" style="width: 50px;"></th>
                    <th>Modelo</th>
                    <th>Version</th>
                    <th>Año Incio</th>
                    <th>Año Fin</th>
                    <th>Marca</th>
                    <th class="d-none d-sm-table-cell" style="width: 15%;">Estado</th>
                    <th class="text-center" style="width: 100px;">Actions</th>
                  </tr>
                </thead>
                <tbody>
                  <?php
                  $item = null;
                  $valor = null;
                  $modelos = ControladorModelos::ctrMostrarModelos($item, $valor);

                  foreach ($modelos as $key => $value) {
                    echo '
                <tr>
                    <th class="text-center" scope="row">' . ($key + 1) . '</th>
                    <td class="text-uppercase">' . $value["nombre_modelo"] . '</td>
                    <td class="text-uppercase">' . $value["version_modelo"] . '</td>
                    <td>' . $value["anio_inicio_modelo"] . '</td>
                    <td>' . $value["anio_fin_modelo"] . '</td>
                    <td class="text-uppercase">' . $value["nombre_marca"] . '</td>';

                    if ($value["estado_modelo"] != 0) {
                      echo '
                    <td class="d-none d-sm-table-cell">
                        <button type="button" class="btnActivar badge btn btn-success" idModelo="' . $value["id_modelo"] . '" estadoModelo="0">Activado</button>
                    </td>';
                    } else {
                      echo '
                    <td class="d-none d-sm-table-cell">
                        <button type="button" class="btnActivar badge btn btn-danger" idModelo="' . $value["id_modelo"] . '" estadoModelo="1">Desactivado</button>
                    </td>';
                    }

                    echo '
                    <td class="text-center">
                        <div class="btn-group">
                            <button type="button" class="btn btn-sm btn-secondary js-bs-tooltip-enabled btnEditarModelo" idModelo="' . $value["id_modelo"] . '" data-bs-target="#modalEditarModelo" data-bs-toggle="modal" aria-label="Edit" data-bs-original-title="Edit">
                                <i class="fa fa-pencil-alt"></i>
                            </button>
                            <button type="button" class="btn btn-sm btn-secondary js-bs-tooltip-enabled btnElininarModelo" idModelo="' . $value["id_modelo"] . '" data-bs-toggle="tooltip" aria-label="Delete" data-bs-original-title="Delete">
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
    </div>
    
<!-- Modal Añadir Modelo -->
<div class="modal" id="modal-Modelos" tabindex="-1" role="dialog" aria-labelledby="modal-normal" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="block block-rounded shadow-none mb-0">
        <div class="block-header block-header-default">
          <h3 class="block-title">Añadir Modelo</h3>
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
                <span class="input-group-text btn btn-outline-primary">Marca</span>
                <select class="form-select" name="marcaSelect" id="marcaSelec" required>
                  <option selected="marcaSelect">Elije una marca</option>
                  <?php
                  $item = null;
                  $valor = null;
                  $marcas = ControladorMarcas::ctrMostrarMarcas($item, $valor);

                  foreach ($marcas as $key => $value) {
                    echo '<option value="' . $value["id_marca"] . '">' . $value["nombre_marca"] . '</option>';
                  }
                  ?>
                </select>
              </div>
            </div>

            <div class="mb-4">
              <div class="input-group">
                <span class="input-group-text btn btn-outline-primary">Modelo</span>
                <input type="text" class="form-control" name="nuevoModelo" pattern="[A-Za-z0-9]+" required autocomplete="Modelo">
                <div class="valid-feedback">Válido.</div>
                <div class="invalid-feedback">Por favor llena este campo correctamente.</div>
              </div>
            </div>

            <div class="mb-4">
              <div class="input-group">
                <span class="input-group-text btn btn-outline-primary">Versión</span>
                <input type="text" class="form-control" name="nuevaVersion" required>
                <div class="valid-feedback">Válido.</div>
                <div class="invalid-feedback">Por favor llena este campo correctamente.</div>
              </div>
            </div>

            <div class="mb-4">
              <div class="input-group">
                <span class="input-group-text btn btn-outline-primary">Año Inicio</span>
                <input type="number" class="form-control" name="anioInicio" required>
                <div class="valid-feedback">Válido.</div>
                <div class="invalid-feedback">Por favor llena este campo correctamente.</div>
              </div>
            </div>

            <div class="mb-4">
              <div class="input-group">
                <span class="input-group-text btn btn-outline-primary">Año Fin</span>
                <input type="number" class="form-control" name="anioFin">
                <div class="valid-feedback">Válido.</div>
                <div class="invalid-feedback">Por favor llena este campo correctamente.</div>
              </div>
            </div>

          </div>
          <div class="block-content block-content-full block-content-sm text-end border-top">
            <button type="button" class="btn btn-alt-secondary" data-bs-dismiss="modal">
              Salir
            </button>
            <button type="submit" class="btn btn-alt-primary" data-bs-dismiss="modal">
              Guardar
            </button>
          </div>
          <?php
          $crearModelo = new ControladorModelos();
          $crearModelo->ctrCrearModelo();
          ?>
        </form>
      </div>
    </div>
  </div>
</div>



<!-- Modal editar Modelo-->
<div class="modal" id="modalEditarModelo" tabindex="-1" role="dialog" aria-labelledby="modal-normal" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="block block-rounded shadow-none mb-0">
        <div class="block-header block-header-default">
          <h3 class="block-title">Editar Modelo</h3>
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
                <span class="input-group-text btn btn-outline-primary">Marca</span>
                <select class="form-select" name="marcaSelectEditar" id="marcaSelecEditar" required>
                  <option selected="marcaSelectEditar">Elije una marca</option>
                  <?php
                  $item = null;
                  $valor = null;
                  $marcas = ControladorMarcas::ctrMostrarMarcas($item, $valor);

                  foreach ($marcas as $key => $value) {
                    echo '<option value="' . $value["id_marca"] . '">' . $value["nombre_marca"] . '</option>';
                  }
                  ?>
                </select>
              </div>
            </div>
            <div class="mb-4">
              <div class="input-group">
                <span class="input-group-text btn btn-outline-primary">Modelo</span>
                <input type="text" class="form-control text-uppercase" id="editarModelo" name="editarModelo">
                <input type="hidden" name="idModelo" id="idModelo" required>
              </div>
            </div>
            <div class="mb-4">
              <div class="input-group">
                <span class="input-group-text btn btn-outline-primary">Versión</span>
                <input type="text" class="form-control text-uppercase" id="editarVersion" name="editarVersion">
              </div>
            </div>
            <div class="mb-4">
              <div class="input-group">
                <span class="input-group-text btn btn-outline-primary">Año de Inicio</span>
                <input type="number" class="form-control" id="editarAnioInicio" name="editarAnioInicio">
              </div>
            </div>
            <div class="mb-4">
              <div class="input-group">
                <span class="input-group-text btn btn-outline-primary">Año de Fin</span>
                <input type="number" class="form-control" id="editarAnioFin" name="editarAnioFin">
              </div>
            </div>
          </div>
          <div class="block-content block-content-full block-content-sm text-end border-top">
            <button type="button" class="btn btn-alt-secondary" data-bs-dismiss="modal">
              Salir
            </button>
            <button type="submit" class="btn btn-alt-primary">
              Guardar Cambios
            </button>
          </div>
          <?php
          $editarModelo = new ControladorModelos();
          $editarModelo->ctrEditarModelo();
          ?>
        </form>
      </div>
    </div>
  </div>
</div>


  </div>
</main>

<?php
$borrarModelo = new ControladorModelos();
$borrarModelo->ctrBorrarModelo();
?>