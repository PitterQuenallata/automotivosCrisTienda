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
                  Lista de Compras
                </h2>
              </div>
            </div>
          </div>

          <div class="block block-rounded">
            <div class="block-header block-header-default">
              <button type="button" class="btn btn-success me-1 mb-1" onclick="window.location.href='/crear-compras'">
                <i class="fa fa-plus opacity-50 me-1"></i> Añadir Compra
              </button>
            </div>

            <div class="block-content block-content-full overflow-x-auto">
              <table id="tablaCompras" class="table table-sm table-striped table-vcenter js-dataTable-responsive">
                <thead>
                  <tr>
                    <th class="text-center" style="width: 50px;">N.</th>
                    <th class="text-center" style="width: 100px;">COD.</th>
                    <th class="text-center">Fecha</th>
                    <th>Proveedor</th>
                    <th>Usuario</th>
                    <th class="text-center">Total</th>
                    <th class="text-center" style="width: 100px;">Actions</th>
                  </tr>
                </thead>
                <tbody></tbody>
              </table>
            </div>
          </div>

        </div>
      </div>
    </div>
  </div>
</main>




<!-- Modal Detalle Compra -->
<div class="modal" id="modalDetalleCompra" tabindex="-1" role="dialog" aria-labelledby="modal-normal" aria-hidden="true">
  <div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">
      <div class="block block-rounded shadow-none mb-0">
        <div class="block-header block-header-default">
          <h3 class="block-title">Detalles de la Compra</h3>
          <div class="block-options">
            <button type="button" class="btn-block-option" data-bs-dismiss="modal" aria-label="Close">
              <i class="fa fa-times"></i>
            </button>
          </div>
        </div>
        <div class="block-content fs-sm">
          <table class="table table-sm table-striped">
            <thead>
              <tr>
                <th class="text-center">N.</th>
                <th>Repuesto</th>
                <th>Cantidad</th>
                <th>Precio Unitario</th>
                <th>Total</th>
                <th class="text-center">Acciones</th>
              </tr>
            </thead>
            <tbody id="detalleCompraBody">
              <!-- Detalles de la compra serán insertados aquí -->
            </tbody>
          </table>
        </div>
      </div>
    </div>
  </div>
</div>

<!-- Modal Editar Detalle -->
<div class="modal fade" id="modalEditarDetalle" tabindex="-1" role="dialog" aria-labelledby="modal-normal" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="block block-rounded shadow-none mb-0">
        <div class="block-header block-header-default">
          <h3 class="block-title">Editar Detalle de Compra</h3>
          <div class="block-options">
            <button type="button" class="btn-block-option" data-bs-dismiss="modal" aria-label="Close">
              <i class="fa fa-times"></i>
            </button>
          </div>
        </div>

        <form id="formEditarDetalleCompra">
          <div class="block-content fs-sm">

            <input type="hidden" id="editIdDetalle" name="id_detalle_compra">
            <input type="hidden" id="editIdCompra" name="id_compra"> <!-- Campo oculto para id_compra -->
            <div class="form-group">
              <label for="editCantidadDetalle">Cantidad</label>
              <input type="number" class="form-control" id="editCantidadDetalle" name="cantidad_detalleCompra" required>
            </div>
            <div class="form-group">
              <label for="editPrecioUnitarioDetalle">Precio Unitario</label>
              <input type="number" class="form-control" id="editPrecioUnitarioDetalle" name="precio_unitario" step="0.01" required>
            </div>
            <div class="form-group mb-3">
              <label for="editRepuestoSelect">Repuesto</label>
              <select class="form-control" id="editRepuestoSelect" name="id_repuesto" required>
                <!-- Opciones de repuestos llenadas dinámicamente -->
              </select>
            </div>
          </div>
          <div class="block-content block-content-full block-content-sm text-end border-top">
            <button type="button" class="btn btn-alt-secondary" data-bs-dismiss="modal">
              Regresar
            </button>
            <button type="submit" class="btn btn-alt-primary">
              Guardar
            </button>
          </div>
        </form>
      </div>
    </div>
  </div>
</div>







<!-- Modal Editar Compra -->
<div class="modal" id="modalEditarCompra" tabindex="-1" role="dialog" aria-labelledby="modal-normal" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="block block-rounded shadow-none mb-0">
        <div class="block-header block-header-default">
          <h3 class="block-title">Editar Compra</h3>
          <div class="block-options">
            <button type="button" class="btn-block-option" data-bs-dismiss="modal" aria-label="Close">
              <i class="fa fa-times"></i>
            </button>
          </div>
        </div>
        <form id="formEditarCompra">
          <div class="block-content fs-sm">

            <input type="hidden" id="editIdCompraF" name="id_compra" value="">
            <div class="form-group mb-3">
              <label for="editProveedorSelect">Proveedor</label>
              <select class="form-control" id="editProveedorSelect" name="id_proveedor" required>
                <!-- Opciones de proveedores llenadas dinámicamente -->
              </select>
            </div>
          </div>
          <div class="block-content block-content-full block-content-sm text-end border-top">
            <button type="button" class="btn btn-alt-secondary" data-bs-dismiss="modal">
              Regresar
            </button>
            <button type="submit" class="btn btn-alt-primary">
              Guardar
            </button>
          </div>
        </form>
      </div>
    </div>
  </div>
</div>
