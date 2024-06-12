<?php

require_once 'controllers/template.controller.php';
require_once 'controllers/categorias.controller.php';
require_once "controllers/usuario.controller.php";
require_once "controllers/marcas.controller.php";
require_once "controllers/modelos.controller.php";
require_once "controllers/motores.controller.php";
require_once "controllers/proveedores.controller.php";
require_once "controllers/compras.controller.php";
require_once "controllers/repuestos.controller.php";
require_once "controllers/ventas.controller.php";
require_once "controllers/clientes.controller.php";

require_once "models/user.model.php";
require_once "models/categorias.model.php";
require_once "models/marcas.model.php";
require_once "models/modelos.model.php";
require_once "models/motores.model.php";
require_once "models/proveedores.model.php";
require_once "models/compras.model.php";
require_once "models/detalles_compras.model.php";
require_once "models/repuestos.model.php";
require_once "models/ventas.model.php";
require_once "models/clientes.model.php";


$index = new TemplateController();
$index->index();

?>
