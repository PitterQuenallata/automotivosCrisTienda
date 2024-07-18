<main id="main-container">
  <div class="content">
    <div class="row justify-content-center">
      <div class="col-7">
        <div class="block block-rounded shadow-none mb-0">
          <div class="block-header block-header-default">
            <h3 class="block-title">Añadir Repuesto</h3>
          </div>
          <div class="block-content">
            <form method="post" class="needs-validation" novalidate>
              <div class="row">
                <div class="col-md-4 mb-4">
                  <label class="form-label" for="nuevoCodigoRepuesto">Código</label>
                  <input type="text" class="form-control" id="nuevoCodigoRepuesto" name="nuevoCodigoRepuesto" placeholder="Código de Repuesto" autocomplete="off" required>
                  <div class="valid-feedback">Válido.</div>
                  <div class="invalid-feedback">Por favor llena este campo correctamente.</div>
                </div>
                <div class="col-md-8 mb-4">
                  <label class="form-label" for="nuevoNombreRepuesto">Nombre</label>
                  <input type="text" class="form-control" id="nuevoNombreRepuesto" name="nuevoNombreRepuesto" placeholder="Nombre de Repuesto" autocomplete="off" required>
                  <div class="valid-feedback">Válido.</div>
                  <div class="invalid-feedback">Por favor llena este campo correctamente.</div>
                </div>
              </div>

              <div class="mb-4">
                <label class="form-label" for="nuevaDescripcionRepuesto">Descripción</label>
                <textarea class="form-control" id="nuevaDescripcionRepuesto" name="nuevaDescripcionRepuesto" placeholder="Descripción del Repuesto" autocomplete="off" required></textarea>
                <div class="valid-feedback">Válido.</div>
                <div class="invalid-feedback">Por favor llena este campo correctamente.</div>
              </div>

              <div class="row">
                <div class="col-md-6 mb-4">
                  <label class="form-label" for="nuevaMarcaRepuesto">Marca</label>
                  <input type="text" class="form-control" id="nuevaMarcaRepuesto" name="nuevaMarcaRepuesto" placeholder="Marca de Repuesto" autocomplete="off" required>
                  <div class="valid-feedback">Válido.</div>
                  <div class="invalid-feedback">Por favor llena este campo correctamente.</div>
                </div>
                <div class="col-md-6 mb-4">
                  <label class="form-label" for="agregarCategoria">Categoría</label>
                  <div class="input-group">
                    <select class="form-select" id="agregarCategoria" name="agregarCategoria" required>
                      <option selected disabled>Elije una Categoría</option>
                      <option value="1">Categoría 1</option>
                      <option value="2">Categoría 2</option>
                      <option value="3">Categoría 3</option>
                    </select>
                    <button type="button" class="btn btn-sm btn-secondary js-bs-tooltip-enabled" data-bs-toggle="modal" data-bs-target="#modal-categorias" aria-label="Add" data-bs-original-title="Add">
                      <i class="fa fa-plus"></i>
                    </button>
                  </div>
                  <div class="valid-feedback">Válido.</div>
                  <div class="invalid-feedback">Por favor selecciona una categoría.</div>
                </div>
              </div>

              <div class="row">
                <div class="col-md-4 mb-4">
                  <label class="form-label" for="nuevoPrecioCompraRepuesto">Precio Compra</label>
                  <input type="number" class="form-control" id="nuevoPrecioCompraRepuesto" name="nuevoPrecioCompraRepuesto" placeholder="00.00" autocomplete="off" required>
                  <div class="valid-feedback">Válido.</div>
                  <div class="invalid-feedback">Por favor llena este campo correctamente.</div>
                </div>
                <div class="col-md-4 mb-4">
                  <label class="form-label" for="nuevoPrecioVentaRepuesto">Precio Venta</label>
                  <input type="number" class="form-control" id="nuevoPrecioVentaRepuesto" name="nuevoPrecioVentaRepuesto" placeholder="00.00" autocomplete="off" required>
                  <div class="valid-feedback">Válido.</div>
                  <div class="invalid-feedback">Por favor llena este campo correctamente.</div>
                </div>
                <div class="col-md-4 mb-4">
                  <label class="form-label" for="nuevoStockRepuesto">Stock</label>
                  <input type="number" class="form-control" id="nuevoStockRepuesto" name="nuevoStockRepuesto" placeholder="0" autocomplete="off" required>
                  <div class="valid-feedback">Válido.</div>
                  <div class="invalid-feedback">Por favor llena este campo correctamente.</div>
                </div>
              </div>

              <div class="row">
                <div class="col-md-4 mb-4">
                  <label class="form-label" for="agregarMarcaVehiculo">Marca de Vehículo</label>
                  <div class="input-group">
                    <select class="form-select" id="agregarMarcaVehiculo" name="agregarMarcaVehiculo" required>
                      <option selected disabled>Elije una Marca</option>
                      <option value="1">Marca 1</option>
                      <option value="2">Marca 2</option>
                      <option value="3">Marca 3</option>
                    </select>
                    <button type="button" class="btn btn-sm btn-secondary js-bs-tooltip-enabled" data-bs-toggle="modal" data-bs-target="#modal-marcas" aria-label="Add" data-bs-original-title="Add">
                      <i class="fa fa-plus"></i>
                    </button>
                  </div>
                  <div class="valid-feedback">Válido.</div>
                  <div class="invalid-feedback">Por favor selecciona una marca de vehículo.</div>
                </div>
                <div class="col-md-4 mb-4">
                  <label class="form-label" for="agregarModeloVehiculo">Modelo de Vehículo</label>
                  <div class="input-group">
                    <select class="form-select" id="agregarModeloVehiculo" name="agregarModeloVehiculo" required>
                      <option selected disabled>Elije un Modelo</option>
                      <option value="1">Modelo 1</option>
                      <option value="2">Modelo 2</option>
                      <option value="3">Modelo 3</option>
                    </select>
                    <button type="button" class="btn btn-sm btn-secondary js-bs-tooltip-enabled" data-bs-toggle="modal" data-bs-target="#modal-modelos" aria-label="Add" data-bs-original-title="Add">
                      <i class="fa fa-plus"></i>
                    </button>
                  </div>
                  <div class="valid-feedback">Válido.</div>
                  <div class="invalid-feedback">Por favor selecciona un modelo de vehículo.</div>
                </div>

                <div class="col-md-4 mb-4">
                  <label class="form-label" for="agregarMotor">Motor de Vehículo</label>
                  <div class="input-group">
                    <select class="form-select" id="agregarMotor" name="agregarMotor" required>
                      <option selected disabled>Elije un Motor</option>
                      <option value="1">Motor 1</option>
                      <option value="2">Motor 2</option>
                      <option value="3">Motor 3</option>
                      <option value="4">Motor 4</option>
                      <option value="5">Motor 5</option>
                    </select>
                    <button type="button" class="btn btn-sm btn-secondary js-bs-tooltip-enabled" data-bs-toggle="modal" data-bs-target="#modal-motores" aria-label="Add" data-bs-original-title="Add">
                      <i class="fa fa-plus"></i>
                    </button>
                  </div>
                  <div class="valid-feedback">Válido.</div>
                  <div class="invalid-feedback">Por favor selecciona al menos un motor.</div>
                </div>
              </div>

              <div class="block-content block-content-full block-content-sm text-end border-top">
                <button type="button" class="btn btn-alt-secondary" onclick="window.location.href='/repuestos'">Volver</button>
                <button type="submit" class="btn btn-alt-primary">Guardar</button>
              </div>
              <?php
              // $crearRepuesto = new ControladorRepuestos();
              // $crearRepuesto->ctrCrearRepuesto();
              ?>
            </form>
          </div>
        </div>
      </div>
    </div>
  </div>
