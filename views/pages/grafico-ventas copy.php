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

foreach ($ventas as $key => $value) {
  // echo "<pre>";
  // var_dump($value);
  // echo "</pre>";
  $dataVentas[] = [
    'date' => $value['date_created_venta'],
    'sales' => $value['monto_total_venta']
  ];
}

$dataVentasJson = json_encode($dataVentas);

?>

<div class="box box-solid bg-teal-gradient">
  <div class="box-header">
    <i class="fa fa-th"></i>
    <h4 class="box-title">Gráfico de Ventas</h4>
  </div>
  <div class="box-body border-radius-none nuevoGraficoVentas">
    <div class="chart" id="line-chart-ventas" style="height: 250px;"></div>
  </div>
</div>

<script>
  // Obtener los datos de ventas desde PHP
  var dataVentas = <?php echo $dataVentasJson; ?>;
  
  // Configurar el gráfico de Morris
  new Morris.Line({
    element: 'line-chart-ventas',
    data: dataVentas,
    xkey: 'date',
    ykeys: ['sales'],
    labels: ['Ventas'],
    lineColors: ['#0b62a4'],
    hideHover: 'auto',
    resize: true,
    parseTime: false // Si los datos no están en un formato de tiempo estándar
  });
</script>
