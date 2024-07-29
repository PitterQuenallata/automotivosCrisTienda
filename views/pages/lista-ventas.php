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
              <div class="items-push">
                <div class="col-sm-6 text-end">
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