

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
                  CATEGORIAS
                </h2>
              </div>
            </div>
          </div>

          <div class="block block-rounded">
            <div class="block-header block-header-default">
              <button type="button" class="btn btn-success me-1 mb-1" data-bs-toggle="modal" data-bs-target="#modal-categorias">
                <i class="fa fa-plus opacity-50 me-1"></i> Añadir Categoria
              </button>
            </div>

            <div class="block-content">
              <table id="tablass" class="table table-vcenter">
                <thead>
                  <tr>
                    <th class="text-center" style="width: 50px;"></th>

                    <th>Categoria</th>

                    <!-- <th class="d-none d-sm-table-cell" style="width: 15%;">Estado</th> -->

                    <th class="text-center" style="width: 100px;">Actions</th>
                  </tr>
                </thead>
                <tbody>
                  <?php
                  $item = null;
                  $valor = null;
                  $categorias = ControladorCategorias::ctrMostrarCategorias($item, $valor);

                  foreach ($categorias as $key => $value) {
                    echo '
              <tr>
                  <th class="text-center" scope="row">' . ($key + 1) . '</th>
                  <td>' . $value["nombre_categoria"] .  '</td>';


                  //   if ($value["estado_categoria"] != 0) {
                  //     echo '
                  // <td class="d-none d-sm-table-cell">
                  //     <button type="button" class="btnActivar badge btn btn-success" idCategoria="' . $value["id_categoria"] . '" estadoCategoria="0">Activado</button>
                  // </td>';
                  //   } else {
                  //     echo '
                  // <td class="d-none d-sm-table-cell">
                  //     <button type="button" class="btnActivar badge btn btn-danger" idCategoria="' . $value["id_categoria"] . '" estadoCategoria="1">Desactivado</button>
                  // </td>';
                  //   }

                    echo '
                 
                  <td class="text-center">
                      <div class="btn-group">
                          <button type="button" class="btn btn-sm btn-secondary js-bs-tooltip-enabled btnEditarCategoria" idCategoria="' . $value["id_categoria"] . '" data-bs-target="#modalEditarCategoria" data-bs-toggle="modal" aria-label="Edit" data-bs-original-title="Edit">
                              <i class="fa fa-pencil-alt"></i>
                          </button>
                          <button type="button" class="btn btn-sm btn-secondary js-bs-tooltip-enabled btnElininarCategoria" idCategoria="' . $value["id_categoria"] . '" data-bs-toggle="tooltip" aria-label="Delete" data-bs-original-title="Delete">
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
    
    <!-- Modal Añadir categoria -->
    <div class="modal" id="modal-categorias" tabindex="-1" role="dialog" aria-labelledby="modal-normal" aria-hidden="true">
      <div class="modal-dialog" role="document">
        <div class="modal-content">
          <div class="block block-rounded shadow-none mb-0">
            <div class="block-header block-header-default">
              <h3 class="block-title">Añadir Categoria</h3>
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
                    <span class="input-group-text btn btn-outline-primary">Categoria</span>
                    <input type="text" class="form-control"  name="nuevaCategoria" onchange="validateJS(event,'text')" required autocomplete="categoria">
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
              $crearCategoria = new ControladorCategorias();
              $crearCategoria->ctrCrearCategoria();
              ?>
            </form>
            
          </div>
        </div>
      </div>
    </div>

    <!-- Modal editar categoria-->
    <div class="modal" id="modalEditarCategoria" tabindex="-1" role="dialog" aria-labelledby="modal-normal" aria-hidden="true">
      <div class="modal-dialog" role="document">
        <div class="modal-content">
          <div class="block block-rounded shadow-none mb-0">
            <div class="block-header block-header-default">
              <h3 class="block-title">Editar Categoria</h3>
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
                    <span class="input-group-text btn btn-outline-primary">Categoria</span>
                    <input type="text" class="form-control" id="editarCategoria" name="editarCategoria">
                    <input type="hidden" name="idCategoria" id="idCategoria" required>

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
              $editarCategoria = new ControladorCategorias();
              $editarCategoria->ctrEditarCategoria();
              ?>
            </form>
            
          </div>
        </div>
      </div>
    </div>
    
  </div>
</main>

<?php
$borrarCategoria = new ControladorCategorias();
$borrarCategoria->ctrBorrarCategoria();
?>