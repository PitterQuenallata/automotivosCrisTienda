<!-- Main Container -->
<main id="main-container">
  <!-- Page Content -->
  <div class="content">
    <div class="text-center mb-3">
      <h1 class="h3 fw-extrabold mb-1">Añadir Compras</h1>
      <h2 class="fs-sm fw-medium text-muted mb-0">Repuestos</h2>
    </div>

    <div class="row justify-content-center">
      <div class="col-12">
        <div class="row">

          <!-- Lado izquierdo form -->
          <!-- Formulario para Iniciar la Compra -->
          <div class="col-md-5">
            <div class="block block-rounded block-bordered">
              <div class="block-content">
                <form id="formIniciarCompra" class="formularioCompra">
                  <div class="row">
                    <div class="col-md-3 mb-4">
                      <label class="form-label" for="codigoCompra">COD.</label>
                      <input type="text" class="form-control" id="codigoCompra" name="codigoCompra" value="" readonly>
                    </div>
                    <div class="col-md-4 mb-4">
                      <label class="form-label" for="usuario">Usuario</label>
                      <input type="text" class="form-control" id="usuario" name="usuario" value="<?php echo $_SESSION["users"]["nombre_usuario"] ?>" readonly>
                      <input type="hidden" id="idUsuario" name="idUsuario" value="<?php echo $_SESSION["users"]["id_usuario"] ?>">
                    </div>

                    <div class="col-md-5 mb-4">
                      <label class="form-label" for="agregarProveedor">Proveedor</label>
                      <div class="input-group">
                        <select class="form-select" id="agregarProveedor" name="agregarProveedor" required>
                          <option selected value="">Elije un Proveedor</option>
                          <?php
                          $item = null;
                          $valor = null;
                          $proveedores = ControladorProveedores::ctrMostrarProveedores($item, $valor);
                          foreach ($proveedores as $key => $value) {
                            echo '<option value="' . $value["id_proveedor"] . '">' . $value["nombre_proveedor"] . '</option>';
                          }
                          ?>
                        </select>
                        <!-- Botón para agregar proveedor manualmente -->
                        <button type="button" class="btn btn-sm btn-secondary js-bs-tooltip-enabled" id="toggleDatosProveedor" data-bs-toggle="tooltip" aria-label="Añadir Proveedor Manual" data-bs-original-title="Añadir Proveedor Manual">
                          <i class="fa fa-plus"></i>
                        </button>
                      </div>
                      <div class="valid-feedback">Válido.</div>
                      <div class="invalid-feedback">Por favor selecciona un proveedor.</div>
                    </div>


                  </div>

                  <div id="datosProveedor" style="display:none;">
                    <div class="row">
                      <div class="col-md-6 mb-1">
                        <label class="form-label" for="nombreProveedor">Nombre Proveedor</label>
                        <input type="text" class="form-control" id="nombreProveedor" name="nombreProveedor" disabled>
                      </div>
                      <div class="col-md-6 mb-1">
                        <label class="form-label" for="nitProveedor">NIT/CI</label>
                        <input type="text" class="form-control" id="nitProveedor" name="nitProveedor">
                      </div>

                    </div>
                    <div class="row">
                      <div class="col-md-6 mb-4">
                        <label class="form-label" for="direccionProveedor">Dirección</label>
                        <input type="text" class="form-control" id="direccionProveedor" name="direccionProveedor">
                      </div>

                      <div class="col-md-6 mb-1 ">
                        <label class="form-label" for="celularProveedor">Celular</label>
                        <input type="text" class="form-control" id="celularProveedor" name="celularProveedor">
                      </div>
                    </div>
                  </div>


                  <!-- Repuestos a comprar añadidos -->
                  <div class="nuevaCompra"></div>
                  <!-- total de toda la compra -->
                  <div class="row">
                    <div class="col-md-12 mb-4">
                      <label class="form-label" for="compraTotal">Monto a pagar</label>
                      <div class="input-group">
                        <input type="text" class="form-control form-control-alt text-center" id="compraTotal" name="compraTotal">
                        <span class="input-group-text input-group-text-alt">BS</span>
                      </div>
                    </div>
                  </div>
                  <input type="hidden" id="listaRepuestos" name="listaRepuestos">

                  <input type="hidden" id="idProveedor" name="idProveedor">
                  <div class="block-content block-content-full block-content-sm text-end border-top">
                    <button type="button" class="btn btn-alt-primary" id="guardarCompra">Guardar Compra</button>
                  </div>
                </form>
              </div>
            </div>
          </div>

          <!-- Lado derecho tabla -->
          <div class="col-md-7">
            <div class="block block-rounded">
              <div class="block-content block-content-full">
                <div class="table-responsive">
                  <div class="d-flex align-items-center mb-3">
                    <a href="/crear-repuestos" class="btn btn-success me-1 mb-1">
                      <i class="fa fa-plus opacity-50 me-1"></i> Añadir Repuesto
                    </a>
                  </div>
                  <table id="tablaRepuestosCompra" class="table table-sm table-striped table-vcenter js-dataTable-responsive">
                    <thead>
                      <tr>
                        <th class="text-center" style="width: 50px;">N.</th>
                        <th class="text-center" style="width: 100px;">COD.</th>
                        <th>Nombre</th>
                        <th>Categoría</th>
                        <th>Marca</th>
                        <th>Stock</th>
                        <th>Precio</th>
                        <th class="text-center" style="width: 100px;">Acción</th>
                      </tr>
                    </thead>
                    <tbody>
                    </tbody>
                  </table>
                </div>
              </div>
            </div>
          </div>

        </div>
      </div>
    </div>
  </div>
</main>