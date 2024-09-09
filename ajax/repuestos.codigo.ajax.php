<?php

require_once "../controllers/repuestos.controller.php";
require_once "../models/repuestos.model.php";

// Obtenemos el último código de repuesto
$respuesta = ModeloRepuestos::mdlObtenerUltimoCodigoRepuesto();

echo json_encode($respuesta);
