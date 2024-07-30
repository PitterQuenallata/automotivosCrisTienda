<?php

require_once "../../../controllers/listasVentas.controller.php";
require_once "../../../models/listasVentas.model.php";

class imprimirrecibo {

  public $id_venta;

  public function traerImpresionrecibo() {

    // TRAEMOS LA INFORMACIÓN DE LA VENTA
    $itemVenta = "id_venta";
    $valorVenta = $this->id_venta;

    $respuestaVenta = ControladorListasVentas::ctrMostrarVenta($itemVenta, $valorVenta);

    $fecha = substr($respuestaVenta["date_updated_venta"], 0, 10);
    $total = number_format($respuestaVenta["monto_total_venta"], 2);
    $codigoVenta = $respuestaVenta["codigo_venta"];

    // TRAEMOS LA INFORMACIÓN DEL CLIENTE
    $itemCliente = "id_cliente";
    $valorCliente = $respuestaVenta["id_cliente"];

    $respuestaCliente = ControladorListasVentas::ctrMostrarCliente($itemCliente, $valorCliente);
    $nombreCliente = isset($respuestaCliente['nombre_cliente']) ? $respuestaCliente['nombre_cliente'] : 'SIN';

    // TRAEMOS LA INFORMACIÓN DEL VENDEDOR
    $itemVendedor = "id_usuario";
    $valorVendedor = $respuestaVenta["id_usuario"];

    $respuestaVendedor = ControladorListasVentas::ctrMostrarUsuario($itemVendedor, $valorVendedor);
    $nombreVendedor = isset($respuestaVendedor['nombre_usuario']) ? $respuestaVendedor['nombre_usuario'] : 'SIN';

    // TRAEMOS LOS DETALLES DE LA VENTA
    $itemDetalle = "id_venta";
    $valorDetalle = $respuestaVenta["id_venta"];

    $respuestaDetalles = ControladorListasVentas::ctrMostrarDetalleVentas($itemDetalle, $valorDetalle);

    // REQUERIMOS LA CLASE TCPDF
    require_once('tcpdf_include.php');

    $pdf = new TCPDF(PDF_PAGE_ORIENTATION, PDF_UNIT, PDF_PAGE_FORMAT, true, 'UTF-8', false);

    $pdf->startPageGroup();
    $pdf->AddPage();

    // ---------------------------------------------------------
    $bloque1 = <<<EOF
    <table>
      <tr>
        <td style="width:150px"><img src="images/iconCrisBlack.png"></td>
        <td style="background-color:white; width:140px">
          <div style="font-size:8.5px; text-align:right; line-height:15px;">
            <br>NIT: 71.759.963-9
            <br>Dirección: Calle 44B 92-11
          </div>
        </td>
        <td style="background-color:white; width:140px">
          <div style="font-size:8.5px; text-align:right; line-height:15px;">
            <br>Teléfono: 65139423
            <br>benjamincanavirirojas@gmail.com
          </div>
        </td>
        <td style="background-color:white; width:110px; text-align:center; color:red"><br><br>RECIBO N.<br>$codigoVenta</td>
      </tr>
    </table>
    EOF;

    $pdf->writeHTML($bloque1, false, false, false, false, '');

    // ---------------------------------------------------------
    $bloque2 = <<<EOF
    <table>
      <tr>
        <td style="width:540px"><img src="images/back.jpg"></td>
      </tr>
    </table>
    <table style="font-size:10px; padding:5px 10px;">
      <tr>
        <td style="border: 1px solid #666; background-color:white; width:390px">
          Cliente: {$nombreCliente}
        </td>
        <td style="border: 1px solid #666; background-color:white; width:150px; text-align:right">
          Fecha: $fecha
        </td>
      </tr>
      <tr>
        <td style="border: 1px solid #666; background-color:white; width:540px">Vendedor: {$nombreVendedor}</td>
      </tr>
      <tr>
        <td style="border-bottom: 1px solid #666; background-color:white; width:540px"></td>
      </tr>
    </table>
    EOF;

    $pdf->writeHTML($bloque2, false, false, false, false, '');

    // ---------------------------------------------------------
    $bloque3 = <<<EOF
    <table style="font-size:10px; padding:5px 10px;">
      <tr>
        <td style="border: 1px solid #666; background-color:white; width:260px; text-align:center">Producto</td>
        <td style="border: 1px solid #666; background-color:white; width:80px; text-align:center">Cantidad</td>
        <td style="border: 1px solid #666; background-color:white; width:100px; text-align:center">Valor Unit.</td>
        <td style="border: 1px solid #666; background-color:white; width:100px; text-align:center">Valor Total</td>
      </tr>
    </table>
    EOF;

    $pdf->writeHTML($bloque3, false, false, false, false, '');

    // ---------------------------------------------------------
    foreach ($respuestaDetalles as $detalle) {
      if ($detalle["id_venta"] == $this->id_venta) {
        $itemRepuesto = "id_repuesto";
        $valorRepuesto = $detalle["id_repuesto"];

        $respuestaRepuesto = ControladorListasVentas::ctrMostrarRepuesto($itemRepuesto, $valorRepuesto);
        $valorUnitario = number_format($detalle["precio_unitario_detalleVenta"], 2);
        $precioTotal = number_format($detalle["precio_unitario_detalleVenta"] * $detalle["cantidad_detalleVenta"], 2);

        $bloque4 = <<<EOF
        <table style="font-size:10px; padding:5px 10px;">
          <tr>
            <td style="border: 1px solid #666; color:#333; background-color:white; width:260px; text-align:center">
              {$respuestaRepuesto['nombre_repuesto']}
            </td>
            <td style="border: 1px solid #666; color:#333; background-color:white; width:80px; text-align:center">
              {$detalle['cantidad_detalleVenta']}
            </td>
            <td style="border: 1px solid #666; color:#333; background-color:white; width:100px; text-align:center">$
              $valorUnitario
            </td>
            <td style="border: 1px solid #666; color:#333; background-color:white; width:100px; text-align:center">$
              $precioTotal
            </td>
          </tr>
        </table>
        EOF;

        $pdf->writeHTML($bloque4, false, false, false, false, '');
      }
    }

    // ---------------------------------------------------------
    $bloque5 = <<<EOF
    <table style="font-size:10px; padding:5px 10px;">
      <tr>
        <td style="color:#333; background-color:white; width:340px; text-align:center"></td>
        <td style="border-bottom: 1px solid #666; background-color:white; width:100px; text-align:center"></td>
        <td style="border-bottom: 1px solid #666; color:#333; background-color:white; width:100px; text-align:center"></td>
      </tr>
      <tr>
        <td style="border-right: 1px solid #666; color:#333; background-color:white; width:340px; text-align:center"></td>
        <td style="border: 1px solid #666;  background-color:white; width:100px; text-align:center">
          Total:
        </td>
        <td style="border: 1px solid #666; color:#333; background-color:white; width:100px; text-align:center">
          $ $total
        </td>
      </tr>
    </table>
    EOF;

    $pdf->writeHTML($bloque5, false, false, false, false, '');

    // SALIDA DEL ARCHIVO
    $pdf->Output('recibo.pdf', 'I');
  }
}

$recibo = new imprimirrecibo();
$recibo->id_venta = $_GET["codigo"];
$recibo->traerImpresionrecibo();

?>
