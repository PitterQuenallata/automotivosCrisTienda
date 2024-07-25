<?php

require_once "conexion.php";

class ModeloCompras
{

    /*=============================================
    MOSTRAR COMPRAS
    =============================================*/
    public static function mdlMostrarCompras($tabla, $item, $valor)
    {
        if ($item != null) {
            $stmt = Conexion::conectar()->prepare("SELECT * FROM $tabla WHERE $item = :$item ORDER BY id_compra DESC");
            $stmt->bindParam(":" . $item, $valor, PDO::PARAM_STR);
            $stmt->execute();
            return $stmt->fetch();
        } else {
            $stmt = Conexion::conectar()->prepare("SELECT * FROM $tabla ORDER BY id_compra DESC");
            $stmt->execute();
            return $stmt->fetchAll();
        }

        $stmt = null;
    }

    /*=============================================
    CREAR COMPRA
    =============================================*/
    public static function mdlCrearCompra($tabla, $datos)
    {
        try {
            $link = Conexion::conectar();
            $stmt = $link->prepare("INSERT INTO $tabla (codigo_compra, fecha_compra, monto_total_compra, id_proveedor, id_usuario) VALUES (:codigo_compra, :fecha_compra, :monto_total_compra, :id_proveedor, :id_usuario)");

            $fechaCompra = date('Y-m-d');
            $stmt->bindParam(":codigo_compra", $datos["codigo_compra"], PDO::PARAM_STR);
            $stmt->bindParam(":fecha_compra", $fechaCompra, PDO::PARAM_STR);
            $stmt->bindParam(":monto_total_compra", $datos["monto_total_compra"], PDO::PARAM_STR);
            $stmt->bindParam(":id_proveedor", $datos["id_proveedor"], PDO::PARAM_INT);
            $stmt->bindParam(":id_usuario", $datos["id_usuario"], PDO::PARAM_INT);

            if ($stmt->execute()) {
                return $link->lastInsertId(); // Devolver el ID de la compra insertada
            } else {
                return "error";
            }

            $stmt = null;
            $link = null;
        } catch (PDOException $e) {
            return "error";
        }
    }

    /*=============================================
    CREAR DETALLE DE COMPRA
    =============================================*/
    public static function mdlCrearDetalleCompra($tabla, $datos)
    {
        try {
            $stmt = Conexion::conectar()->prepare("INSERT INTO $tabla (id_compra, id_repuesto, cantidad_detalleCompra, precio_unitario) VALUES (:id_compra, :id_repuesto, :cantidad_detalleCompra, :precio_unitario)");

            $stmt->bindParam(":id_compra", $datos["id_compra"], PDO::PARAM_INT);
            $stmt->bindParam(":id_repuesto", $datos["id_repuesto"], PDO::PARAM_INT);
            $stmt->bindParam(":cantidad_detalleCompra", $datos["cantidad_detalleCompra"], PDO::PARAM_INT);
            $stmt->bindParam(":precio_unitario", $datos["precio_unitario"], PDO::PARAM_STR);

            if ($stmt->execute()) {
                return "ok";
            } else {
                return "error";
            }

            $stmt = null;
        } catch (PDOException $e) {
            return "error";
        }
    }

    /*=============================================
    MOSTRAR LA ÚLTIMA COMPRA
    =============================================*/
    public static function mdlMostrarUltimaCompra($tabla)
    {
        $stmt = Conexion::conectar()->prepare("SELECT codigo_compra FROM $tabla ORDER BY id_compra DESC LIMIT 1");
        $stmt->execute();
        return $stmt->fetch();
    }

    /*=============================================
    CREAR PROVEEDOR
    =============================================*/
    public static function mdlCrearProveedor($tabla, $datos)
    {
        try {
            $link = Conexion::conectar();
            $stmt = $link->prepare("INSERT INTO $tabla (nombre_proveedor, nit_ci_proveedor, telefono_proveedor, direccion_proveedor, email_proveedor) VALUES (:nombre_proveedor, :nit_ci_proveedor, :telefono_proveedor, :direccion_proveedor, :email_proveedor)");
    
            $stmt->bindParam(":nombre_proveedor", $datos["nombre_proveedor"], PDO::PARAM_STR);
            $stmt->bindParam(":nit_ci_proveedor", $datos["nit_ci_proveedor"], PDO::PARAM_STR);
            $stmt->bindParam(":telefono_proveedor", $datos["telefono_proveedor"], PDO::PARAM_STR);
            $stmt->bindParam(":direccion_proveedor", $datos["direccion_proveedor"], PDO::PARAM_STR);
            $stmt->bindParam(":email_proveedor", $datos["email_proveedor"], PDO::PARAM_STR);
    
            // Debug: Verificar datos antes de la ejecución
            // echo "<pre>";
            // print_r($datos);
            // echo "</pre>";
    
            if ($stmt->execute()) {
                $idProveedor = $link->lastInsertId(); // Devolver el ID del proveedor insertado
    
                // Debug: Verificar el ID del proveedor insertado
                // echo "<pre>";
                // var_dump($idProveedor);
                // echo "</pre>";
    
                return $idProveedor;
            } else {
                // Debug: Obtener información del error
                // $errorInfo = $stmt->errorInfo();
                // echo "<pre>";
                // print_r($errorInfo);
                // echo "</pre>";
    
                // return "error";
            }
    
            $stmt = null;
        } catch (PDOException $e) {
            // Debug: Capturar y mostrar la excepción
            // echo "<pre>";
            // var_dump($e->getMessage());
            // echo "</pre>";
    
            return "error";
        }
    }
    
}
