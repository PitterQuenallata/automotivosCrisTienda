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

// Incluye la cabecera
include "modules/header.php";

// Página contenedora
echo '<input type="hidden" id="urlPath" value="' . $path . '">';

// Modificar la función para cargar directamente desde `pages`
function loadPage($route, $path, $routesArray)
{
    // Contenedor principal
    echo '<div id="page-container" class="sidebar-mini enable-page-overlay side-scroll page-header-modern main-content-narrow sidebar-o side-trans-enabled">';

    // Incluye el menú lateral y la barra de navegación
    include "modules/sidebar.php";
    include "modules/navbar.php";

    // Incluye la página solicitada
    include("pages/{$route}.php");

    // Cierra el contenedor principal
    echo '</div>';
}

// Verifica si el usuario está en sesión
if (isset($_SESSION["users"])) {
    // Determina la ruta solicitada
    $route = !empty($routesArray[0]) ? $routesArray[0] : "inicio";
    $validRoutes = ["inicio", "usuarios", "categorias", "marcas", "vehiculos", "modelos", "motores", "proveedores", "repuestos", "lista-compras","crear-compras","crear-ventas","lista-ventas","crear-repuestos", "salir"]; // Añadir rutas válidas aquí

    // Verifica si la ruta es válida y carga la página correspondiente
    if (in_array($route, $validRoutes)) {
        loadPage($route, $path, $routesArray); // Llama a la función `loadPage`
    } else {
        include('pages/404.php'); // Página de error 404
    }
} else {
    include "pages/login.php"; // Página de login
}









include "modules/scripts.php";
include "modules/footerEnd.php";
