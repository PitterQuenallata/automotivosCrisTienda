<?php

require_once "conexion.php";

class ModeloRepuestos
{

        /*=============================================
    OBTENER EL ÚLTIMO CÓDIGO DE REPUESTO
    =============================================*/
    static public function mdlObtenerUltimoCodigoRepuesto() {
        $stmt = Conexion::conectar()->prepare("SELECT codigo_tienda_repuesto 
                                               FROM repuestos 
                                               ORDER BY id_repuesto DESC 
                                               LIMIT 1");
        $stmt->execute();
        return $stmt->fetch();
        $stmt = null;
    }
    /*=============================================
    MOSTRAR REPUESTOS
    =============================================*/
    static public function mdlMostrarRepuestos($tabla, $item, $valor)
    {
        if ($item != null) {
            $stmt = Conexion::conectar()->prepare("SELECT r.*
            FROM $tabla r
            WHERE r.$item = :$item 
            ORDER BY r.id_repuesto DESC");
            $stmt->bindParam(":" . $item, $valor, PDO::PARAM_STR);
            $stmt->execute();
            return $stmt->fetch();
        } else {
            $stmt = Conexion::conectar()->prepare("SELECT r.*
            FROM $tabla r");
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
    $link = Conexion::conectar();
    
    // Preparamos la consulta para insertar todos los datos incluidos peso, id_marca, id_modelo y id_motor
    $stmt = $link->prepare("INSERT INTO $tabla (id_categoria, nombre_repuesto, descripcion_repuesto, codigo_tienda_repuesto, stock_repuesto, precio_repuesto, fabricante_repuesto, peso_repuesto, id_marca, id_modelo, id_motor, estado_repuesto) 
                            VALUES (:id_categoria, :nombre_repuesto, :descripcion_repuesto, :codigo_tienda_repuesto, :stock_repuesto, :precio_repuesto, :fabricante_repuesto, :peso_repuesto, :id_marca, :id_modelo, :id_motor, :estado_repuesto)");

    // Vincular los parámetros
    $stmt->bindParam(":id_categoria", $datos["id_categoria"], PDO::PARAM_INT);
    $stmt->bindParam(":nombre_repuesto", $datos["nombre_repuesto"], PDO::PARAM_STR);
    $stmt->bindParam(":descripcion_repuesto", $datos["descripcion_repuesto"], PDO::PARAM_STR);
    $stmt->bindParam(":codigo_tienda_repuesto", $datos["codigo_tienda_repuesto"], PDO::PARAM_STR);
    $stmt->bindParam(":stock_repuesto", $datos["stock_repuesto"], PDO::PARAM_INT);
    $stmt->bindParam(":precio_repuesto", $datos["precio_repuesto"], PDO::PARAM_STR);
    $stmt->bindParam(":fabricante_repuesto", $datos["fabricante_repuesto"], PDO::PARAM_STR);
    $stmt->bindParam(":peso_repuesto", $datos["peso_repuesto"], PDO::PARAM_STR); // Añadir peso_repuesto
    $stmt->bindParam(":id_marca", $datos["id_marca"], PDO::PARAM_INT); // Añadir id_marca
    $stmt->bindParam(":id_modelo", $datos["id_modelo"], PDO::PARAM_INT); // Añadir id_modelo
    $stmt->bindParam(":id_motor", $datos["id_motor"], PDO::PARAM_INT); // Añadir id_motor
    $stmt->bindParam(":estado_repuesto", $datos["estado_repuesto"], PDO::PARAM_INT);

    // Ejecutamos la consulta
    if ($stmt->execute()) {
        return $link->lastInsertId(); // Devuelve el ID del último repuesto insertado
    } else {
        return "error";
    }

    // Cerrar conexión
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

    /*=============================================
EDITAR REPUESTO
=============================================*/
public static function mdlEditarRepuesto($tabla, $datos)
{
    $stmt = Conexion::conectar()->prepare(
        "UPDATE $tabla SET 
            id_categoria = :id_categoria, 
            nombre_repuesto = :nombre_repuesto, 
            descripcion_repuesto = :descripcion_repuesto, 
            codigo_tienda_repuesto = :codigo_tienda_repuesto, 
            stock_repuesto = :stock_repuesto, 
            precio_repuesto = :precio_repuesto, 
            fabricante_repuesto = :fabricante_repuesto, 
            peso_repuesto = :peso_repuesto, 
            id_marca = :id_marca, 
            id_modelo = :id_modelo, 
            id_motor = :id_motor, 
            estado_repuesto = :estado_repuesto 
        WHERE id_repuesto = :id_repuesto"
    );

    // Vincular los parámetros
    $stmt->bindParam(":id_categoria", $datos["id_categoria"], PDO::PARAM_INT);
    $stmt->bindParam(":nombre_repuesto", $datos["nombre_repuesto"], PDO::PARAM_STR);
    $stmt->bindParam(":descripcion_repuesto", $datos["descripcion_repuesto"], PDO::PARAM_STR);
    $stmt->bindParam(":codigo_tienda_repuesto", $datos["codigo_tienda_repuesto"], PDO::PARAM_STR);
    $stmt->bindParam(":stock_repuesto", $datos["stock_repuesto"], PDO::PARAM_INT);
    $stmt->bindParam(":precio_repuesto", $datos["precio_repuesto"], PDO::PARAM_STR);
    $stmt->bindParam(":fabricante_repuesto", $datos["fabricante_repuesto"], PDO::PARAM_STR); // Marca del fabricante
    $stmt->bindParam(":peso_repuesto", $datos["peso_repuesto"], PDO::PARAM_STR); // Añadir peso_repuesto
    $stmt->bindParam(":id_marca", $datos["id_marca"], PDO::PARAM_INT); // Añadir id_marca
    $stmt->bindParam(":id_modelo", $datos["id_modelo"], PDO::PARAM_INT); // Añadir id_modelo
    $stmt->bindParam(":id_motor", $datos["id_motor"], PDO::PARAM_INT); // Añadir id_motor
    $stmt->bindParam(":estado_repuesto", $datos["estado_repuesto"], PDO::PARAM_INT);
    $stmt->bindParam(":id_repuesto", $datos["id_repuesto"], PDO::PARAM_INT); // ID del repuesto que se está editando

    // Ejecutamos la consulta
    if ($stmt->execute()) {
        return "ok";
    } else {
        return "error";
    }

    // Cerrar conexión
    $stmt = null;
}


    /*=============================================
ACTUALIZAR MOTOR REPUESTO
=============================================*/
    public static function mdlActualizarMotorRepuesto($tabla, $datos)
    {
        $stmt = Conexion::conectar()->prepare("UPDATE $tabla SET id_motor = :id_motor WHERE id_repuesto = :id_repuesto");

        $stmt->bindParam(":id_motor", $datos["id_motor"], PDO::PARAM_INT);
        $stmt->bindParam(":id_repuesto", $datos["id_repuesto"], PDO::PARAM_INT);

        if ($stmt->execute()) {
            return "ok";
        } else {
            return "error";
        }

        $stmt = null;
    }

    /*=============================================
ACTUALIZAR MODELO REPUESTO
=============================================*/
    public static function mdlActualizarModeloRepuesto($tabla, $datos)
    {
        $stmt = Conexion::conectar()->prepare("UPDATE $tabla SET id_modelo = :id_modelo WHERE id_repuesto = :id_repuesto");

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
    MOSTRAR MARCA, MODELO Y MOTOR DE REPUESTO
    =============================================*/
    public static function mdlMostrarAsociacionesRepuesto($idRepuesto)
    {
        // Mostrar marca de vehículo
        $stmt = Conexion::conectar()->prepare("SELECT marcas.nombre_marca FROM marcas JOIN repuestos ON repuestos.marca_vehiculo = marcas.id_marca WHERE repuestos.id_repuesto = :id_repuesto");
        $stmt->bindParam(":id_repuesto", $idRepuesto, PDO::PARAM_INT);
        $stmt->execute();
        $marca = $stmt->fetch();

        // Mostrar modelo de vehículo
        $stmt = Conexion::conectar()->prepare("SELECT modelos.nombre_modelo FROM modelos JOIN modelo_repuestos ON modelo_repuestos.id_modelo = modelos.id_modelo WHERE modelo_repuestos.id_repuesto = :id_repuesto");
        $stmt->bindParam(":id_repuesto", $idRepuesto, PDO::PARAM_INT);
        $stmt->execute();
        $modelo = $stmt->fetch();

        // Mostrar motor de vehículo
        $stmt = Conexion::conectar()->prepare("SELECT motores.nombre_motor FROM motores JOIN motor_repuestos ON motor_repuestos.id_motor = motores.id_motor WHERE motor_repuestos.id_repuesto = :id_repuesto");
        $stmt->bindParam(":id_repuesto", $idRepuesto, PDO::PARAM_INT);
        $stmt->execute();
        $motor = $stmt->fetch();

        return [
            "marca" => $marca["nombre_marca"],
            "modelo" => $modelo["nombre_modelo"],
            "motor" => $motor["nombre_motor"]
        ];
    }

/*=============================================
ELIMINAR REPUESTO
=============================================*/
static public function mdlEliminarRepuesto($tabla, $datos)
{
    $stmt = Conexion::conectar()->prepare("DELETE FROM $tabla WHERE id_repuesto = :id_repuesto");
    $stmt->bindParam(":id_repuesto", $datos, PDO::PARAM_INT);

    if ($stmt->execute()) {
        return "ok";
    } else {
        return "error";
    }

    $stmt = null;
}

}
