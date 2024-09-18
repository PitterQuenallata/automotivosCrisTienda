<?php
class ModeloRazonSocial {

    /*=============================================
    MOSTRAR RAZON SOCIAL
    =============================================*/
    public static function mdlMostrarRazonSocial($tabla, $item, $valor) {
        $stmt = Conexion::conectar()->prepare("SELECT * FROM $tabla WHERE $item = :$item");
        $stmt->bindParam(":".$item, $valor, PDO::PARAM_STR);
        $stmt->execute();

        return $stmt->fetch(PDO::FETCH_ASSOC); // Retorna una fila de resultado
        $stmt = null;
    }

  // Registrar una nueva razón social
  public static function mdlRegistrarRazonSocial($tabla, $datos) {
    try {
        // Conectar y preparar la consulta
        $link = Conexion::conectar();
        $stmt = $link->prepare("INSERT INTO $tabla (nit_ci_razon_social, cliente_razon_social, telefono_razon_social) VALUES (:nit, :cliente, :telefono)");

        // Vincular los parámetros
        $stmt->bindParam(":nit", $datos["nit"], PDO::PARAM_STR);
        $stmt->bindParam(":cliente", $datos["nombre"], PDO::PARAM_STR);
        $stmt->bindParam(":telefono", $datos["celular"], PDO::PARAM_STR);

        // Ejecutar la consulta
        if ($stmt->execute()) {
            // Retornar el ID generado usando la misma conexión
            $idRazonSocial = $link->lastInsertId();
            return ["status" => "success", "id_razon_social" => $idRazonSocial];
        } else {
            return ["status" => "error", "message" => "Error al registrar la razón social."];
        }

    } catch (PDOException $e) {
        return ["status" => "error", "message" => $e->getMessage()];
    }

    $stmt = null;
}


  /*=============================================
  VERIFICAR NIT EN LA BASE DE DATOS
=============================================*/
// ModeloRazonSocial.php
static public function mdlVerificarNit($tabla, $item, $valor)
{
    $stmt = Conexion::conectar()->prepare("SELECT * FROM $tabla WHERE $item = :$item");
    $stmt->bindParam(":".$item, $valor, PDO::PARAM_STR);
    $stmt->execute();
    
    // Solo retornamos los índices asociativos
    return $stmt->fetch(PDO::FETCH_ASSOC);
}


}
