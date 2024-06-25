-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 25-06-2024 a las 03:32:03
-- Versión del servidor: 10.4.28-MariaDB
-- Versión de PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `farmacia`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

CREATE TABLE `clientes` (
  `id_cliente` int(11) NOT NULL,
  `nombre` tinytext NOT NULL,
  `direccion` varchar(20) NOT NULL,
  `telefono` varchar(20) NOT NULL,
  `email` varchar(30) NOT NULL,
  `con_credito` tinyint(1) NOT NULL,
  `id_datos_bancarios` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `datos_bancarios`
--

CREATE TABLE `datos_bancarios` (
  `id_datos_bancarios` int(11) NOT NULL,
  `titular` tinytext NOT NULL,
  `numero_tarjeta` varchar(20) NOT NULL,
  `fecha_vencimiento` date NOT NULL,
  `codigo_seguridad` varchar(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `familias`
--

CREATE TABLE `familias` (
  `id_codigo_familia` int(11) NOT NULL,
  `nombre_familia` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `laboratorios`
--

CREATE TABLE `laboratorios` (
  `id_codigo_laboratorio` int(11) NOT NULL,
  `nombre_laboratorio` varchar(30) NOT NULL,
  `telefono` varchar(20) NOT NULL,
  `direccion` varchar(20) NOT NULL,
  `fax` varchar(30) NOT NULL,
  `nombre_contacto` tinytext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `medicamentos`
--

CREATE TABLE `medicamentos` (
  `id_codigo_medicamento` int(11) NOT NULL,
  `nombre_medicamento` varchar(30) NOT NULL,
  `tipo_medicamento` tinytext NOT NULL,
  `unidades_stock` int(11) NOT NULL,
  `unidades_vendidas` int(11) NOT NULL,
  `precio` decimal(10,0) NOT NULL,
  `requiere_receta` tinyint(1) NOT NULL,
  `id_codigo_laboratorio` int(11) NOT NULL,
  `id_codigo_familia` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pagos`
--

CREATE TABLE `pagos` (
  `id_pago` int(11) NOT NULL,
  `metodo_pago` varchar(20) NOT NULL,
  `fecha_compra` datetime NOT NULL,
  `fecha_pago` datetime NOT NULL,
  `unidades_compradas` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedidos`
--

CREATE TABLE `pedidos` (
  `id_pago` int(11) NOT NULL,
  `id_cliente` int(11) NOT NULL,
  `id_codigo_medicamento` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`id_cliente`);

--
-- Indices de la tabla `datos_bancarios`
--
ALTER TABLE `datos_bancarios`
  ADD PRIMARY KEY (`id_datos_bancarios`);

--
-- Indices de la tabla `familias`
--
ALTER TABLE `familias`
  ADD PRIMARY KEY (`id_codigo_familia`);

--
-- Indices de la tabla `laboratorios`
--
ALTER TABLE `laboratorios`
  ADD PRIMARY KEY (`id_codigo_laboratorio`);

--
-- Indices de la tabla `medicamentos`
--
ALTER TABLE `medicamentos`
  ADD PRIMARY KEY (`id_codigo_medicamento`);

--
-- Indices de la tabla `pagos`
--
ALTER TABLE `pagos`
  ADD PRIMARY KEY (`id_pago`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
