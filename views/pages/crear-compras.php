<!-- Main Container -->
<main id="main-container">
  <!-- Page Content -->
  <div class="content">
    <div class="text-center mb-3">
      <h1 class="h3 fw-extrabold mb-1">Añadir Compras</h1>
      <h2 class="fs-sm fw-medium text-muted mb-0">Repuestos</h2>
    </div>
    
    <div class="row justify-content-center">
      <div class="col-11">
        <div class="row">
          <!-- Lado izquierdo form -->
          <div class="col-md-5">
            <div class="block block-rounded block-bordered">
              <div class="block-content">
                <!-- Formulario para Iniciar la Compra -->
                <form id="formIniciarCompra">
                  <div class="form-group">
                    <label for="proveedorSelect">Proveedor</label>
                    <select class="form-control" id="proveedorSelect" name="proveedor" required>
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
                    <div class="invalid-feedback">Por favor selecciona un proveedor.</div>
                  </div>
                  <div class="form-group mb-2">
                    <label for="fechaCompra">Fecha de Compra</label>
                    <input type="date" class="form-control" id="fechaCompra" name="fecha" required>
                    <div class="invalid-feedback">Por favor selecciona una fecha.</div>
                  </div>

                  <div class="progress mb-2" style="height: 5px;" role="progressbar" aria-valuenow="100" aria-valuemin="0" aria-valuemax="100">
                    <div class="progress-bar bg-success" style="width: 100%"></div>
                  </div>

                  <div class="form-group">
                    <label for="repuestoSelect">Repuesto</label>
                    <select class="form-select" id="repuestoSelect" name="repuesto" required>
                      <option selected disabled>Elije un Repuesto</option>
                      <?php
                      $item = null;
                      $valor = null;
                      $repuestos = ControladorRepuestos::ctrMostrarRepuestos($item, $valor);
                      foreach ($repuestos as $key => $value) {
                        echo '<option value="' . $value["id_repuesto"] . '">' . $value["nombre_repuesto"] . '</option>';
                      }
                      ?>
                    </select>
                    <div class="invalid-feedback">Por favor, seleccione un repuesto.</div>
                  </div>
                  <div class="row form-group mb-3">
                    <div class="col-6 border-end">
                      <label class="form-label" for="precioRepuesto">Precio Unitario</label>
                      <div class="input-group input-group-lg">
                        <input type="number" step="0.01" class="form-control" id="precioRepuesto" name="precio" min="0.01" required placeholder="0.00">
                        <span class="input-group-text fw-semibold">BS</span>
                        <div class="valid-feedback">Válido.</div>
                        <div class="invalid-feedback">Por favor llena este campo correctamente.</div>
                      </div>
                    </div>
                    <div class="col-6">
                      <label class="form-label" for="cantidadRepuesto">Cantidad</label>
                      <div class="input-group input-group-lg">
                        <input type="number" class="form-control" id="cantidadRepuesto" name="cantidad" min="1" required placeholder="0">
                        <div class="valid-feedback">Válido.</div>
                        <div class="invalid-feedback">Por favor llena este campo correctamente.</div>
                      </div>
                    </div>
                  </div>
                  <div class="block-content block-content-full block-content-sm text-end border-top">
                    <button type="button" class="btn btn-alt-primary" id="añadirRepuesto">Añadir Repuesto</button>
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
                  <h3 class="block-title">Detalle Compra (Repuesto)</h3>
                  <table class="table table-borderless table-striped mb-0" id="tablaDetallesCompra">
                    <thead>
                      <tr>
                        <th>ID</th>
                        <th>Repuesto</th>
                        <th>Cantidad</th>
                        <th class="text-end">Precio</th>
                        <th class="text-end">Total</th>
                        <th></th>
                      </tr>
                    </thead>
                    <tbody>
                      <!-- Detalles añadidos aparecerán aquí -->
                    </tbody>
                    <tfoot>
                      <tr class="table-success">
                        <td colspan="4" class="text-end fw-semibold text-uppercase">Total</td>
                        <td class="text-end fw-semibold" id="totalCompra">0,00 BS</td>
                      </tr>
                    </tfoot>
                  </table>
                </div>
              </div>
              <div class="block-content block-content-full block-content-sm text-end border-top">
                <button type="button" class="btn btn-alt-secondary" id="limpiarTabla" >Limpiar</button>
                <button type="button" class="btn btn-alt-primary" id="confirmarCompra">Confirmar Compra</button>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</main>
