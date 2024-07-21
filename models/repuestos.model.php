<?php

require_once "conexion.php";

class ModeloRepuestos
{

    /*=============================================
    MOSTRAR REPUESTOS
    =============================================*/

    static public function mdlMostrarRepuestos($tabla, $item, $valor)
    {

        if ($item != null) {
            $stmt = Conexion::conectar()->prepare("SELECT * FROM $tabla WHERE $item = :$item ORDER BY id_repuesto DESC");
            $stmt->bindParam(":" . $item, $valor, PDO::PARAM_STR);
            $stmt->execute();
            return $stmt->fetch();
        } else {
            $stmt = Conexion::conectar()->prepare("SELECT * FROM $tabla");
            $stmt->execute();
            return $stmt->fetchAll();
        }

        $stmt = null;
    }
    /*=============================================
  ACTUALIZAR ESTADO REPUESTO
  =============================================*/
    static public function mdlActualizarEstadoRepuesto($tabla, $item, $valor, $estado)
    {
        $stmt = Conexion::conectar()->prepare("UPDATE $tabla SET estado_repuesto = :estado WHERE $item = :valor");
        $stmt->bindParam(":estado", $estado, PDO::PARAM_INT);
        $stmt->bindParam(":valor", $valor, PDO::PARAM_INT);

        if ($stmt->execute()) {
            return "ok";
        } else {
            return "error";
        }

        $stmt = null;
    }

    /*=============================================
    INGRESAR REPUESTO
    =============================================*/
    public static function mdlIngresarRepuesto($tabla, $datos)
    {
        $stmt = Conexion::conectar()->prepare("INSERT INTO $tabla (id_categoria, nombre_repuesto, descripcion_repuesto,codigo_tienda_repuesto, stock_repuesto, precio_repuesto, precio_compra, marca_repuesto, estado_repuesto) VALUES (:id_categoria, :nombre_repuesto, :descripcion_repuesto, :codigo_tienda_repuesto, :stock_repuesto, :precio_repuesto, :precio_compra, :marca_repuesto, :estado_repuesto)");

        $stmt->bindParam(":id_categoria", $datos["id_categoria"], PDO::PARAM_INT);
        $stmt->bindParam(":nombre_repuesto", $datos["nombre_repuesto"], PDO::PARAM_STR);
        $stmt->bindParam(":descripcion_repuesto", $datos["descripcion_repuesto"], PDO::PARAM_STR);
        $stmt->bindParam(":codigo_tienda_repuesto", $datos["codigo_tienda_repuesto"], PDO::PARAM_STR);
        $stmt->bindParam(":stock_repuesto", $datos["stock_repuesto"], PDO::PARAM_INT);
        $stmt->bindParam(":precio_repuesto", $datos["precio_repuesto"], PDO::PARAM_STR);
        $stmt->bindParam(":precio_compra", $datos["precio_compra"], PDO::PARAM_STR);
        $stmt->bindParam(":marca_repuesto", $datos["marca_repuesto"], PDO::PARAM_STR);
        $stmt->bindParam(":estado_repuesto", $datos["estado_repuesto"], PDO::PARAM_INT);

        if ($stmt->execute()) {
            return "ok";
        } else {
            return "error";
        }


        $stmt = null;
    }

    /*=============================================
    OBTENER EL ÚLTIMO ID INSERTADO
    =============================================*/
    public static function mdlObtenerUltimoID($tabla)
    {
        $stmt = Conexion::conectar()->prepare("SELECT MAX(id_repuesto) as id FROM $tabla");
        $stmt->execute();
        return $stmt->fetch()["id"];
    }

    /*=============================================
    INGRESAR MODELO REPUESTO
    =============================================*/
    public static function mdlIngresarModeloRepuesto($tabla, $datos)
    {
        $stmt = Conexion::conectar()->prepare("INSERT INTO $tabla (id_modelo, id_repuesto) VALUES (:id_modelo, :id_repuesto)");

        $stmt->bindParam(":id_modelo", $datos["id_modelo"], PDO::PARAM_INT);
        $stmt->bindParam(":id_repuesto", $datos["id_repuesto"], PDO::PARAM_INT);

        if ($stmt->execute()) {
            return "ok";
        } else {
            return "error";
        }


        $stmt = null;
    }

    /*=============================================
    INGRESAR MOTOR REPUESTO
    =============================================*/
    public static function mdlIngresarMotorRepuesto($tabla, $datos)
    {
        $stmt = Conexion::conectar()->prepare("INSERT INTO $tabla (id_motor, id_repuesto) VALUES (:id_motor, :id_repuesto)");

        $stmt->bindParam(":id_motor", $datos["id_motor"], PDO::PARAM_INT);
        $stmt->bindParam(":id_repuesto", $datos["id_repuesto"], PDO::PARAM_INT);

        if ($stmt->execute()) {
            return "ok";
        } else {
            return "error";
        }


        $stmt = null;
    }
}
