

<!-- Main Container -->
<main id="main-container">
  <!-- Page Content -->
  <div class="content">
    <div class="row justify-content-center">
      <div class="col-7">
        <div class="justify-content-center">

          <div class="block block-rounded">
            <div class="block-content block-content-full">
              <div class="text-center">
                <h2 class="h4 fw-extrabold mb-0">
                  Tipo de Vehiculos
                </h2>
              </div>
            </div>
          </div>

          <div class="block block-rounded">
            <div class="block-header block-header-default">
              <button type="button" class="btn btn-success me-1 mb-1" data-bs-toggle="modal" data-bs-target="#modal-Vehiculos">
                <i class="fa fa-plus opacity-50 me-1"></i> Añadir Vehiculo
              </button>
            </div>

            <div class="block-content">
              <table id="tablass" class="table table-vcenter">
                <thead>
                  <tr>
                    <th class="text-center" style="width: 50px;"></th>

                    <th>Vehiculo</th>
                    <th> </th>  
                    <th class="d-none d-sm-table-cell" style="width: 15%;">Estado</th>

                    <th class="text-center" style="width: 100px;">Actions</th>
                  </tr>
                </thead>
                <tbody>
                  <?php
                  $item = null;
                  $valor = null;
                  //$vehiculos = ControladorVehiculos::ctrMostrarVehiculos($item, $valor);

              //     foreach ($vehiculos as $key => $value) {
              //       echo '
              // <tr>
              //     <th class="text-center" scope="row">' . ($key + 1) . '</th>
              //     <td class=" text-uppercase">' . $value["nombre_vehiculo"] .  '</td>';


              //       if ($value["estado_Vehiculo"] != 0) {
              //         echo '
              //     <td class="d-none d-sm-table-cell">
              //         <button type="button" class="btnActivar badge btn btn-success" idVehiculo="' . $value["id_vehiculo"] . '" estadoVehiculo="0">Activado</button>
              //     </td>';
              //       } else {
              //         echo '
              //     <td class="d-none d-sm-table-cell">
              //         <button type="button" class="btnActivar badge btn btn-danger" idVehiculo="' . $value["id_vehiculo"] . '" estadoVehiculo="1">Desactivado</button>
              //     </td>';
              //       }

              //       echo '
                 
              //     <td class="text-center">
              //         <div class="btn-group">
              //             <button type="button" class="btn btn-sm btn-secondary js-bs-tooltip-enabled btnEditarVehiculo" idVehiculo="' . $value["id_vehiculo"] . '" data-bs-target="#modalEditarVehiculo" data-bs-toggle="modal" aria-label="Edit" data-bs-original-title="Edit">
              //                 <i class="fa fa-pencil-alt"></i>
              //             </button>
              //             <button type="button" class="btn btn-sm btn-secondary js-bs-tooltip-enabled btnElininarVehiculo" idVehiculo="' . $value["id_vehiculo"] . '" data-bs-toggle="tooltip" aria-label="Delete" data-bs-original-title="Delete">
              //                 <i class="fa fa-times"></i>
              //             </button>
              //         </div>
              //     </td>
              // </tr>';
              //     }

                  ?>
                </tbody>
              </table>
            </div>
          </div>

        </div>
      </div>
    </div>
    <!-- Modal Añadir Vehiculo -->
    <div class="modal" id="modal-Vehiculos" tabindex="-1" role="dialog" aria-labelledby="modal-normal" aria-hidden="true">
      <div class="modal-dialog" role="document">
        <div class="modal-content">
          <div class="block block-rounded shadow-none mb-0">
            <div class="block-header block-header-default">
              <h3 class="block-title">Añadir Vehiculo</h3>
              <div class="block-options">
                <button type="button" class="btn-block-option" data-bs-dismiss="modal" aria-label="Close">
                  <i class="fa fa-times"></i>
                </button>
              </div>
            </div>
            <form method="post"  class="needs-validation" novalidate>
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
                      echo '<pre>'; print_r($marcas); echo '</pre>';
                      
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
                      <option selected="modeloSelect">Elije una Modelo</option>
                      <?php
                      $item = null;
                      $valor = null;
                      $modelos = ControladorModelos::ctrMostrarModelos($item, $valor);

                      foreach ($modelos as $key => $value) {

                        echo '<option value="' . $value["id_modelo"] . '">' . $value["nombre_modelo"] . '</option>';
                      }
                      ?>

                    </select>

                  </div>
                </div>

                <div class="mb-4">
                  <div class="input-group">
                    <span class="input-group-text btn btn-outline-primary">Vehiculo</span>
                    <input type="text" class="form-control  text-uppercase"  name="nuevaVehiculo" onchange="validateJS(event,'text')" required autocomplete="Vehiculo">
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
              $crearVehiculo = new ControladorVehiculos();
              $crearVehiculo->ctrCrearVehiculo();
              ?>
            </form>
            
          </div>
        </div>
      </div>
    </div>

    <!-- Modal editar Vehiculo-->
    <div class="modal" id="modalEditarVehiculo" tabindex="-1" role="dialog" aria-labelledby="modal-normal" aria-hidden="true">
      <div class="modal-dialog" role="document">
        <div class="modal-content">
          <div class="block block-rounded shadow-none mb-0">
            <div class="block-header block-header-default">
              <h3 class="block-title">Editar Vehiculo</h3>
              <div class="block-options">
                <button type="button" class="btn-block-option" data-bs-dismiss="modal" aria-label="Close">
                  <i class="fa fa-times"></i>
                </button>
              </div>
            </div>
            <form method="post" >
              <div class="block-content fs-sm">
                <div class="mb-4">
                  <div class="input-group">
                    <span class="input-group-text btn btn-outline-primary">Vehiculo</span>
                    <input type="text" class="form-control text-uppercase" id="editarVehiculo" name="editarVehiculo">
                    <input type="hidden" name="idVehiculo" id="idVehiculo" required>

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
              //$editarVehiculo = new ControladorVehiculos();
              //$editarVehiculo->ctrEditarVehiculo();
              ?>
            </form>
            
          </div>
        </div>
      </div>
    </div>
    
  </div>
</main>

<?php
$borrarVehiculo = new ControladorVehiculos();
$borrarVehiculo->ctrBorrarVehiculo();
?>