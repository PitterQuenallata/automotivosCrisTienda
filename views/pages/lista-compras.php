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
              <table class="table table-sm table-striped table-vcenter js-dataTable-responsive">
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
                <tbody>
                  <?php
                  $item = null;
                  $valor = null;
                  $compras = ControladorCompras::ctrMostrarCompras($item, $valor);

                  foreach ($compras as $key => $compra) {
                    // Obtener nombre del proveedor
                    $itemProveedor = "id_proveedor";
                    $valorProveedor = $compra["id_proveedor"];
                    $proveedor = ControladorProveedores::ctrMostrarProveedores($itemProveedor, $valorProveedor);

                    // Obtener nombre del usuario
                    $itemUsuario = "id_usuario";
                    $valorUsuario = $compra["id_usuario"];
                    $usuario = ControladorUsuarios::ctrMostrarUsuarios($itemUsuario, $valorUsuario);


                    echo '
                <tr>
                    <th class="text-center" scope="row">' . ($key + 1) . '</th>
                    <td class="text-center">' . $compra["id_compra"] . '</td>
                    <td class="text-center">' . $compra["fecha_compra"] . '</td>
                    <td>' . $proveedor["nombre_proveedor"] . '</td>
                    <td>' . $usuario["nombre_usuario"] . '</td>
                    <td class="text-center">' . $compra["monto_total_compra"] . " " . "BS" . '</td>
                    <td class="text-center">
                        <div class="btn-group">
                            <button type="button" class="btn btn-sm btn-secondary js-bs-tooltip-enabled btnVerDetalleCompra" data-idCompra="' . $compra["id_compra"] . '" data-bs-toggle="modal" data-bs-target="#modalDetalleCompra" aria-label="Detail" data-bs-original-title="Detail">
                                <i class="fa fa-eye"></i>
                            </button>

                            <button type="button" class="btn btn-sm btn-secondary js-bs-tooltip-enabled btnEditarCompra" idCompra="' . $compra["id_compra"] . '" data-bs-target="#modalEditarCompra" data-bs-toggle="modal" aria-label="Edit" data-bs-original-title="Edit">
                                <i class="fa fa-pencil-alt"></i>
                            </button>
                            <button type="button" class="btn btn-sm btn-secondary js-bs-tooltip-enabled btnEliminarCompra" idCompra="' . $compra["id_compra"] . '" data-bs-toggle="tooltip" aria-label="Delete" data-bs-original-title="Delete">
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
                    <th class="text-center">COD.</th>
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
    <div class="modal-dialog modal-lg" role="document">
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
                <div class="block-content fs-sm">
                    <form id="formEditarDetalleCompra">
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
                        <div class="form-group">
                            <label for="editRepuestoSelect">Repuesto</label>
                            <select class="form-control" id="editRepuestoSelect" name="id_repuesto" required>
                                <!-- Opciones de repuestos llenadas dinámicamente -->
                            </select>
                        </div>
                        <button type="submit" class="btn btn-primary">Guardar Cambios</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>





<!-- Modal Editar Compra -->
<div class="modal" id="modalEditarCompra" tabindex="-1" role="dialog" aria-labelledby="modal-normal" aria-hidden="true">
  <div class="modal-dialog modal-lg" role="document">
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
        <div class="block-content fs-sm">
          <form id="formEditarCompra">
            <input type="hidden" id="editIdCompraF" name="id_compra" value="">
            <div class="form-group">
              <label for="editFechaCompra">Fecha Compra</label>
              <input type="date" class="form-control" id="editFechaCompra" name="fecha_compra" required>
            </div>
            <div class="form-group">
              <label for="editProveedorSelect">Proveedor</label>
              <select class="form-control" id="editProveedorSelect" name="id_proveedor" required>
                <!-- Opciones de proveedores llenadas dinámicamente -->
              </select>
            </div>
            <div class="form-group">
              <label for="editMontoTotal">Monto Total</label>
              <input type="number" step="0.01" class="form-control" id="editMontoTotal" name="monto_total_compra" required>
            </div>
            <div class="form-group text-end">
              <button type="submit" class="btn btn-primary">Guardar Cambios</button>
            </div>
          </form>
        </div>
      </div>
    </div>
  </div>
</div>




  </div>
</main>