</main>


<!-- Modal Añadir categoria -->
<div class="modal" id="modal-categorias" tabindex="-1" role="dialog" aria-labelledby="modal-normal" aria-hidden="true" data-bs-backdrop="static" data-bs-keyboard="false">
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
        <form method="post" class="needs-validation" novalidate>
          <div class="block-content fs-sm">
            <div class="mb-4">
              <div class="input-group">
                <span class="input-group-text btn btn-outline-primary">Categoria</span>
                <input type="text" class="form-control" name="nuevaCategoria" onchange="validateJS(event,'text')" required autocomplete="categoria">
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

<!-- Modal Añadir Marca -->
<div class="modal" id="modal-marcas" tabindex="-1" role="dialog" aria-labelledby="modal-normal" aria-hidden="true" data-bs-backdrop="static" data-bs-keyboard="false">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="block block-rounded shadow-none mb-0">
        <div class="block-header block-header-default">
          <h3 class="block-title">Añadir Marca</h3>
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
                <input type="text" class="form-control  text-uppercase" name="nuevaMarca" onchange="validateJS(event,'text')" required autocomplete="Marca">
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
          $crearMarca = new ControladorMarcas();
          $crearMarca->ctrCrearMarca();
          ?>
        </form>

      </div>
    </div>
  </div>
</div>

<!-- Modal Añadir Modelo -->
<div class="modal" id="modal-modelos" tabindex="-1" role="dialog" aria-labelledby="modal-normal" aria-hidden="true" data-bs-backdrop="static" data-bs-keyboard="false">
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


<!-- Modal Añadir Motor -->
<div class="modal" id="modal-motores" tabindex="-1" role="dialog" aria-labelledby="modal-large" aria-hidden="true" data-bs-backdrop="static" data-bs-keyboard="false">
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