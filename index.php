<?php

require_once 'controllers/template.controller.php';
//include_once 'controllers/curl.controller.php';
require_once "controllers/usuario.controller.php";

require_once "models/user.model.php";



$index = new TemplateController();
$index->index();

?>
