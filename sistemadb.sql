-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 08-06-2021 a las 22:04:17
-- Versión del servidor: 10.4.17-MariaDB
-- Versión de PHP: 7.4.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `sistemadb`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `username` varchar(30) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  `perfil` varchar(30) DEFAULT NULL,
  `estatus` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`id`, `nombre`, `email`, `username`, `password`, `perfil`, `estatus`) VALUES
(1, 'luis', 'luis@gmail.com', 'luis1', '827ccb0eea8a706c4c34a16891f84e7b', 'administrador', 'activo'),
(2, 'juan', 'juan@gmail.com', 'juan1', '827ccb0eea8a706c4c34a16891f84e7b', 'administrador', 'activo'),
(3, 'pedro', 'pedro@gmail.com', 'pedro1', '827ccb0eea8a706c4c34a16891f84e7b', 'editor', 'activo'),
(4, 'Carlos', 'carlos@gmail.com', 'carlos1', '827ccb0eea8a706c4c34a16891f84e7b', 'editor', 'inactivo'),
(5, 'jose', 'jose@gmail.com', 'jose1', '827ccb0eea8a706c4c34a16891f84e7b', 'administrador', 'activo'),
(7, 'angel', 'angel@gmail.com', 'angel1', '827ccb0eea8a706c4c34a16891f84e7b', 'administrador', 'activo'),
(8, 'roberto', 'roberto@gmail.com', 'roberto1', '827ccb0eea8a706c4c34a16891f84e7b', 'editor', 'activo');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `vacante`
--

CREATE TABLE `vacante` (
  `id` int(11) NOT NULL,
  `fechaPublicacion` date DEFAULT NULL,
  `nombre` varchar(250) DEFAULT NULL,
  `descripcion` text DEFAULT NULL,
  `detalle` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `vacante`
--

INSERT INTO `vacante` (`id`, `fechaPublicacion`, `nombre`, `descripcion`, `detalle`) VALUES
(1, '2021-05-27', 'Ingeniero en Computacion', 'Desarrollo de Sistemas', 'RequerimientosÃÂ \r\njava\r\ncss'),
(2, '2021-05-27', 'Ingeniero en Computacion', 'desarrollador', 'java\r\nphp'),
(3, '2021-05-27', 'Ingeniero en Computacion', 'programador', 'java php mysql'),
(4, '2021-05-28', 'Maestro', 'Dar clases de ingles', 'Requerimientos.\r\nSaber los conceptos basicos.\r\nconstancia\r\ncursos');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `vacante`
--
ALTER TABLE `vacante`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `vacante`
--
ALTER TABLE `vacante`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
