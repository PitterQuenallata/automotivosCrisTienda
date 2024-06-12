-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 13-06-2024 a las 01:13:42
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
-- Base de datos: `repuestosfinal`
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
(15, 'sistema electrico', '2024-06-09 15:47:51', '2024-06-09 15:47:51');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

CREATE TABLE `clientes` (
  `id_cliente` int(11) NOT NULL,
  `nombre_cliente` varchar(255) DEFAULT NULL,
  `apellido_cliente` varchar(255) DEFAULT NULL,
  `direccion_cliente` varchar(255) DEFAULT NULL,
  `telefono_cliente` varchar(255) DEFAULT NULL,
  `email_cliente` varchar(255) DEFAULT NULL,
  `nit_cliente` varchar(20) DEFAULT NULL,
  `dni_cliente` varchar(20) DEFAULT NULL,
  `date_created_cliente` timestamp NOT NULL DEFAULT current_timestamp(),
  `date_updated_cliente` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `clientes`
--

INSERT INTO `clientes` (`id_cliente`, `nombre_cliente`, `apellido_cliente`, `direccion_cliente`, `telefono_cliente`, `email_cliente`, `nit_cliente`, `dni_cliente`, `date_created_cliente`, `date_updated_cliente`) VALUES
(1, 'Juan', 'Pérez', 'Calle Falsa 123', '555-1234', 'juan.perez@example.com', '123456789', '987654321', '2024-06-12 18:51:03', '2024-06-12 18:51:03'),
(2, 'María', 'González', 'Avenida Siempre Viva 742', '555-5678', 'maria.gonzalez@example.com', '987654321', '123456789', '2024-06-12 18:51:03', '2024-06-12 18:51:03'),
(3, 'Carlos', 'Ramírez', 'Boulevard Central 456', '555-8765', 'carlos.ramirez@example.com', '111222333', '112233445', '2024-06-12 18:51:03', '2024-06-12 18:51:03'),
(4, 'Ana', 'Fernández', 'Calle Principal 789', '555-4321', 'ana.fernandez@example.com', '444555666', '667788990', '2024-06-12 18:51:03', '2024-06-12 18:51:03'),
(5, 'Luis', 'Martínez', 'Avenida Secundaria 101', '555-1357', 'luis.martinez@example.com', '777888999', '998877665', '2024-06-12 18:51:03', '2024-06-12 18:51:03');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `compras`
--

CREATE TABLE `compras` (
  `id_compra` int(11) NOT NULL,
  `fecha_compra` date DEFAULT NULL,
  `monto_total_compra` decimal(10,2) NOT NULL,
  `id_proveedor` int(11) DEFAULT NULL,
  `id_usuario` int(11) DEFAULT NULL,
  `date_created_compra` timestamp NOT NULL DEFAULT current_timestamp(),
  `date_updated_compra` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `compras`
--

INSERT INTO `compras` (`id_compra`, `fecha_compra`, `monto_total_compra`, `id_proveedor`, `id_usuario`, `date_created_compra`, `date_updated_compra`) VALUES
(38, '2024-06-14', 1000.00, 5, 1, '2024-06-11 19:49:57', '2024-06-12 14:27:05'),
(39, '2024-06-12', 100.00, 1, 1, '2024-06-12 14:26:45', '2024-06-12 14:26:45');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalles_compras`
--

CREATE TABLE `detalles_compras` (
  `id_detalle_compra` int(11) NOT NULL,
  `id_compra` int(11) DEFAULT NULL,
  `id_repuesto` int(11) DEFAULT NULL,
  `cantidad_detalleCompra` int(11) DEFAULT NULL,
  `codigo_compra` varchar(10) NOT NULL,
  `precio_unitario` decimal(10,2) DEFAULT NULL,
  `date_created_detalle_compra` timestamp NOT NULL DEFAULT current_timestamp(),
  `date_updated_detalle_compra` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `detalles_compras`
--

INSERT INTO `detalles_compras` (`id_detalle_compra`, `id_compra`, `id_repuesto`, `cantidad_detalleCompra`, `codigo_compra`, `precio_unitario`, `date_created_detalle_compra`, `date_updated_detalle_compra`) VALUES
(43, 38, 5, 2, '6668aa6593', 500.00, '2024-06-11 19:49:57', '2024-06-12 14:27:05'),
(44, 39, 2, 10, '6669b025ed', 10.00, '2024-06-12 14:26:45', '2024-06-12 14:26:45');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalles_ventas`
--

CREATE TABLE `detalles_ventas` (
  `id_detalleVenta` int(11) NOT NULL,
  `id_venta` int(11) DEFAULT NULL,
  `id_repuesto` int(11) DEFAULT NULL,
  `cantidad_detalleVenta` int(11) DEFAULT NULL,
  `precio_unitario_detalleVenta` decimal(10,2) DEFAULT NULL,
  `date_created_detalleVenta` timestamp NOT NULL DEFAULT current_timestamp(),
  `date_updated_detalleVenta` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveedores`
--

CREATE TABLE `proveedores` (
  `id_proveedor` int(11) NOT NULL,
  `nombre_proveedor` varchar(255) DEFAULT NULL,
  `telefono_proveedor` varchar(255) DEFAULT NULL,
  `direccion_proveedor` varchar(255) DEFAULT NULL,
  `date_created_proveedor` timestamp NOT NULL DEFAULT current_timestamp(),
  `date_updated_proveedor` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `proveedores`
--

INSERT INTO `proveedores` (`id_proveedor`, `nombre_proveedor`, `telefono_proveedor`, `direccion_proveedor`, `date_created_proveedor`, `date_updated_proveedor`) VALUES
(1, 'Proveedor Uno', '4512698', 'Calle Falsa 123, Ciudad Falsa', '2024-06-10 02:28:09', '2024-06-10 05:03:30'),
(2, 'Proveedor Dos', '22120404', 'Avenida Siempreviva ', '2024-06-10 02:28:09', '2024-06-10 04:58:54'),
(5, 'Juan Marquez', '79125836', 'San Cruz', '2024-06-10 05:20:20', '2024-06-10 05:20:20');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `repuestos`
--

CREATE TABLE `repuestos` (
  `id_repuesto` int(11) NOT NULL,
  `id_categoria` int(11) DEFAULT NULL,
  `nombre_repuesto` varchar(255) NOT NULL,
  `oem_repuesto` varchar(255) DEFAULT NULL,
  `codigo_tienda_repuesto` varchar(255) DEFAULT NULL,
  `stock_repuesto` int(11) DEFAULT NULL,
  `precio_repuesto` decimal(10,2) DEFAULT NULL,
  `precio_cantidad_repuesto` decimal(10,2) DEFAULT NULL,
  `marca_repuesto` varchar(255) DEFAULT NULL,
  `estado_repuesto` tinyint(4) DEFAULT 1,
  `date_created_repuesto` timestamp NOT NULL DEFAULT current_timestamp(),
  `date_updated_repuesto` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `repuestos`
--

INSERT INTO `repuestos` (`id_repuesto`, `id_categoria`, `nombre_repuesto`, `oem_repuesto`, `codigo_tienda_repuesto`, `stock_repuesto`, `precio_repuesto`, `precio_cantidad_repuesto`, `marca_repuesto`, `estado_repuesto`, `date_created_repuesto`, `date_updated_repuesto`) VALUES
(1, 1, 'Filtro de aceite', 'OEM12345', 'COD001', 2, 15.00, 14.50, 'Marca A', 1, '2024-06-11 00:52:50', '2024-06-12 20:39:51'),
(2, 2, 'Bujía de encendido', 'OEM67890', 'COD002', 200, 10.00, 9.50, 'Marca B', 1, '2024-06-11 00:52:50', '2024-06-11 00:52:50'),
(3, 3, 'Amortiguador delantero', 'OEM54321', 'COD003', 150, 45.00, 43.00, 'Marca C', 1, '2024-06-11 00:52:50', '2024-06-11 00:52:50'),
(4, 4, 'Pastillas de freno', 'OEM98765', 'COD004', 250, 20.00, 19.00, 'Marca D', 1, '2024-06-11 00:52:50', '2024-06-11 00:52:50'),
(5, 5, 'Filtro de aire', 'OEM11223', 'COD005', 300, 12.00, 11.50, 'Marca E', 1, '2024-06-11 00:52:50', '2024-06-11 00:52:50');

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
(1, 'benjamin', 'canaviri', 'benjo1234', 'views/assets/media/avatars/usuarios/benjo1234/713.jpg', 'benjo@gmail.com', '$2a$07$azybxcags23425sdg23sdem1CFT2u/A.0JOm/IXWxebxaQOkjS85C', 'administrador', 1, '2024-06-09 15:27:08', '2024-06-12 14:22:10');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ventas`
--

CREATE TABLE `ventas` (
  `id_venta` int(11) NOT NULL,
  `codigo_venta` int(11) NOT NULL,
  `fecha_venta` date DEFAULT NULL,
  `monto_total_venta` int(11) DEFAULT NULL,
  `id_cliente` int(11) DEFAULT NULL,
  `id_usuario` int(11) DEFAULT NULL,
  `estado_venta` varchar(50) NOT NULL DEFAULT '''pendiente''',
  `date_created_venta` timestamp NOT NULL DEFAULT current_timestamp(),
  `date_updated_venta` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
  MODIFY `id_categoria` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT de la tabla `clientes`
--
ALTER TABLE `clientes`
  MODIFY `id_cliente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `compras`
--
ALTER TABLE `compras`
  MODIFY `id_compra` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT de la tabla `detalles_compras`
--
ALTER TABLE `detalles_compras`
  MODIFY `id_detalle_compra` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT de la tabla `detalles_ventas`
--
ALTER TABLE `detalles_ventas`
  MODIFY `id_detalleVenta` int(11) NOT NULL AUTO_INCREMENT;

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
  MODIFY `id_proveedor` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `repuestos`
--
ALTER TABLE `repuestos`
  MODIFY `id_repuesto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id_usuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `ventas`
--
ALTER TABLE `ventas`
  MODIFY `id_venta` int(11) NOT NULL AUTO_INCREMENT;

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
