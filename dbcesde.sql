-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 05-08-2024 a las 19:34:25
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
-- Base de datos: `dbcesde`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tblcursos`
--

CREATE TABLE `tblcursos` (
  `pkcodigo` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `descripcion` varchar(100) NOT NULL,
  `duracion_semanas` int(11) NOT NULL,
  `precio` decimal(10,0) NOT NULL,
  `fecha_inicio` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fkcodigo_docente` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `tblcursos`
--

INSERT INTO `tblcursos` (`pkcodigo`, `nombre`, `descripcion`, `duracion_semanas`, `precio`, `fecha_inicio`, `fkcodigo_docente`) VALUES
(1, 'Desarrollo de software', 'Programacion orientada a objetos, desarrollo de software.', 12, '2200000', '2024-08-05 16:46:33', 1193098305),
(2, 'Diseño grafico', 'Diseño grafico especializado', 12, '1900000', '2024-08-05 16:47:38', 54321);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbldocentes`
--

CREATE TABLE `tbldocentes` (
  `pkcodigo` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `correo` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `tbldocentes`
--

INSERT INTO `tbldocentes` (`pkcodigo`, `nombre`, `correo`) VALUES
(54321, 'Isabela', 'isabelarivas@gmail.com'),
(1193098305, 'Ana Yuliza Garrido', 'anagarrido@gmail.com');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tblroles`
--

CREATE TABLE `tblroles` (
  `pkcodigo` int(11) NOT NULL,
  `descripcion` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `tblroles`
--

INSERT INTO `tblroles` (`pkcodigo`, `descripcion`) VALUES
(1, 'Admin'),
(2, 'Estandar');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tblusuarios`
--

CREATE TABLE `tblusuarios` (
  `pkcodigo` int(11) NOT NULL,
  `nombres` varchar(100) NOT NULL,
  `contraseña` varchar(50) NOT NULL,
  `fkcodigo_roles` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `tblusuarios`
--

INSERT INTO `tblusuarios` (`pkcodigo`, `nombres`, `contraseña`, `fkcodigo_roles`) VALUES
(12345, 'Eva Martinez', '12345', 2),
(1193098300, 'Isaac Garrido', '011995IGv', 1);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `tblcursos`
--
ALTER TABLE `tblcursos`
  ADD PRIMARY KEY (`pkcodigo`),
  ADD KEY `fkcodigo_docente` (`fkcodigo_docente`);

--
-- Indices de la tabla `tbldocentes`
--
ALTER TABLE `tbldocentes`
  ADD PRIMARY KEY (`pkcodigo`);

--
-- Indices de la tabla `tblroles`
--
ALTER TABLE `tblroles`
  ADD PRIMARY KEY (`pkcodigo`);

--
-- Indices de la tabla `tblusuarios`
--
ALTER TABLE `tblusuarios`
  ADD PRIMARY KEY (`pkcodigo`),
  ADD KEY `fkcodigo_roles` (`fkcodigo_roles`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `tblcursos`
--
ALTER TABLE `tblcursos`
  MODIFY `pkcodigo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `tblroles`
--
ALTER TABLE `tblroles`
  MODIFY `pkcodigo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `tblcursos`
--
ALTER TABLE `tblcursos`
  ADD CONSTRAINT `tblcursos_ibfk_1` FOREIGN KEY (`fkcodigo_docente`) REFERENCES `tbldocentes` (`pkcodigo`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `tblusuarios`
--
ALTER TABLE `tblusuarios`
  ADD CONSTRAINT `tblusuarios_ibfk_1` FOREIGN KEY (`fkcodigo_roles`) REFERENCES `tblroles` (`pkcodigo`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
