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
                  Motores de Vehiculos
                </h2>
              </div>
            </div>
          </div>
          <div class="block block-rounded">
            <div class="block-header block-header-default">
              <button type="button" class="btn btn-success me-1 mb-1" data-bs-toggle="modal" data-bs-target="#modal-Motores">
                <i class="fa fa-plus opacity-50 me-1"></i> Añadir Motor
              </button>



            </div>
            <div class="block-content">
              <table class="table table-sm table-striped table-vcenter js-dataTable-responsive">
                <thead>
                  <tr>
                    <th class="text-center" style="width: 50px;"></th>
                    <th>Motor</th>
                    <th>Cilindrada</th>
                    <th>Especificaciones</th>
                    <th class="text-center" style="width: 100px;">Acciones</th>
                  </tr>
                </thead>
                <tbody>
                  <?php
                  $item = null;
                  $valor = null;
                  $motores = ControladorMotores::ctrMostrarMotores($item, $valor);

                  foreach ($motores as $key => $value) {
                    echo '
                      <tr>
                        <th class="text-center" scope="row">' . ($key + 1) . '</th>
                        <td>' . $value["nombre_motor"] . '</td>
                        <td class="text-uppercase">' . $value["cilindrada_motor"] . '</td>
                        <td>' . $value["especificaciones_motor"] . '</td>
                        <td class="text-center">
                          <div class="btn-group">
                            <button type="button" class="btn btn-sm btn-secondary js-bs-tooltip-enabled btnEditarMotor" idMotor="' . $value["id_motor"] . '" data-bs-target="#modalEditarMotor" data-bs-toggle="modal" aria-label="Edit" data-bs-original-title="Edit">
                              <i class="fa fa-pencil-alt"></i>
                            </button>
                            <button type="button" class="btn btn-sm btn-secondary js-bs-tooltip-enabled btnEliminarMotor" idMotor="' . $value["id_motor"] . '" data-bs-toggle="tooltip" aria-label="Delete" data-bs-original-title="Delete">
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

  <!-- Modal Añadir Motor -->
  <div class="modal" id="modal-Motores" tabindex="-1" role="dialog" aria-labelledby="modal-large" aria-hidden="true">
    <div class="modal-dialog modal-lg" role="document">
      <div class="modal-content">
        <div class="block block-rounded shadow-none mb-0">
          <div class="block-header block-header-default">
            <h3 class="block-title">Añadir Motor</h3>
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
                    <option selected disabled>Elije una marca</option>
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
                  <select class="form-select" name="modeloSelect" id="modeloSelec" required>
                    <option selected disabled>Elije un modelo</option>
                    <!-- Los modelos se cargarán dinámicamente con JavaScript -->
                  </select>
                </div>
              </div>

              <div class="mb-4">
                <div class="input-group">
                  <span class="input-group-text btn btn-outline-primary">Motor</span>
                  <input type="text" class="form-control" name="nuevoMotor" required autocomplete="off">
                  <div class="valid-feedback">Válido.</div>
                  <div class="invalid-feedback">Por favor llena este campo correctamente.</div>
                </div>
              </div>
              <div class="mb-4">
                <div class="input-group">
                  <span class="input-group-text btn btn-outline-primary">Cilindrada</span>
                  <input type="text" class="form-control" name="cilindradaMotor" required autocomplete="off">
                  <div class="valid-feedback">Válido.</div>
                  <div class="invalid-feedback">Por favor llena este campo correctamente.</div>
                </div>
              </div>
              <div class="mb-4">
                <div class="input-group">
                  <span class="input-group-text btn btn-outline-primary">Especificaciones</span>
                  <textarea class="form-control" name="especificacionesMotor" required></textarea>
                  <div class="valid-feedback">Válido.</div>
                  <div class="invalid-feedback">Por favor llena este campo correctamente.</div>
                </div>
              </div>
            </div>
            <div class="block-content block-content-full block-content-sm text-end border-top">
              <button type="button" class="btn btn-alt-secondary" data-bs-dismiss="modal">Salir</button>
              <button type="submit" class="btn btn-alt-primary">Guardar</button>
            </div>
            <?php
            $crearMotor = new ControladorMotores();
            $crearMotor->ctrCrearMotor();
            ?>
          </form>
        </div>
      </div>
    </div>
  </div>

<!-- Modal editar Motor -->
<div class="modal" id="modalEditarMotor" tabindex="-1" role="dialog" aria-labelledby="modal-large" aria-hidden="true">
    <div class="modal-dialog modal-lg" role="document">
        <div class="modal-content">
            <div class="block block-rounded shadow-none mb-0">
                <div class="block-header block-header-default">
                    <h3 class="block-title">Editar Motor</h3>
                    <div class="block-options">
                        <button type="button" class="btn-block-option" data-bs-dismiss="modal" aria-label="Close">
                            <i class="fa fa-times"></i>
                        </button>
                    </div>
                </div>
                <form method="post">
                    <div class="block-content fs-sm">
                        <!-- Campo nombre del motor -->
                        <div class="mb-4">
                            <div class="input-group">
                                <span class="input-group-text btn btn-outline-primary">Nombre del Motor</span>
                                <input type="text" class="form-control" id="editarMotor" name="editarMotor">
                                <input type="hidden" name="idMotor" id="idMotor" required>
                                <!-- Input oculto para almacenar el nombre original del motor -->
                                <input type="hidden" name="nombreMotorActual" id="nombreMotorActual">
                            </div>
                        </div>

                        <!-- Campo cilindrada -->
                        <div class="mb-4">
                            <div class="input-group">
                                <span class="input-group-text btn btn-outline-primary">Cilindrada</span>
                                <input type="text" class="form-control" id="editarCilindrada" name="editarCilindrada">
                                <!-- Input oculto para almacenar la cilindrada original -->
                                <input type="hidden" name="cilindradaActual" id="cilindradaActual">
                            </div>
                        </div>

                        <!-- Campo especificaciones -->
                        <div class="mb-4">
                            <div class="input-group">
                                <span class="input-group-text btn btn-outline-primary">Especificaciones</span>
                                <textarea class="form-control" id="editarEspecificaciones" name="editarEspecificaciones"></textarea>
                                <!-- Input oculto para almacenar las especificaciones originales -->
                                <input type="hidden" name="especificacionesActuales" id="especificacionesActuales">
                            </div>
                        </div>

                        <!-- Campo oculto para el id del modelo relacionado -->
                        <input type="hidden" name="idModeloActual" id="idModeloActual">
                    </div>

                    <div class="block-content block-content-full block-content-sm text-end border-top">
                        <button type="button" class="btn btn-alt-secondary" data-bs-dismiss="modal">Salir</button>
                        <button type="submit" class="btn btn-alt-primary">Guardar Cambios</button>
                    </div>

                    <?php
                    $editarMotor = new ControladorMotores();
                    $editarMotor->ctrEditarMotor();
                    ?>
                </form>
            </div>
        </div>
    </div>
</div>







  </div>
</main>

<?php
$borrarMotor = new ControladorMotores();
$borrarMotor->ctrBorrarMotor();
?>