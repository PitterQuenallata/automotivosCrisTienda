<!-- Main Container -->
<main id="main-container">
  <!-- Page Content -->
  <div class="content">
    <div class="text-center mb-3">
      <h1 class="h3 fw-extrabold mb-1">Añadir Ventas</h1>
      <h2 class="fs-sm fw-medium text-muted mb-0">Repuestos</h2>
    </div>

    <div class="row justify-content-center">
      <div class="col-12">
        <div class="row">
          <!-- Lado izquierdo -->
          <div class="col-4">
            <div class="row">
              <div class="block block-rounded block-bordered">
                <div class="block-content">
                  <form id="formIniciarVenta" class="formularioVenta" method="post">
                    <div class="row">
                      <div class="col-md-5 mb-2">
                        <label class="form-label" for="codigoVenta">COD.</label>
                        <input type="text" class="form-control" id="codigoVenta" name="codigoVenta" value="" readonly>
                      </div>
                      <div class="col-md-6 mb-2">
                        <label class="form-label" for="usuario">Usuario</label>
                        <input type="text" class="form-control" id="usuario" name="usuario" value="<?php echo $_SESSION["users"]["nombre_usuario"] ?>" readonly>
                        <input type="hidden" id="idUsuario" name="idUsuario" value="<?php echo $_SESSION["users"]["id_usuario"] ?>">
                      </div>
                    </div>

                    <div class="row">
                      <div class="col-md-5 mb-2">
                        <label class="form-label" for="nombreCliente">Cliente</label>
                        <input type="text" class="form-control" id="nombreCliente" name="nombreCliente">
                      </div>
                      <div class="col-md-4 mb-2">
                        <label class="form-label" for="nitCliente">NIT/CI</label>
                        <input type="text" class="form-control" id="nitCliente" name="nitCliente">
                      </div>
                      <div class="col-md-3 mb-2">
                        <label class="form-label" for="celularCliente">Celular</label>
                        <input type="text" class="form-control" id="celularCliente" name="celularCliente">
                      </div>
                    </div>
                    <span>Repuestos</span>

                    <!-- Repuestos a ser vendidos -->
                    <div class="nuevaVenta"></div>
                    <!-- total de toda la compra -->
                    <div class="row">
                      <div class="col-md-12 mb-4">
                        <label class="form-label" for="VentaTotal">Monto a pagar</label>
                        <div class="input-group">
                          <input type="text" class="form-control form-control-alt text-center" id="VentaTotal" name="VentaTotal" readonly>
                          <span class="input-group-text input-group-text-alt">BS</span>
                        </div>
                      </div>
                    </div>
                    <input type="hidden" id="listaRepuestosVenta" name="listaRepuestosVenta">

                    <div class="block-content block-content-full block-content-sm text-end border-top">
                      <button type="submit" class="btn btn-alt-primary" id="guardarVenta">Vender</button>
                    </div>
                  </form>
                </div>
              </div>
            </div>
          </div>

          <!-- Lado derecho tabla -->
          <div class="col-md-8">
            <div class="block block-rounded">
              <div class="block-content block-content-full">
                <div class="table-responsive">
                  <h3 class="block-title">Repuestos Disponibles</h3>
                  <table id="tablaVentas" class="table table-sm table-striped table-vcenter js-dataTable-responsive">
                    <thead>
                      <tr>
                        <th class="text-center" style="width: 50px;">N.</th>
                        <th class="text-center" style="width: 100px;">COD.</th>
                        <th>Nombre</th>
                        <th>Descripción</th>
                        <th>Precio</th>
                        <th class="text-center" style="width: 100px;">Stock</th>
                        <th>Categoría</th>
                        <th>Marca</th>
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