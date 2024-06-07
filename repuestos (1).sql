-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 07-06-2024 a las 12:39:09
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
-- Base de datos: `repuestos`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `autopartes`
--

CREATE TABLE `autopartes` (
  `id_autoPart` int(11) NOT NULL,
  `codigo_autoPart` varchar(255) NOT NULL,
  `foto_autoPart` varchar(255) NOT NULL,
  `nombre_autoPart` varchar(255) NOT NULL,
  `descripcion_autoPart` varchar(255) NOT NULL,
  `cantidad_minima_autoPart` int(11) NOT NULL,
  `cantidad_autoPart` int(11) NOT NULL,
  `precio_compra_autoPart` decimal(10,2) NOT NULL,
  `precio_autoPart` decimal(10,2) NOT NULL,
  `estado_autoPart` varchar(255) NOT NULL,
  `date_created_autoPart` timestamp NOT NULL DEFAULT current_timestamp(),
  `date_updated_autoPart` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `id_categoria` int(11) NOT NULL,
  `id_motor` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categorias`
--

CREATE TABLE `categorias` (
  `id_categoria` int(11) NOT NULL,
  `nombre_categoria` varchar(255) NOT NULL,
  `estado_categoria` tinyint(4) DEFAULT 1,
  `date_created_categoria` timestamp NOT NULL DEFAULT current_timestamp(),
  `date_updated_categoria` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `categorias`
--

INSERT INTO `categorias` (`id_categoria`, `nombre_categoria`, `estado_categoria`, `date_created_categoria`, `date_updated_categoria`) VALUES
(1, 'Motores', 1, '2024-06-05 20:57:43', '2024-06-05 20:57:43'),
(2, 'Frenos', 1, '2024-06-05 20:58:14', '2024-06-06 14:43:53'),
(3, 'Amortiguacion', 1, '2024-06-05 22:55:04', '2024-06-06 14:50:50');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

CREATE TABLE `clientes` (
  `id_cliente` int(11) NOT NULL,
  `foto_cliente` varchar(255) NOT NULL,
  `nombre_cliente` varchar(255) NOT NULL,
  `apellido_cliente` varchar(255) NOT NULL,
  `email_cliente` varchar(255) NOT NULL,
  `password_cliente` varchar(255) NOT NULL,
  `token_cliente` varchar(255) NOT NULL,
  `token_exp_cliente` varchar(255) NOT NULL,
  `telefono_cliente` varchar(255) NOT NULL,
  `direccion_cliente` varchar(255) NOT NULL,
  `estado_cliente` varchar(255) NOT NULL,
  `nit_cliente` varchar(255) NOT NULL,
  `nombre_nit_cliente` varchar(255) NOT NULL,
  `tipo_cliente` varchar(255) NOT NULL,
  `date_created_cliente` timestamp NOT NULL DEFAULT current_timestamp(),
  `date_updated_cliente` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `compras`
--

CREATE TABLE `compras` (
  `id_compra` int(11) NOT NULL,
  `total_precio_compra` decimal(10,2) NOT NULL,
  `estado_compra` varchar(255) NOT NULL,
  `proveedor_compra` varchar(255) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `date_created_compra` timestamp NOT NULL DEFAULT current_timestamp(),
  `date_updated_compra` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detallecompra`
--

CREATE TABLE `detallecompra` (
  `id_detalleCompra` int(11) NOT NULL,
  `precio_comprado` decimal(10,2) NOT NULL,
  `cantidad_comprada` int(11) NOT NULL,
  `id_compra` int(11) NOT NULL,
  `id_autoPart` int(11) NOT NULL,
  `date_created_dCompra` timestamp NOT NULL DEFAULT current_timestamp(),
  `date_updated_dCompra` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalleventas`
--

CREATE TABLE `detalleventas` (
  `id_detalleVenta` int(11) NOT NULL,
  `cantidad_dVenta` int(11) NOT NULL,
  `precio_vendido_dventa` decimal(10,2) NOT NULL,
  `descuento_dventa` decimal(10,2) NOT NULL,
  `id_venta` int(11) NOT NULL,
  `id_autoPart` int(11) NOT NULL,
  `date_created_dVenta` timestamp NOT NULL DEFAULT current_timestamp(),
  `date_updated_dVenta` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `marcas`
--

CREATE TABLE `marcas` (
  `id_marca` int(11) NOT NULL,
  `nombre_marca` varchar(255) NOT NULL,
  `estado_marca` tinyint(1) NOT NULL DEFAULT 1,
  `date_created_marca` timestamp NOT NULL DEFAULT current_timestamp(),
  `date_updated_marca` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `marcas`
--

INSERT INTO `marcas` (`id_marca`, `nombre_marca`, `estado_marca`, `date_created_marca`, `date_updated_marca`) VALUES
(1, 'bwm', 1, '2024-06-06 15:29:13', '2024-06-06 16:01:07'),
(2, 'volkswagen', 1, '2024-06-06 15:32:26', '2024-06-06 15:32:26'),
(3, 'audi', 1, '2024-06-06 15:37:28', '2024-06-06 15:46:46'),
(5, 'mits', 1, '2024-06-06 15:59:40', '2024-06-06 16:00:54');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `modelos`
--

CREATE TABLE `modelos` (
  `id_modelo` int(11) NOT NULL,
  `nombre_modelo` varchar(255) NOT NULL,
  `estado_modelo` varchar(255) NOT NULL,
  `id_marca_modelo` int(11) NOT NULL,
  `date_created_modelo` timestamp NOT NULL DEFAULT current_timestamp(),
  `date_updated_modelo` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `modelos`
--

INSERT INTO `modelos` (`id_modelo`, `nombre_modelo`, `estado_modelo`, `id_marca_modelo`, `date_created_modelo`, `date_updated_modelo`) VALUES
(1, '02', '', 1, '2024-06-06 23:00:28', '2024-06-06 23:00:28'),
(2, '166', '', 2, '2024-06-06 23:05:20', '2024-06-06 23:05:20'),
(3, '50', '', 3, '2024-06-06 23:09:49', '2024-06-06 23:09:49'),
(4, '340', '', 1, '2024-06-06 23:10:20', '2024-06-06 23:10:20');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `motores`
--

CREATE TABLE `motores` (
  `id_motor` int(11) NOT NULL,
  `tipo_motor` varchar(255) NOT NULL,
  `descripcion_motor` varchar(255) NOT NULL,
  `año_inicio_motor` varchar(255) NOT NULL,
  `año_fin_motor` varchar(255) NOT NULL,
  `date_created_motor` timestamp NOT NULL DEFAULT current_timestamp(),
  `date_updated_motor` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `id_modelo` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pagos`
--

CREATE TABLE `pagos` (
  `id_pago` int(11) NOT NULL,
  `monto_pago` decimal(10,2) NOT NULL,
  `fecha_pago` timestamp NOT NULL DEFAULT current_timestamp(),
  `metodo_pago` varchar(255) NOT NULL,
  `id_venta` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `date_created_pago` timestamp NOT NULL DEFAULT current_timestamp(),
  `date_updated_pago` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id_usuario` int(11) NOT NULL,
  `foto_usuario` varchar(255) NOT NULL,
  `user_usuario` varchar(255) NOT NULL,
  `nombre_usuario` varchar(255) NOT NULL,
  `apellido_usuario` varchar(255) NOT NULL,
  `email_usuario` varchar(255) NOT NULL,
  `password_usuario` varchar(255) NOT NULL,
  `rol_usuario` varchar(255) NOT NULL,
  `estado_usuario` tinyint(1) NOT NULL DEFAULT 1,
  `token_usuario` varchar(255) NOT NULL,
  `token_exp_usuario` varchar(255) NOT NULL,
  `date_created_usuario` timestamp NOT NULL DEFAULT current_timestamp(),
  `date_updated_usuario` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id_usuario`, `foto_usuario`, `user_usuario`, `nombre_usuario`, `apellido_usuario`, `email_usuario`, `password_usuario`, `rol_usuario`, `estado_usuario`, `token_usuario`, `token_exp_usuario`, `date_created_usuario`, `date_updated_usuario`) VALUES
(1, 'views/assets/media/avatars/usuarios/benjo1234/713.jpg', 'benjo1234', 'Benjamin', 'Rojas', 'benj@gmail.com', '$2a$07$azybxcags23425sdg23sdem1CFT2u/A.0JOm/IXWxebxaQOkjS85C', 'administrador', 1, '', '', '2024-06-02 16:41:54', '2024-06-06 19:55:38'),
(14, 'views/assets/media/avatars/usuarios/juan123/352.jpg', 'juan123', 'jauan', 'juan', 'dasd@g.com', '$2a$07$azybxcags23425sdg23sdeeOGUrG2ZGavqekZMMrpw/n1VMhLS8Oe', 'venta', 1, '', '', '2024-06-06 16:47:34', '2024-06-06 17:18:52'),
(16, 'views/assets/media/avatars/usuarios/pitter123/218.jpg', 'pitter123', 'dasd', 'gsdf', 'quena@gmail.com', '$2a$07$azybxcags23425sdg23sdevjZ4ZRzjVDj2wUxKgVeQvWm9IK7lq6W', 'caja', 1, '', '', '2024-06-06 17:19:52', '2024-06-06 17:20:00'),
(18, 'views/assets/media/avatars/usuarios/asdas1/203.jpg', 'asdas1', 'jauan', 'd', 'jauiadf@gmail.com', '$2a$07$azybxcags23425sdg23sdeqW1If.mew2QSXOKCVgUgEZXBrjMIhKq', 'venta', 1, '', '', '2024-06-06 19:58:20', '2024-06-06 19:58:20');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ventas`
--

CREATE TABLE `ventas` (
  `id_venta` int(11) NOT NULL,
  `precio_total_venta` decimal(10,2) NOT NULL,
  `estado_venta` varchar(255) NOT NULL,
  `fecha_venta` timestamp NOT NULL DEFAULT current_timestamp(),
  `id_cliente` int(11) NOT NULL,
  `date_created_venta` timestamp NOT NULL DEFAULT current_timestamp(),
  `date_updated_venta` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `autopartes`
--
ALTER TABLE `autopartes`
  ADD PRIMARY KEY (`id_autoPart`),
  ADD KEY `id_categoria` (`id_categoria`),
  ADD KEY `fk_repuestos_motores` (`id_motor`);

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
  ADD KEY `id_usuario` (`id_usuario`);

--
-- Indices de la tabla `detallecompra`
--
ALTER TABLE `detallecompra`
  ADD PRIMARY KEY (`id_detalleCompra`),
  ADD KEY `id_compra` (`id_compra`),
  ADD KEY `id_autoPart` (`id_autoPart`);

--
-- Indices de la tabla `detalleventas`
--
ALTER TABLE `detalleventas`
  ADD PRIMARY KEY (`id_detalleVenta`),
  ADD KEY `id_venta` (`id_venta`),
  ADD KEY `id_autoPart` (`id_autoPart`);

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
  ADD KEY `id_marca` (`id_marca_modelo`);

--
-- Indices de la tabla `motores`
--
ALTER TABLE `motores`
  ADD PRIMARY KEY (`id_motor`),
  ADD KEY `id_modelo` (`id_modelo`);

--
-- Indices de la tabla `pagos`
--
ALTER TABLE `pagos`
  ADD PRIMARY KEY (`id_pago`),
  ADD KEY `id_venta` (`id_venta`),
  ADD KEY `id_usuario` (`id_usuario`);

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
  ADD KEY `id_cliente` (`id_cliente`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `autopartes`
--
ALTER TABLE `autopartes`
  MODIFY `id_autoPart` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `categorias`
--
ALTER TABLE `categorias`
  MODIFY `id_categoria` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `clientes`
--
ALTER TABLE `clientes`
  MODIFY `id_cliente` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `compras`
--
ALTER TABLE `compras`
  MODIFY `id_compra` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `detallecompra`
--
ALTER TABLE `detallecompra`
  MODIFY `id_detalleCompra` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `detalleventas`
--
ALTER TABLE `detalleventas`
  MODIFY `id_detalleVenta` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `marcas`
--
ALTER TABLE `marcas`
  MODIFY `id_marca` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `modelos`
--
ALTER TABLE `modelos`
  MODIFY `id_modelo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `motores`
--
ALTER TABLE `motores`
  MODIFY `id_motor` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `pagos`
--
ALTER TABLE `pagos`
  MODIFY `id_pago` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id_usuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT de la tabla `ventas`
--
ALTER TABLE `ventas`
  MODIFY `id_venta` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `autopartes`
--
ALTER TABLE `autopartes`
  ADD CONSTRAINT `autoPartes_ibfk_1` FOREIGN KEY (`id_categoria`) REFERENCES `categorias` (`id_categoria`),
  ADD CONSTRAINT `fk_repuestos_motores` FOREIGN KEY (`id_motor`) REFERENCES `motores` (`id_motor`);

--
-- Filtros para la tabla `compras`
--
ALTER TABLE `compras`
  ADD CONSTRAINT `compras_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_usuario`);

--
-- Filtros para la tabla `detallecompra`
--
ALTER TABLE `detallecompra`
  ADD CONSTRAINT `detalleCompra_ibfk_1` FOREIGN KEY (`id_compra`) REFERENCES `compras` (`id_compra`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `detalleCompra_ibfk_2` FOREIGN KEY (`id_autoPart`) REFERENCES `autopartes` (`id_autoPart`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `detalleventas`
--
ALTER TABLE `detalleventas`
  ADD CONSTRAINT `detalleVentas_ibfk_1` FOREIGN KEY (`id_venta`) REFERENCES `ventas` (`id_venta`),
  ADD CONSTRAINT `detalleVentas_ibfk_2` FOREIGN KEY (`id_autoPart`) REFERENCES `autopartes` (`id_autoPart`);

--
-- Filtros para la tabla `modelos`
--
ALTER TABLE `modelos`
  ADD CONSTRAINT `modelos_ibfk_1` FOREIGN KEY (`id_marca_modelo`) REFERENCES `marcas` (`id_marca`);

--
-- Filtros para la tabla `motores`
--
ALTER TABLE `motores`
  ADD CONSTRAINT `motores_ibfk_1` FOREIGN KEY (`id_modelo`) REFERENCES `modelos` (`id_modelo`);

--
-- Filtros para la tabla `pagos`
--
ALTER TABLE `pagos`
  ADD CONSTRAINT `pagos_ibfk_1` FOREIGN KEY (`id_venta`) REFERENCES `ventas` (`id_venta`),
  ADD CONSTRAINT `pagos_ibfk_2` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_usuario`);

--
-- Filtros para la tabla `ventas`
--
ALTER TABLE `ventas`
  ADD CONSTRAINT `ventas_ibfk_1` FOREIGN KEY (`id_cliente`) REFERENCES `clientes` (`id_cliente`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
