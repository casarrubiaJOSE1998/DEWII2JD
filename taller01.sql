-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 07-04-2024 a las 00:47:45
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
-- Base de datos: `taller01`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tabla1`
--

CREATE TABLE `tabla1` (
  `id` int(11) NOT NULL,
  `nombre_cliente` varchar(50) DEFAULT NULL,
  `apellido_cliente` varchar(50) DEFAULT NULL,
  `direccion_cliente` varchar(100) DEFAULT NULL,
  `telefono_cliente` varchar(15) DEFAULT NULL,
  `email_cliente` varchar(50) DEFAULT NULL,
  `tabla2_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tabla1`
--

INSERT INTO `tabla1` (`id`, `nombre_cliente`, `apellido_cliente`, `direccion_cliente`, `telefono_cliente`, `email_cliente`, `tabla2_id`) VALUES
(1, 'Juan', 'Pérez', 'Calle 123', '555-1234', 'juan@gmail.com', 1),
(2, 'María', 'Gómez', 'Avenida 456', '555-5678', 'maria@gmail.com', 2),
(3, 'Pedro', 'López', 'Carrera 789', '555-9012', 'pedro@gmail.com', 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tabla2`
--

CREATE TABLE `tabla2` (
  `id` int(11) NOT NULL,
  `nombre_producto` varchar(100) DEFAULT NULL,
  `descripcion_producto` text DEFAULT NULL,
  `precio_producto` decimal(10,2) DEFAULT NULL,
  `fecha_creacion` date DEFAULT NULL,
  `disponible` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tabla2`
--

INSERT INTO `tabla2` (`id`, `nombre_producto`, `descripcion_producto`, `precio_producto`, `fecha_creacion`, `disponible`) VALUES
(1, 'Camisa', 'Camisa de algodón', 29.99, '2024-04-05', 5),
(2, 'Pantalón', 'Pantalón vaquero', 39.99, '2024-04-05', 10),
(3, 'Zapatos', 'Zapatos deportivos', 49.99, '2024-04-05', 20),
(5, 'Bananos', 'Bananos Frescos', 30.99, '2024-04-05', 50);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tabla3`
--

CREATE TABLE `tabla3` (
  `id` int(11) NOT NULL,
  `nombre_proveedor` varchar(100) DEFAULT NULL,
  `direccion_proveedor` varchar(100) DEFAULT NULL,
  `telefono_proveedor` varchar(15) DEFAULT NULL,
  `email_proveedor` varchar(50) DEFAULT NULL,
  `tabla2_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tabla3`
--

INSERT INTO `tabla3` (`id`, `nombre_proveedor`, `direccion_proveedor`, `telefono_proveedor`, `email_proveedor`, `tabla2_id`) VALUES
(1, 'Proveedor A', 'Calle Proveedor A', '555-1234', 'proveedora@gmail.com', 1),
(2, 'Proveedor B', 'Avenida Proveedor B', '555-5678', 'proveedorb@gmail.com', 2),
(3, 'Proveedor C', 'Carrera Proveedor C', '555-9012', 'proveedorc@gmail.com', 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tabla4`
--

CREATE TABLE `tabla4` (
  `id` int(11) NOT NULL,
  `nombre_empleado` varchar(100) DEFAULT NULL,
  `apellido_empleado` varchar(100) DEFAULT NULL,
  `direccion_empleado` varchar(100) DEFAULT NULL,
  `telefono_empleado` varchar(15) DEFAULT NULL,
  `email_empleado` varchar(50) DEFAULT NULL,
  `tabla2_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tabla4`
--

INSERT INTO `tabla4` (`id`, `nombre_empleado`, `apellido_empleado`, `direccion_empleado`, `telefono_empleado`, `email_empleado`, `tabla2_id`) VALUES
(1, 'Carlos', 'Martínez', 'Calle Empleado 123', '555-1234', 'carlos@gmail.com', 1),
(2, 'Ana', 'Rodríguez', 'Avenida Empleado 456', '555-5678', 'ana@gmail.com', 2),
(3, 'Luis', 'García', 'Carrera Empleado 789', '555-9012', 'luis@gmail.com', 3);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `tabla1`
--
ALTER TABLE `tabla1`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tabla2_id` (`tabla2_id`);

--
-- Indices de la tabla `tabla2`
--
ALTER TABLE `tabla2`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tabla3`
--
ALTER TABLE `tabla3`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tabla2_id` (`tabla2_id`);

--
-- Indices de la tabla `tabla4`
--
ALTER TABLE `tabla4`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tabla2_id` (`tabla2_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `tabla1`
--
ALTER TABLE `tabla1`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `tabla2`
--
ALTER TABLE `tabla2`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `tabla3`
--
ALTER TABLE `tabla3`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `tabla4`
--
ALTER TABLE `tabla4`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `tabla1`
--
ALTER TABLE `tabla1`
  ADD CONSTRAINT `tabla1_ibfk_1` FOREIGN KEY (`tabla2_id`) REFERENCES `tabla2` (`id`);

--
-- Filtros para la tabla `tabla3`
--
ALTER TABLE `tabla3`
  ADD CONSTRAINT `tabla3_ibfk_1` FOREIGN KEY (`tabla2_id`) REFERENCES `tabla2` (`id`);

--
-- Filtros para la tabla `tabla4`
--
ALTER TABLE `tabla4`
  ADD CONSTRAINT `tabla4_ibfk_1` FOREIGN KEY (`tabla2_id`) REFERENCES `tabla2` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
