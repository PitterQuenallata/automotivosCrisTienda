<?php

require_once 'controllers/template.controller.php';
require_once 'controllers/categorias.controller.php';
require_once "controllers/usuario.controller.php";
require_once "controllers/marcas.controller.php";
require_once "controllers/vehiculos.controller.php";
require_once "controllers/modelos.controller.php";

require_once "models/user.model.php";
require_once "models/categorias.model.php";
require_once "models/marcas.model.php";
require_once "models/vehiculos.model.php";
require_once "models/modelos.model.php";


$index = new TemplateController();
$index->index();

?>
