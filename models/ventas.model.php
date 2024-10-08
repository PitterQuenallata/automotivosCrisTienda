<?php

require_once "conexion.php";

class   ModeloVentas
{

  /*=============================================
  MOSTRAR REPUESTOS PARA VENTAS
  =============================================*/
  public static function mdlMostrarRepuestosVentas($tabla, $item, $valor)
  {
    if ($item != null) {
      $stmt = Conexion::conectar()->prepare("SELECT r.*, c.nombre_categoria 
                                            FROM $tabla r 
                                            JOIN categorias c ON r.id_categoria = c.id_categoria 
                                            WHERE $item = :$item");
      $stmt->bindParam(":" . $item, $valor, PDO::PARAM_STR);
      $stmt->execute();
      return $stmt->fetch();
    } else {
      $stmt = Conexion::conectar()->prepare("SELECT r.*, c.nombre_categoria 
                                              FROM $tabla r 
                                              JOIN categorias c ON r.id_categoria = c.id_categoria");
      $stmt->execute();
      return $stmt->fetchAll();
    }
  }
  /*=============================================
  MOSTRAR VENTAS
  =============================================*/
  public static function mdlMostrarVentas($tabla, $item, $valor)
  {
    $stmt = Conexion::conectar()->prepare("SELECT * FROM $tabla ORDER BY id_venta DESC");
    $stmt->execute();
    return $stmt->fetchAll();
  }

  /*=============================================
  OBTENER ÚLTIMO CÓDIGO DE VENTA
  =============================================*/
  public static function mdlObtenerUltimoCodigoVenta($tabla)
  {
    $stmt = Conexion::conectar()->prepare("SELECT codigo_venta FROM $tabla ORDER BY id_venta DESC LIMIT 1");
    $stmt->execute();
    return $stmt->fetch(PDO::FETCH_ASSOC);
  }

  /*=============================================
  REGISTRAR VENTA
  =============================================*/
  public static function mdlRegistrarVenta($tabla, $datosVenta)
  {
      try {
          $link = Conexion::conectar(); // Asegúrate de usar la misma conexión en todo el flujo
          $stmt = $link->prepare("
              INSERT INTO $tabla 
              (codigo_venta, monto_total_venta, metodo_pago_venta, id_usuario, id_razon_social, estado_venta) 
              VALUES (:codigo, :monto_total, :metodo_pago, :id_usuario, :id_razon_social, :estado)
          ");
  
          $stmt->bindParam(":codigo", $datosVenta["codigo"], PDO::PARAM_STR);
          $stmt->bindParam(":monto_total", $datosVenta["total"], PDO::PARAM_STR);
          $stmt->bindParam(":metodo_pago", $datosVenta["metodo_pago"], PDO::PARAM_STR);
          $stmt->bindParam(":id_usuario", $datosVenta["id_usuario"], PDO::PARAM_INT);
          $stmt->bindParam(":id_razon_social", $datosVenta["id_razon_social"], PDO::PARAM_INT);
          $stmt->bindParam(":estado", $datosVenta["estado"], PDO::PARAM_STR);
  
          if ($stmt->execute()) {
              // Retornar el ID de la venta registrada
              return $link->lastInsertId(); 
          } else {
              return "error";
          }
  
      } catch (Exception $e) {
          return "error";
      }
  
      $stmt = null;
  }
  
  
  

  /*=============================================
  REGISTRAR DETALLE DE VENTA
  =============================================*/
  public static function mdlRegistrarDetalleVenta($tabla, $datos)
  {
    $stmt = Conexion::conectar()->prepare("INSERT INTO $tabla(id_venta, id_repuesto, cantidad_detalleVenta, precio_unitario_detalleVenta) VALUES (:id_venta, :id_repuesto, :cantidad, :precio)");

    $stmt->bindParam(":id_venta", $datos["id_venta"], PDO::PARAM_INT);
    $stmt->bindParam(":id_repuesto", $datos["id_repuesto"], PDO::PARAM_INT);
    $stmt->bindParam(":cantidad", $datos["cantidad"], PDO::PARAM_INT);
    $stmt->bindParam(":precio", $datos["precio"], PDO::PARAM_STR);

    if ($stmt->execute()) {
      return "ok";
    } else {
      return "error";
    }

    $stmt = null;
  }

  /*=============================================
  ACTUALIZAR STOCK DE REPUESTO
  =============================================*/
  public static function mdlActualizarStock($tabla, $idRepuesto, $nuevoStock)
  {
    $stmt = Conexion::conectar()->prepare("UPDATE $tabla SET stock_repuesto = :stock WHERE id_repuesto = :id_repuesto");

    $stmt->bindParam(":stock", $nuevoStock, PDO::PARAM_INT);
    $stmt->bindParam(":id_repuesto", $idRepuesto, PDO::PARAM_INT);

    if ($stmt->execute()) {
      return "ok";
    } else {
      return "error";
    }

    $stmt = null;
  }
}
