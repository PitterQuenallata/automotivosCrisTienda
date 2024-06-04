<?php
// Iniciar buffering y sesiones
ob_start();
session_start();




//ruta
$path = TemplateController::path();

// Capturar rutas de la URL limpiando las queries
$routesArray = explode("/", $_SERVER["REQUEST_URI"]);
array_shift($routesArray);
foreach ($routesArray as $key => $value) {
    $routesArray[$key] = explode("?", $value)[0];
    
}

//pagina
include "modules/header.php";
//Page Container 

// para el jquery 
echo '<input type="hidden" id="urlPath" value="' . $path . '">';

// Modificamos la función para aceptar $path como un argumento
function loadPage($route, $path,$routesArray) {
  // Ahora $path está disponible dentro de esta función
  echo '<div id="page-container" class="sidebar-o  enable-page-overlay side-scroll page-header-modern main-content-narrow">';
  include "modules/sidebar.php";
  include "modules/navbar.php";
  include("pages/{$route}/{$route}.php");
  echo '</div>';

}

if (isset($_SESSION["users"])){
  $route = !empty($routesArray[0]) ? $routesArray[0] : "inicio";
  $validRoutes = ["inicio","usuarios", "inventario", "salir"]; // Añadir rutas válidas aquí

  if (in_array($route, $validRoutes)) {
    loadPage($route, $path,$routesArray); // Pasamos $path como un argumento aquí
  } else {
      include('pages/404/404.php');
  }

}else{
  include "pages/login/login.php";
}








include "modules/scripts.php"; 
include "modules/footerEnd.php"
?>
