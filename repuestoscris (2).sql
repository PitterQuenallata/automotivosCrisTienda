-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 31-07-2024 a las 06:30:12
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
-- Estructura de tabla para la tabla `categorias`
--

CREATE TABLE `categorias` (
  `id_categoria` int(11) NOT NULL,
  `nombre_categoria` varchar(255) NOT NULL,
  `date_created_categoria` timestamp NOT NULL DEFAULT current_timestamp(),
  `date_updated_categoria` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `categorias`
--

INSERT INTO `categorias` (`id_categoria`, `nombre_categoria`, `date_created_categoria`, `date_updated_categoria`) VALUES
(1, 'filtros', '2024-06-09 15:36:55', '2024-06-09 15:36:55'),
(2, 'frenos', '2024-06-09 15:36:55', '2024-06-09 15:36:55'),
(3, 'motor', '2024-06-09 15:36:55', '2024-06-09 15:36:55'),
(4, 'suspension', '2024-06-09 15:36:55', '2024-06-09 15:36:55'),
(5, 'amortiguadores', '2024-06-09 15:36:55', '2024-06-09 15:36:55'),
(6, 'bujias', '2024-06-09 15:36:55', '2024-06-09 15:36:55'),
(7, 'carreras, cadenas, rodillos', '2024-06-09 15:36:55', '2024-06-09 15:36:55'),
(8, 'embrague', '2024-06-09 15:36:55', '2024-06-09 15:36:55'),
(9, 'rodamientos', '2024-06-09 15:36:55', '2024-06-09 15:36:55'),
(10, 'puertas', '2024-07-21 15:44:46', '2024-07-21 15:47:12'),
(18, 'frenos', '2024-07-28 23:50:01', '2024-07-28 23:50:01');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

CREATE TABLE `clientes` (
  `id_cliente` int(11) NOT NULL,
  `nombre_cliente` varchar(255) NOT NULL,
  `apellido_cliente` varchar(255) DEFAULT NULL,
  `nit_ci_cliente` varchar(255) DEFAULT NULL,
  `telefono_cliente` varchar(255) DEFAULT NULL,
  `compra_cliente` int(11) DEFAULT NULL,
  `direccion_cliente` varchar(255) DEFAULT NULL,
  `email_cliente` varchar(255) DEFAULT NULL,
  `date_created_cliente` timestamp NOT NULL DEFAULT current_timestamp(),
  `date_updated_cliente` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `clientes`
--

INSERT INTO `clientes` (`id_cliente`, `nombre_cliente`, `apellido_cliente`, `nit_ci_cliente`, `telefono_cliente`, `compra_cliente`, `direccion_cliente`, `email_cliente`, `date_created_cliente`, `date_updated_cliente`) VALUES
(1, 'Juan', 'Pérez', '123456789', '555', 0, 'Calle Falsa 123', 'juan.perez@example.com', '2024-06-12 18:51:03', '2024-06-12 18:51:03'),
(2, 'María', 'González', '987654321', '555', 0, 'Avenida Siempre Viva 742', 'maria.gonzalez@example.com', '2024-06-12 18:51:03', '2024-06-12 18:51:03'),
(3, 'Carlos', 'Ramírez', '111222333', '555', 0, 'Boulevard Central 456', 'carlos.ramirez@example.com', '2024-06-12 18:51:03', '2024-06-12 18:51:03'),
(4, 'Ana', 'Fernández', '444555666', '555', 0, 'Calle Principal 789', 'ana.fernandez@example.com', '2024-06-12 18:51:03', '2024-06-12 18:51:03'),
(5, 'Luis', 'Martínez', '777888999', '555', 0, 'Avenida Secundaria 101', 'luis.martinez@example.com', '2024-06-12 18:51:03', '2024-06-12 18:51:03'),
(87, 'juan', NULL, '7925456', '31231', 1, NULL, NULL, '2024-07-29 00:34:05', '2024-07-29 00:34:05'),
(88, 'juan', NULL, '12345', NULL, NULL, NULL, NULL, '2024-07-29 00:43:37', '2024-07-29 00:43:37'),
(89, 'juan', NULL, '000', '1242', NULL, NULL, NULL, '2024-07-29 00:56:05', '2024-07-29 00:56:05'),
(90, 'juanra', NULL, '123045', '445', NULL, NULL, NULL, '2024-07-29 01:00:02', '2024-07-29 01:00:02'),
(91, '545', NULL, '2543434', '4545', NULL, NULL, NULL, '2024-07-29 01:00:26', '2024-07-29 01:00:26'),
(92, 'ddada', NULL, '1231313', '25', NULL, NULL, NULL, '2024-07-29 01:01:27', '2024-07-29 01:01:27'),
(93, 'dada', NULL, '12313131313', '11', NULL, NULL, NULL, '2024-07-29 01:03:10', '2024-07-29 01:03:10'),
(94, '545', NULL, '1131311', '12', NULL, NULL, NULL, '2024-07-29 01:06:01', '2024-07-29 01:06:01'),
(95, '2323', NULL, '161616', '11', NULL, NULL, NULL, '2024-07-29 01:07:30', '2024-07-29 01:07:30'),
(96, '545', NULL, '1111', '11', 2, NULL, NULL, '2024-07-29 01:08:08', '2024-07-29 01:18:57'),
(97, 'pitter', NULL, '7091455', '67033711', NULL, NULL, NULL, '2024-07-29 04:30:13', '2024-07-29 04:30:13'),
(98, 'juan', NULL, '7000', '25', NULL, NULL, NULL, '2024-07-29 04:52:13', '2024-07-29 04:52:13');

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
(23, 'COM0018', '2024-07-26', 10.00, 13, 1, '2024-07-26 03:21:31', '2024-07-26 03:45:55');

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
(47, 23, 10, 5, 2.00, '2024-07-26 03:21:31', '2024-07-26 03:26:47');

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
(1, 1, 21, 6, 9.99, '2024-07-30 20:23:49', '2024-07-01'),
(2, 2, 21, 5, 9.99, '2024-07-30 20:23:49', '2024-07-05'),
(3, 3, 21, 3, 9.99, '2024-07-30 20:23:49', '2024-07-10'),
(4, 3, 26, 3, 60.00, '2024-07-30 20:23:49', '2024-07-10'),
(5, 3, 27, 3, 60.00, '2024-07-30 20:23:49', '2024-07-10'),
(6, 3, 28, 3, 80.00, '2024-07-30 20:23:49', '2024-07-10'),
(8, 5, 21, 1, 9.99, '2024-07-30 20:23:49', '2024-07-20'),
(9, 6, 21, 1, 9.99, '2024-07-30 20:23:49', '2024-07-25'),
(10, 7, 21, 1, 9.99, '2024-07-30 20:23:49', '2024-07-30'),
(11, 8, 21, 1, 9.99, '2024-07-30 20:23:49', '2024-07-31'),
(12, 9, 21, 1, 9.99, '2024-07-30 20:23:49', '2024-08-01'),
(13, 10, 21, 1, 9.99, '2024-07-30 20:23:49', '2024-08-05'),
(14, 11, 21, 1, 9.99, '2024-07-30 20:23:49', '2024-08-10'),
(15, 12, 7, 2, 120.00, '2024-07-30 20:23:49', '2024-08-15'),
(16, 13, 7, 3, 120.00, '2024-07-30 20:21:51', '2024-07-28'),
(17, 14, 7, 1, 120.00, '2024-07-30 20:21:51', '2024-07-28'),
(18, 15, 21, 6, 9.99, '2024-07-30 20:21:51', '2024-07-28'),
(19, 16, 7, 1, 120.00, '2024-07-30 20:21:51', '2024-07-29'),
(20, 17, 9, 8, 32.99, '2024-07-30 20:21:51', '2024-07-29');

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
(1, 1, 'Corolla', 'XLE', '2015', '2020', 1, '2024-06-09 16:24:17', '2024-06-09 16:24:17'),
(2, 2, 'Mustang', 'GT', '2018', '2022', 1, '2024-06-09 16:24:17', '2024-06-09 16:24:17'),
(3, 2, 'bannete', 'g16', '2008', '2016', 1, '2024-06-09 16:44:41', '2024-06-09 16:49:08');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `modelo_motores`
--

CREATE TABLE `modelo_motores` (
  `id_modelo` int(11) NOT NULL,
  `id_motor` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `modelo_motores`
--

INSERT INTO `modelo_motores` (`id_modelo`, `id_motor`) VALUES
(1, 1),
(1, 2),
(3, 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `modelo_repuestos`
--

CREATE TABLE `modelo_repuestos` (
  `id_modelo` int(11) NOT NULL,
  `id_repuesto` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `modelo_repuestos`
--

INSERT INTO `modelo_repuestos` (`id_modelo`, `id_repuesto`) VALUES
(1, 29),
(1, 30),
(1, 46),
(2, 33),
(2, 34),
(3, 31),
(3, 32);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `motores`
--

CREATE TABLE `motores` (
  `id_motor` int(11) NOT NULL,
  `nombre_motor` varchar(255) NOT NULL,
  `cilindrada_motor` varchar(255) DEFAULT NULL,
  `especificaciones_motor` text DEFAULT NULL,
  `date_created_motor` timestamp NOT NULL DEFAULT current_timestamp(),
  `date_updated_motor` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `motores`
--

INSERT INTO `motores` (`id_motor`, `nombre_motor`, `cilindrada_motor`, `especificaciones_motor`, `date_created_motor`, `date_updated_motor`) VALUES
(1, 'v6 3.5l', '5', 'Motor V6', '2024-06-09 17:36:19', '2024-06-09 21:07:22'),
(2, 'v8 5.0l', '5.0l', 'Motor V8 de 5.0 litros, 450 hp, árbol de levas en cabeza, inyección electrónica secuencial', '2024-06-09 17:36:19', '2024-06-09 21:09:47'),
(3, 'I4 2.0L Turbo', '2.0L', 'Motor de cuatro cilindros en línea, 2.0 litros turbo, 250 hp, doble árbol de levas, intercooler', '2024-06-09 17:36:19', '2024-06-09 17:36:19');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `motor_repuestos`
--

CREATE TABLE `motor_repuestos` (
  `id_motor` int(11) NOT NULL,
  `id_repuesto` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `motor_repuestos`
--

INSERT INTO `motor_repuestos` (`id_motor`, `id_repuesto`) VALUES
(1, 29),
(1, 30),
(1, 46),
(3, 31),
(3, 32);

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
(1, 'Star Company', 0, '67033711', 'Calle Falsa 123, Ciudad Falsa', '', '2024-06-10 02:28:09', '2024-06-12 23:32:18'),
(2, 'AutoParts Cocha', 0, '75845684', 'Avenida Siempreviva ', '', '2024-06-10 02:28:09', '2024-06-12 23:32:30'),
(5, 'Juan Marquez', 0, '79125836', 'San Cruz', '', '2024-06-10 05:20:20', '2024-06-10 05:20:20'),
(6, 'pitter', 7091455, '5858', 'santa', 'gasd@gmail.com', '2024-07-25 05:12:31', '2024-07-25 05:12:31'),
(7, 'pitter', 5668, '6868', 'santa', 'fa@gmaill.com', '2024-07-25 05:14:26', '2024-07-25 05:14:26'),
(8, 'fsdfsd', 5345, '543534', 'gdfg', 'gdfg', '2024-07-25 05:21:35', '2024-07-25 05:21:35'),
(9, '', 0, '', '', '', '2024-07-25 06:58:11', '2024-07-25 06:58:11'),
(10, 'dsadas', 123, '123', 'dasd', 'sda', '2024-07-25 07:05:22', '2024-07-25 07:05:22'),
(11, 'dsadas', 123, '123', 'dasd', 'sda', '2024-07-25 07:05:52', '2024-07-25 07:05:52'),
(12, 'dsadas', 123, '123', 'dasd', 'sda', '2024-07-25 07:06:59', '2024-07-25 07:06:59'),
(13, 'josias', 9999, '9999', 'santa', 'santa', '2024-07-25 07:07:57', '2024-07-25 07:07:57');

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
  `stock_repuesto` int(11) DEFAULT NULL,
  `precio_repuesto` decimal(10,2) DEFAULT NULL,
  `precio_compra` decimal(10,2) DEFAULT NULL,
  `marca_repuesto` varchar(255) DEFAULT NULL,
  `venta_repuesto` int(11) NOT NULL,
  `estado_repuesto` tinyint(4) DEFAULT 1,
  `date_created_repuesto` timestamp NOT NULL DEFAULT current_timestamp(),
  `date_updated_repuesto` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `repuestos`
--

INSERT INTO `repuestos` (`id_repuesto`, `id_categoria`, `nombre_repuesto`, `descripcion_repuesto`, `oem_repuesto`, `codigo_tienda_repuesto`, `img_repuesto`, `stock_repuesto`, `precio_repuesto`, `precio_compra`, `marca_repuesto`, `venta_repuesto`, `estado_repuesto`, `date_created_repuesto`, `date_updated_repuesto`) VALUES
(7, 3, 'Batería', 'hola', 'S6508B', '30000', '', 6, 120.00, 0.00, 'Bosch', 0, 1, '2024-06-12 23:49:22', '2024-07-29 04:30:13'),
(8, 2, 'Pastillas de freno', '', '04465-06150', '20000', '', 49, 45.00, 0.00, 'Toyota', 0, 1, '2024-06-12 23:49:22', '2024-07-28 23:39:59'),
(9, 3, 'Aceite de motor', '', '94001', '30001', '', 90, 32.99, 0.00, 'Mobil', 0, 1, '2024-06-12 23:49:22', '2024-07-29 04:52:13'),
(10, 6, 'Bujías', '', '6619', '60000', '', 200, 10.00, 0.00, 'NGK', 0, 1, '2024-06-12 23:49:22', '2024-07-21 14:02:28'),
(11, 3, 'Alternador', '', '10480322', '30002', '', 0, 210.00, 0.00, 'AC Delco', 0, 1, '2024-06-12 23:49:22', '2024-07-24 23:21:14'),
(12, 5, 'Amortiguador', '', '6L3Z-18124-B', '50000', '', 25, 75.00, 0.00, 'Motorcraft', 0, 1, '2024-06-12 23:49:22', '2024-07-21 14:02:41'),
(13, 3, 'Filtro de combustible', '', '16400-1AA0A', '30003', '', 30, 35.00, 0.00, 'Nissan', 0, 1, '2024-06-12 23:49:22', '2024-07-21 14:02:49'),
(14, 7, 'Correa de distribución', '', '13028-AA231', '70000', '', 12, 85.00, 0.00, 'Subaru', 0, 1, '2024-06-12 23:49:22', '2024-07-21 14:02:55'),
(15, 8, 'Termostato', '', '25500-23550', '80000', '', 40, 18.00, 0.00, 'Hyundai', 0, 1, '2024-06-12 23:49:22', '2024-07-23 09:40:58'),
(16, 3, 'Sensor TPMS', '', '42753-SNA-A83', '30004', '', 50, 75.99, 0.00, 'Honda', 0, 1, '2024-06-12 23:51:20', '2024-07-21 14:03:06'),
(17, 3, 'Eje de transmisión', '', '44305-S84-A02', '30005', '', 20, 150.00, 0.00, 'Honda', 0, 1, '2024-06-12 23:51:20', '2024-07-21 14:03:13'),
(18, 4, 'Buje de control', '', '51393-SDA-A01', '40000', '', 30, 35.00, 0.00, 'Honda', 0, 1, '2024-06-12 23:51:20', '2024-07-21 14:03:19'),
(19, 3, 'Enfriador de transmisión', '', '25430-PLR-003', '30006', '', 15, 120.00, 0.00, 'Honda', 0, 1, '2024-06-12 23:51:20', '2024-07-21 14:03:30'),
(20, 3, 'Soporte del motor', '', '50820-SDA-A02', '30007', '', 40, 45.00, 0.00, 'Honda', 0, 1, '2024-06-12 23:51:20', '2024-07-21 14:03:37'),
(21, 1, 'Filtro de aceite', '', '15400-PLM-A02', '10002', '', 70, 9.99, 0.00, 'Honda', 0, 1, '2024-06-12 23:51:20', '2024-07-29 01:22:08'),
(22, 2, 'Pastillas de freno delanteras', '', '45022-TK8-A02', '20001', '', 60, 60.00, 0.00, 'Honda', 0, 1, '2024-06-12 23:51:20', '2024-07-21 14:03:51'),
(23, 3, 'Batería', '', '31500-SR1-100', '30008', '', 25, 110.00, 0.00, 'Honda', 0, 1, '2024-06-12 23:51:20', '2024-07-21 14:04:02'),
(24, 3, 'Alternador', '', '31100-RCA-A01', '30009', '', 10, 230.00, 0.00, 'Honda', 0, 1, '2024-06-12 23:51:20', '2024-07-21 14:04:06'),
(25, 6, 'Bobina de encendido', '', '30520-RNA-A01', '60001', '', 80, 50.00, 0.00, 'Honda', 0, 1, '2024-06-12 23:51:20', '2024-07-21 14:04:15'),
(26, 1, 'FIltrito', '', NULL, '10003', NULL, 42, 60.00, 0.00, 'Stevean', 0, 1, '2024-07-21 21:40:08', '2024-07-29 00:11:41'),
(27, 1, 'FIltrito', '', NULL, '10003', NULL, 42, 60.00, 0.00, 'Stevean', 0, 1, '2024-07-21 21:41:40', '2024-07-29 00:11:41'),
(28, 1, 'Filtro', '', NULL, '10004', NULL, 47, 80.00, 0.00, 'Siash', 0, 1, '2024-07-21 21:52:38', '2024-07-29 00:11:41'),
(29, 1, 'Filtro2', '', NULL, '10005', NULL, 49, 50.00, 0.00, 'filtroWwe', 0, 1, '2024-07-21 21:57:52', '2024-07-28 23:15:52'),
(30, 1, 'filtros', '', NULL, '10006', NULL, 99, 980.00, 0.00, 'Huajiuwe', 0, 1, '2024-07-21 22:08:12', '2024-07-28 23:15:52'),
(31, 10, 'Puerta 1', '', NULL, '100000', NULL, 1002, 60.00, 50.00, 'honds', 0, 1, '2024-07-21 22:54:56', '2024-07-21 22:54:56'),
(32, 8, 'Embreague', 'embreague super obsolet', NULL, '80001', NULL, 10, 60.00, 50.00, 'Musht', 0, 1, '2024-07-21 22:57:23', '2024-07-21 22:57:23'),
(33, 7, 'Correa', 'correa tripe 3', NULL, '70001', NULL, 50, 80.00, 56.00, 'husj', 0, 1, '2024-07-23 02:12:31', '2024-07-23 02:12:31'),
(34, 7, 'Correa', 'correa tripe 3', NULL, '70001', NULL, 50, 80.00, 56.00, 'husj', 0, 1, '2024-07-23 02:19:20', '2024-07-23 02:19:20'),
(46, 7, 'Carreasoj', 'a', NULL, '70002', NULL, 40, 50.00, 50.00, 'd', 0, 1, '2024-07-24 15:04:46', '2024-07-24 15:04:46');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id_usuario` int(11) NOT NULL,
  `nombre_usuario` varchar(255) DEFAULT NULL,
  `apellido_usuario` varchar(255) DEFAULT NULL,
  `user_usuario` varchar(255) DEFAULT NULL,
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

INSERT INTO `usuarios` (`id_usuario`, `nombre_usuario`, `apellido_usuario`, `user_usuario`, `foto_usuario`, `email_usuario`, `password_usuario`, `rol_usuario`, `estado_usuario`, `date_created_usuario`, `date_updated_usuario`) VALUES
(1, 'benjamin', 'canaviri', 'benjo1234', 'views/assets/media/avatars/usuarios/benjo1234/713.jpg', 'benjo@gmail.com', '$2a$07$azybxcags23425sdg23sdem1CFT2u/A.0JOm/IXWxebxaQOkjS85C', 'administrador', 1, '2024-06-09 15:27:08', '2024-07-30 14:04:02'),
(2, 'pitter', 'kevin', 'pitter123', 'views/assets/media/avatars/usuarios/pitter123/696.jpg', 'pitter@gmail.com', '$2a$07$azybxcags23425sdg23sdexDgBwF1Wba.r8oVb3KiQPBr8fPcAQBe', 'venta', 1, '2024-07-25 03:06:26', '2024-07-25 03:06:26'),
(3, 'david', 'apaza', 'tonkis123', 'views/assets/media/avatars/usuarios/tonkis123/570.jpg', 'tonkis@gmail.com', '$2a$07$azybxcags23425sdg23sdeqJpRVasxIvNizan7dQx1M6JQIJEH4vK', 'venta', 1, '2024-07-29 23:17:47', '2024-07-29 23:18:04');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ventas`
--

CREATE TABLE `ventas` (
  `id_venta` int(11) NOT NULL,
  `codigo_venta` int(11) NOT NULL,
  `monto_total_venta` decimal(10,2) NOT NULL,
  `id_cliente` int(11) DEFAULT NULL,
  `id_usuario` int(11) NOT NULL,
  `estado_venta` varchar(50) DEFAULT NULL,
  `date_created_venta` date DEFAULT NULL,
  `date_updated_venta` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `ventas`
--

INSERT INTO `ventas` (`id_venta`, `codigo_venta`, `monto_total_venta`, `id_cliente`, `id_usuario`, `estado_venta`, `date_created_venta`, `date_updated_venta`) VALUES
(1, 1, 60.00, NULL, 1, NULL, '2024-07-01', '2024-07-30 20:01:31'),
(2, 2, 50.00, NULL, 1, NULL, '2024-07-05', '2024-07-30 20:01:31'),
(3, 3, 630.00, NULL, 1, NULL, '2024-07-10', '2024-07-30 20:01:31'),
(5, 4, 10.00, 93, 1, NULL, '2024-07-20', '2024-07-30 20:01:31'),
(6, 5, 10.00, 94, 1, NULL, '2024-07-25', '2024-07-30 20:01:31'),
(7, 6, 10.00, NULL, 1, NULL, '2024-07-30', '2024-07-30 20:01:31'),
(8, 7, 10.00, NULL, 1, NULL, '2024-07-31', '2024-07-30 20:01:31'),
(9, 8, 10.00, 95, 1, NULL, '2024-08-01', '2024-07-30 20:01:31'),
(10, 9, 10.00, 96, 1, NULL, '2024-08-05', '2024-07-30 20:01:31'),
(11, 10, 10.00, 96, 1, NULL, '2024-08-10', '2024-07-30 20:01:31'),
(12, 11, 10.00, NULL, 1, NULL, '2024-08-15', '2024-07-30 20:01:31'),
(13, 12, 360.00, 96, 1, NULL, '2024-07-28', '2024-07-30 04:00:00'),
(14, 13, 360.00, NULL, 1, NULL, '2024-07-28', '2024-07-30 04:00:00'),
(15, 14, 120.00, NULL, 1, NULL, '2024-07-28', '2024-07-30 04:00:00'),
(16, 15, 60.00, NULL, 1, NULL, '2024-07-28', '2024-07-30 04:00:00'),
(17, 16, 263.92, 97, 1, NULL, '2024-07-29', '2024-07-30 04:00:00');

--
-- Índices para tablas volcadas
--

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
-- Indices de la tabla `detalles_compras`
--
ALTER TABLE `detalles_compras`
  ADD PRIMARY KEY (`id_detalle_compra`),
  ADD KEY `id_compra` (`id_compra`),
  ADD KEY `id_repuesto` (`id_repuesto`);

--
-- Indices de la tabla `detalles_ventas`
--
ALTER TABLE `detalles_ventas`
  ADD PRIMARY KEY (`id_detalleVenta`),
  ADD KEY `id_venta` (`id_venta`),
  ADD KEY `id_repuesto` (`id_repuesto`);

--
-- Indices de la tabla `marcas`
--
ALTER TABLE `marcas`
  ADD PRIMARY KEY (`id_marca`);

--
-- Indices de la tabla `modelos`
--
ALTER TABLE `modelos`
  ADD PRIMARY KEY (`id_modelo`),
  ADD KEY `id_marca` (`id_marca`);

--
-- Indices de la tabla `modelo_motores`
--
ALTER TABLE `modelo_motores`
  ADD PRIMARY KEY (`id_modelo`,`id_motor`),
  ADD KEY `id_motor` (`id_motor`);

--
-- Indices de la tabla `modelo_repuestos`
--
ALTER TABLE `modelo_repuestos`
  ADD PRIMARY KEY (`id_modelo`,`id_repuesto`),
  ADD KEY `id_repuesto` (`id_repuesto`);

--
-- Indices de la tabla `motores`
--
ALTER TABLE `motores`
  ADD PRIMARY KEY (`id_motor`);

--
-- Indices de la tabla `motor_repuestos`
--
ALTER TABLE `motor_repuestos`
  ADD PRIMARY KEY (`id_motor`,`id_repuesto`),
  ADD KEY `id_repuesto` (`id_repuesto`);

--
-- Indices de la tabla `proveedores`
--
ALTER TABLE `proveedores`
  ADD PRIMARY KEY (`id_proveedor`);

--
-- Indices de la tabla `repuestos`
--
ALTER TABLE `repuestos`
  ADD PRIMARY KEY (`id_repuesto`),
  ADD KEY `id_categoria` (`id_categoria`);

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
  ADD KEY `id_usuario` (`id_usuario`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `categorias`
--
ALTER TABLE `categorias`
  MODIFY `id_categoria` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT de la tabla `clientes`
--
ALTER TABLE `clientes`
  MODIFY `id_cliente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=99;

--
-- AUTO_INCREMENT de la tabla `compras`
--
ALTER TABLE `compras`
  MODIFY `id_compra` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT de la tabla `detalles_compras`
--
ALTER TABLE `detalles_compras`
  MODIFY `id_detalle_compra` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT de la tabla `detalles_ventas`
--
ALTER TABLE `detalles_ventas`
  MODIFY `id_detalleVenta` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT de la tabla `marcas`
--
ALTER TABLE `marcas`
  MODIFY `id_marca` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT de la tabla `modelos`
--
ALTER TABLE `modelos`
  MODIFY `id_modelo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `motores`
--
ALTER TABLE `motores`
  MODIFY `id_motor` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT de la tabla `proveedores`
--
ALTER TABLE `proveedores`
  MODIFY `id_proveedor` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT de la tabla `repuestos`
--
ALTER TABLE `repuestos`
  MODIFY `id_repuesto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id_usuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `ventas`
--
ALTER TABLE `ventas`
  MODIFY `id_venta` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `compras`
--
ALTER TABLE `compras`
  ADD CONSTRAINT `compras_ibfk_1` FOREIGN KEY (`id_proveedor`) REFERENCES `proveedores` (`id_proveedor`),
  ADD CONSTRAINT `compras_ibfk_2` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_usuario`);

--
-- Filtros para la tabla `detalles_compras`
--
ALTER TABLE `detalles_compras`
  ADD CONSTRAINT `detalles_compras_ibfk_1` FOREIGN KEY (`id_compra`) REFERENCES `compras` (`id_compra`),
  ADD CONSTRAINT `detalles_compras_ibfk_2` FOREIGN KEY (`id_repuesto`) REFERENCES `repuestos` (`id_repuesto`);

--
-- Filtros para la tabla `detalles_ventas`
--
ALTER TABLE `detalles_ventas`
  ADD CONSTRAINT `detalles_ventas_ibfk_1` FOREIGN KEY (`id_venta`) REFERENCES `ventas` (`id_venta`),
  ADD CONSTRAINT `detalles_ventas_ibfk_2` FOREIGN KEY (`id_repuesto`) REFERENCES `repuestos` (`id_repuesto`);

--
-- Filtros para la tabla `modelos`
--
ALTER TABLE `modelos`
  ADD CONSTRAINT `modelos_ibfk_1` FOREIGN KEY (`id_marca`) REFERENCES `marcas` (`id_marca`);

--
-- Filtros para la tabla `modelo_motores`
--
ALTER TABLE `modelo_motores`
  ADD CONSTRAINT `modelo_motores_ibfk_1` FOREIGN KEY (`id_modelo`) REFERENCES `modelos` (`id_modelo`),
  ADD CONSTRAINT `modelo_motores_ibfk_2` FOREIGN KEY (`id_motor`) REFERENCES `motores` (`id_motor`);

--
-- Filtros para la tabla `modelo_repuestos`
--
ALTER TABLE `modelo_repuestos`
  ADD CONSTRAINT `modelo_repuestos_ibfk_1` FOREIGN KEY (`id_modelo`) REFERENCES `modelos` (`id_modelo`),
  ADD CONSTRAINT `modelo_repuestos_ibfk_2` FOREIGN KEY (`id_repuesto`) REFERENCES `repuestos` (`id_repuesto`);

--
-- Filtros para la tabla `motor_repuestos`
--
ALTER TABLE `motor_repuestos`
  ADD CONSTRAINT `motor_repuestos_ibfk_1` FOREIGN KEY (`id_motor`) REFERENCES `motores` (`id_motor`),
  ADD CONSTRAINT `motor_repuestos_ibfk_2` FOREIGN KEY (`id_repuesto`) REFERENCES `repuestos` (`id_repuesto`);

--
-- Filtros para la tabla `repuestos`
--
ALTER TABLE `repuestos`
  ADD CONSTRAINT `repuestos_ibfk_1` FOREIGN KEY (`id_categoria`) REFERENCES `categorias` (`id_categoria`);

--
-- Filtros para la tabla `ventas`
--
ALTER TABLE `ventas`
  ADD CONSTRAINT `ventas_ibfk_1` FOREIGN KEY (`id_cliente`) REFERENCES `clientes` (`id_cliente`),
  ADD CONSTRAINT `ventas_ibfk_2` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_usuario`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
