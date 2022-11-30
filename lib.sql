-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost:3306
-- Tiempo de generación: 29-11-2022 a las 16:52:58
-- Versión del servidor: 10.4.19-MariaDB

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `lib`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `booking`
--

CREATE TABLE `booking` (
  `user_id` int(11) NOT NULL,
  `content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`content`))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `booking`
--

INSERT INTO `booking` (`user_id`, `content`) VALUES
(6, '[{\"id\":\"2\",\"size\":\"USADO\",\"quantity\":1},{\"id\":\"8\",\"size\":\"USADO\",\"quantity\":1}]'),
(8, '[{\"id\": \"1\", \"size\": \"MEDIUM\", \"quantity\": 1}]');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cart`
--

CREATE TABLE `cart` (
  `user_id` int(11) NOT NULL,
  `content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`content`))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `cart`
--

INSERT INTO `cart` (`user_id`, `content`) VALUES
(6, '[{\"id\":\"2\",\"size\":\"NUEVO\",\"quantity\":2}]'),
(8, '[{\"id\": \"1\", \"size\": \"MEDIUM\", \"quantity\": 1}]'),
(10, '[{\"id\":\"7\",\"size\":\"NUEVO\",\"quantity\":2},{\"id\":\"7\",\"size\":\"USADO\",\"quantity\":1}]');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `costumer_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `orders`
--

INSERT INTO `orders` (`id`, `costumer_id`) VALUES
(1, 2),
(2, 2),
(3, 2),
(4, 2),
(5, 2),
(6, 2),
(7, 2),
(8, 2),
(9, 2),
(10, 2),
(11, 2),
(12, 2),
(13, 2),
(14, 2),
(15, 2),
(16, 2),
(17, 2),
(18, 2),
(19, 2),
(20, 2),
(21, 2),
(22, 2),
(23, 2),
(24, 2),
(25, 2),
(26, 2),
(27, 2),
(28, 2),
(29, 2),
(30, 2),
(31, 2),
(32, 2),
(33, 2),
(34, 2),
(35, 2),
(36, 2),
(37, 2),
(38, 2),
(39, 2),
(40, 2),
(41, 2),
(42, 2),
(43, 2),
(44, 2),
(45, 2),
(46, 2),
(47, 2),
(48, 2),
(49, 2),
(50, 2),
(51, 2),
(52, 2),
(53, 2),
(54, 2),
(55, 2),
(56, 2),
(57, 2),
(58, 2),
(59, 2),
(60, 2),
(61, 2),
(62, 2),
(63, 2),
(64, 2),
(65, 2),
(66, 2),
(67, 2),
(68, 2),
(69, 2),
(80, 6),
(70, 8),
(71, 8),
(72, 8),
(73, 8),
(74, 8),
(75, 8),
(76, 8),
(77, 8),
(78, 8),
(79, 8);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `orders_items`
--

CREATE TABLE `orders_items` (
  `order_id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `size` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `orders_items`
--

INSERT INTO `orders_items` (`order_id`, `item_id`, `quantity`, `size`) VALUES
(64, 1, 3, 'LARGE'),
(65, 1, 1, 'LARGE'),
(65, 1, 1, 'MEDIUM'),
(66, 1, 3, 'MEDIUM'),
(67, 1, 1, 'MEDIUM'),
(68, 1, 3, 'LARGE'),
(68, 1, 3, 'MEDIUM'),
(69, 2, 3, 'MEDIUM'),
(69, 1, 1, 'LARGE'),
(70, 1, 1, 'LARGE'),
(70, 1, 2, 'MEDIUM'),
(70, 1, 3, 'SMALL'),
(70, 3, 4, 'LARGE'),
(71, 1, 2, 'LARGE'),
(71, 1, 2, 'MEDIUM'),
(71, 3, 2, 'LARGE'),
(71, 2, 2, 'LARGE'),
(71, 2, 2, 'MEDIUM'),
(71, 1, 2, 'SMALL'),
(71, 3, 1, 'SMALL'),
(72, 2, 1, 'LARGE'),
(73, 3, 1, 'LARGE'),
(74, 3, 1, 'LARGE'),
(75, 3, 1, 'SMALL'),
(76, 1, 1, 'LARGE'),
(77, 1, 1, 'LARGE'),
(78, 1, 2, 'MEDIUM'),
(79, 1, 2, 'LARGE'),
(80, 1, 3, 'NUEVO'),
(80, 2, 3, 'NUEVO'),
(80, 2, 2, 'USADO'),
(80, 1, 1, 'USADO'),
(80, 1, 1, 'DIGITAL'),
(80, 5, 2, 'NUEVO');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `title` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `year` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `autor` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gender` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `num_pages` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `editorial` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `issn` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `language` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `publication_date` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `category` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `active` bit(1) DEFAULT b'1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `products`
--

INSERT INTO `products` (`id`, `title`, `description`, `year`, `autor`, `gender`, `num_pages`, `editorial`, `issn`, `language`, `publication_date`, `category`, `active`) VALUES
(1, '100 Años de soledad', 'Cien años de soledad es una novela del escritor colombiano Gabriel García Márquez, ganador del Premio Nobel de Literatura en 1982. Es considerada una obra maestra de la literatura hispanoamericana y universal, así como una de las obras más traducidas y leídas en español.​', '1967', 'Gabriel García Marquez', 'Novela', '496', 'Editorial Sudamericana', 'JDHJHDJH', 'Español', '1967-05-05', 'Novela', b'1'),
(2, 'La rebelión de las ratas', 'La Rebelión de las Ratas es una novela del escritor colombiano Fernando Soto Aparicio.​ Cuenta la historia de Timbalí, un pueblo ficticio que el escritor ubica en el departamento de Boyacá y que se encuentra bajo el dominio de multinacionales mineras.', '1962', 'Fernando Soto Aparicio', 'Novela', '396', 'Plaza & Janés S. A', 'ddf3443', 'Español', '1962-02-01', 'Drama', b'1'),
(3, 'El señor de los anillos', 'El Señor de los Anillos es una novela de fantasía épica escrita por el filólogo y escritor británico J. R. R. Tolkien.', '1954', 'J. R. R. Tolkien', 'Literatura fantástica', '500', 'George Allen & Unwin HarperCollins', '68856', 'Inglés', '1954-02-01', 'Ficción', b'1'),
(4, 'El principito', 'El principito es una novela corta y la obra más famosa del escritor y aviador francés Antoine de Saint-Exupéry', '1943', 'Antoine de Saint-Exupéry', 'Literatura infantil', '150', 'Extrangera', '35656565', 'Francés', '1943-04-06', 'Fábula', b'1'),
(5, '1984', '1984 es una novela política de ficción distópica, escrita por George Orwell entre 1947 y 1948 y publicada el 8 de junio de 1949. ', '1949', 'George Orwell', 'Ciencia ficción', '300', 'Editorial', 'dklsklk', 'Inglés', '1984-02-01', 'Social', b'1'),
(6, 'Viaje al centro de la tierra', 'Viaje al centro de la Tierra es una novela de Julio Verne, publicada el 25 de noviembre de 1864; la cual trata de la expedición de un profesor de mineralogía, Otto Lidenbrock, su sobrino Axel y un guía llamado Hans al interior de la Tierra.', '1864', 'Julio Verne', 'Novela', '400', 'Edito', 'lkdlsklsdk', 'Francés', '1864-02-01', 'Aventuras', b'1'),
(7, 'El sueño del Celta', 'El sueño del celta es una novela del escritor peruano Mario Vargas Llosa.​ La historia recrea la vida de Roger Casement y el título hace referencia a un poema del mismo nombre que fue escrito por el protagonista de la narración.​ ', '2010', 'Mario Vargas Llosa', 'Novela', '455', 'Congo', '3456', 'Español', '2010-02-01', 'Historia', b'1'),
(8, 'Rayuela', 'Rayuela es la segundanovela del escritor argentino Julio Cortázar. Escrita en Madrid y publicada por primera vez el 18 de febrero de 1963, constituye una de las obras centrales del boom latinoamericano y de la literatura en español.​​​', '1963', 'Julio Cortazar', 'Novela', '500', 'Editorial Sudamericana', '6565656', 'Español', '1963-02-18', 'Antinovela', b'1'),
(9, 'La increíble y triste historia de la cándida Eréndira y de su abuela desalmada', 'La increíble y triste historia de la cándida Eréndira y de su abuela desalmada es una novela corta o cuento largo escrito por Gabriel García Márquez en 1972 y publicado por primera vez en 1974. Es una obra en la que se trata ampliamente el tema de la prostitución de menores en el Caribe Sudamericano.', '1972', 'Gabriel García Marquez', 'Novela', '200', 'Editorial Sudamericana', '123554', 'Español', '1972-02-01', 'Metafórico', b'1'),
(10, 'El coronel no tiene quien le escriba', 'El coronel no tiene quien le escriba es una novela corta publicada por el escritor colombiano Gabriel García Márquez en 1961. Es una de las más célebres de las escritas por el autor, y su protagonista, un viejo coronel que espera la pensión que nunca llega, es considerado como uno de los personajes más entrañables de la literatura hispanoamericana del siglo XX. ', '1961', 'Gabriel García Marquez', 'Novel', '200', 'Editorial Sudamericana', '122344', 'Español', '1961-02-01', 'Cuento corto', b'1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sessions`
--

CREATE TABLE `sessions` (
  `session_id` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `expires` int(11) UNSIGNED NOT NULL,
  `data` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `sessions`
--

INSERT INTO `sessions` (`session_id`, `expires`, `data`) VALUES
('QCq4aBq15RqBEmgX0WN_LdxY_wQyeCNU', 1669816834, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"passport\":{\"user\":10}}'),
('_nt4c1nK4Yn2Ejk1AgT2IO8gBs8ew78i', 1669775218, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"passport\":{\"user\":6},\"msg\":false,\"multer\":3}');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sizes`
--

CREATE TABLE `sizes` (
  `product_id` int(11) DEFAULT NULL,
  `size` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price` decimal(15,2) DEFAULT NULL,
  `stock` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `sizes`
--

INSERT INTO `sizes` (`product_id`, `size`, `price`, `stock`) VALUES
(1, 'NUEVO', '100000.00', 9),
(1, 'USADO', '25500.00', 7),
(1, 'DIGITAL', '30000.00', 0),
(2, 'NUEVO', '25000.00', 10),
(2, 'USADO', '10000.00', 12),
(2, 'DIGITAL', '8000.00', 500),
(3, 'NUEVO', '50000.00', 10),
(3, 'USADO', '20000.00', 10),
(3, 'DIGITAL', '15000.00', 10),
(4, 'NUEVO', '20000.00', 15),
(4, 'USADO', '10000.00', 0),
(4, 'DIGITAL', '8000.00', 500),
(5, 'NUEVO', '50000.00', 20),
(5, 'USADO', '25000.00', 12),
(5, 'DIGITAL', '10000.00', 500),
(6, 'NUEVO', '60000.00', 10),
(6, 'USADO', '30000.00', 10),
(6, 'DIGITAL', '15000.00', 20),
(7, 'NUEVO', '50000.00', 10),
(7, 'USADO', '30000.00', 10),
(7, 'DIGITAL', '1000.00', 10),
(8, 'NUEVO', '50000.00', 10),
(8, 'USADO', '20000.00', 12),
(8, 'DIGITAL', '10000.00', 10),
(9, 'NUEVO', '10000.00', 10),
(9, 'USADO', '3000.00', 10),
(9, 'DIGITAL', '1000.00', 500),
(10, 'NUEVO', '15000.00', 12),
(10, 'USADO', '6000.00', 12),
(10, 'DIGITAL', '2000.00', 500);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `user_type` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id`, `user_type`, `name`, `password`, `email`) VALUES
(1, NULL, 'Maria Almeida', '$2b$10$vNPDPAva//83gbyad.lIfuo7buBxwvlOuJgWYdJi7PH/5AZ.h/rrm', 'user@user.com'),
(2, NULL, 'Maria', '$2b$10$./ejLdYX5K8nKF8C1MdrAOPq5MILYUccGke/AmJqPjxrI0w5uqN/.', 'admin@assemblerschool.com'),
(3, NULL, 'Betty Boop', '$2b$10$Nf8LdZP/xa0jlVNfP6g5a.Mzsa21KME8l.QHnhCpU4P1ShQTyNnna', 'betty@boop.com'),
(4, NULL, 'Maria12', '$2b$10$AcLQmQ6RuXSAN.mql0/jre2HCYwvd8Jv1rP3fb2jFteH.v8pwrgS.', 'admin@assemblerschool.com'),
(5, NULL, 'Alfred Garcia', '$2b$10$fNyGBL3Wkkv1cWXlYePreOh1cHjHIhEGcKXXlrKqrI.SRkgDe2cdW', 'alfred@garcia.com'),
(6, 'admin', 'Juan José Aroca', '$2b$10$L9DcqwOw93YyjcPkn6MlveVYy92fbv4l/tEOI4L3rC1ziXmVlN3k6', 'admin@admin.com'),
(7, 'employee', 'Juan José Delgado', '$2b$10$twoCKEb81i86JaPqhV9f9O8Klsx/bezijm/32Oii/s42frETlovjy', 'employee@employee.com'),
(8, NULL, 'Guilherme Carra', '$2b$10$f0rgUInqHFsrAyfK/vwPtO.psMpygisDA9n9ifQEDofaaf/WKkXzm', 'gui_gc@hotmail.com'),
(9, 'employee', ' Isabela Duque', '$2b$10$Lx3U74Y73zekmCQEtNk3UeyA9JSqAeAJVbnMEkE1NBTmpqRfLLzdy', 'isa@utp.edu.co'),
(10, NULL, 'lau', '$2b$10$pyWn1PDYu5LQSEkfiztaBeYH5QEATeYVXjwggLW1nargwhxVRKg5K', 'lau@gmail.com'),
(11, NULL, 'emma', '$2b$10$fyAuAlGZdZgANQK7y.3zkeM9WF7E3CQ6xMdHKn.9u/Jm3jsAuk2wO', 'emma@gmail.com');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `booking`
--
ALTER TABLE `booking`
  ADD PRIMARY KEY (`user_id`);

--
-- Indices de la tabla `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`user_id`);

--
-- Indices de la tabla `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_UNIQUE` (`id`),
  ADD KEY `user_id_idx` (`costumer_id`);

--
-- Indices de la tabla `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`session_id`);

--
-- Indices de la tabla `sizes`
--
ALTER TABLE `sizes`
  ADD KEY `product_id` (`product_id`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=81;

--
-- AUTO_INCREMENT de la tabla `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `booking`
--
ALTER TABLE `booking`
  ADD CONSTRAINT `fk_booking` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Filtros para la tabla `cart`
--
ALTER TABLE `cart`
  ADD CONSTRAINT `fk_cart` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Filtros para la tabla `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `costumer_id` FOREIGN KEY (`costumer_id`) REFERENCES `users` (`id`);

--
-- Filtros para la tabla `sizes`
--
ALTER TABLE `sizes`
  ADD CONSTRAINT `sizes_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
