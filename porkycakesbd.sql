-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 22-10-2024 a las 02:32:40
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
-- Base de datos: `porkycakesbd`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ingredientes`
--

CREATE TABLE `ingredientes` (
  `idIngrediente` int(11) NOT NULL,
  `nombre` varchar(30) DEFAULT NULL,
  `stock` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `ingredientes`
--

INSERT INTO `ingredientes` (`idIngrediente`, `nombre`, `stock`) VALUES
(1, 'Harina', 500),
(2, 'Azúcar', 400),
(3, 'Mantequilla', 300),
(4, 'Huevo', 200),
(5, 'Leche', 250),
(6, 'Vainilla', 150),
(7, 'Cocoa', 200),
(8, 'Chocolate', 180),
(9, 'Naranjas', 100),
(10, 'Fresas', 120),
(11, 'Arándanos', 160),
(12, 'Zanahorias', 110),
(13, 'Coco Rallado', 130),
(14, 'Dulce de Leche', 200),
(15, 'Yogur', 140),
(16, 'Mermelada', 150),
(17, 'Nueces', 160),
(18, 'Galletas Trituradas', 140),
(19, 'Jengibre', 100),
(20, 'Crema', 150);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ingredientesxrecetas`
--

CREATE TABLE `ingredientesxrecetas` (
  `idIngredienteXrecetas` int(11) NOT NULL,
  `idIngrediente` int(11) NOT NULL,
  `idReceta` int(11) NOT NULL,
  `cantidad` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `ingredientesxrecetas`
--

INSERT INTO `ingredientesxrecetas` (`idIngredienteXrecetas`, `idIngrediente`, `idReceta`, `cantidad`) VALUES
(1, 1, 1, 500),
(2, 2, 1, 200),
(3, 3, 1, 150),
(4, 4, 1, 3),
(5, 5, 2, 250),
(6, 6, 2, 100),
(7, 7, 2, 2),
(8, 8, 3, 300),
(9, 9, 3, 100),
(10, 10, 3, 1),
(11, 11, 4, 400),
(12, 12, 4, 300),
(13, 13, 5, 500),
(14, 14, 5, 200),
(15, 15, 6, 200),
(16, 16, 6, 100),
(17, 17, 7, 300),
(18, 18, 7, 150),
(19, 19, 8, 200),
(20, 20, 8, 250);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pasos`
--

CREATE TABLE `pasos` (
  `idPaso` int(11) NOT NULL,
  `descripcionPaso` varchar(45) DEFAULT NULL,
  `idReceta` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `pasos`
--

INSERT INTO `pasos` (`idPaso`, `descripcionPaso`, `idReceta`) VALUES
(1, 'Precalentar el horno a 180°C.', 1),
(2, 'Mezclar los ingredientes secos.', 1),
(3, 'Agregar los ingredientes húmedos y mezclar bi', 1),
(4, 'Verter la mezcla en el molde.', 1),
(5, 'Enfriar durante 30 minutos.', 1),
(6, 'Batir la crema y decorar.', 1),
(7, 'Precalentar el horno a 160°C.', 2),
(8, 'Batir el azúcar y los huevos.', 2),
(9, 'Agregar la leche y el limón.', 2),
(10, 'Hornear durante 45 minutos.', 2),
(11, 'Enfriar y desmoldar.', 2),
(12, 'Decorar con limón.', 2),
(13, 'Precalentar el horno a 180°C.', 3),
(14, 'Mezclar mantequilla y azúcar.', 3),
(15, 'Agregar huevo y vainilla.', 3),
(16, 'Incorporar harina y chocolate.', 3),
(17, 'Hornear durante 25 minutos.', 3),
(18, 'Enfriar y decorar.', 3),
(19, 'Precalentar el horno a 180°C.', 4),
(20, 'Preparar la base de galleta.', 4);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `idProducto` int(11) NOT NULL,
  `nombre` varchar(30) DEFAULT NULL,
  `precio` int(11) DEFAULT NULL,
  `stock` int(11) DEFAULT NULL,
  `sinTacc` tinyint(4) DEFAULT NULL,
  `tamaño` varchar(30) DEFAULT NULL,
  `idRecetaDerivada` int(11) NOT NULL,
  `idReceta` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`idProducto`, `nombre`, `precio`, `stock`, `sinTacc`, `tamaño`, `idRecetaDerivada`, `idReceta`) VALUES
(1, 'Torta de Chocolate', 2000, 50, 0, '1kg', 1, 1),
(2, 'Pastel de Limón', 2500, 30, 1, '1kg', 2, 2),
(3, 'Galletas de Vainilla', 800, 100, 0, '500g', 3, 3),
(4, 'Tarta de Fresa', 2200, 25, 1, '1kg', 4, 4),
(5, 'Cheesecake', 3000, 20, 1, '1kg', 5, 5),
(6, 'Bizcocho de Naranja', 1500, 40, 0, '500g', 6, 6),
(7, 'Cupcakes de Chocolate', 3000, 45, 0, '12 unidades', 7, 7),
(8, 'Muffins de Arándano', 1800, 60, 0, '6 unidades', 8, 8),
(9, 'Tarta de Zanahoria', 2300, 35, 1, '1kg', 9, 9),
(10, 'Tarta de Coco', 2400, 28, 1, '1kg', 10, 10),
(11, 'Galletas de Chocolate', 900, 150, 0, '250g', 11, 11),
(12, 'Pudin de Pan', 1600, 45, 1, '500g', 12, 12),
(13, 'Pastel de Tres Leches', 2800, 20, 1, '1kg', 13, 13),
(14, 'Galletas de Avena', 1000, 70, 0, '300g', 14, 14),
(15, 'Torta de Maracuyá', 2500, 30, 1, '1kg', 15, 15),
(16, 'Brownies', 1500, 55, 0, '500g', 16, 16),
(17, 'Tarta de Dulce de Leche', 2700, 25, 1, '1kg', 17, 17),
(18, 'Galletas de Jengibre', 950, 80, 0, '300g', 18, 18),
(19, 'Pastel de Chocolate Blanco', 2600, 22, 1, '1kg', 19, 19),
(20, 'Galletas Sabor Limón', 900, 90, 0, '300g', 20, 20);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `recetas`
--

CREATE TABLE `recetas` (
  `idReceta` int(11) NOT NULL,
  `nombre` varchar(30) DEFAULT NULL,
  `tiempoPreparacion` varchar(45) DEFAULT NULL,
  `porciones` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `recetas`
--

INSERT INTO `recetas` (`idReceta`, `nombre`, `tiempoPreparacion`, `porciones`) VALUES
(1, 'Torta de Chocolate', '45 minutos', 8),
(2, 'Pastel de Limón', '60 minutos', 10),
(3, 'Galletas de Vainilla', '30 minutos', 12),
(4, 'Tarta de Fresa', '50 minutos', 8),
(5, 'Cheesecake', '70 minutos', 8),
(6, 'Bizcocho de Naranja', '40 minutos', 12),
(7, 'Cupcakes de Chocolate', '45 minutos', 24),
(8, 'Muffins de Arándano', '35 minutos', 12),
(9, 'Tarta de Zanahoria', '60 minutos', 8),
(10, 'Tarta de Coco', '55 minutos', 10),
(11, 'Galletas de Chocolate', '25 minutos', 20),
(12, 'Pudin de Pan', '60 minutos', 10),
(13, 'Pastel de Tres Leches', '90 minutos', 12),
(14, 'Galletas de Avena', '30 minutos', 15),
(15, 'Torta de Maracuyá', '50 minutos', 8),
(16, 'Brownies', '40 minutos', 16),
(17, 'Tarta de Dulce de Leche', '50 minutos', 10),
(18, 'Galletas de Jengibre', '30 minutos', 24),
(19, 'Pastel de Chocolate Blanco', '60 minutos', 10),
(20, 'Galletas Sabor Limón', '30 minutos', 20);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `recetasbases`
--

CREATE TABLE `recetasbases` (
  `idRecetaBase` int(11) NOT NULL,
  `tamaño` varchar(30) DEFAULT NULL,
  `idReceta` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `recetasbases`
--

INSERT INTO `recetasbases` (`idRecetaBase`, `tamaño`, `idReceta`) VALUES
(1, 'Pequeño', 1),
(2, 'Grande', 2),
(3, 'Mediano', 3),
(4, 'Familiar', 4),
(5, 'Individual', 5),
(6, 'Pequeño', 6),
(7, 'Grande', 7),
(8, 'Mediano', 8),
(9, 'Familiar', 9),
(10, 'Individual', 10);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `recetasderivadas`
--

CREATE TABLE `recetasderivadas` (
  `idRecetaDerivada` int(11) NOT NULL,
  `idReceta` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `recetasderivadas`
--

INSERT INTO `recetasderivadas` (`idRecetaDerivada`, `idReceta`) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7),
(8, 8),
(9, 9),
(10, 10),
(11, 11),
(12, 12),
(13, 13),
(14, 14),
(15, 15),
(16, 16),
(17, 17),
(18, 18),
(19, 19),
(20, 20);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `recetasderivadasxrecetasbases`
--

CREATE TABLE `recetasderivadasxrecetasbases` (
  `IdrecetaDerivadaXrecetasBases` int(11) NOT NULL,
  `idRecetaDerivada` int(11) NOT NULL,
  `idrecetaBase` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `recetasderivadasxrecetasbases`
--

INSERT INTO `recetasderivadasxrecetasbases` (`IdrecetaDerivadaXrecetasBases`, `idRecetaDerivada`, `idrecetaBase`) VALUES
(1, 1, 1),
(2, 2, 2),
(3, 3, 3),
(4, 4, 4),
(5, 5, 5),
(6, 6, 6),
(7, 7, 7),
(8, 8, 8),
(9, 9, 9),
(10, 10, 10);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `ingredientes`
--
ALTER TABLE `ingredientes`
  ADD PRIMARY KEY (`idIngrediente`);

--
-- Indices de la tabla `ingredientesxrecetas`
--
ALTER TABLE `ingredientesxrecetas`
  ADD PRIMARY KEY (`idIngredienteXrecetas`),
  ADD KEY `fk_Ingredientes_has_Recetas_Recetas1_idx` (`idReceta`),
  ADD KEY `fk_Ingredientes_has_Recetas_Ingredientes1_idx` (`idIngrediente`);

--
-- Indices de la tabla `pasos`
--
ALTER TABLE `pasos`
  ADD PRIMARY KEY (`idPaso`) USING BTREE,
  ADD KEY `fk_Pasos_Recetas1_idx` (`idReceta`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`idProducto`) USING BTREE,
  ADD KEY `fk_Producto_recetaDerivada1_idx` (`idRecetaDerivada`,`idReceta`);

--
-- Indices de la tabla `recetas`
--
ALTER TABLE `recetas`
  ADD PRIMARY KEY (`idReceta`);

--
-- Indices de la tabla `recetasbases`
--
ALTER TABLE `recetasbases`
  ADD PRIMARY KEY (`idRecetaBase`) USING BTREE,
  ADD KEY `fk_recetaBase_Receta1_idx` (`idReceta`);

--
-- Indices de la tabla `recetasderivadas`
--
ALTER TABLE `recetasderivadas`
  ADD PRIMARY KEY (`idRecetaDerivada`,`idReceta`),
  ADD KEY `fk_recetaDerivada_Receta1_idx` (`idReceta`);

--
-- Indices de la tabla `recetasderivadasxrecetasbases`
--
ALTER TABLE `recetasderivadasxrecetasbases`
  ADD PRIMARY KEY (`IdrecetaDerivadaXrecetasBases`),
  ADD KEY `fk_RecetasDerivadas_has_RecetasBases_RecetasBases1_idx` (`idrecetaBase`),
  ADD KEY `fk_RecetasDerivadas_has_RecetasBases_RecetasDerivadas1_idx` (`idRecetaDerivada`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `ingredientes`
--
ALTER TABLE `ingredientes`
  MODIFY `idIngrediente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT de la tabla `ingredientesxrecetas`
--
ALTER TABLE `ingredientesxrecetas`
  MODIFY `idIngredienteXrecetas` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT de la tabla `pasos`
--
ALTER TABLE `pasos`
  MODIFY `idPaso` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `idProducto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT de la tabla `recetas`
--
ALTER TABLE `recetas`
  MODIFY `idReceta` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT de la tabla `recetasbases`
--
ALTER TABLE `recetasbases`
  MODIFY `idRecetaBase` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `recetasderivadas`
--
ALTER TABLE `recetasderivadas`
  MODIFY `idRecetaDerivada` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT de la tabla `recetasderivadasxrecetasbases`
--
ALTER TABLE `recetasderivadasxrecetasbases`
  MODIFY `IdrecetaDerivadaXrecetasBases` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `ingredientesxrecetas`
--
ALTER TABLE `ingredientesxrecetas`
  ADD CONSTRAINT `fk_Ingredientes_has_Recetas_Ingredientes1` FOREIGN KEY (`idIngrediente`) REFERENCES `ingredientes` (`idIngrediente`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Ingredientes_has_Recetas_Recetas1` FOREIGN KEY (`idReceta`) REFERENCES `recetas` (`idReceta`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `pasos`
--
ALTER TABLE `pasos`
  ADD CONSTRAINT `fk_Pasos_Recetas1` FOREIGN KEY (`idReceta`) REFERENCES `recetas` (`idReceta`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `productos`
--
ALTER TABLE `productos`
  ADD CONSTRAINT `fk_Producto_recetaDerivada1` FOREIGN KEY (`idrecetaDerivada`,`idReceta`) REFERENCES `recetasderivadas` (`idrecetaDerivada`, `idReceta`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `recetasbases`
--
ALTER TABLE `recetasbases`
  ADD CONSTRAINT `fk_recetaBase_Receta1` FOREIGN KEY (`idReceta`) REFERENCES `recetas` (`idReceta`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `recetasderivadas`
--
ALTER TABLE `recetasderivadas`
  ADD CONSTRAINT `fk_recetaDerivada_Receta1` FOREIGN KEY (`idReceta`) REFERENCES `recetas` (`idReceta`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `recetasderivadasxrecetasbases`
--
ALTER TABLE `recetasderivadasxrecetasbases`
  ADD CONSTRAINT `fk_RecetasDerivadas_has_RecetasBases_RecetasBases1` FOREIGN KEY (`idrecetaBase`) REFERENCES `recetasbases` (`idrecetaBase`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_RecetasDerivadas_has_RecetasBases_RecetasDerivadas1` FOREIGN KEY (`idrecetaDerivada`) REFERENCES `recetasderivadas` (`idrecetaDerivada`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
