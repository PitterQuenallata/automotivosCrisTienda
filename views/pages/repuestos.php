  <!-- Main Container -->
  <main id="main-container">
    <!-- Page Content -->
    <div class="content">
      <div class="row justify-content-center">
        <div class="col-11">
          <div class="text-center mb-3">
            <h1 class="h3 fw-extrabold mb-1">Lista de Repuestos</h1>
          </div>

          <div class="row">
            <!-- Filtros -->
            <!-- <div class="col-lg-3 col-md-12 mb-2">
              <div class="block block-rounded">
                <div class="block-header block-header-default mb-0 d-flex justify-content-between align-items-center">
                  <h3 class="block-title">Filtros</h3>
                  <button class="btn btn-link text-danger" type="button">
                    <i class="fa fa-arrow-rotate-left"></i> Resetear Filtro
                  </button>
                </div>
                <div class="block-content pt-1">
                  <form id="filtros-form">
                    <div class="mb-4">
                      <label class="form-label" for="select-marca">Marca</label>
                      <select class="form-select" id="select-marca" name="select-marca" onchange="updateModelos()">
                        <option selected="">Seleccionar Marca</option>
                        <option value="1">Marca 1</option>
                        <option value="2">Marca 2</option>
                        <option value="3">Marca 3</option>
                      </select>
                    </div>
                    <div class="mb-4">
                      <label class="form-label" for="select-modelo">Modelo</label>
                      <select class="form-select" id="select-modelo" name="select-modelo">
                        <option selected="">Seleccionar Modelo</option>
                        
                      </select>
                    </div>
                    <div class="mb-4">
                      <label class="form-label" for="select-motor">Motor</label>
                      <select class="form-select" id="select-motor" name="select-motor">
                        <option selected="">Seleccionar Motor</option>
                        <option value="1">Motor 1</option>
                        <option value="2">Motor 2</option>
                        <option value="3">Motor 3</option>
                      </select>
                    </div>
                    <div class="mb-4">
                      <label class="form-label" for="select-estado">Estado</label>
                      <select class="form-select" id="select-estado" name="select-estado">
                        <option selected="">Seleccionar Estado</option>
                        <option value="1">Activo</option>
                        <option value="2">Desactivado</option>
                      </select>
                    </div>
                  </form>
                </div>
              </div>
            </div> -->

            <!-- Tabla de Repuestos -->
            <div class="">
              <div class="block block-rounded">
                <div class="block-content block-content-full overflow-x-auto">
                  <div class="d-flex align-items-center mb-3">
                    <a href="/crear-repuestos" class="btn btn-success me-1 mb-1">
                      <i class="fa fa-plus opacity-50 me-1"></i> Añadir Repuesto
                    </a>
                  </div>
                  <div class="row mt-2 justify-content-between">
                    <div class="col-md-auto me-auto">
                      <div class="dt-buttons btn-group flex-wrap">
                        <button class="btn btn-sm btn-primary buttons-copy buttons-html5" tabindex="0" type="button"><span>Copy</span></button>
                        <button class="btn btn-sm btn-primary buttons-excel buttons-html5" tabindex="0" type="button"><span>Excel</span></button>
                        <button class="btn btn-sm btn-primary buttons-csv buttons-html5" tabindex="0" type="button"><span>CSV</span></button>
                        <button class="btn btn-sm btn-primary buttons-pdf buttons-html5" tabindex="0" type="button"><span>PDF</span></button>
                        <button class="btn btn-sm btn-primary buttons-print" tabindex="0" type="button"><span>Print</span></button>
                      </div>
                    </div>
                  </div>
                  <div class="table-responsive">
                    <table id="tablaRepuestos" class="table table-sm table-striped table-vcenter js-dataTable-responsive">
                      <thead>
                        <tr>
                          <th class="text-center" style="width: 50px;">N.</th>
                          <th class="text-center" style="width: 100px;">COD.</th>
                          <th>REPUESTO</th>
                          <th>DESCRIPCIÓN</th>
                          <th>P. COMPRA</th>
                          <th>PRECIO</th>
                          <th>Marca</th>
                          <th>Marca V.</th>
                          <th>Modelo V.</th>
                          <th>Motor</th>
                          <th>Stock</th>
                          <th>CATEGORIA</th>
                          <th>ESTADO</th>
                          <th class="text-center" style="width: 100px;">Acciones</th>
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