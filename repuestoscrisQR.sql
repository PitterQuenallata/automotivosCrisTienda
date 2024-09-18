-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 18-09-2024 a las 12:23:12
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `repuestoscris`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `carrito`
--

CREATE TABLE `carrito` (
  `id_carrito` int(11) NOT NULL,
  `id_cliente` int(11) NOT NULL,
  `fecha_creacion` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categorias`
--

CREATE TABLE `categorias` (
  `id_categoria` int(11) NOT NULL,
  `nombre_categoria` varchar(255) NOT NULL,
  `img_categoria` text NOT NULL,
  `date_created_categoria` timestamp NOT NULL DEFAULT current_timestamp(),
  `date_updated_categoria` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `categorias`
--

INSERT INTO `categorias` (`id_categoria`, `nombre_categoria`, `img_categoria`, `date_created_categoria`, `date_updated_categoria`) VALUES
(1, 'filtros', 'filtros.png', '2024-06-09 15:36:55', '2024-08-13 07:16:18'),
(2, 'frenos', 'frenos.png', '2024-06-09 15:36:55', '2024-08-13 07:16:30'),
(3, 'motor', 'motores.png', '2024-06-09 15:36:55', '2024-08-13 07:16:41'),
(4, 'suspension', 'suspension.png', '2024-06-09 15:36:55', '2024-08-13 07:17:05'),
(5, 'amortiguadores', 'amortiguadores.png', '2024-06-09 15:36:55', '2024-08-13 07:17:19'),
(6, 'bujias', 'bujias.png', '2024-06-09 15:36:55', '2024-08-13 07:18:48'),
(7, 'carreras, cadenas, rodillos', 'correas.png', '2024-06-09 15:36:55', '2024-08-13 07:19:04'),
(8, 'embrague', 'embrague.png', '2024-06-09 15:36:55', '2024-08-28 02:44:09'),
(9, 'rodamientos', 'rodamientos.png', '2024-06-09 15:36:55', '2024-08-13 07:20:49');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

CREATE TABLE `clientes` (
  `id_cliente` int(11) NOT NULL,
  `email_cliente` varchar(255) DEFAULT NULL,
  `password_cliente` varchar(255) DEFAULT NULL,
  `nombre_cliente` varchar(255) NOT NULL,
  `apellido_cliente` varchar(255) DEFAULT NULL,
  `nit_ci_cliente` varchar(255) DEFAULT NULL,
  `telefono_cliente` varchar(255) DEFAULT NULL,
  `compra_cliente` int(11) DEFAULT 0,
  `direccion_cliente` varchar(255) DEFAULT NULL,
  `estado_cliente` tinyint(1) NOT NULL DEFAULT 1,
  `date_created_cliente` timestamp NOT NULL DEFAULT current_timestamp(),
  `date_updated_cliente` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `clientes`
--

INSERT INTO `clientes` (`id_cliente`, `email_cliente`, `password_cliente`, `nombre_cliente`, `apellido_cliente`, `nit_ci_cliente`, `telefono_cliente`, `compra_cliente`, `direccion_cliente`, `estado_cliente`, `date_created_cliente`, `date_updated_cliente`) VALUES
(1, 'benjo@gmail.com', '$2a$07$azybxcags23425sdg23sdem1CFT2u/A.0JOm/IXWxebxaQOkjS85C', 'Benjamin', 'Canaviri', '100000', '67033711', 0, '123 Main St', 1, '2024-08-12 09:06:42', '2024-08-28 00:39:18'),
(2, 'pitter@gmail.com', '$2a$07$azybxcags23425sdg23sdexDgBwF1Wba.r8oVb3KiQPBr8fPcAQBe', 'pitter', NULL, NULL, NULL, 0, NULL, 1, '2024-08-21 20:18:18', '2024-08-21 21:26:00'),
(3, 'juan@gmail.com', '$2a$07$azybxcags23425sdg23sdeeOGUrG2ZGavqekZMMrpw/n1VMhLS8Oe', 'Juan', NULL, NULL, NULL, 0, NULL, 1, '2024-08-21 20:37:01', '2024-08-21 21:26:03'),
(4, 'elias@gmail.com', '$2a$07$azybxcags23425sdg23sde8orkS43Bhap.DsEe3szgSGUc0NXeJN6', 'Elias', 'Fiede', '7920413', '7928543', 0, NULL, 1, '2024-08-21 21:24:32', '2024-08-21 21:26:05');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `compras`
--

CREATE TABLE `compras` (
  `id_compra` int(11) NOT NULL,
  `codigo_compra` text NOT NULL,
  `fecha_compra` date NOT NULL,
  `monto_total_compra` decimal(10,2) NOT NULL,
  `id_proveedor` int(11) DEFAULT NULL,
  `id_usuario` int(11) DEFAULT NULL,
  `date_created_compra` timestamp NOT NULL DEFAULT current_timestamp(),
  `date_updated_compra` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `compras`
--

INSERT INTO `compras` (`id_compra`, `codigo_compra`, `fecha_compra`, `monto_total_compra`, `id_proveedor`, `id_usuario`, `date_created_compra`, `date_updated_compra`) VALUES
(1, 'COM0001', '2024-09-18', 1000.00, 2, 1, '2024-09-17 22:04:53', '2024-09-17 22:04:53');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalles_carrito`
--

CREATE TABLE `detalles_carrito` (
  `id_detalle_carrito` int(11) NOT NULL,
  `id_carrito` int(11) NOT NULL,
  `id_repuesto` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalles_compras`
--

CREATE TABLE `detalles_compras` (
  `id_detalle_compra` int(11) NOT NULL,
  `id_compra` int(11) DEFAULT NULL,
  `id_repuesto` int(11) DEFAULT NULL,
  `cantidad_detalleCompra` int(11) DEFAULT NULL,
  `precio_unitario` decimal(10,2) NOT NULL,
  `date_created_detalle_compra` timestamp NOT NULL DEFAULT current_timestamp(),
  `date_updated_detalle_compra` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `detalles_compras`
--

INSERT INTO `detalles_compras` (`id_detalle_compra`, `id_compra`, `id_repuesto`, `cantidad_detalleCompra`, `precio_unitario`, `date_created_detalle_compra`, `date_updated_detalle_compra`) VALUES
(1, 1, 1, 25, 40.00, '2024-09-17 22:04:53', '2024-09-17 22:04:53');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalles_orden`
--

CREATE TABLE `detalles_orden` (
  `id_detalle_orden` int(11) NOT NULL,
  `id_orden` int(11) NOT NULL,
  `id_repuesto` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `precio` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `detalles_orden`
--

INSERT INTO `detalles_orden` (`id_detalle_orden`, `id_orden`, `id_repuesto`, `cantidad`, `precio`) VALUES
(43, 40, 8, 5, 100.00),
(44, 40, 5, 5, 100.00);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalles_ventas`
--

CREATE TABLE `detalles_ventas` (
  `id_detalleVenta` int(11) NOT NULL,
  `id_venta` int(11) NOT NULL,
  `id_repuesto` int(11) NOT NULL,
  `cantidad_detalleVenta` int(11) NOT NULL,
  `precio_unitario_detalleVenta` decimal(10,2) NOT NULL,
  `date_updated_detalleVenta` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `date_created_detalleVenta` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `detalles_ventas`
--

INSERT INTO `detalles_ventas` (`id_detalleVenta`, `id_venta`, `id_repuesto`, `cantidad_detalleVenta`, `precio_unitario_detalleVenta`, `date_updated_detalleVenta`, `date_created_detalleVenta`) VALUES
(3, 16, 10, 1, 100.00, '2024-09-18 06:21:52', NULL),
(4, 17, 10, 1, 100.00, '2024-09-18 06:22:31', NULL),
(5, 18, 10, 1, 100.00, '2024-09-18 06:23:05', NULL),
(6, 19, 19, 1, 100.00, '2024-09-18 06:33:48', NULL),
(7, 20, 10, 1, 100.00, '2024-09-18 06:35:27', NULL),
(8, 21, 10, 1, 100.00, '2024-09-18 06:39:52', NULL),
(9, 22, 10, 1, 100.00, '2024-09-18 06:41:33', NULL),
(10, 23, 10, 1, 100.00, '2024-09-18 06:42:08', NULL),
(11, 24, 10, 1, 100.00, '2024-09-18 06:43:15', NULL),
(12, 25, 10, 1, 100.00, '2024-09-18 07:11:29', NULL),
(13, 26, 28, 1, 100.00, '2024-09-18 07:19:07', NULL),
(14, 27, 10, 1, 100.00, '2024-09-18 07:47:40', NULL),
(15, 28, 10, 1, 100.00, '2024-09-18 07:55:53', NULL),
(16, 29, 1, 1, 1.00, '2024-09-18 09:34:33', NULL),
(17, 30, 1, 1, 1.00, '2024-09-18 09:34:37', NULL),
(18, 31, 1, 1, 1.00, '2024-09-18 09:38:12', NULL),
(19, 32, 1, 1, 1.00, '2024-09-18 09:41:40', NULL),
(20, 33, 1, 1, 1.00, '2024-09-18 09:43:58', NULL),
(21, 34, 1, 1, 1.00, '2024-09-18 09:56:13', NULL),
(22, 35, 1, 1, 1.00, '2024-09-18 10:20:01', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `envios`
--

CREATE TABLE `envios` (
  `id_envio` int(11) NOT NULL,
  `id_orden` int(11) DEFAULT NULL,
  `nro_registro` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `envios`
--

INSERT INTO `envios` (`id_envio`, `id_orden`, `nro_registro`) VALUES
(37, 40, 1048);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `marcas`
--

CREATE TABLE `marcas` (
  `id_marca` int(11) NOT NULL,
  `nombre_marca` varchar(255) NOT NULL,
  `estado_marca` tinyint(4) DEFAULT 1,
  `date_created_marca` timestamp NOT NULL DEFAULT current_timestamp(),
  `date_updated_marca` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `marcas`
--

INSERT INTO `marcas` (`id_marca`, `nombre_marca`, `estado_marca`, `date_created_marca`, `date_updated_marca`) VALUES
(1, 'toyota', 1, '2024-06-09 15:31:22', '2024-06-09 15:31:22'),
(2, 'nissan', 1, '2024-06-09 15:31:22', '2024-06-09 15:31:22'),
(3, 'suzuki', 1, '2024-06-09 15:31:22', '2024-06-09 15:31:22'),
(4, 'ford', 1, '2024-06-09 15:31:22', '2024-06-09 15:31:22'),
(5, 'renault', 1, '2024-06-09 15:31:22', '2024-06-09 15:31:22'),
(6, 'chevrolet', 1, '2024-06-09 15:31:22', '2024-06-09 15:31:22'),
(7, 'hyundai', 1, '2024-06-09 15:31:22', '2024-06-09 15:31:22'),
(8, 'kia', 1, '2024-06-09 15:31:22', '2024-06-09 15:31:22'),
(9, 'chery', 1, '2024-06-09 15:31:22', '2024-06-09 15:31:22'),
(10, 'mazda', 1, '2024-06-09 15:31:22', '2024-06-09 15:31:22'),
(11, 'mitsubishi', 1, '2024-06-09 15:31:22', '2024-06-09 15:31:22'),
(12, 'honda', 1, '2024-06-09 15:31:22', '2024-06-09 15:31:22'),
(14, 'foton', 1, '2024-06-09 15:36:28', '2024-06-09 15:36:28');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `modelos`
--

CREATE TABLE `modelos` (
  `id_modelo` int(11) NOT NULL,
  `id_marca` int(11) DEFAULT NULL,
  `nombre_modelo` varchar(255) NOT NULL,
  `version_modelo` varchar(255) DEFAULT NULL,
  `anio_inicio_modelo` year(4) DEFAULT NULL,
  `anio_fin_modelo` year(4) DEFAULT NULL,
  `estado_modelo` tinyint(4) DEFAULT 1,
  `date_created_modelo` timestamp NOT NULL DEFAULT current_timestamp(),
  `date_updated_modelo` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `modelos`
--

INSERT INTO `modelos` (`id_modelo`, `id_marca`, `nombre_modelo`, `version_modelo`, `anio_inicio_modelo`, `anio_fin_modelo`, `estado_modelo`, `date_created_modelo`, `date_updated_modelo`) VALUES
(1, 1, 'Corolla', 'Base', '2010', '2020', 1, '2024-08-11 13:23:37', '2024-08-11 13:23:37'),
(2, 1, 'Hilux', 'SR5', '2015', '2022', 1, '2024-08-11 13:23:37', '2024-08-11 13:23:37'),
(3, 1, 'Prado', 'VX', '2020', '2024', 1, '2024-08-11 13:23:37', '2024-08-11 13:23:37'),
(4, 2, 'Sentra', 'Advance', '2008', '2018', 1, '2024-08-11 13:23:37', '2024-08-11 13:23:37'),
(5, 2, 'Patrol', 'LE', '2012', '2020', 1, '2024-08-11 13:23:37', '2024-08-11 13:23:37'),
(6, 2, 'Frontier', 'SE', '2016', '2022', 1, '2024-08-11 13:23:37', '2024-08-11 13:23:37'),
(7, 3, 'Vitara', 'GL', '2011', '2015', 1, '2024-08-11 13:23:37', '2024-08-11 13:23:37'),
(8, 3, 'Swift', 'GA', '2013', '2017', 1, '2024-08-11 13:23:37', '2024-08-11 13:23:37'),
(9, 3, 'Celerio', 'GS', '2017', '2021', 1, '2024-08-11 13:23:37', '2024-08-11 13:23:37'),
(10, 4, 'Ranger', 'XL', '2014', '2017', 1, '2024-08-11 13:23:37', '2024-08-11 13:23:37'),
(11, 4, 'Ecosport', 'Titanium', '2016', '2019', 1, '2024-08-11 13:23:37', '2024-08-11 13:23:37'),
(12, 4, 'Explorer', 'Limited', '2018', '2023', 1, '2024-08-11 13:23:37', '2024-08-11 13:23:37'),
(13, 5, 'Duster', 'Zen', '2013', '2015', 1, '2024-08-11 13:23:37', '2024-08-11 13:23:37'),
(14, 5, 'Kwid', 'Life', '2017', '2019', 1, '2024-08-11 13:23:37', '2024-08-11 13:23:37'),
(15, 5, 'Logan', 'Intense', '2020', '2024', 1, '2024-08-11 13:23:37', '2024-08-11 13:23:37'),
(16, 6, 'Aveo', 'LS', '2011', '2013', 1, '2024-08-11 13:23:37', '2024-08-11 13:23:37'),
(17, 6, 'Spark', 'LT', '2014', '2016', 1, '2024-08-11 13:23:37', '2024-08-11 13:23:37'),
(18, 6, 'Cruze', 'Premier', '2018', '2022', 1, '2024-08-11 13:23:37', '2024-08-11 13:23:37'),
(19, 7, 'Accent', 'GL', '2012', '2016', 1, '2024-08-11 13:23:37', '2024-08-11 13:23:37'),
(20, 7, 'Tucson', 'GLS', '2015', '2020', 1, '2024-08-11 13:23:37', '2024-08-11 13:23:37'),
(21, 7, 'Santa Fe', 'Limited', '2020', '2024', 1, '2024-08-11 13:23:37', '2024-08-11 13:23:37'),
(22, 8, 'Sportage', 'LX', '2014', '2016', 1, '2024-08-11 13:23:37', '2024-08-11 13:23:37'),
(23, 8, 'Rio', 'EX', '2017', '2019', 1, '2024-08-11 13:23:37', '2024-08-11 13:23:37'),
(24, 8, 'Sorento', 'SXL', '2019', '2023', 1, '2024-08-11 13:23:37', '2024-08-11 13:23:37'),
(25, 9, 'Tiggo', 'Comfort', '2012', '2016', 1, '2024-08-11 13:23:37', '2024-08-11 13:23:37'),
(26, 9, 'Arrizo', 'Luxury', '2014', '2020', 1, '2024-08-11 13:23:37', '2024-08-11 13:23:37'),
(27, 9, 'QQ', 'Basic', '2018', '2024', 1, '2024-08-11 13:23:37', '2024-08-11 13:23:37'),
(28, 10, 'CX-5', 'Touring', '2013', '2017', 1, '2024-08-11 13:23:37', '2024-08-11 13:23:37'),
(29, 10, 'Mazda3', 'Sedan', '2015', '2020', 1, '2024-08-11 13:23:37', '2024-08-11 13:23:37'),
(30, 10, 'Mazda6', 'Sport', '2019', '2023', 1, '2024-08-11 13:23:37', '2024-08-11 13:23:37'),
(31, 11, 'Lancer', 'GLS', '2010', '2014', 1, '2024-08-11 13:23:37', '2024-08-11 13:23:37'),
(32, 11, 'Montero', 'GLX', '2014', '2018', 1, '2024-08-11 13:23:37', '2024-08-11 13:23:37'),
(33, 11, 'Outlander', 'Sport', '2018', '2024', 1, '2024-08-11 13:23:37', '2024-08-11 13:23:37'),
(34, 12, 'Civic', 'EX', '2011', '2016', 1, '2024-08-11 13:23:37', '2024-08-11 13:23:37'),
(35, 12, 'CR-V', 'Touring', '2013', '2018', 1, '2024-08-11 13:23:37', '2024-08-11 13:23:37'),
(36, 12, 'Accord', 'Sport', '2017', '2022', 1, '2024-08-11 13:23:37', '2024-08-11 13:23:37'),
(37, 14, 'Tunland', 'Standard', '2012', '2015', 1, '2024-08-11 13:23:37', '2024-08-11 13:23:37'),
(38, 14, 'View CS2', 'Luxury', '2015', '2020', 1, '2024-08-11 13:23:37', '2024-08-11 13:23:37'),
(39, 14, 'Aumark', 'Cargo', '2018', '2023', 1, '2024-08-11 13:23:37', '2024-08-11 13:23:37');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `motores`
--

CREATE TABLE `motores` (
  `id_motor` int(11) NOT NULL,
  `id_modelo` int(11) NOT NULL,
  `nombre_motor` varchar(255) NOT NULL,
  `cilindrada_motor` varchar(255) DEFAULT NULL,
  `especificaciones_motor` text DEFAULT NULL,
  `combustible_motor` int(11) DEFAULT NULL,
  `date_created_motor` timestamp NOT NULL DEFAULT current_timestamp(),
  `date_updated_motor` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `motores`
--

INSERT INTO `motores` (`id_motor`, `id_modelo`, `nombre_motor`, `cilindrada_motor`, `especificaciones_motor`, `combustible_motor`, `date_created_motor`, `date_updated_motor`) VALUES
(1, 1, '1.8L I4 2ZR-FE', '1798 cc', '132 HP @ 6000 RPM', NULL, '2024-08-19 22:24:57', '2024-08-19 22:24:57'),
(2, 1, '2.0L I4 3ZR-FAE', '1987 cc', '143 HP @ 6200 RPM', NULL, '2024-08-19 22:24:57', '2024-08-19 22:24:57'),
(3, 2, '2.8L I4 1GD-FTV', '2755 cc', '201 HP @ 3400 RPM', NULL, '2024-08-19 22:24:57', '2024-08-19 22:24:57'),
(4, 2, '4.0L V6 1GR-FE', '3956 cc', '270 HP @ 5600 RPM', NULL, '2024-08-19 22:24:57', '2024-08-19 22:24:57'),
(5, 3, '2.8L I4 1GD-FTV', '2755 cc', '201 HP @ 3400 RPM', NULL, '2024-08-19 22:24:57', '2024-08-19 22:24:57'),
(6, 3, '4.0L V6 1GR-FE', '3956 cc', '270 HP @ 5600 RPM', NULL, '2024-08-19 22:24:57', '2024-08-19 22:24:57'),
(7, 4, '1.6L I4 HR16DE', '1598 cc', '113 HP @ 5600 RPM', NULL, '2024-08-19 22:24:57', '2024-08-19 22:24:57'),
(8, 4, '2.0L I4 MR20DE', '1997 cc', '140 HP @ 5200 RPM', NULL, '2024-08-19 22:24:57', '2024-08-19 22:24:57'),
(9, 5, '4.8L I6 TB48DE', '4759 cc', '280 HP @ 4800 RPM', NULL, '2024-08-19 22:24:57', '2024-08-19 22:24:57'),
(10, 5, '5.6L V8 VK56VD', '5552 cc', '400 HP @ 5800 RPM', NULL, '2024-08-19 22:24:57', '2024-08-19 22:24:57'),
(11, 6, '2.0L I4 K20C1', '1996 cc', '306 HP @ 6500 RPM', NULL, '2024-08-19 22:25:04', '2024-08-19 22:25:04'),
(12, 6, '1.5L I4 L15B7', '1497 cc', '205 HP @ 5700 RPM', NULL, '2024-08-19 22:25:04', '2024-08-19 22:25:04'),
(13, 7, '2.4L I4 K24W7', '2356 cc', '189 HP @ 6400 RPM', NULL, '2024-08-19 22:25:04', '2024-08-19 22:25:04'),
(14, 7, '1.5L I4 L15B7', '1497 cc', '205 HP @ 5700 RPM', NULL, '2024-08-19 22:25:04', '2024-08-19 22:25:04'),
(15, 8, '3.5L V6 VQ35DE', '3498 cc', '300 HP @ 6400 RPM', NULL, '2024-08-19 22:25:04', '2024-08-19 22:25:04'),
(16, 8, '2.5L I4 QR25DE', '2488 cc', '182 HP @ 6000 RPM', NULL, '2024-08-19 22:25:04', '2024-08-19 22:25:04'),
(17, 9, '2.0L I4 4B11', '1998 cc', '237 HP @ 6000 RPM', NULL, '2024-08-19 22:25:04', '2024-08-19 22:25:04'),
(18, 9, '1.8L I4 4B10', '1798 cc', '148 HP @ 6000 RPM', NULL, '2024-08-19 22:25:04', '2024-08-19 22:25:04'),
(19, 10, '3.0L V6 6B31', '2998 cc', '220 HP @ 6000 RPM', NULL, '2024-08-19 22:25:04', '2024-08-19 22:25:04'),
(20, 10, '2.4L I4 4G69', '2378 cc', '168 HP @ 6000 RPM', NULL, '2024-08-19 22:25:04', '2024-08-19 22:25:04'),
(21, 11, '1.5L I4 L15A7', '1497 cc', '120 HP @ 6600 RPM', NULL, '2024-08-19 22:25:43', '2024-08-19 22:25:43'),
(22, 11, '1.8L I4 R18A1', '1799 cc', '140 HP @ 6300 RPM', NULL, '2024-08-19 22:25:43', '2024-08-19 22:25:43'),
(23, 12, '2.0L I4 MZR LF-VE', '1999 cc', '148 HP @ 6500 RPM', NULL, '2024-08-19 22:25:43', '2024-08-19 22:25:43'),
(24, 12, '2.5L I4 MZR L5-VE', '2488 cc', '167 HP @ 6000 RPM', NULL, '2024-08-19 22:25:43', '2024-08-19 22:25:43'),
(25, 13, '1.6L I4 B16A2', '1595 cc', '160 HP @ 7600 RPM', NULL, '2024-08-19 22:25:43', '2024-08-19 22:25:43'),
(26, 13, '1.8L I4 B18C', '1797 cc', '197 HP @ 7600 RPM', NULL, '2024-08-19 22:25:43', '2024-08-19 22:25:43'),
(27, 14, '1.8L I4 QG18DE', '1769 cc', '116 HP @ 5600 RPM', NULL, '2024-08-19 22:25:43', '2024-08-19 22:25:43'),
(28, 14, '2.0L I4 SR20DE', '1998 cc', '140 HP @ 6400 RPM', NULL, '2024-08-19 22:25:43', '2024-08-19 22:25:43'),
(29, 15, '3.5L V6 VQ35DE', '3498 cc', '300 HP @ 6400 RPM', NULL, '2024-08-19 22:25:43', '2024-08-19 22:25:43'),
(30, 15, '2.5L I4 QR25DE', '2488 cc', '182 HP @ 6000 RPM', NULL, '2024-08-19 22:25:43', '2024-08-19 22:25:43'),
(31, 16, '1.8L I4 1ZZ-FE', '1794 cc', '132 HP @ 6000 RPM', NULL, '2024-08-19 22:25:43', '2024-08-19 22:25:43'),
(32, 16, '2.0L I4 3ZR-FE', '1987 cc', '143 HP @ 6200 RPM', NULL, '2024-08-19 22:25:43', '2024-08-19 22:25:43'),
(33, 17, '1.6L I4 HR16DE', '1598 cc', '117 HP @ 6000 RPM', NULL, '2024-08-19 22:25:43', '2024-08-19 22:25:43'),
(34, 17, '2.0L I4 MR20DE', '1997 cc', '143 HP @ 5600 RPM', NULL, '2024-08-19 22:25:43', '2024-08-19 22:25:43'),
(35, 18, '2.0L I4 FB20', '1995 cc', '148 HP @ 6000 RPM', NULL, '2024-08-19 22:25:43', '2024-08-19 22:25:43'),
(36, 18, '2.5L H4 EJ25', '2457 cc', '173 HP @ 5800 RPM', NULL, '2024-08-19 22:25:43', '2024-08-19 22:25:43'),
(37, 19, '2.0L I4 16V TDI', '1968 cc', '140 HP @ 4200 RPM', NULL, '2024-08-19 22:25:43', '2024-08-19 22:25:43'),
(38, 19, '2.0L I4 16V TDI CR', '1968 cc', '150 HP @ 3500 RPM', NULL, '2024-08-19 22:25:43', '2024-08-19 22:25:43'),
(39, 20, '3.0L V6 6G72', '2972 cc', '177 HP @ 5500 RPM', NULL, '2024-08-19 22:25:43', '2024-08-19 22:25:43'),
(40, 20, '2.4L I4 4G69', '2378 cc', '168 HP @ 6000 RPM', NULL, '2024-08-19 22:25:43', '2024-08-19 22:25:43'),
(41, 21, '2.0L I4 K20C1', '1996 cc', '306 HP @ 6500 RPM', NULL, '2024-08-19 22:26:02', '2024-08-19 22:26:02'),
(42, 21, '1.5L I4 L15B7', '1497 cc', '205 HP @ 5700 RPM', NULL, '2024-08-19 22:26:02', '2024-08-19 22:26:02'),
(43, 22, '2.4L I4 K24W7', '2356 cc', '189 HP @ 6400 RPM', NULL, '2024-08-19 22:26:02', '2024-08-19 22:26:02'),
(44, 22, '1.5L I4 L15B7', '1497 cc', '205 HP @ 5700 RPM', NULL, '2024-08-19 22:26:02', '2024-08-19 22:26:02'),
(45, 23, '3.5L V6 VQ35DE', '3498 cc', '300 HP @ 6400 RPM', NULL, '2024-08-19 22:26:02', '2024-08-19 22:26:02'),
(46, 23, '2.5L I4 QR25DE', '2488 cc', '182 HP @ 6000 RPM', NULL, '2024-08-19 22:26:02', '2024-08-19 22:26:02'),
(47, 24, '2.0L I4 4B11', '1998 cc', '237 HP @ 6000 RPM', NULL, '2024-08-19 22:26:02', '2024-08-19 22:26:02'),
(48, 24, '1.8L I4 4B10', '1798 cc', '148 HP @ 6000 RPM', NULL, '2024-08-19 22:26:02', '2024-08-19 22:26:02'),
(49, 25, '3.0L V6 6B31', '2998 cc', '220 HP @ 6000 RPM', NULL, '2024-08-19 22:26:02', '2024-08-19 22:26:02'),
(50, 25, '2.4L I4 4G69', '2378 cc', '168 HP @ 6000 RPM', NULL, '2024-08-19 22:26:02', '2024-08-19 22:26:02'),
(51, 26, '1.8L I4 1ZZ-FE', '1794 cc', '140 HP @ 6000 RPM', NULL, '2024-08-19 22:26:02', '2024-08-19 22:26:02'),
(52, 26, '2.4L I4 2AZ-FE', '2362 cc', '160 HP @ 5600 RPM', NULL, '2024-08-19 22:26:02', '2024-08-19 22:26:02'),
(53, 27, '2.0L I4 SR20DE', '1998 cc', '140 HP @ 6400 RPM', NULL, '2024-08-19 22:26:02', '2024-08-19 22:26:02'),
(54, 27, '2.5L I4 QR25DE', '2488 cc', '170 HP @ 6000 RPM', NULL, '2024-08-19 22:26:02', '2024-08-19 22:26:02'),
(55, 28, '2.4L I4 4G69', '2378 cc', '168 HP @ 6000 RPM', NULL, '2024-08-19 22:26:02', '2024-08-19 22:26:02'),
(56, 28, '3.0L V6 6G72', '2972 cc', '177 HP @ 5500 RPM', NULL, '2024-08-19 22:26:02', '2024-08-19 22:26:02'),
(57, 29, '1.6L I4 M16A', '1586 cc', '118 HP @ 6000 RPM', NULL, '2024-08-19 22:26:02', '2024-08-19 22:26:02'),
(58, 29, '2.0L I4 J20A', '1995 cc', '140 HP @ 6000 RPM', NULL, '2024-08-19 22:26:02', '2024-08-19 22:26:02'),
(59, 30, '2.5L I4 QR25DE', '2488 cc', '170 HP @ 6000 RPM', NULL, '2024-08-19 22:26:02', '2024-08-19 22:26:02'),
(60, 30, '3.5L V6 VQ35DE', '3498 cc', '290 HP @ 6200 RPM', NULL, '2024-08-19 22:26:02', '2024-08-19 22:26:02'),
(61, 31, '1.8L I4 1ZZ-FE', '1794 cc', '132 HP @ 6000 RPM', NULL, '2024-08-19 22:26:40', '2024-08-19 22:26:40'),
(62, 31, '2.0L I4 3ZR-FE', '1987 cc', '143 HP @ 6200 RPM', NULL, '2024-08-19 22:26:40', '2024-08-19 22:26:40'),
(63, 32, '1.6L I4 HR16DE', '1598 cc', '117 HP @ 6000 RPM', NULL, '2024-08-19 22:26:40', '2024-08-19 22:26:40'),
(64, 32, '2.0L I4 MR20DE', '1997 cc', '143 HP @ 5600 RPM', NULL, '2024-08-19 22:26:40', '2024-08-19 22:26:40'),
(65, 33, '2.0L I4 FB20', '1995 cc', '148 HP @ 6000 RPM', NULL, '2024-08-19 22:26:40', '2024-08-19 22:26:40'),
(66, 33, '2.5L H4 EJ25', '2457 cc', '173 HP @ 5800 RPM', NULL, '2024-08-19 22:26:40', '2024-08-19 22:26:40'),
(67, 34, '1.4L I4 K14C', '1373 cc', '140 HP @ 5500 RPM', NULL, '2024-08-19 22:26:40', '2024-08-19 22:26:40'),
(68, 34, '1.6L I4 M16A', '1586 cc', '118 HP @ 6000 RPM', NULL, '2024-08-19 22:26:40', '2024-08-19 22:26:40'),
(69, 35, '2.0L I4 MZR LF-VE', '1999 cc', '148 HP @ 6500 RPM', NULL, '2024-08-19 22:26:40', '2024-08-19 22:26:40'),
(70, 35, '2.5L I4 MZR L5-VE', '2488 cc', '167 HP @ 6000 RPM', NULL, '2024-08-19 22:26:40', '2024-08-19 22:26:40'),
(71, 36, '1.5L I4 L15A7', '1497 cc', '120 HP @ 6600 RPM', NULL, '2024-08-19 22:26:40', '2024-08-19 22:26:40'),
(72, 36, '1.8L I4 R18A1', '1799 cc', '140 HP @ 6300 RPM', NULL, '2024-08-19 22:26:40', '2024-08-19 22:26:40'),
(73, 37, '2.0L I4 16V TDI', '1968 cc', '140 HP @ 4200 RPM', NULL, '2024-08-19 22:26:40', '2024-08-19 22:26:40'),
(74, 37, '2.0L I4 16V TDI CR', '1968 cc', '150 HP @ 3500 RPM', NULL, '2024-08-19 22:26:40', '2024-08-19 22:26:40'),
(75, 38, '1.6L I4 B16A2', '1595 cc', '160 HP @ 7600 RPM', NULL, '2024-08-19 22:26:40', '2024-08-19 22:26:40'),
(76, 38, '1.8L I4 B18C', '1797 cc', '197 HP @ 7600 RPM', NULL, '2024-08-19 22:26:40', '2024-08-19 22:26:40'),
(77, 39, '2.0L I4 B20B', '1973 cc', '146 HP @ 6200 RPM', NULL, '2024-08-19 22:26:40', '2024-08-19 22:26:40'),
(78, 39, '2.2L I4 F22B1', '2156 cc', '145 HP @ 5500 RPM', NULL, '2024-08-19 22:26:40', '2024-08-19 22:26:40');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ordenes`
--

CREATE TABLE `ordenes` (
  `id_orden` int(11) NOT NULL,
  `id_cliente` int(11) NOT NULL,
  `fecha_orden` timestamp NOT NULL DEFAULT current_timestamp(),
  `estado_orden` tinyint(5) NOT NULL DEFAULT 0,
  `total_orden` decimal(10,2) NOT NULL,
  `metodo_pago_orden` varchar(50) NOT NULL,
  `direccion_envio_orden` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `ordenes`
--

INSERT INTO `ordenes` (`id_orden`, `id_cliente`, `fecha_orden`, `estado_orden`, `total_orden`, `metodo_pago_orden`, `direccion_envio_orden`) VALUES
(40, 1, '2024-08-28 02:45:36', 1, 1000.00, 'stripe', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveedores`
--

CREATE TABLE `proveedores` (
  `id_proveedor` int(11) NOT NULL,
  `nombre_proveedor` varchar(255) NOT NULL,
  `nit_ci_proveedor` int(11) NOT NULL,
  `telefono_proveedor` varchar(255) NOT NULL,
  `direccion_proveedor` varchar(255) NOT NULL,
  `email_proveedor` text NOT NULL,
  `date_created_proveedor` timestamp NOT NULL DEFAULT current_timestamp(),
  `date_updated_proveedor` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `proveedores`
--

INSERT INTO `proveedores` (`id_proveedor`, `nombre_proveedor`, `nit_ci_proveedor`, `telefono_proveedor`, `direccion_proveedor`, `email_proveedor`, `date_created_proveedor`, `date_updated_proveedor`) VALUES
(2, 'Empresa AutoDoc', 552547, '79128536', 'Santa Cruz', '', '2024-09-17 21:03:37', '2024-09-17 22:23:44'),
(3, 'CochaRepuestos', 2542424, '67033711', 'Cochabamba', '', '2024-09-17 21:05:08', '2024-09-17 22:23:49'),
(4, 'PitterATU', 7584, '65212121', 'La Paz', '', '2024-09-17 22:23:37', '2024-09-17 22:23:37'),
(5, 'Pitter', 7091455, '79128536', 'La PAz', '', '2024-09-17 23:05:49', '2024-09-17 23:05:49');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `razon_social`
--

CREATE TABLE `razon_social` (
  `id_razon_social` int(11) NOT NULL,
  `nit_ci_razon_social` int(11) NOT NULL,
  `cliente_razon_social` text NOT NULL,
  `telefono_razon_social` int(11) DEFAULT NULL,
  `fecha_razon_social` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `razon_social`
--

INSERT INTO `razon_social` (`id_razon_social`, `nit_ci_razon_social`, `cliente_razon_social`, `telefono_razon_social`, `fecha_razon_social`) VALUES
(1, 10001, 'Pitter Studios', 79128536, '2024-09-17 22:45:23'),
(2, 2000, 'Juan', 4545, '2024-09-18 00:33:48'),
(3, 3000, 'JPitter', NULL, '2024-09-18 00:35:27');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `repuestos`
--

CREATE TABLE `repuestos` (
  `id_repuesto` int(11) NOT NULL,
  `id_categoria` int(11) DEFAULT NULL,
  `nombre_repuesto` varchar(255) NOT NULL,
  `descripcion_repuesto` text DEFAULT NULL,
  `oem_repuesto` varchar(255) DEFAULT NULL,
  `codigo_tienda_repuesto` varchar(255) NOT NULL,
  `img_repuesto` text DEFAULT NULL,
  `stock_repuesto` int(11) NOT NULL,
  `precio_repuesto` decimal(10,2) NOT NULL,
  `fabricante_repuesto` varchar(255) DEFAULT NULL,
  `venta_repuesto` int(11) NOT NULL DEFAULT 0,
  `peso_repuesto` double(5,2) NOT NULL DEFAULT 0.00,
  `estado_repuesto` tinyint(4) NOT NULL DEFAULT 1,
  `date_created_repuesto` timestamp NOT NULL DEFAULT current_timestamp(),
  `date_updated_repuesto` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `id_marca` int(11) DEFAULT NULL,
  `id_modelo` int(11) DEFAULT NULL,
  `id_motor` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `repuestos`
--

INSERT INTO `repuestos` (`id_repuesto`, `id_categoria`, `nombre_repuesto`, `descripcion_repuesto`, `oem_repuesto`, `codigo_tienda_repuesto`, `img_repuesto`, `stock_repuesto`, `precio_repuesto`, `fabricante_repuesto`, `venta_repuesto`, `peso_repuesto`, `estado_repuesto`, `date_created_repuesto`, `date_updated_repuesto`, `id_marca`, `id_modelo`, `id_motor`) VALUES
(1, 1, 'filtros para 1.8L I4 2ZR-FE', 'Descripción de filtros compatible con 1.8L I4 2ZR-FE', '1', 'R-1000', 'public/assets/shop/img/repuestos/filtros.png', 45, 1.00, 'Genérico', 0, 1.00, 1, '2024-08-19 22:46:38', '2024-09-18 10:20:01', 1, 1, 1),
(2, 2, 'frenos para 1.8L I4 2ZR-FE', 'Descripción de frenos compatible con 1.8L I4 2ZR-FE', '1', 'R-1001', 'public/assets/shop/img/repuestos/frenos.png', 50, 1.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:38', '2024-09-18 07:58:35', 1, 1, 1),
(3, 3, 'motor para 1.8L I4 2ZR-FE', 'Descripción de motor compatible con 1.8L I4 2ZR-FE', '1', 'R-1002', 'public/assets/shop/img/repuestos/motor.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:38', '2024-08-19 22:46:38', 1, 1, 1),
(4, 4, 'suspension para 1.8L I4 2ZR-FE', 'Descripción de suspension compatible con 1.8L I4 2ZR-FE', '1', 'R-1003', 'public/assets/shop/img/repuestos/suspension.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:38', '2024-08-19 22:46:38', 1, 1, 1),
(5, 5, 'amortiguadores para 1.8L I4 2ZR-FE', 'Descripción de amortiguadores compatible con 1.8L I4 2ZR-FE', '1', 'R-1004', 'public/assets/shop/img/repuestos/amortiguadores.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:38', '2024-08-19 22:46:38', 1, 1, 1),
(6, 6, 'bujias para 1.8L I4 2ZR-FE', 'Descripción de bujias compatible con 1.8L I4 2ZR-FE', '1', 'R-1005', 'public/assets/shop/img/repuestos/bujias.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:38', '2024-08-19 22:46:38', 1, 1, 1),
(7, 7, 'carreras, cadenas, rodillos para 1.8L I4 2ZR-FE', 'Descripción de carreras, cadenas, rodillos compatible con 1.8L I4 2ZR-FE', '1', 'R-1006', 'public/assets/shop/img/repuestos/correas.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:38', '2024-08-20 01:31:19', 1, 1, 1),
(8, 8, 'embrague para 1.8L I4 2ZR-FE', 'Descripción de embrague compatible con 1.8L I4 2ZR-FE', '1', 'R-1007', 'public/assets/shop/img/repuestos/embrague.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:38', '2024-08-19 22:46:38', 1, 1, 1),
(9, 9, 'rodamientos para 1.8L I4 2ZR-FE', 'Descripción de rodamientos compatible con 1.8L I4 2ZR-FE', '1', 'R-1008', 'public/assets/shop/img/repuestos/rodamientos.png', 50, 100.59, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:38', '2024-08-22 21:14:20', 1, 1, 1),
(10, 1, 'filtros para 2.0L I4 3ZR-FAE', 'Descripción de filtros compatible con 2.0L I4 3ZR-FAE', '1', 'R-1009', 'public/assets/shop/img/repuestos/filtros.png', 39, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:38', '2024-09-18 07:55:53', 1, 1, 2),
(11, 2, 'frenos para 2.0L I4 3ZR-FAE', 'Descripción de frenos compatible con 2.0L I4 3ZR-FAE', '1', 'R-1010', 'public/assets/shop/img/repuestos/frenos.png', 2, 100.00, 'Genérico', 0, 0.00, 0, '2024-08-19 22:46:38', '2024-08-21 22:39:25', 1, 1, 2),
(12, 3, 'motor para 2.0L I4 3ZR-FAE', 'Descripción de motor compatible con 2.0L I4 3ZR-FAE', '1', 'R-1011', 'public/assets/shop/img/repuestos/motor.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:38', '2024-08-19 22:46:38', 1, 1, 2),
(13, 4, 'suspension para 2.0L I4 3ZR-FAE', 'Descripción de suspension compatible con 2.0L I4 3ZR-FAE', '1', 'R-1012', 'public/assets/shop/img/repuestos/suspension.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:38', '2024-08-19 22:46:38', 1, 1, 2),
(14, 5, 'amortiguadores para 2.0L I4 3ZR-FAE', 'Descripción de amortiguadores compatible con 2.0L I4 3ZR-FAE', '1', 'R-1013', 'public/assets/shop/img/repuestos/amortiguadores.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:38', '2024-08-19 22:46:38', 1, 1, 2),
(15, 6, 'bujias para 2.0L I4 3ZR-FAE', 'Descripción de bujias compatible con 2.0L I4 3ZR-FAE', '1', 'R-1014', 'public/assets/shop/img/repuestos/bujias.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:38', '2024-08-19 22:46:38', 1, 1, 2),
(16, 7, 'carreras, cadenas, rodillos para 2.0L I4 3ZR-FAE', 'Descripción de carreras, cadenas, rodillos compatible con 2.0L I4 3ZR-FAE', '1', 'R-1015', 'public/assets/shop/img/repuestos/correas.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:38', '2024-08-20 01:31:19', 1, 1, 2),
(17, 8, 'embrague para 2.0L I4 3ZR-FAE', 'Descripción de embrague compatible con 2.0L I4 3ZR-FAE', '1', 'R-1016', 'public/assets/shop/img/repuestos/embrague.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:38', '2024-08-19 22:46:38', 1, 1, 2),
(18, 9, 'rodamientos para 2.0L I4 3ZR-FAE', 'Descripción de rodamientos compatible con 2.0L I4 3ZR-FAE', '1', 'R-1017', 'public/assets/shop/img/repuestos/rodamientos.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:38', '2024-08-19 22:46:38', 1, 1, 2),
(19, 1, 'filtros para 2.8L I4 1GD-FTV', 'Descripción de filtros compatible con 2.8L I4 1GD-FTV', '1', 'R-1018', 'public/assets/shop/img/repuestos/filtros.png', 49, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:38', '2024-09-18 06:33:48', 1, 2, 3),
(20, 2, 'frenos para 2.8L I4 1GD-FTV', 'Descripción de frenos compatible con 2.8L I4 1GD-FTV', '1', 'R-1019', 'public/assets/shop/img/repuestos/frenos.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:38', '2024-08-19 22:46:38', 1, 2, 3),
(21, 3, 'motor para 2.8L I4 1GD-FTV', 'Descripción de motor compatible con 2.8L I4 1GD-FTV', '1', 'R-1020', 'public/assets/shop/img/repuestos/motor.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:38', '2024-08-19 22:46:38', 1, 2, 3),
(22, 4, 'suspension para 2.8L I4 1GD-FTV', 'Descripción de suspension compatible con 2.8L I4 1GD-FTV', '1', 'R-1021', 'public/assets/shop/img/repuestos/suspension.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:38', '2024-08-19 22:46:38', 1, 2, 3),
(23, 5, 'amortiguadores para 2.8L I4 1GD-FTV', 'Descripción de amortiguadores compatible con 2.8L I4 1GD-FTV', '1', 'R-1022', 'public/assets/shop/img/repuestos/amortiguadores.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:38', '2024-08-19 22:46:38', 1, 2, 3),
(24, 6, 'bujias para 2.8L I4 1GD-FTV', 'Descripción de bujias compatible con 2.8L I4 1GD-FTV', '1', 'R-1023', 'public/assets/shop/img/repuestos/bujias.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:38', '2024-08-19 22:46:38', 1, 2, 3),
(25, 7, 'carreras, cadenas, rodillos para 2.8L I4 1GD-FTV', 'Descripción de carreras, cadenas, rodillos compatible con 2.8L I4 1GD-FTV', '1', 'R-1024', 'public/assets/shop/img/repuestos/correas.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:38', '2024-08-20 01:31:19', 1, 2, 3),
(26, 8, 'embrague para 2.8L I4 1GD-FTV', 'Descripción de embrague compatible con 2.8L I4 1GD-FTV', '1', 'R-1025', 'public/assets/shop/img/repuestos/embrague.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:38', '2024-08-19 22:46:38', 1, 2, 3),
(27, 9, 'rodamientos para 2.8L I4 1GD-FTV', 'Descripción de rodamientos compatible con 2.8L I4 1GD-FTV', '1', 'R-1026', 'public/assets/shop/img/repuestos/rodamientos.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:38', '2024-08-19 22:46:38', 1, 2, 3),
(28, 1, 'filtros para 4.0L V6 1GR-FE', 'Descripción de filtros compatible con 4.0L V6 1GR-FE', '1', 'R-1027', 'public/assets/shop/img/repuestos/filtros.png', 49, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:38', '2024-09-18 07:19:08', 1, 2, 4),
(29, 2, 'frenos para 4.0L V6 1GR-FE', 'Descripción de frenos compatible con 4.0L V6 1GR-FE', '1', 'R-1028', 'public/assets/shop/img/repuestos/frenos.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:38', '2024-08-19 22:46:38', 1, 2, 4),
(30, 3, 'motor para 4.0L V6 1GR-FE', 'Descripción de motor compatible con 4.0L V6 1GR-FE', '1', 'R-1029', 'public/assets/shop/img/repuestos/motor.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:38', '2024-08-19 22:46:38', 1, 2, 4),
(31, 4, 'suspension para 4.0L V6 1GR-FE', 'Descripción de suspension compatible con 4.0L V6 1GR-FE', '1', 'R-1030', 'public/assets/shop/img/repuestos/suspension.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:38', '2024-08-19 22:46:38', 1, 2, 4),
(32, 5, 'amortiguadores para 4.0L V6 1GR-FE', 'Descripción de amortiguadores compatible con 4.0L V6 1GR-FE', '1', 'R-1031', 'public/assets/shop/img/repuestos/amortiguadores.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:38', '2024-08-19 22:46:38', 1, 2, 4),
(33, 6, 'bujias para 4.0L V6 1GR-FE', 'Descripción de bujias compatible con 4.0L V6 1GR-FE', '1', 'R-1032', 'public/assets/shop/img/repuestos/bujias.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:38', '2024-08-19 22:46:38', 1, 2, 4),
(34, 7, 'carreras, cadenas, rodillos para 4.0L V6 1GR-FE', 'Descripción de carreras, cadenas, rodillos compatible con 4.0L V6 1GR-FE', '1', 'R-1033', 'public/assets/shop/img/repuestos/correas.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:38', '2024-08-20 01:31:19', 1, 2, 4),
(35, 8, 'embrague para 4.0L V6 1GR-FE', 'Descripción de embrague compatible con 4.0L V6 1GR-FE', '1', 'R-1034', 'public/assets/shop/img/repuestos/embrague.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:38', '2024-08-19 22:46:38', 1, 2, 4),
(36, 9, 'rodamientos para 4.0L V6 1GR-FE', 'Descripción de rodamientos compatible con 4.0L V6 1GR-FE', '1', 'R-1035', 'public/assets/shop/img/repuestos/rodamientos.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:38', '2024-08-19 22:46:38', 1, 2, 4),
(37, 1, 'filtros para 2.8L I4 1GD-FTV', 'Descripción de filtros compatible con 2.8L I4 1GD-FTV', '1', 'R-1036', 'public/assets/shop/img/repuestos/filtros.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:38', '2024-08-19 22:46:38', 1, 3, 5),
(38, 2, 'frenos para 2.8L I4 1GD-FTV', 'Descripción de frenos compatible con 2.8L I4 1GD-FTV', '1', 'R-1037', 'public/assets/shop/img/repuestos/frenos.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:38', '2024-08-19 22:46:38', 1, 3, 5),
(39, 3, 'motor para 2.8L I4 1GD-FTV', 'Descripción de motor compatible con 2.8L I4 1GD-FTV', '1', 'R-1038', 'public/assets/shop/img/repuestos/motor.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:38', '2024-08-19 22:46:38', 1, 3, 5),
(40, 4, 'suspension para 2.8L I4 1GD-FTV', 'Descripción de suspension compatible con 2.8L I4 1GD-FTV', '1', 'R-1039', 'public/assets/shop/img/repuestos/suspension.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:38', '2024-08-19 22:46:38', 1, 3, 5),
(41, 5, 'amortiguadores para 2.8L I4 1GD-FTV', 'Descripción de amortiguadores compatible con 2.8L I4 1GD-FTV', '1', 'R-1040', 'public/assets/shop/img/repuestos/amortiguadores.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:38', '2024-08-19 22:46:38', 1, 3, 5),
(42, 6, 'bujias para 2.8L I4 1GD-FTV', 'Descripción de bujias compatible con 2.8L I4 1GD-FTV', '1', 'R-1041', 'public/assets/shop/img/repuestos/bujias.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:38', '2024-08-19 22:46:38', 1, 3, 5),
(43, 7, 'carreras, cadenas, rodillos para 2.8L I4 1GD-FTV', 'Descripción de carreras, cadenas, rodillos compatible con 2.8L I4 1GD-FTV', '1', 'R-1042', 'public/assets/shop/img/repuestos/correas.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:38', '2024-08-20 01:31:19', 1, 3, 5),
(44, 8, 'embrague para 2.8L I4 1GD-FTV', 'Descripción de embrague compatible con 2.8L I4 1GD-FTV', '1', 'R-1043', 'public/assets/shop/img/repuestos/embrague.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:38', '2024-08-19 22:46:38', 1, 3, 5),
(45, 9, 'rodamientos para 2.8L I4 1GD-FTV', 'Descripción de rodamientos compatible con 2.8L I4 1GD-FTV', '1', 'R-1044', 'public/assets/shop/img/repuestos/rodamientos.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:38', '2024-08-19 22:46:38', 1, 3, 5),
(46, 1, 'filtros para 4.0L V6 1GR-FE', 'Descripción de filtros compatible con 4.0L V6 1GR-FE', '1', 'R-1045', 'public/assets/shop/img/repuestos/filtros.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:38', '2024-08-19 22:46:38', 1, 3, 6),
(47, 2, 'frenos para 4.0L V6 1GR-FE', 'Descripción de frenos compatible con 4.0L V6 1GR-FE', '1', 'R-1046', 'public/assets/shop/img/repuestos/frenos.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:38', '2024-08-19 22:46:38', 1, 3, 6),
(48, 3, 'motor para 4.0L V6 1GR-FE', 'Descripción de motor compatible con 4.0L V6 1GR-FE', '1', 'R-1047', 'public/assets/shop/img/repuestos/motor.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:38', '2024-08-19 22:46:38', 1, 3, 6),
(49, 4, 'suspension para 4.0L V6 1GR-FE', 'Descripción de suspension compatible con 4.0L V6 1GR-FE', '1', 'R-1048', 'public/assets/shop/img/repuestos/suspension.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:38', '2024-08-19 22:46:38', 1, 3, 6),
(50, 5, 'amortiguadores para 4.0L V6 1GR-FE', 'Descripción de amortiguadores compatible con 4.0L V6 1GR-FE', '1', 'R-1049', 'public/assets/shop/img/repuestos/amortiguadores.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:38', '2024-08-19 22:46:38', 1, 3, 6),
(51, 6, 'bujias para 4.0L V6 1GR-FE', 'Descripción de bujias compatible con 4.0L V6 1GR-FE', '1', 'R-1050', 'public/assets/shop/img/repuestos/bujias.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:38', '2024-08-19 22:46:38', 1, 3, 6),
(52, 7, 'carreras, cadenas, rodillos para 4.0L V6 1GR-FE', 'Descripción de carreras, cadenas, rodillos compatible con 4.0L V6 1GR-FE', '1', 'R-1051', 'public/assets/shop/img/repuestos/correas.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:38', '2024-08-20 01:31:19', 1, 3, 6),
(53, 8, 'embrague para 4.0L V6 1GR-FE', 'Descripción de embrague compatible con 4.0L V6 1GR-FE', '1', 'R-1052', 'public/assets/shop/img/repuestos/embrague.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:38', '2024-08-19 22:46:38', 1, 3, 6),
(54, 9, 'rodamientos para 4.0L V6 1GR-FE', 'Descripción de rodamientos compatible con 4.0L V6 1GR-FE', '1', 'R-1053', 'public/assets/shop/img/repuestos/rodamientos.png', 50, 59.99, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:38', '2024-08-22 21:14:44', 1, 3, 6),
(55, 1, 'filtros para 1.6L I4 HR16DE', 'Descripción de filtros compatible con 1.6L I4 HR16DE', '1', 'R-1054', 'public/assets/shop/img/repuestos/filtros.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:38', '2024-08-19 22:46:38', 2, 4, 7),
(56, 2, 'frenos para 1.6L I4 HR16DE', 'Descripción de frenos compatible con 1.6L I4 HR16DE', '1', 'R-1055', 'public/assets/shop/img/repuestos/frenos.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:38', '2024-08-19 22:46:38', 2, 4, 7),
(57, 3, 'motor para 1.6L I4 HR16DE', 'Descripción de motor compatible con 1.6L I4 HR16DE', '1', 'R-1056', 'public/assets/shop/img/repuestos/motor.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:38', '2024-08-19 22:46:38', 2, 4, 7),
(58, 4, 'suspension para 1.6L I4 HR16DE', 'Descripción de suspension compatible con 1.6L I4 HR16DE', '1', 'R-1057', 'public/assets/shop/img/repuestos/suspension.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:38', '2024-08-19 22:46:38', 2, 4, 7),
(59, 5, 'amortiguadores para 1.6L I4 HR16DE', 'Descripción de amortiguadores compatible con 1.6L I4 HR16DE', '1', 'R-1058', 'public/assets/shop/img/repuestos/amortiguadores.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:38', '2024-08-19 22:46:38', 2, 4, 7),
(60, 6, 'bujias para 1.6L I4 HR16DE', 'Descripción de bujias compatible con 1.6L I4 HR16DE', '1', 'R-1059', 'public/assets/shop/img/repuestos/bujias.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:38', '2024-08-19 22:46:38', 2, 4, 7),
(61, 7, 'carreras, cadenas, rodillos para 1.6L I4 HR16DE', 'Descripción de carreras, cadenas, rodillos compatible con 1.6L I4 HR16DE', '1', 'R-1060', 'public/assets/shop/img/repuestos/correas.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:38', '2024-08-20 01:31:19', 2, 4, 7),
(62, 8, 'embrague para 1.6L I4 HR16DE', 'Descripción de embrague compatible con 1.6L I4 HR16DE', '1', 'R-1061', 'public/assets/shop/img/repuestos/embrague.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:38', '2024-08-19 22:46:38', 2, 4, 7),
(63, 9, 'rodamientos para 1.6L I4 HR16DE', 'Descripción de rodamientos compatible con 1.6L I4 HR16DE', '1', 'R-1062', 'public/assets/shop/img/repuestos/rodamientos.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:38', '2024-08-19 22:46:38', 2, 4, 7),
(64, 1, 'filtros para 2.0L I4 MR20DE', 'Descripción de filtros compatible con 2.0L I4 MR20DE', '1', 'R-1063', 'public/assets/shop/img/repuestos/filtros.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:38', '2024-08-19 22:46:38', 2, 4, 8),
(65, 2, 'frenos para 2.0L I4 MR20DE', 'Descripción de frenos compatible con 2.0L I4 MR20DE', '1', 'R-1064', 'public/assets/shop/img/repuestos/frenos.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:38', '2024-08-19 22:46:38', 2, 4, 8),
(66, 3, 'motor para 2.0L I4 MR20DE', 'Descripción de motor compatible con 2.0L I4 MR20DE', '1', 'R-1065', 'public/assets/shop/img/repuestos/motor.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:38', '2024-08-19 22:46:38', 2, 4, 8),
(67, 4, 'suspension para 2.0L I4 MR20DE', 'Descripción de suspension compatible con 2.0L I4 MR20DE', '1', 'R-1066', 'public/assets/shop/img/repuestos/suspension.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:38', '2024-08-19 22:46:38', 2, 4, 8),
(68, 5, 'amortiguadores para 2.0L I4 MR20DE', 'Descripción de amortiguadores compatible con 2.0L I4 MR20DE', '1', 'R-1067', 'public/assets/shop/img/repuestos/amortiguadores.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:38', '2024-08-19 22:46:38', 2, 4, 8),
(69, 6, 'bujias para 2.0L I4 MR20DE', 'Descripción de bujias compatible con 2.0L I4 MR20DE', '1', 'R-1068', 'public/assets/shop/img/repuestos/bujias.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:38', '2024-08-19 22:46:38', 2, 4, 8),
(70, 7, 'carreras, cadenas, rodillos para 2.0L I4 MR20DE', 'Descripción de carreras, cadenas, rodillos compatible con 2.0L I4 MR20DE', '1', 'R-1069', 'public/assets/shop/img/repuestos/correas.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:38', '2024-08-20 01:31:19', 2, 4, 8),
(71, 8, 'embrague para 2.0L I4 MR20DE', 'Descripción de embrague compatible con 2.0L I4 MR20DE', '1', 'R-1070', 'public/assets/shop/img/repuestos/embrague.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:38', '2024-08-19 22:46:38', 2, 4, 8),
(72, 9, 'rodamientos para 2.0L I4 MR20DE', 'Descripción de rodamientos compatible con 2.0L I4 MR20DE', '1', 'R-1071', 'public/assets/shop/img/repuestos/rodamientos.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:38', '2024-08-19 22:46:38', 2, 4, 8),
(73, 1, 'filtros para 4.8L I6 TB48DE', 'Descripción de filtros compatible con 4.8L I6 TB48DE', '1', 'R-1072', 'public/assets/shop/img/repuestos/filtros.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:38', '2024-08-19 22:46:38', 2, 5, 9),
(74, 2, 'frenos para 4.8L I6 TB48DE', 'Descripción de frenos compatible con 4.8L I6 TB48DE', '1', 'R-1073', 'public/assets/shop/img/repuestos/frenos.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:38', '2024-08-19 22:46:38', 2, 5, 9),
(75, 3, 'motor para 4.8L I6 TB48DE', 'Descripción de motor compatible con 4.8L I6 TB48DE', '1', 'R-1074', 'public/assets/shop/img/repuestos/motor.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:38', '2024-08-19 22:46:38', 2, 5, 9),
(76, 4, 'suspension para 4.8L I6 TB48DE', 'Descripción de suspension compatible con 4.8L I6 TB48DE', '1', 'R-1075', 'public/assets/shop/img/repuestos/suspension.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:38', '2024-08-19 22:46:38', 2, 5, 9),
(77, 5, 'amortiguadores para 4.8L I6 TB48DE', 'Descripción de amortiguadores compatible con 4.8L I6 TB48DE', '1', 'R-1076', 'public/assets/shop/img/repuestos/amortiguadores.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:38', '2024-08-19 22:46:38', 2, 5, 9),
(78, 6, 'bujias para 4.8L I6 TB48DE', 'Descripción de bujias compatible con 4.8L I6 TB48DE', '1', 'R-1077', 'public/assets/shop/img/repuestos/bujias.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:38', '2024-08-19 22:46:38', 2, 5, 9),
(79, 7, 'carreras, cadenas, rodillos para 4.8L I6 TB48DE', 'Descripción de carreras, cadenas, rodillos compatible con 4.8L I6 TB48DE', '1', 'R-1078', 'public/assets/shop/img/repuestos/correas.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:38', '2024-08-20 01:31:19', 2, 5, 9),
(80, 8, 'embrague para 4.8L I6 TB48DE', 'Descripción de embrague compatible con 4.8L I6 TB48DE', '1', 'R-1079', 'public/assets/shop/img/repuestos/embrague.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:38', '2024-08-19 22:46:38', 2, 5, 9),
(81, 9, 'rodamientos para 4.8L I6 TB48DE', 'Descripción de rodamientos compatible con 4.8L I6 TB48DE', '1', 'R-1080', 'public/assets/shop/img/repuestos/rodamientos.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:38', '2024-08-19 22:46:38', 2, 5, 9),
(82, 1, 'filtros para 5.6L V8 VK56VD', 'Descripción de filtros compatible con 5.6L V8 VK56VD', '1', 'R-1081', 'public/assets/shop/img/repuestos/filtros.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:38', '2024-08-19 22:46:38', 2, 5, 10),
(83, 2, 'frenos para 5.6L V8 VK56VD', 'Descripción de frenos compatible con 5.6L V8 VK56VD', '1', 'R-1082', 'public/assets/shop/img/repuestos/frenos.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:38', '2024-08-19 22:46:38', 2, 5, 10),
(84, 3, 'motor para 5.6L V8 VK56VD', 'Descripción de motor compatible con 5.6L V8 VK56VD', '1', 'R-1083', 'public/assets/shop/img/repuestos/motor.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:38', '2024-08-19 22:46:38', 2, 5, 10),
(85, 4, 'suspension para 5.6L V8 VK56VD', 'Descripción de suspension compatible con 5.6L V8 VK56VD', '1', 'R-1084', 'public/assets/shop/img/repuestos/suspension.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:38', '2024-08-19 22:46:38', 2, 5, 10),
(86, 5, 'amortiguadores para 5.6L V8 VK56VD', 'Descripción de amortiguadores compatible con 5.6L V8 VK56VD', '1', 'R-1085', 'public/assets/shop/img/repuestos/amortiguadores.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:38', '2024-08-19 22:46:38', 2, 5, 10),
(87, 6, 'bujias para 5.6L V8 VK56VD', 'Descripción de bujias compatible con 5.6L V8 VK56VD', '1', 'R-1086', 'public/assets/shop/img/repuestos/bujias.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:38', '2024-08-19 22:46:38', 2, 5, 10),
(88, 7, 'carreras, cadenas, rodillos para 5.6L V8 VK56VD', 'Descripción de carreras, cadenas, rodillos compatible con 5.6L V8 VK56VD', '1', 'R-1087', 'public/assets/shop/img/repuestos/correas.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:38', '2024-08-20 01:31:19', 2, 5, 10),
(89, 8, 'embrague para 5.6L V8 VK56VD', 'Descripción de embrague compatible con 5.6L V8 VK56VD', '1', 'R-1088', 'public/assets/shop/img/repuestos/embrague.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:38', '2024-08-19 22:46:38', 2, 5, 10),
(90, 9, 'rodamientos para 5.6L V8 VK56VD', 'Descripción de rodamientos compatible con 5.6L V8 VK56VD', '1', 'R-1089', 'public/assets/shop/img/repuestos/rodamientos.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:38', '2024-08-19 22:46:38', 2, 5, 10),
(91, 1, 'filtros para 2.0L I4 K20C1', 'Descripción de filtros compatible con 2.0L I4 K20C1', '1', 'R-1090', 'public/assets/shop/img/repuestos/filtros.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:38', '2024-08-19 22:46:38', 2, 6, 11),
(92, 2, 'frenos para 2.0L I4 K20C1', 'Descripción de frenos compatible con 2.0L I4 K20C1', '1', 'R-1091', 'public/assets/shop/img/repuestos/frenos.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:38', '2024-08-19 22:46:38', 2, 6, 11),
(93, 3, 'motor para 2.0L I4 K20C1', 'Descripción de motor compatible con 2.0L I4 K20C1', '1', 'R-1092', 'public/assets/shop/img/repuestos/motor.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:38', '2024-08-19 22:46:38', 2, 6, 11),
(94, 4, 'suspension para 2.0L I4 K20C1', 'Descripción de suspension compatible con 2.0L I4 K20C1', '1', 'R-1093', 'public/assets/shop/img/repuestos/suspension.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:38', '2024-08-19 22:46:38', 2, 6, 11),
(95, 5, 'amortiguadores para 2.0L I4 K20C1', 'Descripción de amortiguadores compatible con 2.0L I4 K20C1', '1', 'R-1094', 'public/assets/shop/img/repuestos/amortiguadores.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:38', '2024-08-19 22:46:38', 2, 6, 11),
(96, 6, 'bujias para 2.0L I4 K20C1', 'Descripción de bujias compatible con 2.0L I4 K20C1', '1', 'R-1095', 'public/assets/shop/img/repuestos/bujias.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:38', '2024-08-19 22:46:38', 2, 6, 11),
(97, 7, 'carreras, cadenas, rodillos para 2.0L I4 K20C1', 'Descripción de carreras, cadenas, rodillos compatible con 2.0L I4 K20C1', '1', 'R-1096', 'public/assets/shop/img/repuestos/correas.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:38', '2024-08-20 01:31:19', 2, 6, 11),
(98, 8, 'embrague para 2.0L I4 K20C1', 'Descripción de embrague compatible con 2.0L I4 K20C1', '1', 'R-1097', 'public/assets/shop/img/repuestos/embrague.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:38', '2024-08-19 22:46:38', 2, 6, 11),
(99, 9, 'rodamientos para 2.0L I4 K20C1', 'Descripción de rodamientos compatible con 2.0L I4 K20C1', '1', 'R-1098', 'public/assets/shop/img/repuestos/rodamientos.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:38', '2024-08-19 22:46:38', 2, 6, 11),
(100, 1, 'filtros para 1.5L I4 L15B7', 'Descripción de filtros compatible con 1.5L I4 L15B7', '1', 'R-1099', 'public/assets/shop/img/repuestos/filtros.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:38', '2024-08-19 22:46:38', 2, 6, 12),
(101, 2, 'frenos para 1.5L I4 L15B7', 'Descripción de frenos compatible con 1.5L I4 L15B7', '1', 'R-1100', 'public/assets/shop/img/repuestos/frenos.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:38', '2024-08-19 22:46:38', 2, 6, 12),
(102, 3, 'motor para 1.5L I4 L15B7', 'Descripción de motor compatible con 1.5L I4 L15B7', '1', 'R-1101', 'public/assets/shop/img/repuestos/motor.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:38', '2024-08-19 22:46:38', 2, 6, 12),
(103, 4, 'suspension para 1.5L I4 L15B7', 'Descripción de suspension compatible con 1.5L I4 L15B7', '1', 'R-1102', 'public/assets/shop/img/repuestos/suspension.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:38', '2024-08-19 22:46:38', 2, 6, 12),
(104, 5, 'amortiguadores para 1.5L I4 L15B7', 'Descripción de amortiguadores compatible con 1.5L I4 L15B7', '1', 'R-1103', 'public/assets/shop/img/repuestos/amortiguadores.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:38', '2024-08-19 22:46:38', 2, 6, 12),
(105, 6, 'bujias para 1.5L I4 L15B7', 'Descripción de bujias compatible con 1.5L I4 L15B7', '1', 'R-1104', 'public/assets/shop/img/repuestos/bujias.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:38', '2024-08-19 22:46:38', 2, 6, 12),
(106, 7, 'carreras, cadenas, rodillos para 1.5L I4 L15B7', 'Descripción de carreras, cadenas, rodillos compatible con 1.5L I4 L15B7', '1', 'R-1105', 'public/assets/shop/img/repuestos/correas.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:38', '2024-08-20 01:31:19', 2, 6, 12),
(107, 8, 'embrague para 1.5L I4 L15B7', 'Descripción de embrague compatible con 1.5L I4 L15B7', '1', 'R-1106', 'public/assets/shop/img/repuestos/embrague.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:38', '2024-08-19 22:46:38', 2, 6, 12),
(108, 9, 'rodamientos para 1.5L I4 L15B7', 'Descripción de rodamientos compatible con 1.5L I4 L15B7', '1', 'R-1107', 'public/assets/shop/img/repuestos/rodamientos.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:38', '2024-08-19 22:46:38', 2, 6, 12),
(109, 1, 'filtros para 2.4L I4 K24W7', 'Descripción de filtros compatible con 2.4L I4 K24W7', '1', 'R-1108', 'public/assets/shop/img/repuestos/filtros.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:38', '2024-08-19 22:46:38', 3, 7, 13),
(110, 2, 'frenos para 2.4L I4 K24W7', 'Descripción de frenos compatible con 2.4L I4 K24W7', '1', 'R-1109', 'public/assets/shop/img/repuestos/frenos.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:38', '2024-08-19 22:46:38', 3, 7, 13),
(111, 3, 'motor para 2.4L I4 K24W7', 'Descripción de motor compatible con 2.4L I4 K24W7', '1', 'R-1110', 'public/assets/shop/img/repuestos/motor.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:38', '2024-08-19 22:46:38', 3, 7, 13),
(112, 4, 'suspension para 2.4L I4 K24W7', 'Descripción de suspension compatible con 2.4L I4 K24W7', '1', 'R-1111', 'public/assets/shop/img/repuestos/suspension.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:38', '2024-08-19 22:46:38', 3, 7, 13),
(113, 5, 'amortiguadores para 2.4L I4 K24W7', 'Descripción de amortiguadores compatible con 2.4L I4 K24W7', '1', 'R-1112', 'public/assets/shop/img/repuestos/amortiguadores.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:38', '2024-08-19 22:46:38', 3, 7, 13),
(114, 6, 'bujias para 2.4L I4 K24W7', 'Descripción de bujias compatible con 2.4L I4 K24W7', '1', 'R-1113', 'public/assets/shop/img/repuestos/bujias.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:38', '2024-08-19 22:46:38', 3, 7, 13),
(115, 7, 'carreras, cadenas, rodillos para 2.4L I4 K24W7', 'Descripción de carreras, cadenas, rodillos compatible con 2.4L I4 K24W7', '1', 'R-1114', 'public/assets/shop/img/repuestos/correas.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:38', '2024-08-20 01:31:19', 3, 7, 13),
(116, 8, 'embrague para 2.4L I4 K24W7', 'Descripción de embrague compatible con 2.4L I4 K24W7', '1', 'R-1115', 'public/assets/shop/img/repuestos/embrague.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:38', '2024-08-19 22:46:38', 3, 7, 13),
(117, 9, 'rodamientos para 2.4L I4 K24W7', 'Descripción de rodamientos compatible con 2.4L I4 K24W7', '1', 'R-1116', 'public/assets/shop/img/repuestos/rodamientos.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:38', '2024-08-19 22:46:38', 3, 7, 13),
(118, 1, 'filtros para 1.5L I4 L15B7', 'Descripción de filtros compatible con 1.5L I4 L15B7', '1', 'R-1117', 'public/assets/shop/img/repuestos/filtros.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:38', '2024-08-19 22:46:38', 3, 7, 14),
(119, 2, 'frenos para 1.5L I4 L15B7', 'Descripción de frenos compatible con 1.5L I4 L15B7', '1', 'R-1118', 'public/assets/shop/img/repuestos/frenos.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:38', '2024-08-19 22:46:38', 3, 7, 14),
(120, 3, 'motor para 1.5L I4 L15B7', 'Descripción de motor compatible con 1.5L I4 L15B7', '1', 'R-1119', 'public/assets/shop/img/repuestos/motor.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:38', '2024-08-19 22:46:38', 3, 7, 14),
(121, 4, 'suspension para 1.5L I4 L15B7', 'Descripción de suspension compatible con 1.5L I4 L15B7', '1', 'R-1120', 'public/assets/shop/img/repuestos/suspension.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:38', '2024-08-19 22:46:38', 3, 7, 14),
(122, 5, 'amortiguadores para 1.5L I4 L15B7', 'Descripción de amortiguadores compatible con 1.5L I4 L15B7', '1', 'R-1121', 'public/assets/shop/img/repuestos/amortiguadores.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:38', '2024-08-19 22:46:38', 3, 7, 14),
(123, 6, 'bujias para 1.5L I4 L15B7', 'Descripción de bujias compatible con 1.5L I4 L15B7', '1', 'R-1122', 'public/assets/shop/img/repuestos/bujias.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:38', '2024-08-19 22:46:38', 3, 7, 14),
(124, 7, 'carreras, cadenas, rodillos para 1.5L I4 L15B7', 'Descripción de carreras, cadenas, rodillos compatible con 1.5L I4 L15B7', '1', 'R-1123', 'public/assets/shop/img/repuestos/correas.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:38', '2024-08-20 01:31:19', 3, 7, 14),
(125, 8, 'embrague para 1.5L I4 L15B7', 'Descripción de embrague compatible con 1.5L I4 L15B7', '1', 'R-1124', 'public/assets/shop/img/repuestos/embrague.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:38', '2024-08-19 22:46:38', 3, 7, 14),
(126, 9, 'rodamientos para 1.5L I4 L15B7', 'Descripción de rodamientos compatible con 1.5L I4 L15B7', '1', 'R-1125', 'public/assets/shop/img/repuestos/rodamientos.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:38', '2024-08-19 22:46:38', 3, 7, 14),
(127, 1, 'filtros para 3.5L V6 VQ35DE', 'Descripción de filtros compatible con 3.5L V6 VQ35DE', '1', 'R-1126', 'public/assets/shop/img/repuestos/filtros.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:38', '2024-08-19 22:46:38', 3, 8, 15),
(128, 2, 'frenos para 3.5L V6 VQ35DE', 'Descripción de frenos compatible con 3.5L V6 VQ35DE', '1', 'R-1127', 'public/assets/shop/img/repuestos/frenos.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:38', '2024-08-19 22:46:38', 3, 8, 15),
(129, 3, 'motor para 3.5L V6 VQ35DE', 'Descripción de motor compatible con 3.5L V6 VQ35DE', '1', 'R-1128', 'public/assets/shop/img/repuestos/motor.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:38', '2024-08-19 22:46:38', 3, 8, 15),
(130, 4, 'suspension para 3.5L V6 VQ35DE', 'Descripción de suspension compatible con 3.5L V6 VQ35DE', '1', 'R-1129', 'public/assets/shop/img/repuestos/suspension.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:38', '2024-08-19 22:46:38', 3, 8, 15),
(131, 5, 'amortiguadores para 3.5L V6 VQ35DE', 'Descripción de amortiguadores compatible con 3.5L V6 VQ35DE', '1', 'R-1130', 'public/assets/shop/img/repuestos/amortiguadores.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:38', '2024-08-19 22:46:38', 3, 8, 15),
(132, 6, 'bujias para 3.5L V6 VQ35DE', 'Descripción de bujias compatible con 3.5L V6 VQ35DE', '1', 'R-1131', 'public/assets/shop/img/repuestos/bujias.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:38', '2024-08-19 22:46:38', 3, 8, 15),
(133, 7, 'carreras, cadenas, rodillos para 3.5L V6 VQ35DE', 'Descripción de carreras, cadenas, rodillos compatible con 3.5L V6 VQ35DE', '1', 'R-1132', 'public/assets/shop/img/repuestos/correas.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:38', '2024-08-20 01:31:19', 3, 8, 15),
(134, 8, 'embrague para 3.5L V6 VQ35DE', 'Descripción de embrague compatible con 3.5L V6 VQ35DE', '1', 'R-1133', 'public/assets/shop/img/repuestos/embrague.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:38', '2024-08-19 22:46:38', 3, 8, 15),
(135, 9, 'rodamientos para 3.5L V6 VQ35DE', 'Descripción de rodamientos compatible con 3.5L V6 VQ35DE', '1', 'R-1134', 'public/assets/shop/img/repuestos/rodamientos.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:38', '2024-08-19 22:46:38', 3, 8, 15),
(136, 1, 'filtros para 2.5L I4 QR25DE', 'Descripción de filtros compatible con 2.5L I4 QR25DE', '1', 'R-1135', 'public/assets/shop/img/repuestos/filtros.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:38', '2024-08-19 22:46:38', 3, 8, 16),
(137, 2, 'frenos para 2.5L I4 QR25DE', 'Descripción de frenos compatible con 2.5L I4 QR25DE', '1', 'R-1136', 'public/assets/shop/img/repuestos/frenos.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:38', '2024-08-19 22:46:38', 3, 8, 16),
(138, 3, 'motor para 2.5L I4 QR25DE', 'Descripción de motor compatible con 2.5L I4 QR25DE', '1', 'R-1137', 'public/assets/shop/img/repuestos/motor.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:38', '2024-08-19 22:46:38', 3, 8, 16),
(139, 4, 'suspension para 2.5L I4 QR25DE', 'Descripción de suspension compatible con 2.5L I4 QR25DE', '1', 'R-1138', 'public/assets/shop/img/repuestos/suspension.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:38', '2024-08-19 22:46:38', 3, 8, 16),
(140, 5, 'amortiguadores para 2.5L I4 QR25DE', 'Descripción de amortiguadores compatible con 2.5L I4 QR25DE', '1', 'R-1139', 'public/assets/shop/img/repuestos/amortiguadores.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:39', '2024-08-19 22:46:39', 3, 8, 16),
(141, 6, 'bujias para 2.5L I4 QR25DE', 'Descripción de bujias compatible con 2.5L I4 QR25DE', '1', 'R-1140', 'public/assets/shop/img/repuestos/bujias.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:39', '2024-08-19 22:46:39', 3, 8, 16),
(142, 7, 'carreras, cadenas, rodillos para 2.5L I4 QR25DE', 'Descripción de carreras, cadenas, rodillos compatible con 2.5L I4 QR25DE', '1', 'R-1141', 'public/assets/shop/img/repuestos/correas.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:39', '2024-08-20 01:31:19', 3, 8, 16),
(143, 8, 'embrague para 2.5L I4 QR25DE', 'Descripción de embrague compatible con 2.5L I4 QR25DE', '1', 'R-1142', 'public/assets/shop/img/repuestos/embrague.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:39', '2024-08-19 22:46:39', 3, 8, 16),
(144, 9, 'rodamientos para 2.5L I4 QR25DE', 'Descripción de rodamientos compatible con 2.5L I4 QR25DE', '1', 'R-1143', 'public/assets/shop/img/repuestos/rodamientos.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:39', '2024-08-19 22:46:39', 3, 8, 16),
(145, 1, 'filtros para 2.0L I4 4B11', 'Descripción de filtros compatible con 2.0L I4 4B11', '1', 'R-1144', 'public/assets/shop/img/repuestos/filtros.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:39', '2024-08-19 22:46:39', 3, 9, 17),
(146, 2, 'frenos para 2.0L I4 4B11', 'Descripción de frenos compatible con 2.0L I4 4B11', '1', 'R-1145', 'public/assets/shop/img/repuestos/frenos.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:39', '2024-08-19 22:46:39', 3, 9, 17),
(147, 3, 'motor para 2.0L I4 4B11', 'Descripción de motor compatible con 2.0L I4 4B11', '1', 'R-1146', 'public/assets/shop/img/repuestos/motor.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:39', '2024-08-19 22:46:39', 3, 9, 17),
(148, 4, 'suspension para 2.0L I4 4B11', 'Descripción de suspension compatible con 2.0L I4 4B11', '1', 'R-1147', 'public/assets/shop/img/repuestos/suspension.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:39', '2024-08-19 22:46:39', 3, 9, 17),
(149, 5, 'amortiguadores para 2.0L I4 4B11', 'Descripción de amortiguadores compatible con 2.0L I4 4B11', '1', 'R-1148', 'public/assets/shop/img/repuestos/amortiguadores.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:39', '2024-08-19 22:46:39', 3, 9, 17),
(150, 6, 'bujias para 2.0L I4 4B11', 'Descripción de bujias compatible con 2.0L I4 4B11', '1', 'R-1149', 'public/assets/shop/img/repuestos/bujias.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:39', '2024-08-19 22:46:39', 3, 9, 17),
(151, 7, 'carreras, cadenas, rodillos para 2.0L I4 4B11', 'Descripción de carreras, cadenas, rodillos compatible con 2.0L I4 4B11', '1', 'R-1150', 'public/assets/shop/img/repuestos/correas.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:39', '2024-08-20 01:31:19', 3, 9, 17),
(152, 8, 'embrague para 2.0L I4 4B11', 'Descripción de embrague compatible con 2.0L I4 4B11', '1', 'R-1151', 'public/assets/shop/img/repuestos/embrague.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:39', '2024-08-19 22:46:39', 3, 9, 17),
(153, 9, 'rodamientos para 2.0L I4 4B11', 'Descripción de rodamientos compatible con 2.0L I4 4B11', '1', 'R-1152', 'public/assets/shop/img/repuestos/rodamientos.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:39', '2024-08-19 22:46:39', 3, 9, 17),
(154, 1, 'filtros para 1.8L I4 4B10', 'Descripción de filtros compatible con 1.8L I4 4B10', '1', 'R-1153', 'public/assets/shop/img/repuestos/filtros.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:39', '2024-08-19 22:46:39', 3, 9, 18),
(155, 2, 'frenos para 1.8L I4 4B10', 'Descripción de frenos compatible con 1.8L I4 4B10', '1', 'R-1154', 'public/assets/shop/img/repuestos/frenos.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:39', '2024-08-19 22:46:39', 3, 9, 18),
(156, 3, 'motor para 1.8L I4 4B10', 'Descripción de motor compatible con 1.8L I4 4B10', '1', 'R-1155', 'public/assets/shop/img/repuestos/motor.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:39', '2024-08-19 22:46:39', 3, 9, 18),
(157, 4, 'suspension para 1.8L I4 4B10', 'Descripción de suspension compatible con 1.8L I4 4B10', '1', 'R-1156', 'public/assets/shop/img/repuestos/suspension.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:39', '2024-08-19 22:46:39', 3, 9, 18),
(158, 5, 'amortiguadores para 1.8L I4 4B10', 'Descripción de amortiguadores compatible con 1.8L I4 4B10', '1', 'R-1157', 'public/assets/shop/img/repuestos/amortiguadores.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:39', '2024-08-19 22:46:39', 3, 9, 18),
(159, 6, 'bujias para 1.8L I4 4B10', 'Descripción de bujias compatible con 1.8L I4 4B10', '1', 'R-1158', 'public/assets/shop/img/repuestos/bujias.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:39', '2024-08-19 22:46:39', 3, 9, 18),
(160, 7, 'carreras, cadenas, rodillos para 1.8L I4 4B10', 'Descripción de carreras, cadenas, rodillos compatible con 1.8L I4 4B10', '1', 'R-1159', 'public/assets/shop/img/repuestos/correas.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:39', '2024-08-20 01:31:19', 3, 9, 18),
(161, 8, 'embrague para 1.8L I4 4B10', 'Descripción de embrague compatible con 1.8L I4 4B10', '1', 'R-1160', 'public/assets/shop/img/repuestos/embrague.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:39', '2024-08-19 22:46:39', 3, 9, 18),
(162, 9, 'rodamientos para 1.8L I4 4B10', 'Descripción de rodamientos compatible con 1.8L I4 4B10', '1', 'R-1161', 'public/assets/shop/img/repuestos/rodamientos.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:39', '2024-08-19 22:46:39', 3, 9, 18),
(163, 1, 'filtros para 3.0L V6 6B31', 'Descripción de filtros compatible con 3.0L V6 6B31', '1', 'R-1162', 'public/assets/shop/img/repuestos/filtros.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:39', '2024-08-19 22:46:39', 4, 10, 19),
(164, 2, 'frenos para 3.0L V6 6B31', 'Descripción de frenos compatible con 3.0L V6 6B31', '1', 'R-1163', 'public/assets/shop/img/repuestos/frenos.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:39', '2024-08-19 22:46:39', 4, 10, 19),
(165, 3, 'motor para 3.0L V6 6B31', 'Descripción de motor compatible con 3.0L V6 6B31', '1', 'R-1164', 'public/assets/shop/img/repuestos/motor.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:39', '2024-08-19 22:46:39', 4, 10, 19),
(166, 4, 'suspension para 3.0L V6 6B31', 'Descripción de suspension compatible con 3.0L V6 6B31', '1', 'R-1165', 'public/assets/shop/img/repuestos/suspension.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:39', '2024-08-19 22:46:39', 4, 10, 19),
(167, 5, 'amortiguadores para 3.0L V6 6B31', 'Descripción de amortiguadores compatible con 3.0L V6 6B31', '1', 'R-1166', 'public/assets/shop/img/repuestos/amortiguadores.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:39', '2024-08-19 22:46:39', 4, 10, 19),
(168, 6, 'bujias para 3.0L V6 6B31', 'Descripción de bujias compatible con 3.0L V6 6B31', '1', 'R-1167', 'public/assets/shop/img/repuestos/bujias.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:39', '2024-08-19 22:46:39', 4, 10, 19),
(169, 7, 'carreras, cadenas, rodillos para 3.0L V6 6B31', 'Descripción de carreras, cadenas, rodillos compatible con 3.0L V6 6B31', '1', 'R-1168', 'public/assets/shop/img/repuestos/correas.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:39', '2024-08-20 01:31:19', 4, 10, 19),
(170, 8, 'embrague para 3.0L V6 6B31', 'Descripción de embrague compatible con 3.0L V6 6B31', '1', 'R-1169', 'public/assets/shop/img/repuestos/embrague.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:39', '2024-08-19 22:46:39', 4, 10, 19),
(171, 9, 'rodamientos para 3.0L V6 6B31', 'Descripción de rodamientos compatible con 3.0L V6 6B31', '1', 'R-1170', 'public/assets/shop/img/repuestos/rodamientos.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:39', '2024-08-19 22:46:39', 4, 10, 19),
(172, 1, 'filtros para 2.4L I4 4G69', 'Descripción de filtros compatible con 2.4L I4 4G69', '1', 'R-1171', 'public/assets/shop/img/repuestos/filtros.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:39', '2024-08-19 22:46:39', 4, 10, 20),
(173, 2, 'frenos para 2.4L I4 4G69', 'Descripción de frenos compatible con 2.4L I4 4G69', '1', 'R-1172', 'public/assets/shop/img/repuestos/frenos.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:39', '2024-08-19 22:46:39', 4, 10, 20),
(174, 3, 'motor para 2.4L I4 4G69', 'Descripción de motor compatible con 2.4L I4 4G69', '1', 'R-1173', 'public/assets/shop/img/repuestos/motor.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:39', '2024-08-19 22:46:39', 4, 10, 20),
(175, 4, 'suspension para 2.4L I4 4G69', 'Descripción de suspension compatible con 2.4L I4 4G69', '1', 'R-1174', 'public/assets/shop/img/repuestos/suspension.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:39', '2024-08-19 22:46:39', 4, 10, 20),
(176, 5, 'amortiguadores para 2.4L I4 4G69', 'Descripción de amortiguadores compatible con 2.4L I4 4G69', '1', 'R-1175', 'public/assets/shop/img/repuestos/amortiguadores.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:39', '2024-08-19 22:46:39', 4, 10, 20),
(177, 6, 'bujias para 2.4L I4 4G69', 'Descripción de bujias compatible con 2.4L I4 4G69', '1', 'R-1176', 'public/assets/shop/img/repuestos/bujias.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:39', '2024-08-19 22:46:39', 4, 10, 20),
(178, 7, 'carreras, cadenas, rodillos para 2.4L I4 4G69', 'Descripción de carreras, cadenas, rodillos compatible con 2.4L I4 4G69', '1', 'R-1177', 'public/assets/shop/img/repuestos/correas.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:39', '2024-08-20 01:31:19', 4, 10, 20),
(179, 8, 'embrague para 2.4L I4 4G69', 'Descripción de embrague compatible con 2.4L I4 4G69', '1', 'R-1178', 'public/assets/shop/img/repuestos/embrague.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:39', '2024-08-19 22:46:39', 4, 10, 20),
(180, 9, 'rodamientos para 2.4L I4 4G69', 'Descripción de rodamientos compatible con 2.4L I4 4G69', '1', 'R-1179', 'public/assets/shop/img/repuestos/rodamientos.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:39', '2024-08-19 22:46:39', 4, 10, 20),
(181, 1, 'filtros para 1.5L I4 L15A7', 'Descripción de filtros compatible con 1.5L I4 L15A7', '1', 'R-1180', 'public/assets/shop/img/repuestos/filtros.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:39', '2024-08-19 22:46:39', 4, 11, 21),
(182, 2, 'frenos para 1.5L I4 L15A7', 'Descripción de frenos compatible con 1.5L I4 L15A7', '1', 'R-1181', 'public/assets/shop/img/repuestos/frenos.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:39', '2024-08-19 22:46:39', 4, 11, 21),
(183, 3, 'motor para 1.5L I4 L15A7', 'Descripción de motor compatible con 1.5L I4 L15A7', '1', 'R-1182', 'public/assets/shop/img/repuestos/motor.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:39', '2024-08-19 22:46:39', 4, 11, 21),
(184, 4, 'suspension para 1.5L I4 L15A7', 'Descripción de suspension compatible con 1.5L I4 L15A7', '1', 'R-1183', 'public/assets/shop/img/repuestos/suspension.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:39', '2024-08-19 22:46:39', 4, 11, 21),
(185, 5, 'amortiguadores para 1.5L I4 L15A7', 'Descripción de amortiguadores compatible con 1.5L I4 L15A7', '1', 'R-1184', 'public/assets/shop/img/repuestos/amortiguadores.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:39', '2024-08-19 22:46:39', 4, 11, 21),
(186, 6, 'bujias para 1.5L I4 L15A7', 'Descripción de bujias compatible con 1.5L I4 L15A7', '1', 'R-1185', 'public/assets/shop/img/repuestos/bujias.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:39', '2024-08-19 22:46:39', 4, 11, 21),
(187, 7, 'carreras, cadenas, rodillos para 1.5L I4 L15A7', 'Descripción de carreras, cadenas, rodillos compatible con 1.5L I4 L15A7', '1', 'R-1186', 'public/assets/shop/img/repuestos/correas.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:39', '2024-08-20 01:31:19', 4, 11, 21),
(188, 8, 'embrague para 1.5L I4 L15A7', 'Descripción de embrague compatible con 1.5L I4 L15A7', '1', 'R-1187', 'public/assets/shop/img/repuestos/embrague.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:39', '2024-08-19 22:46:39', 4, 11, 21),
(189, 9, 'rodamientos para 1.5L I4 L15A7', 'Descripción de rodamientos compatible con 1.5L I4 L15A7', '1', 'R-1188', 'public/assets/shop/img/repuestos/rodamientos.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:39', '2024-08-19 22:46:39', 4, 11, 21),
(190, 1, 'filtros para 1.8L I4 R18A1', 'Descripción de filtros compatible con 1.8L I4 R18A1', '1', 'R-1189', 'public/assets/shop/img/repuestos/filtros.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:39', '2024-08-19 22:46:39', 4, 11, 22),
(191, 2, 'frenos para 1.8L I4 R18A1', 'Descripción de frenos compatible con 1.8L I4 R18A1', '1', 'R-1190', 'public/assets/shop/img/repuestos/frenos.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:39', '2024-08-19 22:46:39', 4, 11, 22),
(192, 3, 'motor para 1.8L I4 R18A1', 'Descripción de motor compatible con 1.8L I4 R18A1', '1', 'R-1191', 'public/assets/shop/img/repuestos/motor.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:39', '2024-08-19 22:46:39', 4, 11, 22),
(193, 4, 'suspension para 1.8L I4 R18A1', 'Descripción de suspension compatible con 1.8L I4 R18A1', '1', 'R-1192', 'public/assets/shop/img/repuestos/suspension.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:39', '2024-08-19 22:46:39', 4, 11, 22);
INSERT INTO `repuestos` (`id_repuesto`, `id_categoria`, `nombre_repuesto`, `descripcion_repuesto`, `oem_repuesto`, `codigo_tienda_repuesto`, `img_repuesto`, `stock_repuesto`, `precio_repuesto`, `fabricante_repuesto`, `venta_repuesto`, `peso_repuesto`, `estado_repuesto`, `date_created_repuesto`, `date_updated_repuesto`, `id_marca`, `id_modelo`, `id_motor`) VALUES
(194, 5, 'amortiguadores para 1.8L I4 R18A1', 'Descripción de amortiguadores compatible con 1.8L I4 R18A1', '1', 'R-1193', 'public/assets/shop/img/repuestos/amortiguadores.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:39', '2024-08-19 22:46:39', 4, 11, 22),
(195, 6, 'bujias para 1.8L I4 R18A1', 'Descripción de bujias compatible con 1.8L I4 R18A1', '1', 'R-1194', 'public/assets/shop/img/repuestos/bujias.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:39', '2024-08-19 22:46:39', 4, 11, 22),
(196, 7, 'carreras, cadenas, rodillos para 1.8L I4 R18A1', 'Descripción de carreras, cadenas, rodillos compatible con 1.8L I4 R18A1', '1', 'R-1195', 'public/assets/shop/img/repuestos/correas.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:39', '2024-08-20 01:31:19', 4, 11, 22),
(197, 8, 'embrague para 1.8L I4 R18A1', 'Descripción de embrague compatible con 1.8L I4 R18A1', '1', 'R-1196', 'public/assets/shop/img/repuestos/embrague.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:39', '2024-08-19 22:46:39', 4, 11, 22),
(198, 9, 'rodamientos para 1.8L I4 R18A1', 'Descripción de rodamientos compatible con 1.8L I4 R18A1', '1', 'R-1197', 'public/assets/shop/img/repuestos/rodamientos.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:39', '2024-08-19 22:46:39', 4, 11, 22),
(199, 1, 'filtros para 2.0L I4 MZR LF-VE', 'Descripción de filtros compatible con 2.0L I4 MZR LF-VE', '1', 'R-1198', 'public/assets/shop/img/repuestos/filtros.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:39', '2024-08-19 22:46:39', 4, 12, 23),
(200, 2, 'frenos para 2.0L I4 MZR LF-VE', 'Descripción de frenos compatible con 2.0L I4 MZR LF-VE', '1', 'R-1199', 'public/assets/shop/img/repuestos/frenos.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:39', '2024-08-19 22:46:39', 4, 12, 23),
(201, 3, 'motor para 2.0L I4 MZR LF-VE', 'Descripción de motor compatible con 2.0L I4 MZR LF-VE', '1', 'R-1200', 'public/assets/shop/img/repuestos/motor.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:39', '2024-08-19 22:46:39', 4, 12, 23),
(202, 4, 'suspension para 2.0L I4 MZR LF-VE', 'Descripción de suspension compatible con 2.0L I4 MZR LF-VE', '1', 'R-1201', 'public/assets/shop/img/repuestos/suspension.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:39', '2024-08-19 22:46:39', 4, 12, 23),
(203, 5, 'amortiguadores para 2.0L I4 MZR LF-VE', 'Descripción de amortiguadores compatible con 2.0L I4 MZR LF-VE', '1', 'R-1202', 'public/assets/shop/img/repuestos/amortiguadores.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:39', '2024-08-19 22:46:39', 4, 12, 23),
(204, 6, 'bujias para 2.0L I4 MZR LF-VE', 'Descripción de bujias compatible con 2.0L I4 MZR LF-VE', '1', 'R-1203', 'public/assets/shop/img/repuestos/bujias.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:39', '2024-08-19 22:46:39', 4, 12, 23),
(205, 7, 'carreras, cadenas, rodillos para 2.0L I4 MZR LF-VE', 'Descripción de carreras, cadenas, rodillos compatible con 2.0L I4 MZR LF-VE', '1', 'R-1204', 'public/assets/shop/img/repuestos/correas.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:39', '2024-08-20 01:31:19', 4, 12, 23),
(206, 8, 'embrague para 2.0L I4 MZR LF-VE', 'Descripción de embrague compatible con 2.0L I4 MZR LF-VE', '1', 'R-1205', 'public/assets/shop/img/repuestos/embrague.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:39', '2024-08-19 22:46:39', 4, 12, 23),
(207, 9, 'rodamientos para 2.0L I4 MZR LF-VE', 'Descripción de rodamientos compatible con 2.0L I4 MZR LF-VE', '1', 'R-1206', 'public/assets/shop/img/repuestos/rodamientos.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:39', '2024-08-19 22:46:39', 4, 12, 23),
(208, 1, 'filtros para 2.5L I4 MZR L5-VE', 'Descripción de filtros compatible con 2.5L I4 MZR L5-VE', '1', 'R-1207', 'public/assets/shop/img/repuestos/filtros.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:39', '2024-08-19 22:46:39', 4, 12, 24),
(209, 2, 'frenos para 2.5L I4 MZR L5-VE', 'Descripción de frenos compatible con 2.5L I4 MZR L5-VE', '1', 'R-1208', 'public/assets/shop/img/repuestos/frenos.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:39', '2024-08-19 22:46:39', 4, 12, 24),
(210, 3, 'motor para 2.5L I4 MZR L5-VE', 'Descripción de motor compatible con 2.5L I4 MZR L5-VE', '1', 'R-1209', 'public/assets/shop/img/repuestos/motor.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:39', '2024-08-19 22:46:39', 4, 12, 24),
(211, 4, 'suspension para 2.5L I4 MZR L5-VE', 'Descripción de suspension compatible con 2.5L I4 MZR L5-VE', '1', 'R-1210', 'public/assets/shop/img/repuestos/suspension.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:39', '2024-08-19 22:46:39', 4, 12, 24),
(212, 5, 'amortiguadores para 2.5L I4 MZR L5-VE', 'Descripción de amortiguadores compatible con 2.5L I4 MZR L5-VE', '1', 'R-1211', 'public/assets/shop/img/repuestos/amortiguadores.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:39', '2024-08-19 22:46:39', 4, 12, 24),
(213, 6, 'bujias para 2.5L I4 MZR L5-VE', 'Descripción de bujias compatible con 2.5L I4 MZR L5-VE', '1', 'R-1212', 'public/assets/shop/img/repuestos/bujias.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:39', '2024-08-19 22:46:39', 4, 12, 24),
(214, 7, 'carreras, cadenas, rodillos para 2.5L I4 MZR L5-VE', 'Descripción de carreras, cadenas, rodillos compatible con 2.5L I4 MZR L5-VE', '1', 'R-1213', 'public/assets/shop/img/repuestos/correas.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:39', '2024-08-20 01:31:19', 4, 12, 24),
(215, 8, 'embrague para 2.5L I4 MZR L5-VE', 'Descripción de embrague compatible con 2.5L I4 MZR L5-VE', '1', 'R-1214', 'public/assets/shop/img/repuestos/embrague.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:39', '2024-08-19 22:46:39', 4, 12, 24),
(216, 9, 'rodamientos para 2.5L I4 MZR L5-VE', 'Descripción de rodamientos compatible con 2.5L I4 MZR L5-VE', '1', 'R-1215', 'public/assets/shop/img/repuestos/rodamientos.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:39', '2024-08-19 22:46:39', 4, 12, 24),
(217, 1, 'filtros para 1.6L I4 B16A2', 'Descripción de filtros compatible con 1.6L I4 B16A2', '1', 'R-1216', 'public/assets/shop/img/repuestos/filtros.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:39', '2024-08-19 22:46:39', 5, 13, 25),
(218, 2, 'frenos para 1.6L I4 B16A2', 'Descripción de frenos compatible con 1.6L I4 B16A2', '1', 'R-1217', 'public/assets/shop/img/repuestos/frenos.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:39', '2024-08-19 22:46:39', 5, 13, 25),
(219, 3, 'motor para 1.6L I4 B16A2', 'Descripción de motor compatible con 1.6L I4 B16A2', '1', 'R-1218', 'public/assets/shop/img/repuestos/motor.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:39', '2024-08-19 22:46:39', 5, 13, 25),
(220, 4, 'suspension para 1.6L I4 B16A2', 'Descripción de suspension compatible con 1.6L I4 B16A2', '1', 'R-1219', 'public/assets/shop/img/repuestos/suspension.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:39', '2024-08-19 22:46:39', 5, 13, 25),
(221, 5, 'amortiguadores para 1.6L I4 B16A2', 'Descripción de amortiguadores compatible con 1.6L I4 B16A2', '1', 'R-1220', 'public/assets/shop/img/repuestos/amortiguadores.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:39', '2024-08-19 22:46:39', 5, 13, 25),
(222, 6, 'bujias para 1.6L I4 B16A2', 'Descripción de bujias compatible con 1.6L I4 B16A2', '1', 'R-1221', 'public/assets/shop/img/repuestos/bujias.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:39', '2024-08-19 22:46:39', 5, 13, 25),
(223, 7, 'carreras, cadenas, rodillos para 1.6L I4 B16A2', 'Descripción de carreras, cadenas, rodillos compatible con 1.6L I4 B16A2', '1', 'R-1222', 'public/assets/shop/img/repuestos/correas.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:39', '2024-08-20 01:31:19', 5, 13, 25),
(224, 8, 'embrague para 1.6L I4 B16A2', 'Descripción de embrague compatible con 1.6L I4 B16A2', '1', 'R-1223', 'public/assets/shop/img/repuestos/embrague.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:39', '2024-08-19 22:46:39', 5, 13, 25),
(225, 9, 'rodamientos para 1.6L I4 B16A2', 'Descripción de rodamientos compatible con 1.6L I4 B16A2', '1', 'R-1224', 'public/assets/shop/img/repuestos/rodamientos.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:39', '2024-08-19 22:46:39', 5, 13, 25),
(226, 1, 'filtros para 1.8L I4 B18C', 'Descripción de filtros compatible con 1.8L I4 B18C', '1', 'R-1225', 'public/assets/shop/img/repuestos/filtros.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:39', '2024-08-19 22:46:39', 5, 13, 26),
(227, 2, 'frenos para 1.8L I4 B18C', 'Descripción de frenos compatible con 1.8L I4 B18C', '1', 'R-1226', 'public/assets/shop/img/repuestos/frenos.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:39', '2024-08-19 22:46:39', 5, 13, 26),
(228, 3, 'motor para 1.8L I4 B18C', 'Descripción de motor compatible con 1.8L I4 B18C', '1', 'R-1227', 'public/assets/shop/img/repuestos/motor.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:39', '2024-08-19 22:46:39', 5, 13, 26),
(229, 4, 'suspension para 1.8L I4 B18C', 'Descripción de suspension compatible con 1.8L I4 B18C', '1', 'R-1228', 'public/assets/shop/img/repuestos/suspension.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:39', '2024-08-19 22:46:39', 5, 13, 26),
(230, 5, 'amortiguadores para 1.8L I4 B18C', 'Descripción de amortiguadores compatible con 1.8L I4 B18C', '1', 'R-1229', 'public/assets/shop/img/repuestos/amortiguadores.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:39', '2024-08-19 22:46:39', 5, 13, 26),
(231, 6, 'bujias para 1.8L I4 B18C', 'Descripción de bujias compatible con 1.8L I4 B18C', '1', 'R-1230', 'public/assets/shop/img/repuestos/bujias.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:39', '2024-08-19 22:46:39', 5, 13, 26),
(232, 7, 'carreras, cadenas, rodillos para 1.8L I4 B18C', 'Descripción de carreras, cadenas, rodillos compatible con 1.8L I4 B18C', '1', 'R-1231', 'public/assets/shop/img/repuestos/correas.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:39', '2024-08-20 01:31:19', 5, 13, 26),
(233, 8, 'embrague para 1.8L I4 B18C', 'Descripción de embrague compatible con 1.8L I4 B18C', '1', 'R-1232', 'public/assets/shop/img/repuestos/embrague.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:39', '2024-08-19 22:46:39', 5, 13, 26),
(234, 9, 'rodamientos para 1.8L I4 B18C', 'Descripción de rodamientos compatible con 1.8L I4 B18C', '1', 'R-1233', 'public/assets/shop/img/repuestos/rodamientos.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:39', '2024-08-19 22:46:39', 5, 13, 26),
(235, 1, 'filtros para 1.8L I4 QG18DE', 'Descripción de filtros compatible con 1.8L I4 QG18DE', '1', 'R-1234', 'public/assets/shop/img/repuestos/filtros.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:39', '2024-08-19 22:46:39', 5, 14, 27),
(236, 2, 'frenos para 1.8L I4 QG18DE', 'Descripción de frenos compatible con 1.8L I4 QG18DE', '1', 'R-1235', 'public/assets/shop/img/repuestos/frenos.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:39', '2024-08-19 22:46:39', 5, 14, 27),
(237, 3, 'motor para 1.8L I4 QG18DE', 'Descripción de motor compatible con 1.8L I4 QG18DE', '1', 'R-1236', 'public/assets/shop/img/repuestos/motor.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:39', '2024-08-19 22:46:39', 5, 14, 27),
(238, 4, 'suspension para 1.8L I4 QG18DE', 'Descripción de suspension compatible con 1.8L I4 QG18DE', '1', 'R-1237', 'public/assets/shop/img/repuestos/suspension.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:39', '2024-08-19 22:46:39', 5, 14, 27),
(239, 5, 'amortiguadores para 1.8L I4 QG18DE', 'Descripción de amortiguadores compatible con 1.8L I4 QG18DE', '1', 'R-1238', 'public/assets/shop/img/repuestos/amortiguadores.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:39', '2024-08-19 22:46:39', 5, 14, 27),
(240, 6, 'bujias para 1.8L I4 QG18DE', 'Descripción de bujias compatible con 1.8L I4 QG18DE', '1', 'R-1239', 'public/assets/shop/img/repuestos/bujias.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:39', '2024-08-19 22:46:39', 5, 14, 27),
(241, 7, 'carreras, cadenas, rodillos para 1.8L I4 QG18DE', 'Descripción de carreras, cadenas, rodillos compatible con 1.8L I4 QG18DE', '1', 'R-1240', 'public/assets/shop/img/repuestos/correas.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:39', '2024-08-20 01:31:19', 5, 14, 27),
(242, 8, 'embrague para 1.8L I4 QG18DE', 'Descripción de embrague compatible con 1.8L I4 QG18DE', '1', 'R-1241', 'public/assets/shop/img/repuestos/embrague.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:39', '2024-08-19 22:46:39', 5, 14, 27),
(243, 9, 'rodamientos para 1.8L I4 QG18DE', 'Descripción de rodamientos compatible con 1.8L I4 QG18DE', '1', 'R-1242', 'public/assets/shop/img/repuestos/rodamientos.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:39', '2024-08-19 22:46:39', 5, 14, 27),
(244, 1, 'filtros para 2.0L I4 SR20DE', 'Descripción de filtros compatible con 2.0L I4 SR20DE', '1', 'R-1243', 'public/assets/shop/img/repuestos/filtros.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:39', '2024-08-19 22:46:39', 5, 14, 28),
(245, 2, 'frenos para 2.0L I4 SR20DE', 'Descripción de frenos compatible con 2.0L I4 SR20DE', '1', 'R-1244', 'public/assets/shop/img/repuestos/frenos.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:39', '2024-08-19 22:46:39', 5, 14, 28),
(246, 3, 'motor para 2.0L I4 SR20DE', 'Descripción de motor compatible con 2.0L I4 SR20DE', '1', 'R-1245', 'public/assets/shop/img/repuestos/motor.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:39', '2024-08-19 22:46:39', 5, 14, 28),
(247, 4, 'suspension para 2.0L I4 SR20DE', 'Descripción de suspension compatible con 2.0L I4 SR20DE', '1', 'R-1246', 'public/assets/shop/img/repuestos/suspension.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:39', '2024-08-19 22:46:39', 5, 14, 28),
(248, 5, 'amortiguadores para 2.0L I4 SR20DE', 'Descripción de amortiguadores compatible con 2.0L I4 SR20DE', '1', 'R-1247', 'public/assets/shop/img/repuestos/amortiguadores.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:39', '2024-08-19 22:46:39', 5, 14, 28),
(249, 6, 'bujias para 2.0L I4 SR20DE', 'Descripción de bujias compatible con 2.0L I4 SR20DE', '1', 'R-1248', 'public/assets/shop/img/repuestos/bujias.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:39', '2024-08-19 22:46:39', 5, 14, 28),
(250, 7, 'carreras, cadenas, rodillos para 2.0L I4 SR20DE', 'Descripción de carreras, cadenas, rodillos compatible con 2.0L I4 SR20DE', '1', 'R-1249', 'public/assets/shop/img/repuestos/correas.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:39', '2024-08-20 01:31:19', 5, 14, 28),
(251, 8, 'embrague para 2.0L I4 SR20DE', 'Descripción de embrague compatible con 2.0L I4 SR20DE', '1', 'R-1250', 'public/assets/shop/img/repuestos/embrague.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:39', '2024-08-19 22:46:39', 5, 14, 28),
(252, 9, 'rodamientos para 2.0L I4 SR20DE', 'Descripción de rodamientos compatible con 2.0L I4 SR20DE', '1', 'R-1251', 'public/assets/shop/img/repuestos/rodamientos.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:39', '2024-08-19 22:46:39', 5, 14, 28),
(253, 1, 'filtros para 3.5L V6 VQ35DE', 'Descripción de filtros compatible con 3.5L V6 VQ35DE', '1', 'R-1252', 'public/assets/shop/img/repuestos/filtros.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:39', '2024-08-19 22:46:39', 5, 15, 29),
(254, 2, 'frenos para 3.5L V6 VQ35DE', 'Descripción de frenos compatible con 3.5L V6 VQ35DE', '1', 'R-1253', 'public/assets/shop/img/repuestos/frenos.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:39', '2024-08-19 22:46:39', 5, 15, 29),
(255, 3, 'motor para 3.5L V6 VQ35DE', 'Descripción de motor compatible con 3.5L V6 VQ35DE', '1', 'R-1254', 'public/assets/shop/img/repuestos/motor.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:39', '2024-08-19 22:46:39', 5, 15, 29),
(256, 4, 'suspension para 3.5L V6 VQ35DE', 'Descripción de suspension compatible con 3.5L V6 VQ35DE', '1', 'R-1255', 'public/assets/shop/img/repuestos/suspension.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:39', '2024-08-19 22:46:39', 5, 15, 29),
(257, 5, 'amortiguadores para 3.5L V6 VQ35DE', 'Descripción de amortiguadores compatible con 3.5L V6 VQ35DE', '1', 'R-1256', 'public/assets/shop/img/repuestos/amortiguadores.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:39', '2024-08-19 22:46:39', 5, 15, 29),
(258, 6, 'bujias para 3.5L V6 VQ35DE', 'Descripción de bujias compatible con 3.5L V6 VQ35DE', '1', 'R-1257', 'public/assets/shop/img/repuestos/bujias.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:39', '2024-08-19 22:46:39', 5, 15, 29),
(259, 7, 'carreras, cadenas, rodillos para 3.5L V6 VQ35DE', 'Descripción de carreras, cadenas, rodillos compatible con 3.5L V6 VQ35DE', '1', 'R-1258', 'public/assets/shop/img/repuestos/correas.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:39', '2024-08-20 01:31:19', 5, 15, 29),
(260, 8, 'embrague para 3.5L V6 VQ35DE', 'Descripción de embrague compatible con 3.5L V6 VQ35DE', '1', 'R-1259', 'public/assets/shop/img/repuestos/embrague.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:39', '2024-08-19 22:46:39', 5, 15, 29),
(261, 9, 'rodamientos para 3.5L V6 VQ35DE', 'Descripción de rodamientos compatible con 3.5L V6 VQ35DE', '1', 'R-1260', 'public/assets/shop/img/repuestos/rodamientos.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:39', '2024-08-19 22:46:39', 5, 15, 29),
(262, 1, 'filtros para 2.5L I4 QR25DE', 'Descripción de filtros compatible con 2.5L I4 QR25DE', '1', 'R-1261', 'public/assets/shop/img/repuestos/filtros.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:39', '2024-08-19 22:46:39', 5, 15, 30),
(263, 2, 'frenos para 2.5L I4 QR25DE', 'Descripción de frenos compatible con 2.5L I4 QR25DE', '1', 'R-1262', 'public/assets/shop/img/repuestos/frenos.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:39', '2024-08-19 22:46:39', 5, 15, 30),
(264, 3, 'motor para 2.5L I4 QR25DE', 'Descripción de motor compatible con 2.5L I4 QR25DE', '1', 'R-1263', 'public/assets/shop/img/repuestos/motor.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:39', '2024-08-19 22:46:39', 5, 15, 30),
(265, 4, 'suspension para 2.5L I4 QR25DE', 'Descripción de suspension compatible con 2.5L I4 QR25DE', '1', 'R-1264', 'public/assets/shop/img/repuestos/suspension.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:39', '2024-08-19 22:46:39', 5, 15, 30),
(266, 5, 'amortiguadores para 2.5L I4 QR25DE', 'Descripción de amortiguadores compatible con 2.5L I4 QR25DE', '1', 'R-1265', 'public/assets/shop/img/repuestos/amortiguadores.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:39', '2024-08-19 22:46:39', 5, 15, 30),
(267, 6, 'bujias para 2.5L I4 QR25DE', 'Descripción de bujias compatible con 2.5L I4 QR25DE', '1', 'R-1266', 'public/assets/shop/img/repuestos/bujias.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:39', '2024-08-19 22:46:39', 5, 15, 30),
(268, 7, 'carreras, cadenas, rodillos para 2.5L I4 QR25DE', 'Descripción de carreras, cadenas, rodillos compatible con 2.5L I4 QR25DE', '1', 'R-1267', 'public/assets/shop/img/repuestos/correas.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:39', '2024-08-20 01:31:19', 5, 15, 30),
(269, 8, 'embrague para 2.5L I4 QR25DE', 'Descripción de embrague compatible con 2.5L I4 QR25DE', '1', 'R-1268', 'public/assets/shop/img/repuestos/embrague.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:39', '2024-08-19 22:46:39', 5, 15, 30),
(270, 9, 'rodamientos para 2.5L I4 QR25DE', 'Descripción de rodamientos compatible con 2.5L I4 QR25DE', '1', 'R-1269', 'public/assets/shop/img/repuestos/rodamientos.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:39', '2024-08-19 22:46:39', 5, 15, 30),
(271, 1, 'filtros para 1.8L I4 1ZZ-FE', 'Descripción de filtros compatible con 1.8L I4 1ZZ-FE', '1', 'R-1270', 'public/assets/shop/img/repuestos/filtros.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:39', '2024-08-19 22:46:39', 6, 16, 31),
(272, 2, 'frenos para 1.8L I4 1ZZ-FE', 'Descripción de frenos compatible con 1.8L I4 1ZZ-FE', '1', 'R-1271', 'public/assets/shop/img/repuestos/frenos.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:39', '2024-08-19 22:46:39', 6, 16, 31),
(273, 3, 'motor para 1.8L I4 1ZZ-FE', 'Descripción de motor compatible con 1.8L I4 1ZZ-FE', '1', 'R-1272', 'public/assets/shop/img/repuestos/motor.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:39', '2024-08-19 22:46:39', 6, 16, 31),
(274, 4, 'suspension para 1.8L I4 1ZZ-FE', 'Descripción de suspension compatible con 1.8L I4 1ZZ-FE', '1', 'R-1273', 'public/assets/shop/img/repuestos/suspension.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:39', '2024-08-19 22:46:39', 6, 16, 31),
(275, 5, 'amortiguadores para 1.8L I4 1ZZ-FE', 'Descripción de amortiguadores compatible con 1.8L I4 1ZZ-FE', '1', 'R-1274', 'public/assets/shop/img/repuestos/amortiguadores.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:39', '2024-08-19 22:46:39', 6, 16, 31),
(276, 6, 'bujias para 1.8L I4 1ZZ-FE', 'Descripción de bujias compatible con 1.8L I4 1ZZ-FE', '1', 'R-1275', 'public/assets/shop/img/repuestos/bujias.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:39', '2024-08-19 22:46:39', 6, 16, 31),
(277, 7, 'carreras, cadenas, rodillos para 1.8L I4 1ZZ-FE', 'Descripción de carreras, cadenas, rodillos compatible con 1.8L I4 1ZZ-FE', '1', 'R-1276', 'public/assets/shop/img/repuestos/correas.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:39', '2024-08-20 01:31:19', 6, 16, 31),
(278, 8, 'embrague para 1.8L I4 1ZZ-FE', 'Descripción de embrague compatible con 1.8L I4 1ZZ-FE', '1', 'R-1277', 'public/assets/shop/img/repuestos/embrague.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:39', '2024-08-19 22:46:39', 6, 16, 31),
(279, 9, 'rodamientos para 1.8L I4 1ZZ-FE', 'Descripción de rodamientos compatible con 1.8L I4 1ZZ-FE', '1', 'R-1278', 'public/assets/shop/img/repuestos/rodamientos.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:39', '2024-08-19 22:46:39', 6, 16, 31),
(280, 1, 'filtros para 2.0L I4 3ZR-FE', 'Descripción de filtros compatible con 2.0L I4 3ZR-FE', '1', 'R-1279', 'public/assets/shop/img/repuestos/filtros.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:39', '2024-08-19 22:46:39', 6, 16, 32),
(281, 2, 'frenos para 2.0L I4 3ZR-FE', 'Descripción de frenos compatible con 2.0L I4 3ZR-FE', '1', 'R-1280', 'public/assets/shop/img/repuestos/frenos.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:39', '2024-08-19 22:46:39', 6, 16, 32),
(282, 3, 'motor para 2.0L I4 3ZR-FE', 'Descripción de motor compatible con 2.0L I4 3ZR-FE', '1', 'R-1281', 'public/assets/shop/img/repuestos/motor.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:39', '2024-08-19 22:46:39', 6, 16, 32),
(283, 4, 'suspension para 2.0L I4 3ZR-FE', 'Descripción de suspension compatible con 2.0L I4 3ZR-FE', '1', 'R-1282', 'public/assets/shop/img/repuestos/suspension.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:39', '2024-08-19 22:46:39', 6, 16, 32),
(284, 5, 'amortiguadores para 2.0L I4 3ZR-FE', 'Descripción de amortiguadores compatible con 2.0L I4 3ZR-FE', '1', 'R-1283', 'public/assets/shop/img/repuestos/amortiguadores.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:39', '2024-08-19 22:46:39', 6, 16, 32),
(285, 6, 'bujias para 2.0L I4 3ZR-FE', 'Descripción de bujias compatible con 2.0L I4 3ZR-FE', '1', 'R-1284', 'public/assets/shop/img/repuestos/bujias.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:39', '2024-08-19 22:46:39', 6, 16, 32),
(286, 7, 'carreras, cadenas, rodillos para 2.0L I4 3ZR-FE', 'Descripción de carreras, cadenas, rodillos compatible con 2.0L I4 3ZR-FE', '1', 'R-1285', 'public/assets/shop/img/repuestos/correas.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:39', '2024-08-20 01:31:19', 6, 16, 32),
(287, 8, 'embrague para 2.0L I4 3ZR-FE', 'Descripción de embrague compatible con 2.0L I4 3ZR-FE', '1', 'R-1286', 'public/assets/shop/img/repuestos/embrague.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:39', '2024-08-19 22:46:39', 6, 16, 32),
(288, 9, 'rodamientos para 2.0L I4 3ZR-FE', 'Descripción de rodamientos compatible con 2.0L I4 3ZR-FE', '1', 'R-1287', 'public/assets/shop/img/repuestos/rodamientos.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:39', '2024-08-19 22:46:39', 6, 16, 32),
(289, 1, 'filtros para 1.6L I4 HR16DE', 'Descripción de filtros compatible con 1.6L I4 HR16DE', '1', 'R-1288', 'public/assets/shop/img/repuestos/filtros.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:39', '2024-08-19 22:46:39', 6, 17, 33),
(290, 2, 'frenos para 1.6L I4 HR16DE', 'Descripción de frenos compatible con 1.6L I4 HR16DE', '1', 'R-1289', 'public/assets/shop/img/repuestos/frenos.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:39', '2024-08-19 22:46:39', 6, 17, 33),
(291, 3, 'motor para 1.6L I4 HR16DE', 'Descripción de motor compatible con 1.6L I4 HR16DE', '1', 'R-1290', 'public/assets/shop/img/repuestos/motor.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:39', '2024-08-19 22:46:39', 6, 17, 33),
(292, 4, 'suspension para 1.6L I4 HR16DE', 'Descripción de suspension compatible con 1.6L I4 HR16DE', '1', 'R-1291', 'public/assets/shop/img/repuestos/suspension.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:39', '2024-08-19 22:46:39', 6, 17, 33),
(293, 5, 'amortiguadores para 1.6L I4 HR16DE', 'Descripción de amortiguadores compatible con 1.6L I4 HR16DE', '1', 'R-1292', 'public/assets/shop/img/repuestos/amortiguadores.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:39', '2024-08-19 22:46:39', 6, 17, 33),
(294, 6, 'bujias para 1.6L I4 HR16DE', 'Descripción de bujias compatible con 1.6L I4 HR16DE', '1', 'R-1293', 'public/assets/shop/img/repuestos/bujias.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:39', '2024-08-19 22:46:39', 6, 17, 33),
(295, 7, 'carreras, cadenas, rodillos para 1.6L I4 HR16DE', 'Descripción de carreras, cadenas, rodillos compatible con 1.6L I4 HR16DE', '1', 'R-1294', 'public/assets/shop/img/repuestos/correas.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:39', '2024-08-20 01:31:19', 6, 17, 33),
(296, 8, 'embrague para 1.6L I4 HR16DE', 'Descripción de embrague compatible con 1.6L I4 HR16DE', '1', 'R-1295', 'public/assets/shop/img/repuestos/embrague.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:39', '2024-08-19 22:46:39', 6, 17, 33),
(297, 9, 'rodamientos para 1.6L I4 HR16DE', 'Descripción de rodamientos compatible con 1.6L I4 HR16DE', '1', 'R-1296', 'public/assets/shop/img/repuestos/rodamientos.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:39', '2024-08-19 22:46:39', 6, 17, 33),
(298, 1, 'filtros para 2.0L I4 MR20DE', 'Descripción de filtros compatible con 2.0L I4 MR20DE', '1', 'R-1297', 'public/assets/shop/img/repuestos/filtros.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:39', '2024-08-19 22:46:39', 6, 17, 34),
(299, 2, 'frenos para 2.0L I4 MR20DE', 'Descripción de frenos compatible con 2.0L I4 MR20DE', '1', 'R-1298', 'public/assets/shop/img/repuestos/frenos.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:39', '2024-08-19 22:46:39', 6, 17, 34),
(300, 3, 'motor para 2.0L I4 MR20DE', 'Descripción de motor compatible con 2.0L I4 MR20DE', '1', 'R-1299', 'public/assets/shop/img/repuestos/motor.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:39', '2024-08-19 22:46:39', 6, 17, 34),
(301, 4, 'suspension para 2.0L I4 MR20DE', 'Descripción de suspension compatible con 2.0L I4 MR20DE', '1', 'R-1300', 'public/assets/shop/img/repuestos/suspension.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:39', '2024-08-19 22:46:39', 6, 17, 34),
(302, 5, 'amortiguadores para 2.0L I4 MR20DE', 'Descripción de amortiguadores compatible con 2.0L I4 MR20DE', '1', 'R-1301', 'public/assets/shop/img/repuestos/amortiguadores.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:39', '2024-08-19 22:46:39', 6, 17, 34),
(303, 6, 'bujias para 2.0L I4 MR20DE', 'Descripción de bujias compatible con 2.0L I4 MR20DE', '1', 'R-1302', 'public/assets/shop/img/repuestos/bujias.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:39', '2024-08-19 22:46:39', 6, 17, 34),
(304, 7, 'carreras, cadenas, rodillos para 2.0L I4 MR20DE', 'Descripción de carreras, cadenas, rodillos compatible con 2.0L I4 MR20DE', '1', 'R-1303', 'public/assets/shop/img/repuestos/correas.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:39', '2024-08-20 01:31:19', 6, 17, 34),
(305, 8, 'embrague para 2.0L I4 MR20DE', 'Descripción de embrague compatible con 2.0L I4 MR20DE', '1', 'R-1304', 'public/assets/shop/img/repuestos/embrague.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:39', '2024-08-19 22:46:39', 6, 17, 34),
(306, 9, 'rodamientos para 2.0L I4 MR20DE', 'Descripción de rodamientos compatible con 2.0L I4 MR20DE', '1', 'R-1305', 'public/assets/shop/img/repuestos/rodamientos.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:39', '2024-08-19 22:46:39', 6, 17, 34),
(307, 1, 'filtros para 2.0L I4 FB20', 'Descripción de filtros compatible con 2.0L I4 FB20', '1', 'R-1306', 'public/assets/shop/img/repuestos/filtros.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:39', '2024-08-19 22:46:39', 6, 18, 35),
(308, 2, 'frenos para 2.0L I4 FB20', 'Descripción de frenos compatible con 2.0L I4 FB20', '1', 'R-1307', 'public/assets/shop/img/repuestos/frenos.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:39', '2024-08-19 22:46:39', 6, 18, 35),
(309, 3, 'motor para 2.0L I4 FB20', 'Descripción de motor compatible con 2.0L I4 FB20', '1', 'R-1308', 'public/assets/shop/img/repuestos/motor.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:39', '2024-08-19 22:46:39', 6, 18, 35),
(310, 4, 'suspension para 2.0L I4 FB20', 'Descripción de suspension compatible con 2.0L I4 FB20', '1', 'R-1309', 'public/assets/shop/img/repuestos/suspension.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:39', '2024-08-19 22:46:39', 6, 18, 35),
(311, 5, 'amortiguadores para 2.0L I4 FB20', 'Descripción de amortiguadores compatible con 2.0L I4 FB20', '1', 'R-1310', 'public/assets/shop/img/repuestos/amortiguadores.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:39', '2024-08-19 22:46:39', 6, 18, 35),
(312, 6, 'bujias para 2.0L I4 FB20', 'Descripción de bujias compatible con 2.0L I4 FB20', '1', 'R-1311', 'public/assets/shop/img/repuestos/bujias.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:39', '2024-08-19 22:46:39', 6, 18, 35),
(313, 7, 'carreras, cadenas, rodillos para 2.0L I4 FB20', 'Descripción de carreras, cadenas, rodillos compatible con 2.0L I4 FB20', '1', 'R-1312', 'public/assets/shop/img/repuestos/correas.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:39', '2024-08-20 01:31:19', 6, 18, 35),
(314, 8, 'embrague para 2.0L I4 FB20', 'Descripción de embrague compatible con 2.0L I4 FB20', '1', 'R-1313', 'public/assets/shop/img/repuestos/embrague.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:40', '2024-08-19 22:46:40', 6, 18, 35),
(315, 9, 'rodamientos para 2.0L I4 FB20', 'Descripción de rodamientos compatible con 2.0L I4 FB20', '1', 'R-1314', 'public/assets/shop/img/repuestos/rodamientos.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:40', '2024-08-19 22:46:40', 6, 18, 35),
(316, 1, 'filtros para 2.5L H4 EJ25', 'Descripción de filtros compatible con 2.5L H4 EJ25', '1', 'R-1315', 'public/assets/shop/img/repuestos/filtros.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:40', '2024-08-19 22:46:40', 6, 18, 36),
(317, 2, 'frenos para 2.5L H4 EJ25', 'Descripción de frenos compatible con 2.5L H4 EJ25', '1', 'R-1316', 'public/assets/shop/img/repuestos/frenos.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:40', '2024-08-19 22:46:40', 6, 18, 36),
(318, 3, 'motor para 2.5L H4 EJ25', 'Descripción de motor compatible con 2.5L H4 EJ25', '1', 'R-1317', 'public/assets/shop/img/repuestos/motor.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:40', '2024-08-19 22:46:40', 6, 18, 36),
(319, 4, 'suspension para 2.5L H4 EJ25', 'Descripción de suspension compatible con 2.5L H4 EJ25', '1', 'R-1318', 'public/assets/shop/img/repuestos/suspension.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:40', '2024-08-19 22:46:40', 6, 18, 36),
(320, 5, 'amortiguadores para 2.5L H4 EJ25', 'Descripción de amortiguadores compatible con 2.5L H4 EJ25', '1', 'R-1319', 'public/assets/shop/img/repuestos/amortiguadores.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:40', '2024-08-19 22:46:40', 6, 18, 36),
(321, 6, 'bujias para 2.5L H4 EJ25', 'Descripción de bujias compatible con 2.5L H4 EJ25', '1', 'R-1320', 'public/assets/shop/img/repuestos/bujias.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:40', '2024-08-19 22:46:40', 6, 18, 36),
(322, 7, 'carreras, cadenas, rodillos para 2.5L H4 EJ25', 'Descripción de carreras, cadenas, rodillos compatible con 2.5L H4 EJ25', '1', 'R-1321', 'public/assets/shop/img/repuestos/correas.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:40', '2024-08-20 01:31:19', 6, 18, 36),
(323, 8, 'embrague para 2.5L H4 EJ25', 'Descripción de embrague compatible con 2.5L H4 EJ25', '1', 'R-1322', 'public/assets/shop/img/repuestos/embrague.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:40', '2024-08-19 22:46:40', 6, 18, 36),
(324, 9, 'rodamientos para 2.5L H4 EJ25', 'Descripción de rodamientos compatible con 2.5L H4 EJ25', '1', 'R-1323', 'public/assets/shop/img/repuestos/rodamientos.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:40', '2024-08-19 22:46:40', 6, 18, 36),
(325, 1, 'filtros para 2.0L I4 16V TDI', 'Descripción de filtros compatible con 2.0L I4 16V TDI', '1', 'R-1324', 'public/assets/shop/img/repuestos/filtros.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:40', '2024-08-19 22:46:40', 7, 19, 37),
(326, 2, 'frenos para 2.0L I4 16V TDI', 'Descripción de frenos compatible con 2.0L I4 16V TDI', '1', 'R-1325', 'public/assets/shop/img/repuestos/frenos.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:40', '2024-08-19 22:46:40', 7, 19, 37),
(327, 3, 'motor para 2.0L I4 16V TDI', 'Descripción de motor compatible con 2.0L I4 16V TDI', '1', 'R-1326', 'public/assets/shop/img/repuestos/motor.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:40', '2024-08-19 22:46:40', 7, 19, 37),
(328, 4, 'suspension para 2.0L I4 16V TDI', 'Descripción de suspension compatible con 2.0L I4 16V TDI', '1', 'R-1327', 'public/assets/shop/img/repuestos/suspension.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:40', '2024-08-19 22:46:40', 7, 19, 37),
(329, 5, 'amortiguadores para 2.0L I4 16V TDI', 'Descripción de amortiguadores compatible con 2.0L I4 16V TDI', '1', 'R-1328', 'public/assets/shop/img/repuestos/amortiguadores.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:40', '2024-08-19 22:46:40', 7, 19, 37),
(330, 6, 'bujias para 2.0L I4 16V TDI', 'Descripción de bujias compatible con 2.0L I4 16V TDI', '1', 'R-1329', 'public/assets/shop/img/repuestos/bujias.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:40', '2024-08-19 22:46:40', 7, 19, 37),
(331, 7, 'carreras, cadenas, rodillos para 2.0L I4 16V TDI', 'Descripción de carreras, cadenas, rodillos compatible con 2.0L I4 16V TDI', '1', 'R-1330', 'public/assets/shop/img/repuestos/correas.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:40', '2024-08-20 01:31:19', 7, 19, 37),
(332, 8, 'embrague para 2.0L I4 16V TDI', 'Descripción de embrague compatible con 2.0L I4 16V TDI', '1', 'R-1331', 'public/assets/shop/img/repuestos/embrague.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:40', '2024-08-19 22:46:40', 7, 19, 37),
(333, 9, 'rodamientos para 2.0L I4 16V TDI', 'Descripción de rodamientos compatible con 2.0L I4 16V TDI', '1', 'R-1332', 'public/assets/shop/img/repuestos/rodamientos.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:40', '2024-08-19 22:46:40', 7, 19, 37),
(334, 1, 'filtros para 2.0L I4 16V TDI CR', 'Descripción de filtros compatible con 2.0L I4 16V TDI CR', '1', 'R-1333', 'public/assets/shop/img/repuestos/filtros.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:40', '2024-08-19 22:46:40', 7, 19, 38),
(335, 2, 'frenos para 2.0L I4 16V TDI CR', 'Descripción de frenos compatible con 2.0L I4 16V TDI CR', '1', 'R-1334', 'public/assets/shop/img/repuestos/frenos.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:40', '2024-08-19 22:46:40', 7, 19, 38),
(336, 3, 'motor para 2.0L I4 16V TDI CR', 'Descripción de motor compatible con 2.0L I4 16V TDI CR', '1', 'R-1335', 'public/assets/shop/img/repuestos/motor.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:40', '2024-08-19 22:46:40', 7, 19, 38),
(337, 4, 'suspension para 2.0L I4 16V TDI CR', 'Descripción de suspension compatible con 2.0L I4 16V TDI CR', '1', 'R-1336', 'public/assets/shop/img/repuestos/suspension.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:40', '2024-08-19 22:46:40', 7, 19, 38),
(338, 5, 'amortiguadores para 2.0L I4 16V TDI CR', 'Descripción de amortiguadores compatible con 2.0L I4 16V TDI CR', '1', 'R-1337', 'public/assets/shop/img/repuestos/amortiguadores.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:40', '2024-08-19 22:46:40', 7, 19, 38),
(339, 6, 'bujias para 2.0L I4 16V TDI CR', 'Descripción de bujias compatible con 2.0L I4 16V TDI CR', '1', 'R-1338', 'public/assets/shop/img/repuestos/bujias.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:40', '2024-08-19 22:46:40', 7, 19, 38),
(340, 7, 'carreras, cadenas, rodillos para 2.0L I4 16V TDI CR', 'Descripción de carreras, cadenas, rodillos compatible con 2.0L I4 16V TDI CR', '1', 'R-1339', 'public/assets/shop/img/repuestos/correas.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:40', '2024-08-20 01:31:19', 7, 19, 38),
(341, 8, 'embrague para 2.0L I4 16V TDI CR', 'Descripción de embrague compatible con 2.0L I4 16V TDI CR', '1', 'R-1340', 'public/assets/shop/img/repuestos/embrague.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:40', '2024-08-19 22:46:40', 7, 19, 38),
(342, 9, 'rodamientos para 2.0L I4 16V TDI CR', 'Descripción de rodamientos compatible con 2.0L I4 16V TDI CR', '1', 'R-1341', 'public/assets/shop/img/repuestos/rodamientos.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:40', '2024-08-19 22:46:40', 7, 19, 38),
(343, 1, 'filtros para 3.0L V6 6G72', 'Descripción de filtros compatible con 3.0L V6 6G72', '1', 'R-1342', 'public/assets/shop/img/repuestos/filtros.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:40', '2024-08-19 22:46:40', 7, 20, 39),
(344, 2, 'frenos para 3.0L V6 6G72', 'Descripción de frenos compatible con 3.0L V6 6G72', '1', 'R-1343', 'public/assets/shop/img/repuestos/frenos.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:40', '2024-08-19 22:46:40', 7, 20, 39),
(345, 3, 'motor para 3.0L V6 6G72', 'Descripción de motor compatible con 3.0L V6 6G72', '1', 'R-1344', 'public/assets/shop/img/repuestos/motor.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:40', '2024-08-19 22:46:40', 7, 20, 39),
(346, 4, 'suspension para 3.0L V6 6G72', 'Descripción de suspension compatible con 3.0L V6 6G72', '1', 'R-1345', 'public/assets/shop/img/repuestos/suspension.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:40', '2024-08-19 22:46:40', 7, 20, 39),
(347, 5, 'amortiguadores para 3.0L V6 6G72', 'Descripción de amortiguadores compatible con 3.0L V6 6G72', '1', 'R-1346', 'public/assets/shop/img/repuestos/amortiguadores.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:40', '2024-08-19 22:46:40', 7, 20, 39),
(348, 6, 'bujias para 3.0L V6 6G72', 'Descripción de bujias compatible con 3.0L V6 6G72', '1', 'R-1347', 'public/assets/shop/img/repuestos/bujias.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:40', '2024-08-19 22:46:40', 7, 20, 39),
(349, 7, 'carreras, cadenas, rodillos para 3.0L V6 6G72', 'Descripción de carreras, cadenas, rodillos compatible con 3.0L V6 6G72', '1', 'R-1348', 'public/assets/shop/img/repuestos/correas.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:40', '2024-08-20 01:31:19', 7, 20, 39),
(350, 8, 'embrague para 3.0L V6 6G72', 'Descripción de embrague compatible con 3.0L V6 6G72', '1', 'R-1349', 'public/assets/shop/img/repuestos/embrague.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:40', '2024-08-19 22:46:40', 7, 20, 39),
(351, 9, 'rodamientos para 3.0L V6 6G72', 'Descripción de rodamientos compatible con 3.0L V6 6G72', '1', 'R-1350', 'public/assets/shop/img/repuestos/rodamientos.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:40', '2024-08-19 22:46:40', 7, 20, 39),
(352, 1, 'filtros para 2.4L I4 4G69', 'Descripción de filtros compatible con 2.4L I4 4G69', '1', 'R-1351', 'public/assets/shop/img/repuestos/filtros.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:40', '2024-08-19 22:46:40', 7, 20, 40),
(353, 2, 'frenos para 2.4L I4 4G69', 'Descripción de frenos compatible con 2.4L I4 4G69', '1', 'R-1352', 'public/assets/shop/img/repuestos/frenos.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:40', '2024-08-19 22:46:40', 7, 20, 40),
(354, 3, 'motor para 2.4L I4 4G69', 'Descripción de motor compatible con 2.4L I4 4G69', '1', 'R-1353', 'public/assets/shop/img/repuestos/motor.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:40', '2024-08-19 22:46:40', 7, 20, 40),
(355, 4, 'suspension para 2.4L I4 4G69', 'Descripción de suspension compatible con 2.4L I4 4G69', '1', 'R-1354', 'public/assets/shop/img/repuestos/suspension.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:40', '2024-08-19 22:46:40', 7, 20, 40),
(356, 5, 'amortiguadores para 2.4L I4 4G69', 'Descripción de amortiguadores compatible con 2.4L I4 4G69', '1', 'R-1355', 'public/assets/shop/img/repuestos/amortiguadores.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:40', '2024-08-19 22:46:40', 7, 20, 40),
(357, 6, 'bujias para 2.4L I4 4G69', 'Descripción de bujias compatible con 2.4L I4 4G69', '1', 'R-1356', 'public/assets/shop/img/repuestos/bujias.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:40', '2024-08-19 22:46:40', 7, 20, 40),
(358, 7, 'carreras, cadenas, rodillos para 2.4L I4 4G69', 'Descripción de carreras, cadenas, rodillos compatible con 2.4L I4 4G69', '1', 'R-1357', 'public/assets/shop/img/repuestos/correas.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:40', '2024-08-20 01:31:19', 7, 20, 40),
(359, 8, 'embrague para 2.4L I4 4G69', 'Descripción de embrague compatible con 2.4L I4 4G69', '1', 'R-1358', 'public/assets/shop/img/repuestos/embrague.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:40', '2024-08-19 22:46:40', 7, 20, 40),
(360, 9, 'rodamientos para 2.4L I4 4G69', 'Descripción de rodamientos compatible con 2.4L I4 4G69', '1', 'R-1359', 'public/assets/shop/img/repuestos/rodamientos.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:40', '2024-08-19 22:46:40', 7, 20, 40),
(361, 1, 'filtros para 2.0L I4 K20C1', 'Descripción de filtros compatible con 2.0L I4 K20C1', '1', 'R-1360', 'public/assets/shop/img/repuestos/filtros.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:40', '2024-08-19 22:46:40', 7, 21, 41),
(362, 2, 'frenos para 2.0L I4 K20C1', 'Descripción de frenos compatible con 2.0L I4 K20C1', '1', 'R-1361', 'public/assets/shop/img/repuestos/frenos.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:40', '2024-08-19 22:46:40', 7, 21, 41),
(363, 3, 'motor para 2.0L I4 K20C1', 'Descripción de motor compatible con 2.0L I4 K20C1', '1', 'R-1362', 'public/assets/shop/img/repuestos/motor.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:40', '2024-08-19 22:46:40', 7, 21, 41),
(364, 4, 'suspension para 2.0L I4 K20C1', 'Descripción de suspension compatible con 2.0L I4 K20C1', '1', 'R-1363', 'public/assets/shop/img/repuestos/suspension.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:40', '2024-08-19 22:46:40', 7, 21, 41),
(365, 5, 'amortiguadores para 2.0L I4 K20C1', 'Descripción de amortiguadores compatible con 2.0L I4 K20C1', '1', 'R-1364', 'public/assets/shop/img/repuestos/amortiguadores.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:40', '2024-08-19 22:46:40', 7, 21, 41),
(366, 6, 'bujias para 2.0L I4 K20C1', 'Descripción de bujias compatible con 2.0L I4 K20C1', '1', 'R-1365', 'public/assets/shop/img/repuestos/bujias.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:40', '2024-08-19 22:46:40', 7, 21, 41),
(367, 7, 'carreras, cadenas, rodillos para 2.0L I4 K20C1', 'Descripción de carreras, cadenas, rodillos compatible con 2.0L I4 K20C1', '1', 'R-1366', 'public/assets/shop/img/repuestos/correas.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:40', '2024-08-20 01:31:19', 7, 21, 41),
(368, 8, 'embrague para 2.0L I4 K20C1', 'Descripción de embrague compatible con 2.0L I4 K20C1', '1', 'R-1367', 'public/assets/shop/img/repuestos/embrague.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:40', '2024-08-19 22:46:40', 7, 21, 41),
(369, 9, 'rodamientos para 2.0L I4 K20C1', 'Descripción de rodamientos compatible con 2.0L I4 K20C1', '1', 'R-1368', 'public/assets/shop/img/repuestos/rodamientos.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:40', '2024-08-19 22:46:40', 7, 21, 41),
(370, 1, 'filtros para 1.5L I4 L15B7', 'Descripción de filtros compatible con 1.5L I4 L15B7', '1', 'R-1369', 'public/assets/shop/img/repuestos/filtros.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:40', '2024-08-19 22:46:40', 7, 21, 42),
(371, 2, 'frenos para 1.5L I4 L15B7', 'Descripción de frenos compatible con 1.5L I4 L15B7', '1', 'R-1370', 'public/assets/shop/img/repuestos/frenos.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:40', '2024-08-19 22:46:40', 7, 21, 42),
(372, 3, 'motor para 1.5L I4 L15B7', 'Descripción de motor compatible con 1.5L I4 L15B7', '1', 'R-1371', 'public/assets/shop/img/repuestos/motor.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:40', '2024-08-19 22:46:40', 7, 21, 42),
(373, 4, 'suspension para 1.5L I4 L15B7', 'Descripción de suspension compatible con 1.5L I4 L15B7', '1', 'R-1372', 'public/assets/shop/img/repuestos/suspension.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:40', '2024-08-19 22:46:40', 7, 21, 42),
(374, 5, 'amortiguadores para 1.5L I4 L15B7', 'Descripción de amortiguadores compatible con 1.5L I4 L15B7', '1', 'R-1373', 'public/assets/shop/img/repuestos/amortiguadores.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:40', '2024-08-19 22:46:40', 7, 21, 42),
(375, 6, 'bujias para 1.5L I4 L15B7', 'Descripción de bujias compatible con 1.5L I4 L15B7', '1', 'R-1374', 'public/assets/shop/img/repuestos/bujias.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:40', '2024-08-19 22:46:40', 7, 21, 42),
(376, 7, 'carreras, cadenas, rodillos para 1.5L I4 L15B7', 'Descripción de carreras, cadenas, rodillos compatible con 1.5L I4 L15B7', '1', 'R-1375', 'public/assets/shop/img/repuestos/correas.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:40', '2024-08-20 01:31:19', 7, 21, 42),
(377, 8, 'embrague para 1.5L I4 L15B7', 'Descripción de embrague compatible con 1.5L I4 L15B7', '1', 'R-1376', 'public/assets/shop/img/repuestos/embrague.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:40', '2024-08-19 22:46:40', 7, 21, 42),
(378, 9, 'rodamientos para 1.5L I4 L15B7', 'Descripción de rodamientos compatible con 1.5L I4 L15B7', '1', 'R-1377', 'public/assets/shop/img/repuestos/rodamientos.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:40', '2024-08-19 22:46:40', 7, 21, 42),
(379, 1, 'filtros para 2.4L I4 K24W7', 'Descripción de filtros compatible con 2.4L I4 K24W7', '1', 'R-1378', 'public/assets/shop/img/repuestos/filtros.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:40', '2024-08-19 22:46:40', 8, 22, 43),
(380, 2, 'frenos para 2.4L I4 K24W7', 'Descripción de frenos compatible con 2.4L I4 K24W7', '1', 'R-1379', 'public/assets/shop/img/repuestos/frenos.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:40', '2024-08-19 22:46:40', 8, 22, 43),
(381, 3, 'motor para 2.4L I4 K24W7', 'Descripción de motor compatible con 2.4L I4 K24W7', '1', 'R-1380', 'public/assets/shop/img/repuestos/motor.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:40', '2024-08-19 22:46:40', 8, 22, 43),
(382, 4, 'suspension para 2.4L I4 K24W7', 'Descripción de suspension compatible con 2.4L I4 K24W7', '1', 'R-1381', 'public/assets/shop/img/repuestos/suspension.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:40', '2024-08-19 22:46:40', 8, 22, 43),
(383, 5, 'amortiguadores para 2.4L I4 K24W7', 'Descripción de amortiguadores compatible con 2.4L I4 K24W7', '1', 'R-1382', 'public/assets/shop/img/repuestos/amortiguadores.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:40', '2024-08-19 22:46:40', 8, 22, 43),
(384, 6, 'bujias para 2.4L I4 K24W7', 'Descripción de bujias compatible con 2.4L I4 K24W7', '1', 'R-1383', 'public/assets/shop/img/repuestos/bujias.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:40', '2024-08-19 22:46:40', 8, 22, 43);
INSERT INTO `repuestos` (`id_repuesto`, `id_categoria`, `nombre_repuesto`, `descripcion_repuesto`, `oem_repuesto`, `codigo_tienda_repuesto`, `img_repuesto`, `stock_repuesto`, `precio_repuesto`, `fabricante_repuesto`, `venta_repuesto`, `peso_repuesto`, `estado_repuesto`, `date_created_repuesto`, `date_updated_repuesto`, `id_marca`, `id_modelo`, `id_motor`) VALUES
(385, 7, 'carreras, cadenas, rodillos para 2.4L I4 K24W7', 'Descripción de carreras, cadenas, rodillos compatible con 2.4L I4 K24W7', '1', 'R-1384', 'public/assets/shop/img/repuestos/correas.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:40', '2024-08-20 01:31:19', 8, 22, 43),
(386, 8, 'embrague para 2.4L I4 K24W7', 'Descripción de embrague compatible con 2.4L I4 K24W7', '1', 'R-1385', 'public/assets/shop/img/repuestos/embrague.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:40', '2024-08-19 22:46:40', 8, 22, 43),
(387, 9, 'rodamientos para 2.4L I4 K24W7', 'Descripción de rodamientos compatible con 2.4L I4 K24W7', '1', 'R-1386', 'public/assets/shop/img/repuestos/rodamientos.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:40', '2024-08-19 22:46:40', 8, 22, 43),
(388, 1, 'filtros para 1.5L I4 L15B7', 'Descripción de filtros compatible con 1.5L I4 L15B7', '1', 'R-1387', 'public/assets/shop/img/repuestos/filtros.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:40', '2024-08-19 22:46:40', 8, 22, 44),
(389, 2, 'frenos para 1.5L I4 L15B7', 'Descripción de frenos compatible con 1.5L I4 L15B7', '1', 'R-1388', 'public/assets/shop/img/repuestos/frenos.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:40', '2024-08-19 22:46:40', 8, 22, 44),
(390, 3, 'motor para 1.5L I4 L15B7', 'Descripción de motor compatible con 1.5L I4 L15B7', '1', 'R-1389', 'public/assets/shop/img/repuestos/motor.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:40', '2024-08-19 22:46:40', 8, 22, 44),
(391, 4, 'suspension para 1.5L I4 L15B7', 'Descripción de suspension compatible con 1.5L I4 L15B7', '1', 'R-1390', 'public/assets/shop/img/repuestos/suspension.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:40', '2024-08-19 22:46:40', 8, 22, 44),
(392, 5, 'amortiguadores para 1.5L I4 L15B7', 'Descripción de amortiguadores compatible con 1.5L I4 L15B7', '1', 'R-1391', 'public/assets/shop/img/repuestos/amortiguadores.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:40', '2024-08-19 22:46:40', 8, 22, 44),
(393, 6, 'bujias para 1.5L I4 L15B7', 'Descripción de bujias compatible con 1.5L I4 L15B7', '1', 'R-1392', 'public/assets/shop/img/repuestos/bujias.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:40', '2024-08-19 22:46:40', 8, 22, 44),
(394, 7, 'carreras, cadenas, rodillos para 1.5L I4 L15B7', 'Descripción de carreras, cadenas, rodillos compatible con 1.5L I4 L15B7', '1', 'R-1393', 'public/assets/shop/img/repuestos/correas.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:40', '2024-08-20 01:31:19', 8, 22, 44),
(395, 8, 'embrague para 1.5L I4 L15B7', 'Descripción de embrague compatible con 1.5L I4 L15B7', '1', 'R-1394', 'public/assets/shop/img/repuestos/embrague.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:40', '2024-08-19 22:46:40', 8, 22, 44),
(396, 9, 'rodamientos para 1.5L I4 L15B7', 'Descripción de rodamientos compatible con 1.5L I4 L15B7', '1', 'R-1395', 'public/assets/shop/img/repuestos/rodamientos.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:40', '2024-08-19 22:46:40', 8, 22, 44),
(397, 1, 'filtros para 3.5L V6 VQ35DE', 'Descripción de filtros compatible con 3.5L V6 VQ35DE', '1', 'R-1396', 'public/assets/shop/img/repuestos/filtros.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:40', '2024-08-19 22:46:40', 8, 23, 45),
(398, 2, 'frenos para 3.5L V6 VQ35DE', 'Descripción de frenos compatible con 3.5L V6 VQ35DE', '1', 'R-1397', 'public/assets/shop/img/repuestos/frenos.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:40', '2024-08-19 22:46:40', 8, 23, 45),
(399, 3, 'motor para 3.5L V6 VQ35DE', 'Descripción de motor compatible con 3.5L V6 VQ35DE', '1', 'R-1398', 'public/assets/shop/img/repuestos/motor.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:40', '2024-08-19 22:46:40', 8, 23, 45),
(400, 4, 'suspension para 3.5L V6 VQ35DE', 'Descripción de suspension compatible con 3.5L V6 VQ35DE', '1', 'R-1399', 'public/assets/shop/img/repuestos/suspension.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:40', '2024-08-19 22:46:40', 8, 23, 45),
(401, 5, 'amortiguadores para 3.5L V6 VQ35DE', 'Descripción de amortiguadores compatible con 3.5L V6 VQ35DE', '1', 'R-1400', 'public/assets/shop/img/repuestos/amortiguadores.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:40', '2024-08-19 22:46:40', 8, 23, 45),
(402, 6, 'bujias para 3.5L V6 VQ35DE', 'Descripción de bujias compatible con 3.5L V6 VQ35DE', '1', 'R-1401', 'public/assets/shop/img/repuestos/bujias.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:40', '2024-08-19 22:46:40', 8, 23, 45),
(403, 7, 'carreras, cadenas, rodillos para 3.5L V6 VQ35DE', 'Descripción de carreras, cadenas, rodillos compatible con 3.5L V6 VQ35DE', '1', 'R-1402', 'public/assets/shop/img/repuestos/correas.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:40', '2024-08-20 01:31:19', 8, 23, 45),
(404, 8, 'embrague para 3.5L V6 VQ35DE', 'Descripción de embrague compatible con 3.5L V6 VQ35DE', '1', 'R-1403', 'public/assets/shop/img/repuestos/embrague.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:40', '2024-08-19 22:46:40', 8, 23, 45),
(405, 9, 'rodamientos para 3.5L V6 VQ35DE', 'Descripción de rodamientos compatible con 3.5L V6 VQ35DE', '1', 'R-1404', 'public/assets/shop/img/repuestos/rodamientos.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:40', '2024-08-19 22:46:40', 8, 23, 45),
(406, 1, 'filtros para 2.5L I4 QR25DE', 'Descripción de filtros compatible con 2.5L I4 QR25DE', '1', 'R-1405', 'public/assets/shop/img/repuestos/filtros.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:40', '2024-08-19 22:46:40', 8, 23, 46),
(407, 2, 'frenos para 2.5L I4 QR25DE', 'Descripción de frenos compatible con 2.5L I4 QR25DE', '1', 'R-1406', 'public/assets/shop/img/repuestos/frenos.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:40', '2024-08-19 22:46:40', 8, 23, 46),
(408, 3, 'motor para 2.5L I4 QR25DE', 'Descripción de motor compatible con 2.5L I4 QR25DE', '1', 'R-1407', 'public/assets/shop/img/repuestos/motor.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:40', '2024-08-19 22:46:40', 8, 23, 46),
(409, 4, 'suspension para 2.5L I4 QR25DE', 'Descripción de suspension compatible con 2.5L I4 QR25DE', '1', 'R-1408', 'public/assets/shop/img/repuestos/suspension.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:40', '2024-08-19 22:46:40', 8, 23, 46),
(410, 5, 'amortiguadores para 2.5L I4 QR25DE', 'Descripción de amortiguadores compatible con 2.5L I4 QR25DE', '1', 'R-1409', 'public/assets/shop/img/repuestos/amortiguadores.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:40', '2024-08-19 22:46:40', 8, 23, 46),
(411, 6, 'bujias para 2.5L I4 QR25DE', 'Descripción de bujias compatible con 2.5L I4 QR25DE', '1', 'R-1410', 'public/assets/shop/img/repuestos/bujias.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:40', '2024-08-19 22:46:40', 8, 23, 46),
(412, 7, 'carreras, cadenas, rodillos para 2.5L I4 QR25DE', 'Descripción de carreras, cadenas, rodillos compatible con 2.5L I4 QR25DE', '1', 'R-1411', 'public/assets/shop/img/repuestos/correas.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:40', '2024-08-20 01:31:19', 8, 23, 46),
(413, 8, 'embrague para 2.5L I4 QR25DE', 'Descripción de embrague compatible con 2.5L I4 QR25DE', '1', 'R-1412', 'public/assets/shop/img/repuestos/embrague.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:40', '2024-08-19 22:46:40', 8, 23, 46),
(414, 9, 'rodamientos para 2.5L I4 QR25DE', 'Descripción de rodamientos compatible con 2.5L I4 QR25DE', '1', 'R-1413', 'public/assets/shop/img/repuestos/rodamientos.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:40', '2024-08-19 22:46:40', 8, 23, 46),
(415, 1, 'filtros para 2.0L I4 4B11', 'Descripción de filtros compatible con 2.0L I4 4B11', '1', 'R-1414', 'public/assets/shop/img/repuestos/filtros.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:40', '2024-08-19 22:46:40', 8, 24, 47),
(416, 2, 'frenos para 2.0L I4 4B11', 'Descripción de frenos compatible con 2.0L I4 4B11', '1', 'R-1415', 'public/assets/shop/img/repuestos/frenos.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:40', '2024-08-19 22:46:40', 8, 24, 47),
(417, 3, 'motor para 2.0L I4 4B11', 'Descripción de motor compatible con 2.0L I4 4B11', '1', 'R-1416', 'public/assets/shop/img/repuestos/motor.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:40', '2024-08-19 22:46:40', 8, 24, 47),
(418, 4, 'suspension para 2.0L I4 4B11', 'Descripción de suspension compatible con 2.0L I4 4B11', '1', 'R-1417', 'public/assets/shop/img/repuestos/suspension.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:40', '2024-08-19 22:46:40', 8, 24, 47),
(419, 5, 'amortiguadores para 2.0L I4 4B11', 'Descripción de amortiguadores compatible con 2.0L I4 4B11', '1', 'R-1418', 'public/assets/shop/img/repuestos/amortiguadores.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:40', '2024-08-19 22:46:40', 8, 24, 47),
(420, 6, 'bujias para 2.0L I4 4B11', 'Descripción de bujias compatible con 2.0L I4 4B11', '1', 'R-1419', 'public/assets/shop/img/repuestos/bujias.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:40', '2024-08-19 22:46:40', 8, 24, 47),
(421, 7, 'carreras, cadenas, rodillos para 2.0L I4 4B11', 'Descripción de carreras, cadenas, rodillos compatible con 2.0L I4 4B11', '1', 'R-1420', 'public/assets/shop/img/repuestos/correas.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:40', '2024-08-20 01:31:19', 8, 24, 47),
(422, 8, 'embrague para 2.0L I4 4B11', 'Descripción de embrague compatible con 2.0L I4 4B11', '1', 'R-1421', 'public/assets/shop/img/repuestos/embrague.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:40', '2024-08-19 22:46:40', 8, 24, 47),
(423, 9, 'rodamientos para 2.0L I4 4B11', 'Descripción de rodamientos compatible con 2.0L I4 4B11', '1', 'R-1422', 'public/assets/shop/img/repuestos/rodamientos.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:40', '2024-08-19 22:46:40', 8, 24, 47),
(424, 1, 'filtros para 1.8L I4 4B10', 'Descripción de filtros compatible con 1.8L I4 4B10', '1', 'R-1423', 'public/assets/shop/img/repuestos/filtros.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:40', '2024-08-19 22:46:40', 8, 24, 48),
(425, 2, 'frenos para 1.8L I4 4B10', 'Descripción de frenos compatible con 1.8L I4 4B10', '1', 'R-1424', 'public/assets/shop/img/repuestos/frenos.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:40', '2024-08-19 22:46:40', 8, 24, 48),
(426, 3, 'motor para 1.8L I4 4B10', 'Descripción de motor compatible con 1.8L I4 4B10', '1', 'R-1425', 'public/assets/shop/img/repuestos/motor.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:40', '2024-08-19 22:46:40', 8, 24, 48),
(427, 4, 'suspension para 1.8L I4 4B10', 'Descripción de suspension compatible con 1.8L I4 4B10', '1', 'R-1426', 'public/assets/shop/img/repuestos/suspension.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:40', '2024-08-19 22:46:40', 8, 24, 48),
(428, 5, 'amortiguadores para 1.8L I4 4B10', 'Descripción de amortiguadores compatible con 1.8L I4 4B10', '1', 'R-1427', 'public/assets/shop/img/repuestos/amortiguadores.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:40', '2024-08-19 22:46:40', 8, 24, 48),
(429, 6, 'bujias para 1.8L I4 4B10', 'Descripción de bujias compatible con 1.8L I4 4B10', '1', 'R-1428', 'public/assets/shop/img/repuestos/bujias.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:40', '2024-08-19 22:46:40', 8, 24, 48),
(430, 7, 'carreras, cadenas, rodillos para 1.8L I4 4B10', 'Descripción de carreras, cadenas, rodillos compatible con 1.8L I4 4B10', '1', 'R-1429', 'public/assets/shop/img/repuestos/correas.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:40', '2024-08-20 01:31:19', 8, 24, 48),
(431, 8, 'embrague para 1.8L I4 4B10', 'Descripción de embrague compatible con 1.8L I4 4B10', '1', 'R-1430', 'public/assets/shop/img/repuestos/embrague.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:40', '2024-08-19 22:46:40', 8, 24, 48),
(432, 9, 'rodamientos para 1.8L I4 4B10', 'Descripción de rodamientos compatible con 1.8L I4 4B10', '1', 'R-1431', 'public/assets/shop/img/repuestos/rodamientos.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:40', '2024-08-19 22:46:40', 8, 24, 48),
(433, 1, 'filtros para 3.0L V6 6B31', 'Descripción de filtros compatible con 3.0L V6 6B31', '1', 'R-1432', 'public/assets/shop/img/repuestos/filtros.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:40', '2024-08-19 22:46:40', 9, 25, 49),
(434, 2, 'frenos para 3.0L V6 6B31', 'Descripción de frenos compatible con 3.0L V6 6B31', '1', 'R-1433', 'public/assets/shop/img/repuestos/frenos.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:40', '2024-08-19 22:46:40', 9, 25, 49),
(435, 3, 'motor para 3.0L V6 6B31', 'Descripción de motor compatible con 3.0L V6 6B31', '1', 'R-1434', 'public/assets/shop/img/repuestos/motor.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:40', '2024-08-19 22:46:40', 9, 25, 49),
(436, 4, 'suspension para 3.0L V6 6B31', 'Descripción de suspension compatible con 3.0L V6 6B31', '1', 'R-1435', 'public/assets/shop/img/repuestos/suspension.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:40', '2024-08-19 22:46:40', 9, 25, 49),
(437, 5, 'amortiguadores para 3.0L V6 6B31', 'Descripción de amortiguadores compatible con 3.0L V6 6B31', '1', 'R-1436', 'public/assets/shop/img/repuestos/amortiguadores.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:40', '2024-08-19 22:46:40', 9, 25, 49),
(438, 6, 'bujias para 3.0L V6 6B31', 'Descripción de bujias compatible con 3.0L V6 6B31', '1', 'R-1437', 'public/assets/shop/img/repuestos/bujias.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:40', '2024-08-19 22:46:40', 9, 25, 49),
(439, 7, 'carreras, cadenas, rodillos para 3.0L V6 6B31', 'Descripción de carreras, cadenas, rodillos compatible con 3.0L V6 6B31', '1', 'R-1438', 'public/assets/shop/img/repuestos/correas.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:40', '2024-08-20 01:31:19', 9, 25, 49),
(440, 8, 'embrague para 3.0L V6 6B31', 'Descripción de embrague compatible con 3.0L V6 6B31', '1', 'R-1439', 'public/assets/shop/img/repuestos/embrague.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:40', '2024-08-19 22:46:40', 9, 25, 49),
(441, 9, 'rodamientos para 3.0L V6 6B31', 'Descripción de rodamientos compatible con 3.0L V6 6B31', '1', 'R-1440', 'public/assets/shop/img/repuestos/rodamientos.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:40', '2024-08-19 22:46:40', 9, 25, 49),
(442, 1, 'filtros para 2.4L I4 4G69', 'Descripción de filtros compatible con 2.4L I4 4G69', '1', 'R-1441', 'public/assets/shop/img/repuestos/filtros.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:40', '2024-08-19 22:46:40', 9, 25, 50),
(443, 2, 'frenos para 2.4L I4 4G69', 'Descripción de frenos compatible con 2.4L I4 4G69', '1', 'R-1442', 'public/assets/shop/img/repuestos/frenos.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:40', '2024-08-19 22:46:40', 9, 25, 50),
(444, 3, 'motor para 2.4L I4 4G69', 'Descripción de motor compatible con 2.4L I4 4G69', '1', 'R-1443', 'public/assets/shop/img/repuestos/motor.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:40', '2024-08-19 22:46:40', 9, 25, 50),
(445, 4, 'suspension para 2.4L I4 4G69', 'Descripción de suspension compatible con 2.4L I4 4G69', '1', 'R-1444', 'public/assets/shop/img/repuestos/suspension.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:40', '2024-08-19 22:46:40', 9, 25, 50),
(446, 5, 'amortiguadores para 2.4L I4 4G69', 'Descripción de amortiguadores compatible con 2.4L I4 4G69', '1', 'R-1445', 'public/assets/shop/img/repuestos/amortiguadores.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:40', '2024-08-19 22:46:40', 9, 25, 50),
(447, 6, 'bujias para 2.4L I4 4G69', 'Descripción de bujias compatible con 2.4L I4 4G69', '1', 'R-1446', 'public/assets/shop/img/repuestos/bujias.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:40', '2024-08-19 22:46:40', 9, 25, 50),
(448, 7, 'carreras, cadenas, rodillos para 2.4L I4 4G69', 'Descripción de carreras, cadenas, rodillos compatible con 2.4L I4 4G69', '1', 'R-1447', 'public/assets/shop/img/repuestos/correas.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:40', '2024-08-20 01:31:19', 9, 25, 50),
(449, 8, 'embrague para 2.4L I4 4G69', 'Descripción de embrague compatible con 2.4L I4 4G69', '1', 'R-1448', 'public/assets/shop/img/repuestos/embrague.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:40', '2024-08-19 22:46:40', 9, 25, 50),
(450, 9, 'rodamientos para 2.4L I4 4G69', 'Descripción de rodamientos compatible con 2.4L I4 4G69', '1', 'R-1449', 'public/assets/shop/img/repuestos/rodamientos.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:40', '2024-08-19 22:46:40', 9, 25, 50),
(451, 1, 'filtros para 1.8L I4 1ZZ-FE', 'Descripción de filtros compatible con 1.8L I4 1ZZ-FE', '1', 'R-1450', 'public/assets/shop/img/repuestos/filtros.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:40', '2024-08-19 22:46:40', 9, 26, 51),
(452, 2, 'frenos para 1.8L I4 1ZZ-FE', 'Descripción de frenos compatible con 1.8L I4 1ZZ-FE', '1', 'R-1451', 'public/assets/shop/img/repuestos/frenos.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:40', '2024-08-19 22:46:40', 9, 26, 51),
(453, 3, 'motor para 1.8L I4 1ZZ-FE', 'Descripción de motor compatible con 1.8L I4 1ZZ-FE', '1', 'R-1452', 'public/assets/shop/img/repuestos/motor.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:40', '2024-08-19 22:46:40', 9, 26, 51),
(454, 4, 'suspension para 1.8L I4 1ZZ-FE', 'Descripción de suspension compatible con 1.8L I4 1ZZ-FE', '1', 'R-1453', 'public/assets/shop/img/repuestos/suspension.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:40', '2024-08-19 22:46:40', 9, 26, 51),
(455, 5, 'amortiguadores para 1.8L I4 1ZZ-FE', 'Descripción de amortiguadores compatible con 1.8L I4 1ZZ-FE', '1', 'R-1454', 'public/assets/shop/img/repuestos/amortiguadores.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:40', '2024-08-19 22:46:40', 9, 26, 51),
(456, 6, 'bujias para 1.8L I4 1ZZ-FE', 'Descripción de bujias compatible con 1.8L I4 1ZZ-FE', '1', 'R-1455', 'public/assets/shop/img/repuestos/bujias.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:40', '2024-08-19 22:46:40', 9, 26, 51),
(457, 7, 'carreras, cadenas, rodillos para 1.8L I4 1ZZ-FE', 'Descripción de carreras, cadenas, rodillos compatible con 1.8L I4 1ZZ-FE', '1', 'R-1456', 'public/assets/shop/img/repuestos/correas.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:40', '2024-08-20 01:31:19', 9, 26, 51),
(458, 8, 'embrague para 1.8L I4 1ZZ-FE', 'Descripción de embrague compatible con 1.8L I4 1ZZ-FE', '1', 'R-1457', 'public/assets/shop/img/repuestos/embrague.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:40', '2024-08-19 22:46:40', 9, 26, 51),
(459, 9, 'rodamientos para 1.8L I4 1ZZ-FE', 'Descripción de rodamientos compatible con 1.8L I4 1ZZ-FE', '1', 'R-1458', 'public/assets/shop/img/repuestos/rodamientos.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:40', '2024-08-19 22:46:40', 9, 26, 51),
(460, 1, 'filtros para 2.4L I4 2AZ-FE', 'Descripción de filtros compatible con 2.4L I4 2AZ-FE', '1', 'R-1459', 'public/assets/shop/img/repuestos/filtros.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:40', '2024-08-19 22:46:40', 9, 26, 52),
(461, 2, 'frenos para 2.4L I4 2AZ-FE', 'Descripción de frenos compatible con 2.4L I4 2AZ-FE', '1', 'R-1460', 'public/assets/shop/img/repuestos/frenos.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:40', '2024-08-19 22:46:40', 9, 26, 52),
(462, 3, 'motor para 2.4L I4 2AZ-FE', 'Descripción de motor compatible con 2.4L I4 2AZ-FE', '1', 'R-1461', 'public/assets/shop/img/repuestos/motor.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:40', '2024-08-19 22:46:40', 9, 26, 52),
(463, 4, 'suspension para 2.4L I4 2AZ-FE', 'Descripción de suspension compatible con 2.4L I4 2AZ-FE', '1', 'R-1462', 'public/assets/shop/img/repuestos/suspension.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:40', '2024-08-19 22:46:40', 9, 26, 52),
(464, 5, 'amortiguadores para 2.4L I4 2AZ-FE', 'Descripción de amortiguadores compatible con 2.4L I4 2AZ-FE', '1', 'R-1463', 'public/assets/shop/img/repuestos/amortiguadores.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:40', '2024-08-19 22:46:40', 9, 26, 52),
(465, 6, 'bujias para 2.4L I4 2AZ-FE', 'Descripción de bujias compatible con 2.4L I4 2AZ-FE', '1', 'R-1464', 'public/assets/shop/img/repuestos/bujias.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:40', '2024-08-19 22:46:40', 9, 26, 52),
(466, 7, 'carreras, cadenas, rodillos para 2.4L I4 2AZ-FE', 'Descripción de carreras, cadenas, rodillos compatible con 2.4L I4 2AZ-FE', '1', 'R-1465', 'public/assets/shop/img/repuestos/correas.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:40', '2024-08-20 01:31:19', 9, 26, 52),
(467, 8, 'embrague para 2.4L I4 2AZ-FE', 'Descripción de embrague compatible con 2.4L I4 2AZ-FE', '1', 'R-1466', 'public/assets/shop/img/repuestos/embrague.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:40', '2024-08-19 22:46:40', 9, 26, 52),
(468, 9, 'rodamientos para 2.4L I4 2AZ-FE', 'Descripción de rodamientos compatible con 2.4L I4 2AZ-FE', '1', 'R-1467', 'public/assets/shop/img/repuestos/rodamientos.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:40', '2024-08-19 22:46:40', 9, 26, 52),
(469, 1, 'filtros para 2.0L I4 SR20DE', 'Descripción de filtros compatible con 2.0L I4 SR20DE', '1', 'R-1468', 'public/assets/shop/img/repuestos/filtros.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:40', '2024-08-19 22:46:40', 9, 27, 53),
(470, 2, 'frenos para 2.0L I4 SR20DE', 'Descripción de frenos compatible con 2.0L I4 SR20DE', '1', 'R-1469', 'public/assets/shop/img/repuestos/frenos.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:40', '2024-08-19 22:46:40', 9, 27, 53),
(471, 3, 'motor para 2.0L I4 SR20DE', 'Descripción de motor compatible con 2.0L I4 SR20DE', '1', 'R-1470', 'public/assets/shop/img/repuestos/motor.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:40', '2024-08-19 22:46:40', 9, 27, 53),
(472, 4, 'suspension para 2.0L I4 SR20DE', 'Descripción de suspension compatible con 2.0L I4 SR20DE', '1', 'R-1471', 'public/assets/shop/img/repuestos/suspension.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:40', '2024-08-19 22:46:40', 9, 27, 53),
(473, 5, 'amortiguadores para 2.0L I4 SR20DE', 'Descripción de amortiguadores compatible con 2.0L I4 SR20DE', '1', 'R-1472', 'public/assets/shop/img/repuestos/amortiguadores.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:40', '2024-08-19 22:46:40', 9, 27, 53),
(474, 6, 'bujias para 2.0L I4 SR20DE', 'Descripción de bujias compatible con 2.0L I4 SR20DE', '1', 'R-1473', 'public/assets/shop/img/repuestos/bujias.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:40', '2024-08-19 22:46:40', 9, 27, 53),
(475, 7, 'carreras, cadenas, rodillos para 2.0L I4 SR20DE', 'Descripción de carreras, cadenas, rodillos compatible con 2.0L I4 SR20DE', '1', 'R-1474', 'public/assets/shop/img/repuestos/correas.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:40', '2024-08-20 01:31:19', 9, 27, 53),
(476, 8, 'embrague para 2.0L I4 SR20DE', 'Descripción de embrague compatible con 2.0L I4 SR20DE', '1', 'R-1475', 'public/assets/shop/img/repuestos/embrague.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:40', '2024-08-19 22:46:40', 9, 27, 53),
(477, 9, 'rodamientos para 2.0L I4 SR20DE', 'Descripción de rodamientos compatible con 2.0L I4 SR20DE', '1', 'R-1476', 'public/assets/shop/img/repuestos/rodamientos.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:40', '2024-08-19 22:46:40', 9, 27, 53),
(478, 1, 'filtros para 2.5L I4 QR25DE', 'Descripción de filtros compatible con 2.5L I4 QR25DE', '1', 'R-1477', 'public/assets/shop/img/repuestos/filtros.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:40', '2024-08-19 22:46:40', 9, 27, 54),
(479, 2, 'frenos para 2.5L I4 QR25DE', 'Descripción de frenos compatible con 2.5L I4 QR25DE', '1', 'R-1478', 'public/assets/shop/img/repuestos/frenos.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:40', '2024-08-19 22:46:40', 9, 27, 54),
(480, 3, 'motor para 2.5L I4 QR25DE', 'Descripción de motor compatible con 2.5L I4 QR25DE', '1', 'R-1479', 'public/assets/shop/img/repuestos/motor.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:40', '2024-08-19 22:46:40', 9, 27, 54),
(481, 4, 'suspension para 2.5L I4 QR25DE', 'Descripción de suspension compatible con 2.5L I4 QR25DE', '1', 'R-1480', 'public/assets/shop/img/repuestos/suspension.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:40', '2024-08-19 22:46:40', 9, 27, 54),
(482, 5, 'amortiguadores para 2.5L I4 QR25DE', 'Descripción de amortiguadores compatible con 2.5L I4 QR25DE', '1', 'R-1481', 'public/assets/shop/img/repuestos/amortiguadores.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:40', '2024-08-19 22:46:40', 9, 27, 54),
(483, 6, 'bujias para 2.5L I4 QR25DE', 'Descripción de bujias compatible con 2.5L I4 QR25DE', '1', 'R-1482', 'public/assets/shop/img/repuestos/bujias.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:40', '2024-08-19 22:46:40', 9, 27, 54),
(484, 7, 'carreras, cadenas, rodillos para 2.5L I4 QR25DE', 'Descripción de carreras, cadenas, rodillos compatible con 2.5L I4 QR25DE', '1', 'R-1483', 'public/assets/shop/img/repuestos/correas.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:40', '2024-08-20 01:31:19', 9, 27, 54),
(485, 8, 'embrague para 2.5L I4 QR25DE', 'Descripción de embrague compatible con 2.5L I4 QR25DE', '1', 'R-1484', 'public/assets/shop/img/repuestos/embrague.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:40', '2024-08-19 22:46:40', 9, 27, 54),
(486, 9, 'rodamientos para 2.5L I4 QR25DE', 'Descripción de rodamientos compatible con 2.5L I4 QR25DE', '1', 'R-1485', 'public/assets/shop/img/repuestos/rodamientos.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:40', '2024-08-19 22:46:40', 9, 27, 54),
(487, 1, 'filtros para 2.4L I4 4G69', 'Descripción de filtros compatible con 2.4L I4 4G69', '1', 'R-1486', 'public/assets/shop/img/repuestos/filtros.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:40', '2024-08-19 22:46:40', 10, 28, 55),
(488, 2, 'frenos para 2.4L I4 4G69', 'Descripción de frenos compatible con 2.4L I4 4G69', '1', 'R-1487', 'public/assets/shop/img/repuestos/frenos.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:40', '2024-08-19 22:46:40', 10, 28, 55),
(489, 3, 'motor para 2.4L I4 4G69', 'Descripción de motor compatible con 2.4L I4 4G69', '1', 'R-1488', 'public/assets/shop/img/repuestos/motor.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:40', '2024-08-19 22:46:40', 10, 28, 55),
(490, 4, 'suspension para 2.4L I4 4G69', 'Descripción de suspension compatible con 2.4L I4 4G69', '1', 'R-1489', 'public/assets/shop/img/repuestos/suspension.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:40', '2024-08-19 22:46:40', 10, 28, 55),
(491, 5, 'amortiguadores para 2.4L I4 4G69', 'Descripción de amortiguadores compatible con 2.4L I4 4G69', '1', 'R-1490', 'public/assets/shop/img/repuestos/amortiguadores.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:40', '2024-08-19 22:46:40', 10, 28, 55),
(492, 6, 'bujias para 2.4L I4 4G69', 'Descripción de bujias compatible con 2.4L I4 4G69', '1', 'R-1491', 'public/assets/shop/img/repuestos/bujias.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:40', '2024-08-19 22:46:40', 10, 28, 55),
(493, 7, 'carreras, cadenas, rodillos para 2.4L I4 4G69', 'Descripción de carreras, cadenas, rodillos compatible con 2.4L I4 4G69', '1', 'R-1492', 'public/assets/shop/img/repuestos/correas.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:40', '2024-08-20 01:31:19', 10, 28, 55),
(494, 8, 'embrague para 2.4L I4 4G69', 'Descripción de embrague compatible con 2.4L I4 4G69', '1', 'R-1493', 'public/assets/shop/img/repuestos/embrague.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:40', '2024-08-19 22:46:40', 10, 28, 55),
(495, 9, 'rodamientos para 2.4L I4 4G69', 'Descripción de rodamientos compatible con 2.4L I4 4G69', '1', 'R-1494', 'public/assets/shop/img/repuestos/rodamientos.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:40', '2024-08-19 22:46:40', 10, 28, 55),
(496, 1, 'filtros para 3.0L V6 6G72', 'Descripción de filtros compatible con 3.0L V6 6G72', '1', 'R-1495', 'public/assets/shop/img/repuestos/filtros.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:41', '2024-08-19 22:46:41', 10, 28, 56),
(497, 2, 'frenos para 3.0L V6 6G72', 'Descripción de frenos compatible con 3.0L V6 6G72', '1', 'R-1496', 'public/assets/shop/img/repuestos/frenos.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:41', '2024-08-19 22:46:41', 10, 28, 56),
(498, 3, 'motor para 3.0L V6 6G72', 'Descripción de motor compatible con 3.0L V6 6G72', '1', 'R-1497', 'public/assets/shop/img/repuestos/motor.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:41', '2024-08-19 22:46:41', 10, 28, 56),
(499, 4, 'suspension para 3.0L V6 6G72', 'Descripción de suspension compatible con 3.0L V6 6G72', '1', 'R-1498', 'public/assets/shop/img/repuestos/suspension.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:41', '2024-08-19 22:46:41', 10, 28, 56),
(500, 5, 'amortiguadores para 3.0L V6 6G72', 'Descripción de amortiguadores compatible con 3.0L V6 6G72', '1', 'R-1499', 'public/assets/shop/img/repuestos/amortiguadores.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:41', '2024-08-19 22:46:41', 10, 28, 56),
(501, 6, 'bujias para 3.0L V6 6G72', 'Descripción de bujias compatible con 3.0L V6 6G72', '1', 'R-1500', 'public/assets/shop/img/repuestos/bujias.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:41', '2024-08-19 22:46:41', 10, 28, 56),
(502, 7, 'carreras, cadenas, rodillos para 3.0L V6 6G72', 'Descripción de carreras, cadenas, rodillos compatible con 3.0L V6 6G72', '1', 'R-1501', 'public/assets/shop/img/repuestos/correas.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:41', '2024-08-20 01:31:19', 10, 28, 56),
(503, 8, 'embrague para 3.0L V6 6G72', 'Descripción de embrague compatible con 3.0L V6 6G72', '1', 'R-1502', 'public/assets/shop/img/repuestos/embrague.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:41', '2024-08-19 22:46:41', 10, 28, 56),
(504, 9, 'rodamientos para 3.0L V6 6G72', 'Descripción de rodamientos compatible con 3.0L V6 6G72', '1', 'R-1503', 'public/assets/shop/img/repuestos/rodamientos.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:41', '2024-08-19 22:46:41', 10, 28, 56),
(505, 1, 'filtros para 1.6L I4 M16A', 'Descripción de filtros compatible con 1.6L I4 M16A', '1', 'R-1504', 'public/assets/shop/img/repuestos/filtros.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:41', '2024-08-19 22:46:41', 10, 29, 57),
(506, 2, 'frenos para 1.6L I4 M16A', 'Descripción de frenos compatible con 1.6L I4 M16A', '1', 'R-1505', 'public/assets/shop/img/repuestos/frenos.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:41', '2024-08-19 22:46:41', 10, 29, 57),
(507, 3, 'motor para 1.6L I4 M16A', 'Descripción de motor compatible con 1.6L I4 M16A', '1', 'R-1506', 'public/assets/shop/img/repuestos/motor.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:41', '2024-08-19 22:46:41', 10, 29, 57),
(508, 4, 'suspension para 1.6L I4 M16A', 'Descripción de suspension compatible con 1.6L I4 M16A', '1', 'R-1507', 'public/assets/shop/img/repuestos/suspension.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:41', '2024-08-19 22:46:41', 10, 29, 57),
(509, 5, 'amortiguadores para 1.6L I4 M16A', 'Descripción de amortiguadores compatible con 1.6L I4 M16A', '1', 'R-1508', 'public/assets/shop/img/repuestos/amortiguadores.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:41', '2024-08-19 22:46:41', 10, 29, 57),
(510, 6, 'bujias para 1.6L I4 M16A', 'Descripción de bujias compatible con 1.6L I4 M16A', '1', 'R-1509', 'public/assets/shop/img/repuestos/bujias.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:41', '2024-08-19 22:46:41', 10, 29, 57),
(511, 7, 'carreras, cadenas, rodillos para 1.6L I4 M16A', 'Descripción de carreras, cadenas, rodillos compatible con 1.6L I4 M16A', '1', 'R-1510', 'public/assets/shop/img/repuestos/correas.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:41', '2024-08-20 01:31:19', 10, 29, 57),
(512, 8, 'embrague para 1.6L I4 M16A', 'Descripción de embrague compatible con 1.6L I4 M16A', '1', 'R-1511', 'public/assets/shop/img/repuestos/embrague.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:41', '2024-08-19 22:46:41', 10, 29, 57),
(513, 9, 'rodamientos para 1.6L I4 M16A', 'Descripción de rodamientos compatible con 1.6L I4 M16A', '1', 'R-1512', 'public/assets/shop/img/repuestos/rodamientos.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:41', '2024-08-19 22:46:41', 10, 29, 57),
(514, 1, 'filtros para 2.0L I4 J20A', 'Descripción de filtros compatible con 2.0L I4 J20A', '1', 'R-1513', 'public/assets/shop/img/repuestos/filtros.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:41', '2024-08-19 22:46:41', 10, 29, 58),
(515, 2, 'frenos para 2.0L I4 J20A', 'Descripción de frenos compatible con 2.0L I4 J20A', '1', 'R-1514', 'public/assets/shop/img/repuestos/frenos.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:41', '2024-08-19 22:46:41', 10, 29, 58),
(516, 3, 'motor para 2.0L I4 J20A', 'Descripción de motor compatible con 2.0L I4 J20A', '1', 'R-1515', 'public/assets/shop/img/repuestos/motor.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:41', '2024-08-19 22:46:41', 10, 29, 58),
(517, 4, 'suspension para 2.0L I4 J20A', 'Descripción de suspension compatible con 2.0L I4 J20A', '1', 'R-1516', 'public/assets/shop/img/repuestos/suspension.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:41', '2024-08-19 22:46:41', 10, 29, 58),
(518, 5, 'amortiguadores para 2.0L I4 J20A', 'Descripción de amortiguadores compatible con 2.0L I4 J20A', '1', 'R-1517', 'public/assets/shop/img/repuestos/amortiguadores.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:41', '2024-08-19 22:46:41', 10, 29, 58),
(519, 6, 'bujias para 2.0L I4 J20A', 'Descripción de bujias compatible con 2.0L I4 J20A', '1', 'R-1518', 'public/assets/shop/img/repuestos/bujias.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:41', '2024-08-19 22:46:41', 10, 29, 58),
(520, 7, 'carreras, cadenas, rodillos para 2.0L I4 J20A', 'Descripción de carreras, cadenas, rodillos compatible con 2.0L I4 J20A', '1', 'R-1519', 'public/assets/shop/img/repuestos/correas.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:41', '2024-08-20 01:31:19', 10, 29, 58),
(521, 8, 'embrague para 2.0L I4 J20A', 'Descripción de embrague compatible con 2.0L I4 J20A', '1', 'R-1520', 'public/assets/shop/img/repuestos/embrague.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:41', '2024-08-19 22:46:41', 10, 29, 58),
(522, 9, 'rodamientos para 2.0L I4 J20A', 'Descripción de rodamientos compatible con 2.0L I4 J20A', '1', 'R-1521', 'public/assets/shop/img/repuestos/rodamientos.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:41', '2024-08-19 22:46:41', 10, 29, 58),
(523, 1, 'filtros para 2.5L I4 QR25DE', 'Descripción de filtros compatible con 2.5L I4 QR25DE', '1', 'R-1522', 'public/assets/shop/img/repuestos/filtros.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:41', '2024-08-19 22:46:41', 10, 30, 59),
(524, 2, 'frenos para 2.5L I4 QR25DE', 'Descripción de frenos compatible con 2.5L I4 QR25DE', '1', 'R-1523', 'public/assets/shop/img/repuestos/frenos.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:41', '2024-08-19 22:46:41', 10, 30, 59),
(525, 3, 'motor para 2.5L I4 QR25DE', 'Descripción de motor compatible con 2.5L I4 QR25DE', '1', 'R-1524', 'public/assets/shop/img/repuestos/motor.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:41', '2024-08-19 22:46:41', 10, 30, 59),
(526, 4, 'suspension para 2.5L I4 QR25DE', 'Descripción de suspension compatible con 2.5L I4 QR25DE', '1', 'R-1525', 'public/assets/shop/img/repuestos/suspension.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:41', '2024-08-19 22:46:41', 10, 30, 59),
(527, 5, 'amortiguadores para 2.5L I4 QR25DE', 'Descripción de amortiguadores compatible con 2.5L I4 QR25DE', '1', 'R-1526', 'public/assets/shop/img/repuestos/amortiguadores.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:41', '2024-08-19 22:46:41', 10, 30, 59),
(528, 6, 'bujias para 2.5L I4 QR25DE', 'Descripción de bujias compatible con 2.5L I4 QR25DE', '1', 'R-1527', 'public/assets/shop/img/repuestos/bujias.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:41', '2024-08-19 22:46:41', 10, 30, 59),
(529, 7, 'carreras, cadenas, rodillos para 2.5L I4 QR25DE', 'Descripción de carreras, cadenas, rodillos compatible con 2.5L I4 QR25DE', '1', 'R-1528', 'public/assets/shop/img/repuestos/correas.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:41', '2024-08-20 01:31:19', 10, 30, 59),
(530, 8, 'embrague para 2.5L I4 QR25DE', 'Descripción de embrague compatible con 2.5L I4 QR25DE', '1', 'R-1529', 'public/assets/shop/img/repuestos/embrague.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:41', '2024-08-19 22:46:41', 10, 30, 59),
(531, 9, 'rodamientos para 2.5L I4 QR25DE', 'Descripción de rodamientos compatible con 2.5L I4 QR25DE', '1', 'R-1530', 'public/assets/shop/img/repuestos/rodamientos.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:41', '2024-08-19 22:46:41', 10, 30, 59),
(532, 1, 'filtros para 3.5L V6 VQ35DE', 'Descripción de filtros compatible con 3.5L V6 VQ35DE', '1', 'R-1531', 'public/assets/shop/img/repuestos/filtros.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:41', '2024-08-19 22:46:41', 10, 30, 60),
(533, 2, 'frenos para 3.5L V6 VQ35DE', 'Descripción de frenos compatible con 3.5L V6 VQ35DE', '1', 'R-1532', 'public/assets/shop/img/repuestos/frenos.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:41', '2024-08-19 22:46:41', 10, 30, 60),
(534, 3, 'motor para 3.5L V6 VQ35DE', 'Descripción de motor compatible con 3.5L V6 VQ35DE', '1', 'R-1533', 'public/assets/shop/img/repuestos/motor.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:41', '2024-08-19 22:46:41', 10, 30, 60),
(535, 4, 'suspension para 3.5L V6 VQ35DE', 'Descripción de suspension compatible con 3.5L V6 VQ35DE', '1', 'R-1534', 'public/assets/shop/img/repuestos/suspension.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:41', '2024-08-19 22:46:41', 10, 30, 60),
(536, 5, 'amortiguadores para 3.5L V6 VQ35DE', 'Descripción de amortiguadores compatible con 3.5L V6 VQ35DE', '1', 'R-1535', 'public/assets/shop/img/repuestos/amortiguadores.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:41', '2024-08-19 22:46:41', 10, 30, 60),
(537, 6, 'bujias para 3.5L V6 VQ35DE', 'Descripción de bujias compatible con 3.5L V6 VQ35DE', '1', 'R-1536', 'public/assets/shop/img/repuestos/bujias.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:41', '2024-08-19 22:46:41', 10, 30, 60),
(538, 7, 'carreras, cadenas, rodillos para 3.5L V6 VQ35DE', 'Descripción de carreras, cadenas, rodillos compatible con 3.5L V6 VQ35DE', '1', 'R-1537', 'public/assets/shop/img/repuestos/correas.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:41', '2024-08-20 01:31:19', 10, 30, 60),
(539, 8, 'embrague para 3.5L V6 VQ35DE', 'Descripción de embrague compatible con 3.5L V6 VQ35DE', '1', 'R-1538', 'public/assets/shop/img/repuestos/embrague.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:41', '2024-08-19 22:46:41', 10, 30, 60),
(540, 9, 'rodamientos para 3.5L V6 VQ35DE', 'Descripción de rodamientos compatible con 3.5L V6 VQ35DE', '1', 'R-1539', 'public/assets/shop/img/repuestos/rodamientos.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:41', '2024-08-19 22:46:41', 10, 30, 60),
(541, 1, 'filtros para 1.8L I4 1ZZ-FE', 'Descripción de filtros compatible con 1.8L I4 1ZZ-FE', '1', 'R-1540', 'public/assets/shop/img/repuestos/filtros.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:41', '2024-08-19 22:46:41', 11, 31, 61),
(542, 2, 'frenos para 1.8L I4 1ZZ-FE', 'Descripción de frenos compatible con 1.8L I4 1ZZ-FE', '1', 'R-1541', 'public/assets/shop/img/repuestos/frenos.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:41', '2024-08-19 22:46:41', 11, 31, 61),
(543, 3, 'motor para 1.8L I4 1ZZ-FE', 'Descripción de motor compatible con 1.8L I4 1ZZ-FE', '1', 'R-1542', 'public/assets/shop/img/repuestos/motor.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:41', '2024-08-19 22:46:41', 11, 31, 61),
(544, 4, 'suspension para 1.8L I4 1ZZ-FE', 'Descripción de suspension compatible con 1.8L I4 1ZZ-FE', '1', 'R-1543', 'public/assets/shop/img/repuestos/suspension.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:41', '2024-08-19 22:46:41', 11, 31, 61),
(545, 5, 'amortiguadores para 1.8L I4 1ZZ-FE', 'Descripción de amortiguadores compatible con 1.8L I4 1ZZ-FE', '1', 'R-1544', 'public/assets/shop/img/repuestos/amortiguadores.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:41', '2024-08-19 22:46:41', 11, 31, 61),
(546, 6, 'bujias para 1.8L I4 1ZZ-FE', 'Descripción de bujias compatible con 1.8L I4 1ZZ-FE', '1', 'R-1545', 'public/assets/shop/img/repuestos/bujias.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:41', '2024-08-19 22:46:41', 11, 31, 61),
(547, 7, 'carreras, cadenas, rodillos para 1.8L I4 1ZZ-FE', 'Descripción de carreras, cadenas, rodillos compatible con 1.8L I4 1ZZ-FE', '1', 'R-1546', 'public/assets/shop/img/repuestos/correas.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:41', '2024-08-20 01:31:19', 11, 31, 61),
(548, 8, 'embrague para 1.8L I4 1ZZ-FE', 'Descripción de embrague compatible con 1.8L I4 1ZZ-FE', '1', 'R-1547', 'public/assets/shop/img/repuestos/embrague.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:41', '2024-08-19 22:46:41', 11, 31, 61),
(549, 9, 'rodamientos para 1.8L I4 1ZZ-FE', 'Descripción de rodamientos compatible con 1.8L I4 1ZZ-FE', '1', 'R-1548', 'public/assets/shop/img/repuestos/rodamientos.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:41', '2024-08-19 22:46:41', 11, 31, 61),
(550, 1, 'filtros para 2.0L I4 3ZR-FE', 'Descripción de filtros compatible con 2.0L I4 3ZR-FE', '1', 'R-1549', 'public/assets/shop/img/repuestos/filtros.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:41', '2024-08-19 22:46:41', 11, 31, 62),
(551, 2, 'frenos para 2.0L I4 3ZR-FE', 'Descripción de frenos compatible con 2.0L I4 3ZR-FE', '1', 'R-1550', 'public/assets/shop/img/repuestos/frenos.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:41', '2024-08-19 22:46:41', 11, 31, 62),
(552, 3, 'motor para 2.0L I4 3ZR-FE', 'Descripción de motor compatible con 2.0L I4 3ZR-FE', '1', 'R-1551', 'public/assets/shop/img/repuestos/motor.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:41', '2024-08-19 22:46:41', 11, 31, 62),
(553, 4, 'suspension para 2.0L I4 3ZR-FE', 'Descripción de suspension compatible con 2.0L I4 3ZR-FE', '1', 'R-1552', 'public/assets/shop/img/repuestos/suspension.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:41', '2024-08-19 22:46:41', 11, 31, 62),
(554, 5, 'amortiguadores para 2.0L I4 3ZR-FE', 'Descripción de amortiguadores compatible con 2.0L I4 3ZR-FE', '1', 'R-1553', 'public/assets/shop/img/repuestos/amortiguadores.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:41', '2024-08-19 22:46:41', 11, 31, 62),
(555, 6, 'bujias para 2.0L I4 3ZR-FE', 'Descripción de bujias compatible con 2.0L I4 3ZR-FE', '1', 'R-1554', 'public/assets/shop/img/repuestos/bujias.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:41', '2024-08-19 22:46:41', 11, 31, 62),
(556, 7, 'carreras, cadenas, rodillos para 2.0L I4 3ZR-FE', 'Descripción de carreras, cadenas, rodillos compatible con 2.0L I4 3ZR-FE', '1', 'R-1555', 'public/assets/shop/img/repuestos/correas.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:41', '2024-08-20 01:31:19', 11, 31, 62),
(557, 8, 'embrague para 2.0L I4 3ZR-FE', 'Descripción de embrague compatible con 2.0L I4 3ZR-FE', '1', 'R-1556', 'public/assets/shop/img/repuestos/embrague.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:41', '2024-08-19 22:46:41', 11, 31, 62),
(558, 9, 'rodamientos para 2.0L I4 3ZR-FE', 'Descripción de rodamientos compatible con 2.0L I4 3ZR-FE', '1', 'R-1557', 'public/assets/shop/img/repuestos/rodamientos.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:41', '2024-08-19 22:46:41', 11, 31, 62),
(559, 1, 'filtros para 1.6L I4 HR16DE', 'Descripción de filtros compatible con 1.6L I4 HR16DE', '1', 'R-1558', 'public/assets/shop/img/repuestos/filtros.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:41', '2024-08-19 22:46:41', 11, 32, 63),
(560, 2, 'frenos para 1.6L I4 HR16DE', 'Descripción de frenos compatible con 1.6L I4 HR16DE', '1', 'R-1559', 'public/assets/shop/img/repuestos/frenos.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:41', '2024-08-19 22:46:41', 11, 32, 63),
(561, 3, 'motor para 1.6L I4 HR16DE', 'Descripción de motor compatible con 1.6L I4 HR16DE', '1', 'R-1560', 'public/assets/shop/img/repuestos/motor.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:41', '2024-08-19 22:46:41', 11, 32, 63),
(562, 4, 'suspension para 1.6L I4 HR16DE', 'Descripción de suspension compatible con 1.6L I4 HR16DE', '1', 'R-1561', 'public/assets/shop/img/repuestos/suspension.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:41', '2024-08-19 22:46:41', 11, 32, 63),
(563, 5, 'amortiguadores para 1.6L I4 HR16DE', 'Descripción de amortiguadores compatible con 1.6L I4 HR16DE', '1', 'R-1562', 'public/assets/shop/img/repuestos/amortiguadores.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:41', '2024-08-19 22:46:41', 11, 32, 63),
(564, 6, 'bujias para 1.6L I4 HR16DE', 'Descripción de bujias compatible con 1.6L I4 HR16DE', '1', 'R-1563', 'public/assets/shop/img/repuestos/bujias.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:41', '2024-08-19 22:46:41', 11, 32, 63),
(565, 7, 'carreras, cadenas, rodillos para 1.6L I4 HR16DE', 'Descripción de carreras, cadenas, rodillos compatible con 1.6L I4 HR16DE', '1', 'R-1564', 'public/assets/shop/img/repuestos/correas.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:41', '2024-08-20 01:31:19', 11, 32, 63),
(566, 8, 'embrague para 1.6L I4 HR16DE', 'Descripción de embrague compatible con 1.6L I4 HR16DE', '1', 'R-1565', 'public/assets/shop/img/repuestos/embrague.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:41', '2024-08-19 22:46:41', 11, 32, 63),
(567, 9, 'rodamientos para 1.6L I4 HR16DE', 'Descripción de rodamientos compatible con 1.6L I4 HR16DE', '1', 'R-1566', 'public/assets/shop/img/repuestos/rodamientos.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:41', '2024-08-19 22:46:41', 11, 32, 63),
(568, 1, 'filtros para 2.0L I4 MR20DE', 'Descripción de filtros compatible con 2.0L I4 MR20DE', '1', 'R-1567', 'public/assets/shop/img/repuestos/filtros.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:41', '2024-08-19 22:46:41', 11, 32, 64),
(569, 2, 'frenos para 2.0L I4 MR20DE', 'Descripción de frenos compatible con 2.0L I4 MR20DE', '1', 'R-1568', 'public/assets/shop/img/repuestos/frenos.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:41', '2024-08-19 22:46:41', 11, 32, 64),
(570, 3, 'motor para 2.0L I4 MR20DE', 'Descripción de motor compatible con 2.0L I4 MR20DE', '1', 'R-1569', 'public/assets/shop/img/repuestos/motor.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:41', '2024-08-19 22:46:41', 11, 32, 64),
(571, 4, 'suspension para 2.0L I4 MR20DE', 'Descripción de suspension compatible con 2.0L I4 MR20DE', '1', 'R-1570', 'public/assets/shop/img/repuestos/suspension.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:41', '2024-08-19 22:46:41', 11, 32, 64),
(572, 5, 'amortiguadores para 2.0L I4 MR20DE', 'Descripción de amortiguadores compatible con 2.0L I4 MR20DE', '1', 'R-1571', 'public/assets/shop/img/repuestos/amortiguadores.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:41', '2024-08-19 22:46:41', 11, 32, 64),
(573, 6, 'bujias para 2.0L I4 MR20DE', 'Descripción de bujias compatible con 2.0L I4 MR20DE', '1', 'R-1572', 'public/assets/shop/img/repuestos/bujias.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:41', '2024-08-19 22:46:41', 11, 32, 64),
(574, 7, 'carreras, cadenas, rodillos para 2.0L I4 MR20DE', 'Descripción de carreras, cadenas, rodillos compatible con 2.0L I4 MR20DE', '1', 'R-1573', 'public/assets/shop/img/repuestos/correas.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:41', '2024-08-20 01:31:19', 11, 32, 64),
(575, 8, 'embrague para 2.0L I4 MR20DE', 'Descripción de embrague compatible con 2.0L I4 MR20DE', '1', 'R-1574', 'public/assets/shop/img/repuestos/embrague.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:41', '2024-08-19 22:46:41', 11, 32, 64),
(576, 9, 'rodamientos para 2.0L I4 MR20DE', 'Descripción de rodamientos compatible con 2.0L I4 MR20DE', '1', 'R-1575', 'public/assets/shop/img/repuestos/rodamientos.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:41', '2024-08-19 22:46:41', 11, 32, 64);
INSERT INTO `repuestos` (`id_repuesto`, `id_categoria`, `nombre_repuesto`, `descripcion_repuesto`, `oem_repuesto`, `codigo_tienda_repuesto`, `img_repuesto`, `stock_repuesto`, `precio_repuesto`, `fabricante_repuesto`, `venta_repuesto`, `peso_repuesto`, `estado_repuesto`, `date_created_repuesto`, `date_updated_repuesto`, `id_marca`, `id_modelo`, `id_motor`) VALUES
(577, 1, 'filtros para 2.0L I4 FB20', 'Descripción de filtros compatible con 2.0L I4 FB20', '1', 'R-1576', 'public/assets/shop/img/repuestos/filtros.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:41', '2024-08-19 22:46:41', 11, 33, 65),
(578, 2, 'frenos para 2.0L I4 FB20', 'Descripción de frenos compatible con 2.0L I4 FB20', '1', 'R-1577', 'public/assets/shop/img/repuestos/frenos.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:41', '2024-08-19 22:46:41', 11, 33, 65),
(579, 3, 'motor para 2.0L I4 FB20', 'Descripción de motor compatible con 2.0L I4 FB20', '1', 'R-1578', 'public/assets/shop/img/repuestos/motor.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:41', '2024-08-19 22:46:41', 11, 33, 65),
(580, 4, 'suspension para 2.0L I4 FB20', 'Descripción de suspension compatible con 2.0L I4 FB20', '1', 'R-1579', 'public/assets/shop/img/repuestos/suspension.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:41', '2024-08-19 22:46:41', 11, 33, 65),
(581, 5, 'amortiguadores para 2.0L I4 FB20', 'Descripción de amortiguadores compatible con 2.0L I4 FB20', '1', 'R-1580', 'public/assets/shop/img/repuestos/amortiguadores.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:41', '2024-08-19 22:46:41', 11, 33, 65),
(582, 6, 'bujias para 2.0L I4 FB20', 'Descripción de bujias compatible con 2.0L I4 FB20', '1', 'R-1581', 'public/assets/shop/img/repuestos/bujias.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:41', '2024-08-19 22:46:41', 11, 33, 65),
(583, 7, 'carreras, cadenas, rodillos para 2.0L I4 FB20', 'Descripción de carreras, cadenas, rodillos compatible con 2.0L I4 FB20', '1', 'R-1582', 'public/assets/shop/img/repuestos/correas.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:41', '2024-08-20 01:31:19', 11, 33, 65),
(584, 8, 'embrague para 2.0L I4 FB20', 'Descripción de embrague compatible con 2.0L I4 FB20', '1', 'R-1583', 'public/assets/shop/img/repuestos/embrague.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:41', '2024-08-19 22:46:41', 11, 33, 65),
(585, 9, 'rodamientos para 2.0L I4 FB20', 'Descripción de rodamientos compatible con 2.0L I4 FB20', '1', 'R-1584', 'public/assets/shop/img/repuestos/rodamientos.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:41', '2024-08-19 22:46:41', 11, 33, 65),
(586, 1, 'filtros para 2.5L H4 EJ25', 'Descripción de filtros compatible con 2.5L H4 EJ25', '1', 'R-1585', 'public/assets/shop/img/repuestos/filtros.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:41', '2024-08-19 22:46:41', 11, 33, 66),
(587, 2, 'frenos para 2.5L H4 EJ25', 'Descripción de frenos compatible con 2.5L H4 EJ25', '1', 'R-1586', 'public/assets/shop/img/repuestos/frenos.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:41', '2024-08-19 22:46:41', 11, 33, 66),
(588, 3, 'motor para 2.5L H4 EJ25', 'Descripción de motor compatible con 2.5L H4 EJ25', '1', 'R-1587', 'public/assets/shop/img/repuestos/motor.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:41', '2024-08-19 22:46:41', 11, 33, 66),
(589, 4, 'suspension para 2.5L H4 EJ25', 'Descripción de suspension compatible con 2.5L H4 EJ25', '1', 'R-1588', 'public/assets/shop/img/repuestos/suspension.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:41', '2024-08-19 22:46:41', 11, 33, 66),
(590, 5, 'amortiguadores para 2.5L H4 EJ25', 'Descripción de amortiguadores compatible con 2.5L H4 EJ25', '1', 'R-1589', 'public/assets/shop/img/repuestos/amortiguadores.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:41', '2024-08-19 22:46:41', 11, 33, 66),
(591, 6, 'bujias para 2.5L H4 EJ25', 'Descripción de bujias compatible con 2.5L H4 EJ25', '1', 'R-1590', 'public/assets/shop/img/repuestos/bujias.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:41', '2024-08-19 22:46:41', 11, 33, 66),
(592, 7, 'carreras, cadenas, rodillos para 2.5L H4 EJ25', 'Descripción de carreras, cadenas, rodillos compatible con 2.5L H4 EJ25', '1', 'R-1591', 'public/assets/shop/img/repuestos/correas.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:41', '2024-08-20 01:31:19', 11, 33, 66),
(593, 8, 'embrague para 2.5L H4 EJ25', 'Descripción de embrague compatible con 2.5L H4 EJ25', '1', 'R-1592', 'public/assets/shop/img/repuestos/embrague.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:41', '2024-08-19 22:46:41', 11, 33, 66),
(594, 9, 'rodamientos para 2.5L H4 EJ25', 'Descripción de rodamientos compatible con 2.5L H4 EJ25', '1', 'R-1593', 'public/assets/shop/img/repuestos/rodamientos.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:41', '2024-08-19 22:46:41', 11, 33, 66),
(595, 1, 'filtros para 1.4L I4 K14C', 'Descripción de filtros compatible con 1.4L I4 K14C', '1', 'R-1594', 'public/assets/shop/img/repuestos/filtros.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:41', '2024-08-19 22:46:41', 12, 34, 67),
(596, 2, 'frenos para 1.4L I4 K14C', 'Descripción de frenos compatible con 1.4L I4 K14C', '1', 'R-1595', 'public/assets/shop/img/repuestos/frenos.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:41', '2024-08-19 22:46:41', 12, 34, 67),
(597, 3, 'motor para 1.4L I4 K14C', 'Descripción de motor compatible con 1.4L I4 K14C', '1', 'R-1596', 'public/assets/shop/img/repuestos/motor.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:41', '2024-08-19 22:46:41', 12, 34, 67),
(598, 4, 'suspension para 1.4L I4 K14C', 'Descripción de suspension compatible con 1.4L I4 K14C', '1', 'R-1597', 'public/assets/shop/img/repuestos/suspension.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:41', '2024-08-19 22:46:41', 12, 34, 67),
(599, 5, 'amortiguadores para 1.4L I4 K14C', 'Descripción de amortiguadores compatible con 1.4L I4 K14C', '1', 'R-1598', 'public/assets/shop/img/repuestos/amortiguadores.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:41', '2024-08-19 22:46:41', 12, 34, 67),
(600, 6, 'bujias para 1.4L I4 K14C', 'Descripción de bujias compatible con 1.4L I4 K14C', '1', 'R-1599', 'public/assets/shop/img/repuestos/bujias.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:41', '2024-08-19 22:46:41', 12, 34, 67),
(601, 7, 'carreras, cadenas, rodillos para 1.4L I4 K14C', 'Descripción de carreras, cadenas, rodillos compatible con 1.4L I4 K14C', '1', 'R-1600', 'public/assets/shop/img/repuestos/correas.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:41', '2024-08-20 01:31:19', 12, 34, 67),
(602, 8, 'embrague para 1.4L I4 K14C', 'Descripción de embrague compatible con 1.4L I4 K14C', '1', 'R-1601', 'public/assets/shop/img/repuestos/embrague.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:41', '2024-08-19 22:46:41', 12, 34, 67),
(603, 9, 'rodamientos para 1.4L I4 K14C', 'Descripción de rodamientos compatible con 1.4L I4 K14C', '1', 'R-1602', 'public/assets/shop/img/repuestos/rodamientos.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:41', '2024-08-19 22:46:41', 12, 34, 67),
(604, 1, 'filtros para 1.6L I4 M16A', 'Descripción de filtros compatible con 1.6L I4 M16A', '1', 'R-1603', 'public/assets/shop/img/repuestos/filtros.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:41', '2024-08-19 22:46:41', 12, 34, 68),
(605, 2, 'frenos para 1.6L I4 M16A', 'Descripción de frenos compatible con 1.6L I4 M16A', '1', 'R-1604', 'public/assets/shop/img/repuestos/frenos.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:41', '2024-08-19 22:46:41', 12, 34, 68),
(606, 3, 'motor para 1.6L I4 M16A', 'Descripción de motor compatible con 1.6L I4 M16A', '1', 'R-1605', 'public/assets/shop/img/repuestos/motor.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:41', '2024-08-19 22:46:41', 12, 34, 68),
(607, 4, 'suspension para 1.6L I4 M16A', 'Descripción de suspension compatible con 1.6L I4 M16A', '1', 'R-1606', 'public/assets/shop/img/repuestos/suspension.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:41', '2024-08-19 22:46:41', 12, 34, 68),
(608, 5, 'amortiguadores para 1.6L I4 M16A', 'Descripción de amortiguadores compatible con 1.6L I4 M16A', '1', 'R-1607', 'public/assets/shop/img/repuestos/amortiguadores.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:41', '2024-08-19 22:46:41', 12, 34, 68),
(609, 6, 'bujias para 1.6L I4 M16A', 'Descripción de bujias compatible con 1.6L I4 M16A', '1', 'R-1608', 'public/assets/shop/img/repuestos/bujias.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:41', '2024-08-19 22:46:41', 12, 34, 68),
(610, 7, 'carreras, cadenas, rodillos para 1.6L I4 M16A', 'Descripción de carreras, cadenas, rodillos compatible con 1.6L I4 M16A', '1', 'R-1609', 'public/assets/shop/img/repuestos/correas.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:41', '2024-08-20 01:31:19', 12, 34, 68),
(611, 8, 'embrague para 1.6L I4 M16A', 'Descripción de embrague compatible con 1.6L I4 M16A', '1', 'R-1610', 'public/assets/shop/img/repuestos/embrague.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:41', '2024-08-19 22:46:41', 12, 34, 68),
(612, 9, 'rodamientos para 1.6L I4 M16A', 'Descripción de rodamientos compatible con 1.6L I4 M16A', '1', 'R-1611', 'public/assets/shop/img/repuestos/rodamientos.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:41', '2024-08-19 22:46:41', 12, 34, 68),
(613, 1, 'filtros para 2.0L I4 MZR LF-VE', 'Descripción de filtros compatible con 2.0L I4 MZR LF-VE', '1', 'R-1612', 'public/assets/shop/img/repuestos/filtros.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:41', '2024-08-19 22:46:41', 12, 35, 69),
(614, 2, 'frenos para 2.0L I4 MZR LF-VE', 'Descripción de frenos compatible con 2.0L I4 MZR LF-VE', '1', 'R-1613', 'public/assets/shop/img/repuestos/frenos.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:41', '2024-08-19 22:46:41', 12, 35, 69),
(615, 3, 'motor para 2.0L I4 MZR LF-VE', 'Descripción de motor compatible con 2.0L I4 MZR LF-VE', '1', 'R-1614', 'public/assets/shop/img/repuestos/motor.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:41', '2024-08-19 22:46:41', 12, 35, 69),
(616, 4, 'suspension para 2.0L I4 MZR LF-VE', 'Descripción de suspension compatible con 2.0L I4 MZR LF-VE', '1', 'R-1615', 'public/assets/shop/img/repuestos/suspension.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:41', '2024-08-19 22:46:41', 12, 35, 69),
(617, 5, 'amortiguadores para 2.0L I4 MZR LF-VE', 'Descripción de amortiguadores compatible con 2.0L I4 MZR LF-VE', '1', 'R-1616', 'public/assets/shop/img/repuestos/amortiguadores.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:41', '2024-08-19 22:46:41', 12, 35, 69),
(618, 6, 'bujias para 2.0L I4 MZR LF-VE', 'Descripción de bujias compatible con 2.0L I4 MZR LF-VE', '1', 'R-1617', 'public/assets/shop/img/repuestos/bujias.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:41', '2024-08-19 22:46:41', 12, 35, 69),
(619, 7, 'carreras, cadenas, rodillos para 2.0L I4 MZR LF-VE', 'Descripción de carreras, cadenas, rodillos compatible con 2.0L I4 MZR LF-VE', '1', 'R-1618', 'public/assets/shop/img/repuestos/correas.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:41', '2024-08-20 01:31:19', 12, 35, 69),
(620, 8, 'embrague para 2.0L I4 MZR LF-VE', 'Descripción de embrague compatible con 2.0L I4 MZR LF-VE', '1', 'R-1619', 'public/assets/shop/img/repuestos/embrague.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:41', '2024-08-19 22:46:41', 12, 35, 69),
(621, 9, 'rodamientos para 2.0L I4 MZR LF-VE', 'Descripción de rodamientos compatible con 2.0L I4 MZR LF-VE', '1', 'R-1620', 'public/assets/shop/img/repuestos/rodamientos.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:41', '2024-08-19 22:46:41', 12, 35, 69),
(622, 1, 'filtros para 2.5L I4 MZR L5-VE', 'Descripción de filtros compatible con 2.5L I4 MZR L5-VE', '1', 'R-1621', 'public/assets/shop/img/repuestos/filtros.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:41', '2024-08-19 22:46:41', 12, 35, 70),
(623, 2, 'frenos para 2.5L I4 MZR L5-VE', 'Descripción de frenos compatible con 2.5L I4 MZR L5-VE', '1', 'R-1622', 'public/assets/shop/img/repuestos/frenos.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:41', '2024-08-19 22:46:41', 12, 35, 70),
(624, 3, 'motor para 2.5L I4 MZR L5-VE', 'Descripción de motor compatible con 2.5L I4 MZR L5-VE', '1', 'R-1623', 'public/assets/shop/img/repuestos/motor.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:41', '2024-08-19 22:46:41', 12, 35, 70),
(625, 4, 'suspension para 2.5L I4 MZR L5-VE', 'Descripción de suspension compatible con 2.5L I4 MZR L5-VE', '1', 'R-1624', 'public/assets/shop/img/repuestos/suspension.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:41', '2024-08-19 22:46:41', 12, 35, 70),
(626, 5, 'amortiguadores para 2.5L I4 MZR L5-VE', 'Descripción de amortiguadores compatible con 2.5L I4 MZR L5-VE', '1', 'R-1625', 'public/assets/shop/img/repuestos/amortiguadores.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:41', '2024-08-19 22:46:41', 12, 35, 70),
(627, 6, 'bujias para 2.5L I4 MZR L5-VE', 'Descripción de bujias compatible con 2.5L I4 MZR L5-VE', '1', 'R-1626', 'public/assets/shop/img/repuestos/bujias.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:41', '2024-08-19 22:46:41', 12, 35, 70),
(628, 7, 'carreras, cadenas, rodillos para 2.5L I4 MZR L5-VE', 'Descripción de carreras, cadenas, rodillos compatible con 2.5L I4 MZR L5-VE', '1', 'R-1627', 'public/assets/shop/img/repuestos/correas.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:41', '2024-08-20 01:31:19', 12, 35, 70),
(629, 8, 'embrague para 2.5L I4 MZR L5-VE', 'Descripción de embrague compatible con 2.5L I4 MZR L5-VE', '1', 'R-1628', 'public/assets/shop/img/repuestos/embrague.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:41', '2024-08-19 22:46:41', 12, 35, 70),
(630, 9, 'rodamientos para 2.5L I4 MZR L5-VE', 'Descripción de rodamientos compatible con 2.5L I4 MZR L5-VE', '1', 'R-1629', 'public/assets/shop/img/repuestos/rodamientos.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:41', '2024-08-19 22:46:41', 12, 35, 70),
(631, 1, 'filtros para 1.5L I4 L15A7', 'Descripción de filtros compatible con 1.5L I4 L15A7', '1', 'R-1630', 'public/assets/shop/img/repuestos/filtros.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:41', '2024-08-19 22:46:41', 12, 36, 71),
(632, 2, 'frenos para 1.5L I4 L15A7', 'Descripción de frenos compatible con 1.5L I4 L15A7', '1', 'R-1631', 'public/assets/shop/img/repuestos/frenos.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:41', '2024-08-19 22:46:41', 12, 36, 71),
(633, 3, 'motor para 1.5L I4 L15A7', 'Descripción de motor compatible con 1.5L I4 L15A7', '1', 'R-1632', 'public/assets/shop/img/repuestos/motor.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:41', '2024-08-19 22:46:41', 12, 36, 71),
(634, 4, 'suspension para 1.5L I4 L15A7', 'Descripción de suspension compatible con 1.5L I4 L15A7', '1', 'R-1633', 'public/assets/shop/img/repuestos/suspension.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:41', '2024-08-19 22:46:41', 12, 36, 71),
(635, 5, 'amortiguadores para 1.5L I4 L15A7', 'Descripción de amortiguadores compatible con 1.5L I4 L15A7', '1', 'R-1634', 'public/assets/shop/img/repuestos/amortiguadores.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:41', '2024-08-19 22:46:41', 12, 36, 71),
(636, 6, 'bujias para 1.5L I4 L15A7', 'Descripción de bujias compatible con 1.5L I4 L15A7', '1', 'R-1635', 'public/assets/shop/img/repuestos/bujias.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:41', '2024-08-19 22:46:41', 12, 36, 71),
(637, 7, 'carreras, cadenas, rodillos para 1.5L I4 L15A7', 'Descripción de carreras, cadenas, rodillos compatible con 1.5L I4 L15A7', '1', 'R-1636', 'public/assets/shop/img/repuestos/correas.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:41', '2024-08-20 01:31:19', 12, 36, 71),
(638, 8, 'embrague para 1.5L I4 L15A7', 'Descripción de embrague compatible con 1.5L I4 L15A7', '1', 'R-1637', 'public/assets/shop/img/repuestos/embrague.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:41', '2024-08-19 22:46:41', 12, 36, 71),
(639, 9, 'rodamientos para 1.5L I4 L15A7', 'Descripción de rodamientos compatible con 1.5L I4 L15A7', '1', 'R-1638', 'public/assets/shop/img/repuestos/rodamientos.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:41', '2024-08-19 22:46:41', 12, 36, 71),
(640, 1, 'filtros para 1.8L I4 R18A1', 'Descripción de filtros compatible con 1.8L I4 R18A1', '1', 'R-1639', 'public/assets/shop/img/repuestos/filtros.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:41', '2024-08-19 22:46:41', 12, 36, 72),
(641, 2, 'frenos para 1.8L I4 R18A1', 'Descripción de frenos compatible con 1.8L I4 R18A1', '1', 'R-1640', 'public/assets/shop/img/repuestos/frenos.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:41', '2024-08-19 22:46:41', 12, 36, 72),
(642, 3, 'motor para 1.8L I4 R18A1', 'Descripción de motor compatible con 1.8L I4 R18A1', '1', 'R-1641', 'public/assets/shop/img/repuestos/motor.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:41', '2024-08-19 22:46:41', 12, 36, 72),
(643, 4, 'suspension para 1.8L I4 R18A1', 'Descripción de suspension compatible con 1.8L I4 R18A1', '1', 'R-1642', 'public/assets/shop/img/repuestos/suspension.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:41', '2024-08-19 22:46:41', 12, 36, 72),
(644, 5, 'amortiguadores para 1.8L I4 R18A1', 'Descripción de amortiguadores compatible con 1.8L I4 R18A1', '1', 'R-1643', 'public/assets/shop/img/repuestos/amortiguadores.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:41', '2024-08-19 22:46:41', 12, 36, 72),
(645, 6, 'bujias para 1.8L I4 R18A1', 'Descripción de bujias compatible con 1.8L I4 R18A1', '1', 'R-1644', 'public/assets/shop/img/repuestos/bujias.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:41', '2024-08-19 22:46:41', 12, 36, 72),
(646, 7, 'carreras, cadenas, rodillos para 1.8L I4 R18A1', 'Descripción de carreras, cadenas, rodillos compatible con 1.8L I4 R18A1', '1', 'R-1645', 'public/assets/shop/img/repuestos/correas.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:41', '2024-08-20 01:31:19', 12, 36, 72),
(647, 8, 'embrague para 1.8L I4 R18A1', 'Descripción de embrague compatible con 1.8L I4 R18A1', '1', 'R-1646', 'public/assets/shop/img/repuestos/embrague.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:41', '2024-08-19 22:46:41', 12, 36, 72),
(648, 9, 'rodamientos para 1.8L I4 R18A1', 'Descripción de rodamientos compatible con 1.8L I4 R18A1', '1', 'R-1647', 'public/assets/shop/img/repuestos/rodamientos.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:41', '2024-08-19 22:46:41', 12, 36, 72),
(649, 1, 'filtros para 2.0L I4 16V TDI', 'Descripción de filtros compatible con 2.0L I4 16V TDI', '1', 'R-1648', 'public/assets/shop/img/repuestos/filtros.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:41', '2024-08-19 22:46:41', 14, 37, 73),
(650, 2, 'frenos para 2.0L I4 16V TDI', 'Descripción de frenos compatible con 2.0L I4 16V TDI', '1', 'R-1649', 'public/assets/shop/img/repuestos/frenos.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:41', '2024-08-19 22:46:41', 14, 37, 73),
(651, 3, 'motor para 2.0L I4 16V TDI', 'Descripción de motor compatible con 2.0L I4 16V TDI', '1', 'R-1650', 'public/assets/shop/img/repuestos/motor.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:41', '2024-08-19 22:46:41', 14, 37, 73),
(652, 4, 'suspension para 2.0L I4 16V TDI', 'Descripción de suspension compatible con 2.0L I4 16V TDI', '1', 'R-1651', 'public/assets/shop/img/repuestos/suspension.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:41', '2024-08-19 22:46:41', 14, 37, 73),
(653, 5, 'amortiguadores para 2.0L I4 16V TDI', 'Descripción de amortiguadores compatible con 2.0L I4 16V TDI', '1', 'R-1652', 'public/assets/shop/img/repuestos/amortiguadores.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:41', '2024-08-19 22:46:41', 14, 37, 73),
(654, 6, 'bujias para 2.0L I4 16V TDI', 'Descripción de bujias compatible con 2.0L I4 16V TDI', '1', 'R-1653', 'public/assets/shop/img/repuestos/bujias.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:41', '2024-08-19 22:46:41', 14, 37, 73),
(655, 7, 'carreras, cadenas, rodillos para 2.0L I4 16V TDI', 'Descripción de carreras, cadenas, rodillos compatible con 2.0L I4 16V TDI', '1', 'R-1654', 'public/assets/shop/img/repuestos/correas.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:41', '2024-08-20 01:31:19', 14, 37, 73),
(656, 8, 'embrague para 2.0L I4 16V TDI', 'Descripción de embrague compatible con 2.0L I4 16V TDI', '1', 'R-1655', 'public/assets/shop/img/repuestos/embrague.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:41', '2024-08-19 22:46:41', 14, 37, 73),
(657, 9, 'rodamientos para 2.0L I4 16V TDI', 'Descripción de rodamientos compatible con 2.0L I4 16V TDI', '1', 'R-1656', 'public/assets/shop/img/repuestos/rodamientos.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:41', '2024-08-19 22:46:41', 14, 37, 73),
(658, 1, 'filtros para 2.0L I4 16V TDI CR', 'Descripción de filtros compatible con 2.0L I4 16V TDI CR', '1', 'R-1657', 'public/assets/shop/img/repuestos/filtros.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:41', '2024-08-19 22:46:41', 14, 37, 74),
(659, 2, 'frenos para 2.0L I4 16V TDI CR', 'Descripción de frenos compatible con 2.0L I4 16V TDI CR', '1', 'R-1658', 'public/assets/shop/img/repuestos/frenos.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:41', '2024-08-19 22:46:41', 14, 37, 74),
(660, 3, 'motor para 2.0L I4 16V TDI CR', 'Descripción de motor compatible con 2.0L I4 16V TDI CR', '1', 'R-1659', 'public/assets/shop/img/repuestos/motor.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:41', '2024-08-19 22:46:41', 14, 37, 74),
(661, 4, 'suspension para 2.0L I4 16V TDI CR', 'Descripción de suspension compatible con 2.0L I4 16V TDI CR', '1', 'R-1660', 'public/assets/shop/img/repuestos/suspension.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:41', '2024-08-19 22:46:41', 14, 37, 74),
(662, 5, 'amortiguadores para 2.0L I4 16V TDI CR', 'Descripción de amortiguadores compatible con 2.0L I4 16V TDI CR', '1', 'R-1661', 'public/assets/shop/img/repuestos/amortiguadores.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:41', '2024-08-19 22:46:41', 14, 37, 74),
(663, 6, 'bujias para 2.0L I4 16V TDI CR', 'Descripción de bujias compatible con 2.0L I4 16V TDI CR', '1', 'R-1662', 'public/assets/shop/img/repuestos/bujias.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:41', '2024-08-19 22:46:41', 14, 37, 74),
(664, 7, 'carreras, cadenas, rodillos para 2.0L I4 16V TDI CR', 'Descripción de carreras, cadenas, rodillos compatible con 2.0L I4 16V TDI CR', '1', 'R-1663', 'public/assets/shop/img/repuestos/correas.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:41', '2024-08-20 01:31:19', 14, 37, 74),
(665, 8, 'embrague para 2.0L I4 16V TDI CR', 'Descripción de embrague compatible con 2.0L I4 16V TDI CR', '1', 'R-1664', 'public/assets/shop/img/repuestos/embrague.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:41', '2024-08-19 22:46:41', 14, 37, 74),
(666, 9, 'rodamientos para 2.0L I4 16V TDI CR', 'Descripción de rodamientos compatible con 2.0L I4 16V TDI CR', '1', 'R-1665', 'public/assets/shop/img/repuestos/rodamientos.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:41', '2024-08-19 22:46:41', 14, 37, 74),
(667, 1, 'filtros para 1.6L I4 B16A2', 'Descripción de filtros compatible con 1.6L I4 B16A2', '1', 'R-1666', 'public/assets/shop/img/repuestos/filtros.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:41', '2024-08-19 22:46:41', 14, 38, 75),
(668, 2, 'frenos para 1.6L I4 B16A2', 'Descripción de frenos compatible con 1.6L I4 B16A2', '1', 'R-1667', 'public/assets/shop/img/repuestos/frenos.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:41', '2024-08-19 22:46:41', 14, 38, 75),
(669, 3, 'motor para 1.6L I4 B16A2', 'Descripción de motor compatible con 1.6L I4 B16A2', '1', 'R-1668', 'public/assets/shop/img/repuestos/motor.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:41', '2024-08-19 22:46:41', 14, 38, 75),
(670, 4, 'suspension para 1.6L I4 B16A2', 'Descripción de suspension compatible con 1.6L I4 B16A2', '1', 'R-1669', 'public/assets/shop/img/repuestos/suspension.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:41', '2024-08-19 22:46:41', 14, 38, 75),
(671, 5, 'amortiguadores para 1.6L I4 B16A2', 'Descripción de amortiguadores compatible con 1.6L I4 B16A2', '1', 'R-1670', 'public/assets/shop/img/repuestos/amortiguadores.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:41', '2024-08-19 22:46:41', 14, 38, 75),
(672, 6, 'bujias para 1.6L I4 B16A2', 'Descripción de bujias compatible con 1.6L I4 B16A2', '1', 'R-1671', 'public/assets/shop/img/repuestos/bujias.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:41', '2024-08-19 22:46:41', 14, 38, 75),
(673, 7, 'carreras, cadenas, rodillos para 1.6L I4 B16A2', 'Descripción de carreras, cadenas, rodillos compatible con 1.6L I4 B16A2', '1', 'R-1672', 'public/assets/shop/img/repuestos/correas.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:41', '2024-08-20 01:31:19', 14, 38, 75),
(674, 8, 'embrague para 1.6L I4 B16A2', 'Descripción de embrague compatible con 1.6L I4 B16A2', '1', 'R-1673', 'public/assets/shop/img/repuestos/embrague.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:41', '2024-08-19 22:46:41', 14, 38, 75),
(675, 9, 'rodamientos para 1.6L I4 B16A2', 'Descripción de rodamientos compatible con 1.6L I4 B16A2', '1', 'R-1674', 'public/assets/shop/img/repuestos/rodamientos.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:41', '2024-08-19 22:46:41', 14, 38, 75),
(676, 1, 'filtros para 1.8L I4 B18C', 'Descripción de filtros compatible con 1.8L I4 B18C', '1', 'R-1675', 'public/assets/shop/img/repuestos/filtros.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:41', '2024-08-19 22:46:41', 14, 38, 76),
(677, 2, 'frenos para 1.8L I4 B18C', 'Descripción de frenos compatible con 1.8L I4 B18C', '1', 'R-1676', 'public/assets/shop/img/repuestos/frenos.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:41', '2024-08-19 22:46:41', 14, 38, 76),
(678, 3, 'motor para 1.8L I4 B18C', 'Descripción de motor compatible con 1.8L I4 B18C', '1', 'R-1677', 'public/assets/shop/img/repuestos/motor.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:41', '2024-08-19 22:46:41', 14, 38, 76),
(679, 4, 'suspension para 1.8L I4 B18C', 'Descripción de suspension compatible con 1.8L I4 B18C', '1', 'R-1678', 'public/assets/shop/img/repuestos/suspension.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:41', '2024-08-19 22:46:41', 14, 38, 76),
(680, 5, 'amortiguadores para 1.8L I4 B18C', 'Descripción de amortiguadores compatible con 1.8L I4 B18C', '1', 'R-1679', 'public/assets/shop/img/repuestos/amortiguadores.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:41', '2024-08-19 22:46:41', 14, 38, 76),
(681, 6, 'bujias para 1.8L I4 B18C', 'Descripción de bujias compatible con 1.8L I4 B18C', '1', 'R-1680', 'public/assets/shop/img/repuestos/bujias.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:41', '2024-08-19 22:46:41', 14, 38, 76),
(682, 7, 'carreras, cadenas, rodillos para 1.8L I4 B18C', 'Descripción de carreras, cadenas, rodillos compatible con 1.8L I4 B18C', '1', 'R-1681', 'public/assets/shop/img/repuestos/correas.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:41', '2024-08-20 01:31:19', 14, 38, 76),
(683, 8, 'embrague para 1.8L I4 B18C', 'Descripción de embrague compatible con 1.8L I4 B18C', '1', 'R-1682', 'public/assets/shop/img/repuestos/embrague.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:41', '2024-08-19 22:46:41', 14, 38, 76),
(684, 9, 'rodamientos para 1.8L I4 B18C', 'Descripción de rodamientos compatible con 1.8L I4 B18C', '1', 'R-1683', 'public/assets/shop/img/repuestos/rodamientos.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:41', '2024-08-19 22:46:41', 14, 38, 76),
(685, 1, 'filtros para 2.0L I4 B20B', 'Descripción de filtros compatible con 2.0L I4 B20B', '1', 'R-1684', 'public/assets/shop/img/repuestos/filtros.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:41', '2024-08-19 22:46:41', 14, 39, 77),
(686, 2, 'frenos para 2.0L I4 B20B', 'Descripción de frenos compatible con 2.0L I4 B20B', '1', 'R-1685', 'public/assets/shop/img/repuestos/frenos.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:41', '2024-08-19 22:46:41', 14, 39, 77),
(687, 3, 'motor para 2.0L I4 B20B', 'Descripción de motor compatible con 2.0L I4 B20B', '1', 'R-1686', 'public/assets/shop/img/repuestos/motor.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:41', '2024-08-19 22:46:41', 14, 39, 77),
(688, 4, 'suspension para 2.0L I4 B20B', 'Descripción de suspension compatible con 2.0L I4 B20B', '1', 'R-1687', 'public/assets/shop/img/repuestos/suspension.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:41', '2024-08-19 22:46:41', 14, 39, 77),
(689, 5, 'amortiguadores para 2.0L I4 B20B', 'Descripción de amortiguadores compatible con 2.0L I4 B20B', '1', 'R-1688', 'public/assets/shop/img/repuestos/amortiguadores.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:41', '2024-08-19 22:46:41', 14, 39, 77),
(690, 6, 'bujias para 2.0L I4 B20B', 'Descripción de bujias compatible con 2.0L I4 B20B', '1', 'R-1689', 'public/assets/shop/img/repuestos/bujias.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:41', '2024-08-19 22:46:41', 14, 39, 77),
(691, 7, 'carreras, cadenas, rodillos para 2.0L I4 B20B', 'Descripción de carreras, cadenas, rodillos compatible con 2.0L I4 B20B', '1', 'R-1690', 'public/assets/shop/img/repuestos/correas.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:41', '2024-08-20 01:31:19', 14, 39, 77),
(692, 8, 'embrague para 2.0L I4 B20B', 'Descripción de embrague compatible con 2.0L I4 B20B', '1', 'R-1691', 'public/assets/shop/img/repuestos/embrague.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:41', '2024-08-19 22:46:41', 14, 39, 77),
(693, 9, 'rodamientos para 2.0L I4 B20B', 'Descripción de rodamientos compatible con 2.0L I4 B20B', '1', 'R-1692', 'public/assets/shop/img/repuestos/rodamientos.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:41', '2024-08-19 22:46:41', 14, 39, 77),
(694, 1, 'filtros para 2.2L I4 F22B1', 'Descripción de filtros compatible con 2.2L I4 F22B1', '1', 'R-1693', 'public/assets/shop/img/repuestos/filtros.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:41', '2024-08-19 22:46:41', 14, 39, 78),
(695, 2, 'frenos para 2.2L I4 F22B1', 'Descripción de frenos compatible con 2.2L I4 F22B1', '1', 'R-1694', 'public/assets/shop/img/repuestos/frenos.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:41', '2024-08-19 22:46:41', 14, 39, 78),
(696, 3, 'motor para 2.2L I4 F22B1', 'Descripción de motor compatible con 2.2L I4 F22B1', '1', 'R-1695', 'public/assets/shop/img/repuestos/motor.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:41', '2024-08-19 22:46:41', 14, 39, 78),
(697, 4, 'suspension para 2.2L I4 F22B1', 'Descripción de suspension compatible con 2.2L I4 F22B1', '1', 'R-1696', 'public/assets/shop/img/repuestos/suspension.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:41', '2024-08-19 22:46:41', 14, 39, 78),
(698, 5, 'amortiguadores para 2.2L I4 F22B1', 'Descripción de amortiguadores compatible con 2.2L I4 F22B1', '1', 'R-1697', 'public/assets/shop/img/repuestos/amortiguadores.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:42', '2024-08-19 22:46:42', 14, 39, 78),
(699, 6, 'bujias para 2.2L I4 F22B1', 'Descripción de bujias compatible con 2.2L I4 F22B1', '1', 'R-1698', 'public/assets/shop/img/repuestos/bujias.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:42', '2024-08-19 22:46:42', 14, 39, 78),
(700, 7, 'carreras, cadenas, rodillos para 2.2L I4 F22B1', 'Descripción de carreras, cadenas, rodillos compatible con 2.2L I4 F22B1', '1', 'R-1699', 'public/assets/shop/img/repuestos/correas.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:42', '2024-08-20 01:31:19', 14, 39, 78),
(701, 8, 'embrague para 2.2L I4 F22B1', 'Descripción de embrague compatible con 2.2L I4 F22B1', '1', 'R-1700', 'public/assets/shop/img/repuestos/embrague.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:42', '2024-08-19 22:46:42', 14, 39, 78),
(702, 9, 'rodamientos para 2.2L I4 F22B1', 'Descripción de rodamientos compatible con 2.2L I4 F22B1', '1', 'R-1701', 'public/assets/shop/img/repuestos/rodamientos.png', 50, 100.00, 'Genérico', 0, 0.00, 1, '2024-08-19 22:46:42', '2024-08-19 22:46:42', 14, 39, 78),
(705, 3, 'RIDEX 805O0009', 'RIDEX 805O0009 Interruptor de control de la presión de aceite', NULL, 'R-1702', NULL, 25, 25.00, 'ridex', 0, 0.24, 1, '2024-09-16 21:55:59', '2024-09-16 21:55:59', 1, 1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id_usuario` int(11) NOT NULL,
  `nombre_usuario` varchar(255) DEFAULT NULL,
  `apellido_usuario` varchar(255) DEFAULT NULL,
  `user_usuario` varchar(255) DEFAULT NULL,
  `telefono_usuario` varchar(11) NOT NULL,
  `foto_usuario` varchar(255) DEFAULT NULL,
  `email_usuario` varchar(255) DEFAULT NULL,
  `password_usuario` varchar(255) DEFAULT NULL,
  `rol_usuario` varchar(255) DEFAULT NULL,
  `estado_usuario` tinyint(4) DEFAULT 1,
  `date_created_usuario` timestamp NOT NULL DEFAULT current_timestamp(),
  `date_updated_usuario` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id_usuario`, `nombre_usuario`, `apellido_usuario`, `user_usuario`, `telefono_usuario`, `foto_usuario`, `email_usuario`, `password_usuario`, `rol_usuario`, `estado_usuario`, `date_created_usuario`, `date_updated_usuario`) VALUES
(1, 'benjamin', 'canaviri', 'benjo1234', '72565845', 'views/assets/media/avatars/usuarios/benjo1234/713.jpg', 'benjo@gmail.com', '$2a$07$azybxcags23425sdg23sdem1CFT2u/A.0JOm/IXWxebxaQOkjS85C', 'administrador', 1, '2024-06-09 15:27:08', '2024-09-18 05:19:34'),
(2, 'pitter', 'kevin', 'pitter123', '75468454', 'views/assets/media/avatars/usuarios/pitter123/696.jpg', 'pitter@gmail.com', '$2a$07$azybxcags23425sdg23sdexDgBwF1Wba.r8oVb3KiQPBr8fPcAQBe', 'venta', 1, '2024-07-25 03:06:26', '2024-08-27 02:55:37'),
(3, 'david', 'apaza', 'tonkis123', '65489552', 'views/assets/media/avatars/usuarios/tonkis123/570.jpg', 'tonkis@gmail.com', '$2a$07$azybxcags23425sdg23sdeqJpRVasxIvNizan7dQx1M6JQIJEH4vK', 'venta', 1, '2024-07-29 23:17:47', '2024-08-27 02:55:43');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ventas`
--

CREATE TABLE `ventas` (
  `id_venta` int(11) NOT NULL,
  `codigo_venta` int(11) NOT NULL,
  `monto_total_venta` decimal(10,2) NOT NULL,
  `metodo_pago_venta` varchar(50) NOT NULL,
  `id_cliente` int(11) DEFAULT NULL,
  `id_usuario` int(11) DEFAULT NULL,
  `id_razon_social` int(11) DEFAULT NULL,
  `estado_venta` varchar(50) DEFAULT NULL,
  `date_created_venta` date DEFAULT current_timestamp(),
  `date_updated_venta` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `ventas`
--

INSERT INTO `ventas` (`id_venta`, `codigo_venta`, `monto_total_venta`, `metodo_pago_venta`, `id_cliente`, `id_usuario`, `id_razon_social`, `estado_venta`, `date_created_venta`, `date_updated_venta`) VALUES
(15, 1, 100.00, 'efectivo', NULL, 1, 1, NULL, NULL, '2024-09-18 06:18:58'),
(16, 2, 100.00, 'efectivo', NULL, 1, 1, NULL, NULL, '2024-09-18 06:21:52'),
(17, 3, 100.00, 'efectivo', NULL, 1, 1, NULL, NULL, '2024-09-18 06:22:31'),
(18, 4, 100.00, 'efectivo', NULL, 1, 1, NULL, NULL, '2024-09-18 06:23:05'),
(19, 5, 100.00, 'efectivo', NULL, 1, 2, NULL, NULL, '2024-09-18 06:33:48'),
(20, 6, 100.00, 'efectivo', NULL, 1, 3, NULL, NULL, '2024-09-18 06:35:27'),
(21, 7, 100.00, 'efectivo', NULL, 1, NULL, NULL, NULL, '2024-09-18 06:39:52'),
(22, 8, 100.00, 'efectivo', NULL, 1, NULL, NULL, NULL, '2024-09-18 06:41:33'),
(23, 9, 100.00, 'efectivo', NULL, 1, NULL, NULL, NULL, '2024-09-18 06:42:08'),
(24, 10, 100.00, 'efectivo', NULL, 1, NULL, NULL, NULL, '2024-09-18 06:43:15'),
(25, 11, 100.00, 'qr', NULL, 1, NULL, NULL, NULL, '2024-09-18 07:11:29'),
(26, 12, 100.00, 'efectivo', NULL, 1, NULL, NULL, NULL, '2024-09-18 07:19:07'),
(27, 13, 100.00, 'efectivo', NULL, 1, NULL, NULL, NULL, '2024-09-18 07:47:40'),
(28, 14, 100.00, 'efectivo', NULL, 1, NULL, NULL, NULL, '2024-09-18 07:55:53'),
(29, 15, 1.00, 'qr', NULL, 1, 1, NULL, NULL, '2024-09-18 09:34:33'),
(30, 15, 1.00, 'qr', NULL, 1, 1, NULL, NULL, '2024-09-18 09:34:37'),
(31, 16, 1.00, 'qr', NULL, 1, 1, NULL, NULL, '2024-09-18 09:38:12'),
(32, 16, 1.00, 'qr', NULL, 1, 1, NULL, NULL, '2024-09-18 09:41:40'),
(33, 17, 1.00, 'qr', NULL, 1, 1, NULL, NULL, '2024-09-18 09:43:58'),
(34, 18, 1.00, 'qr', NULL, 1, NULL, NULL, NULL, '2024-09-18 09:56:13'),
(35, 19, 1.00, 'efectivo', NULL, 1, NULL, NULL, '2024-09-18', '2024-09-18 10:20:01');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `carrito`
--
ALTER TABLE `carrito`
  ADD PRIMARY KEY (`id_carrito`),
  ADD KEY `id_cliente` (`id_cliente`);

--
-- Indices de la tabla `categorias`
--
ALTER TABLE `categorias`
  ADD PRIMARY KEY (`id_categoria`);

--
-- Indices de la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`id_cliente`);

--
-- Indices de la tabla `compras`
--
ALTER TABLE `compras`
  ADD PRIMARY KEY (`id_compra`),
  ADD KEY `id_proveedor` (`id_proveedor`),
  ADD KEY `id_usuario` (`id_usuario`);

--
-- Indices de la tabla `detalles_carrito`
--
ALTER TABLE `detalles_carrito`
  ADD PRIMARY KEY (`id_detalle_carrito`),
  ADD KEY `id_carrito` (`id_carrito`),
  ADD KEY `id_repuesto` (`id_repuesto`);

--
-- Indices de la tabla `detalles_compras`
--
ALTER TABLE `detalles_compras`
  ADD PRIMARY KEY (`id_detalle_compra`),
  ADD KEY `id_compra` (`id_compra`),
  ADD KEY `id_repuesto` (`id_repuesto`);

--
-- Indices de la tabla `detalles_orden`
--
ALTER TABLE `detalles_orden`
  ADD PRIMARY KEY (`id_detalle_orden`),
  ADD KEY `id_orden` (`id_orden`),
  ADD KEY `id_repuesto` (`id_repuesto`);

--
-- Indices de la tabla `detalles_ventas`
--
ALTER TABLE `detalles_ventas`
  ADD PRIMARY KEY (`id_detalleVenta`),
  ADD KEY `id_venta` (`id_venta`),
  ADD KEY `id_repuesto` (`id_repuesto`);

--
-- Indices de la tabla `envios`
--
ALTER TABLE `envios`
  ADD PRIMARY KEY (`id_envio`),
  ADD KEY `fk_id_orden_ordenes` (`id_orden`);

--
-- Indices de la tabla `marcas`
--
ALTER TABLE `marcas`
  ADD PRIMARY KEY (`id_marca`);

--
-- Indices de la tabla `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `modelos`
--
ALTER TABLE `modelos`
  ADD PRIMARY KEY (`id_modelo`),
  ADD KEY `id_marca` (`id_marca`);

--
-- Indices de la tabla `motores`
--
ALTER TABLE `motores`
  ADD PRIMARY KEY (`id_motor`),
  ADD KEY `fk_modelo_motor` (`id_modelo`);

--
-- Indices de la tabla `ordenes`
--
ALTER TABLE `ordenes`
  ADD PRIMARY KEY (`id_orden`),
  ADD KEY `id_cliente` (`id_cliente`);

--
-- Indices de la tabla `proveedores`
--
ALTER TABLE `proveedores`
  ADD PRIMARY KEY (`id_proveedor`);

--
-- Indices de la tabla `razon_social`
--
ALTER TABLE `razon_social`
  ADD PRIMARY KEY (`id_razon_social`);

--
-- Indices de la tabla `repuestos`
--
ALTER TABLE `repuestos`
  ADD PRIMARY KEY (`id_repuesto`),
  ADD KEY `id_categoria` (`id_categoria`),
  ADD KEY `fk_marca_repuesto` (`id_marca`),
  ADD KEY `fk_modelo_repuesto` (`id_modelo`),
  ADD KEY `fk_motor_repuesto` (`id_motor`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id_usuario`);

--
-- Indices de la tabla `ventas`
--
ALTER TABLE `ventas`
  ADD PRIMARY KEY (`id_venta`),
  ADD KEY `id_cliente` (`id_cliente`),
  ADD KEY `id_usuario` (`id_usuario`),
  ADD KEY `fk_ventas_razon_social` (`id_razon_social`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `carrito`
--
ALTER TABLE `carrito`
  MODIFY `id_carrito` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT de la tabla `categorias`
--
ALTER TABLE `categorias`
  MODIFY `id_categoria` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `clientes`
--
ALTER TABLE `clientes`
  MODIFY `id_cliente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `compras`
--
ALTER TABLE `compras`
  MODIFY `id_compra` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `detalles_carrito`
--
ALTER TABLE `detalles_carrito`
  MODIFY `id_detalle_carrito` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=78;

--
-- AUTO_INCREMENT de la tabla `detalles_compras`
--
ALTER TABLE `detalles_compras`
  MODIFY `id_detalle_compra` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `detalles_orden`
--
ALTER TABLE `detalles_orden`
  MODIFY `id_detalle_orden` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT de la tabla `detalles_ventas`
--
ALTER TABLE `detalles_ventas`
  MODIFY `id_detalleVenta` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT de la tabla `envios`
--
ALTER TABLE `envios`
  MODIFY `id_envio` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT de la tabla `marcas`
--
ALTER TABLE `marcas`
  MODIFY `id_marca` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT de la tabla `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `modelos`
--
ALTER TABLE `modelos`
  MODIFY `id_modelo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT de la tabla `motores`
--
ALTER TABLE `motores`
  MODIFY `id_motor` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=84;

--
-- AUTO_INCREMENT de la tabla `ordenes`
--
ALTER TABLE `ordenes`
  MODIFY `id_orden` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT de la tabla `proveedores`
--
ALTER TABLE `proveedores`
  MODIFY `id_proveedor` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `razon_social`
--
ALTER TABLE `razon_social`
  MODIFY `id_razon_social` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `repuestos`
--
ALTER TABLE `repuestos`
  MODIFY `id_repuesto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=713;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id_usuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `ventas`
--
ALTER TABLE `ventas`
  MODIFY `id_venta` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `carrito`
--
ALTER TABLE `carrito`
  ADD CONSTRAINT `carrito_ibfk_1` FOREIGN KEY (`id_cliente`) REFERENCES `clientes` (`id_cliente`);

--
-- Filtros para la tabla `compras`
--
ALTER TABLE `compras`
  ADD CONSTRAINT `compras_ibfk_1` FOREIGN KEY (`id_proveedor`) REFERENCES `proveedores` (`id_proveedor`),
  ADD CONSTRAINT `compras_ibfk_2` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_usuario`);

--
-- Filtros para la tabla `detalles_carrito`
--
ALTER TABLE `detalles_carrito`
  ADD CONSTRAINT `detalles_carrito_ibfk_1` FOREIGN KEY (`id_carrito`) REFERENCES `carrito` (`id_carrito`) ON DELETE CASCADE,
  ADD CONSTRAINT `detalles_carrito_ibfk_2` FOREIGN KEY (`id_repuesto`) REFERENCES `repuestos` (`id_repuesto`);

--
-- Filtros para la tabla `detalles_compras`
--
ALTER TABLE `detalles_compras`
  ADD CONSTRAINT `detalles_compras_ibfk_1` FOREIGN KEY (`id_compra`) REFERENCES `compras` (`id_compra`),
  ADD CONSTRAINT `detalles_compras_ibfk_2` FOREIGN KEY (`id_repuesto`) REFERENCES `repuestos` (`id_repuesto`);

--
-- Filtros para la tabla `detalles_orden`
--
ALTER TABLE `detalles_orden`
  ADD CONSTRAINT `detalles_orden_ibfk_1` FOREIGN KEY (`id_orden`) REFERENCES `ordenes` (`id_orden`) ON DELETE CASCADE,
  ADD CONSTRAINT `detalles_orden_ibfk_2` FOREIGN KEY (`id_repuesto`) REFERENCES `repuestos` (`id_repuesto`);

--
-- Filtros para la tabla `detalles_ventas`
--
ALTER TABLE `detalles_ventas`
  ADD CONSTRAINT `detalles_ventas_ibfk_1` FOREIGN KEY (`id_venta`) REFERENCES `ventas` (`id_venta`),
  ADD CONSTRAINT `detalles_ventas_ibfk_2` FOREIGN KEY (`id_repuesto`) REFERENCES `repuestos` (`id_repuesto`);

--
-- Filtros para la tabla `envios`
--
ALTER TABLE `envios`
  ADD CONSTRAINT `fk_id_orden_ordenes` FOREIGN KEY (`id_orden`) REFERENCES `ordenes` (`id_orden`);

--
-- Filtros para la tabla `modelos`
--
ALTER TABLE `modelos`
  ADD CONSTRAINT `modelos_ibfk_1` FOREIGN KEY (`id_marca`) REFERENCES `marcas` (`id_marca`);

--
-- Filtros para la tabla `motores`
--
ALTER TABLE `motores`
  ADD CONSTRAINT `fk_modelo_motor` FOREIGN KEY (`id_modelo`) REFERENCES `modelos` (`id_modelo`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `ordenes`
--
ALTER TABLE `ordenes`
  ADD CONSTRAINT `ordenes_ibfk_1` FOREIGN KEY (`id_cliente`) REFERENCES `clientes` (`id_cliente`);

--
-- Filtros para la tabla `repuestos`
--
ALTER TABLE `repuestos`
  ADD CONSTRAINT `fk_marca_repuesto` FOREIGN KEY (`id_marca`) REFERENCES `marcas` (`id_marca`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_modelo_repuesto` FOREIGN KEY (`id_modelo`) REFERENCES `modelos` (`id_modelo`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_motor_repuesto` FOREIGN KEY (`id_motor`) REFERENCES `motores` (`id_motor`) ON DELETE CASCADE,
  ADD CONSTRAINT `repuestos_ibfk_1` FOREIGN KEY (`id_categoria`) REFERENCES `categorias` (`id_categoria`);

--
-- Filtros para la tabla `ventas`
--
ALTER TABLE `ventas`
  ADD CONSTRAINT `fk_ventas_razon_social` FOREIGN KEY (`id_razon_social`) REFERENCES `razon_social` (`id_razon_social`),
  ADD CONSTRAINT `ventas_ibfk_1` FOREIGN KEY (`id_cliente`) REFERENCES `clientes` (`id_cliente`),
  ADD CONSTRAINT `ventas_ibfk_2` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_usuario`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
