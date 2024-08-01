<?php
// echo '<pre>';
// 		print_r($_SESSION["users"]);
// 		echo '</pre>';

?>
3 <script src="//cdnjs.cloudflare.com/ajax/libs/raphael/2.1.0/raphael-min.js"></script>
<!-- Main Container -->
<main id="main-container">
  <!-- Page Content -->
  <div class="content ">
    <div class="text-center mb-3">
      <h1 class="h3 fw-extrabold mb-1">Reportes</h1>
      <h2 class="fs-sm fw-medium text-muted mb-0">Ventas</h2>
    </div>
    <div class="row justify-content-center">
      <div class="col-10">
        <!--  Rango fecha -->
        <div class="row justify-content-center">
          <div class="col-auto mb-4">
            <div class="d-flex justify-content-center align-items-center">
              <div class="form-check me-0">
                <input class="form-check-input" type="checkbox" value="" id="activeRangoFechaReport" name="activeRangoFechaReport">
              </div>
              <label class="form-check-label" for="activeRangoFechaReport" id="laberCheckFecha">Rango por Fechas</label>
            </div>
            <div class="pull-right openscenter"">
            <div id="daterange-btn-report" class="openscenter" style="background: #fff; cursor: pointer; padding: 5px 10px; border: 1px solid #ccc; display: none; margin-top: 10px;">
              <i class="fa fa-calendar"></i>&nbsp;
              <span>Rango de Fechas <i class="fa fa-caret-down ms-1"></i></span>
            </div>
            </div>

          </div>
        </div>
        <!--  Fin Rango fecha -->

        <div class="row">
          <div class="col-6">
            <!-- <div class="block block-rounded">
              <div class="block-content"> -->
                <?php
                include "grafico-ventas.php";
                ?>
              <!-- </div>
            </div> -->
          </div>
        </div>


      </div>
    </div>

  </div>
  <!-- END Page Content -->
</main>
<!-- END Main Container -->