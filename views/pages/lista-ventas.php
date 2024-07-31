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
                  Lista de Ventas
                </h2>
              </div>
            </div>
          </div>


          <div class="block">
            <div class="block-header block-header-default">
              <button type="button" class="btn btn-success me-1 mb-1" onclick="window.location.href='/crear-ventas'">
                <i class="fa fa-plus opacity-50 me-1"></i> Añadir Compra
              </button>

              <div class="d-flex align-items-center me-auto">
                <div class="form-check me-3">
                  <input class="form-check-input" type="checkbox" value="" id="activeRangoFecha" name="activeRangoFecha">
                  <label class="form-check-label" for="activeRangoFecha">Rango de Fecha</label>
                </div>
                <div id="daterange-btn" style="background: #fff; cursor: pointer; padding: 5px 10px; border: 1px solid #ccc; display: none;">
                  <i class="fa fa-calendar"></i>&nbsp;
                  <span></span> <i class="fa fa-caret-down"></i>
                </div>
              </div>

              <div class="items-push ms-auto">
                <div class="dropdown">
                  <button type="button" class="btn btn-alt-primary dropdown-toggle" id="dropdown-align-alt-primary" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="true">
                    Tablas
                  </button>
                  <div class="dropdown-menu dropdown-menu-end fs-sm" aria-labelledby="dropdown-align-alt-primary">
                    <a class="dropdown-item" href="javascript:void(0)" onclick="mostrarTabla('ventasRealizadas')">Tabla Ventas</a>
                    <a class="dropdown-item" href="javascript:void(0)" onclick="mostrarTabla('detalleVentasRealizadas')">Tabla Detalle Ventas</a>
                  </div>
                </div>
              </div>
            </div>
          </div>



          <?php
          if (isset($_GET["action"])) {
            if ($_GET["action"] == "ventasRealizadas") {
              include "lista-ventas-ventas.php";
            } else if ($_GET["action"] == "detalleVentasRealizadas") {
              include "lista-ventas-detalle.php";
            }
          } else {
            include "lista-ventas-ventas.php";
          }
          ?>

        </div>
      </div>
    </div>
  </div>
</main>