<?php

if (isset($_GET["fechaInicio"])) {
    $fechaInicial = $_GET["fechaInicio"];
    $fechaFinal = $_GET["fechaFin"];
    $ventas = ControladorListasVentas::ctrRangoFechasVentas($fechaInicial, $fechaFinal);
} else {
    $item = null;
    $valor = null;
    $ventas = ControladorListasVentas::ctrMostrarVentas($item, $valor);
}

$dataVentas = [];
$labels = [];

$ventasDiarias = 0;
$ventasSemanales = 0;
$ventasMensuales = 0;

$hoy = new DateTime();
$inicioSemana = new DateTime('last Sunday');
$inicioMes = new DateTime('first day of this month');

foreach ($ventas as $key => $value) {
    $fechaVenta = new DateTime($value['date_created_venta']);
    $labels[] = $value['date_created_venta'];
    $dataVentas[] = $value['monto_total_venta'];

    if ($fechaVenta->format('Y-m-d') == $hoy->format('Y-m-d')) {
        $ventasDiarias += $value['monto_total_venta'];
    }

    if ($fechaVenta >= $inicioSemana) {
        $ventasSemanales += $value['monto_total_venta'];
    }

    if ($fechaVenta >= $inicioMes) {
        $ventasMensuales += $value['monto_total_venta'];
    }
}

$dataVentasJson = json_encode($dataVentas);
$labelsJson = json_encode($labels);

?>

<div class="block block-rounded">
  <div class="block-header">
    <h3 class="block-title">
      Sales <small>This week</small>
    </h3>
    <div class="block-options">
      <button type="button" class="btn-block-option" data-toggle="block-option" data-action="state_toggle" data-action-mode="demo">
        <i class="si si-refresh"></i>
      </button>
      <button type="button" class="btn-block-option">
        <i class="si si-wrench"></i>
      </button>
    </div>
  </div>
  <div class="block-content p-1 bg-body-light">
    <canvas id="js-chartjs-dashboard-lines" style="height: 290px; display: block; box-sizing: border-box; width: 580px;" width="580" height="290"></canvas>
  </div>
  <div class="block-content">
    <div class="row items-push">
      <div class="col-6 col-sm-4 text-center text-sm-start">
        <div class="fs-sm fw-semibold text-uppercase text-muted">Ventas Diarias</div>
        <div class="fs-4 fw-semibold"><?php echo $ventasDiarias; ?></div>
        <div class="fw-semibold text-success">
          <i class="fa fa-caret-up"></i> +16%
        </div>
      </div>
      <div class="col-6 col-sm-4 text-center text-sm-start">
        <div class="fs-sm fw-semibold text-uppercase text-muted">Ventas Semanales</div>
        <div class="fs-4 fw-semibold"><?php echo $ventasSemanales; ?></div>
        <div class="fw-semibold text-danger">
          <i class="fa fa-caret-down"></i> -3%
        </div>
      </div>
      <div class="col-12 col-sm-4 text-center text-sm-start">
        <div class="fs-sm fw-semibold text-uppercase text-muted">Ventas Mensuales</div>
        <div class="fs-4 fw-semibold"><?php echo $ventasMensuales; ?></div>
        <div class="fw-semibold text-success">
          <i class="fa fa-caret-up"></i> +9%
        </div>
      </div>
    </div>
  </div>
</div>

<script>
  // Obtener los datos de ventas desde PHP
  var dataVentas = <?php echo $dataVentasJson; ?>;
  var labels = <?php echo $labelsJson; ?>;

  // Configurar el gráfico de Chart.js
  var ctx = document.getElementById('js-chartjs-dashboard-lines').getContext('2d');
  var myChart = new Chart(ctx, {
    type: 'line',
    data: {
      labels: labels,
      datasets: [{
        label: 'Ventas',
        data: dataVentas,
        borderColor: 'rgba(75, 192, 192, 1)',
        backgroundColor: 'rgba(75, 192, 192, 0.2)',
        borderWidth: 1
      }]
    },
    options: {
      scales: {
        x: {
          beginAtZero: true
        },
        y: {
          beginAtZero: true
        }
      },
      responsive: true,
      plugins: {
        legend: {
          position: 'top',
        },
        title: {
          display: true,
          text: 'Gráfico de Ventas'
        }
      }
    }
  });
</script>
