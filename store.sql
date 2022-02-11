-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost
-- Tiempo de generación: 11-02-2022 a las 04:02:07
-- Versión del servidor: 8.0.26-0ubuntu0.20.04.2
-- Versión de PHP: 8.0.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `store`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `buy`
--

CREATE TABLE `buy` (
  `id` int NOT NULL,
  `id_user` int NOT NULL,
  `created` datetime NOT NULL,
  `status` int NOT NULL,
  `total` float(10,2) NOT NULL,
  `payment_method` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `buy`
--

INSERT INTO `buy` (`id`, `id_user`, `created`, `status`, `total`, `payment_method`) VALUES
(1, 2, '0001-01-01 00:00:00', 0, 110000.00, NULL),
(2, 2, '0001-01-01 00:00:00', 0, 110000.00, NULL),
(3, 2, '0001-01-01 00:00:00', 0, 110000.00, NULL),
(4, 2, '0001-01-01 00:00:00', 0, 110000.00, NULL),
(5, 2, '0001-01-01 00:00:00', 0, 110000.00, NULL),
(6, 2, '0001-01-01 00:00:00', 0, 110000.00, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `buy_detail`
--

CREATE TABLE `buy_detail` (
  `id` int NOT NULL,
  `id_buy` int NOT NULL,
  `id_product` int NOT NULL,
  `quantity` int NOT NULL,
  `unit_price` float(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `buy_detail`
--

INSERT INTO `buy_detail` (`id`, `id_buy`, `id_product`, `quantity`, `unit_price`) VALUES
(1, 0, 1, 5, 20000.00),
(2, 2, 1, 5, 20000.00),
(3, 3, 1, 5, 20000.00),
(4, 4, 1, 5, 20000.00),
(5, 4, 2, 10, 1000.00),
(6, 5, 1, 5, 20000.00),
(7, 5, 2, 10, 1000.00),
(8, 6, 1, 5, 20000.00),
(9, 6, 2, 10, 1000.00);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `product`
--

CREATE TABLE `product` (
  `id` int NOT NULL,
  `id_category` int NOT NULL,
  `code` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `description` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `price` float(10,2) NOT NULL,
  `image` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `product`
--

INSERT INTO `product` (`id`, `id_category`, `code`, `name`, `description`, `price`, `image`) VALUES
(1, 1, '1001', 'Pastel', 'Pastel grande', 10000.00, 'C:\\Users\\caraguta\\Documents\\PRUEBA_PLAN\\StoreApi\\StoreApi/Files/603c4a71bd20c324b9ea0bdb_maxresdefault.jpg'),
(2, 1, '1001', 'Postre', 'Pastel grande', 10000.00, 'C:\\Users\\caraguta\\Documents\\PRUEBA_PLAN\\StoreApi\\StoreApi/Files/603c4a71bd20c324b9ea0bdb_maxresdefault.jpg');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `product_category`
--

CREATE TABLE `product_category` (
  `id` int NOT NULL,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `product_category`
--

INSERT INTO `product_category` (`id`, `name`) VALUES
(1, 'Pasteles'),
(2, 'Desayunos Sorpresa'),
(3, 'Postres');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `user`
--

CREATE TABLE `user` (
  `id` int NOT NULL,
  `first_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `last_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `role` int NOT NULL DEFAULT '0',
  `address` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `email` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `password` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `user`
--

INSERT INTO `user` (`id`, `first_name`, `last_name`, `role`, `address`, `email`, `password`) VALUES
(1, 'CARLOS FELIPE', 'AGUIRRE TABORDA', 1, 'CALLE 10a NORTE #18-36 PROVIDENCIA', 'carlos@email.com', '123456'),
(3, 'Juliana', 'Guzman', 0, 'Calle 10A #1836', 'juliana@email.com', '123456');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `buy`
--
ALTER TABLE `buy`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `buy_detail`
--
ALTER TABLE `buy_detail`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `product_category`
--
ALTER TABLE `product_category`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `buy`
--
ALTER TABLE `buy`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `buy_detail`
--
ALTER TABLE `buy_detail`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `product`
--
ALTER TABLE `product`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `product_category`
--
ALTER TABLE `product_category`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `user`
--
ALTER TABLE `user`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
