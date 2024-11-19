-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 19-11-2024 a las 21:50:20
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
(1, 'Azúcar ', 5000),
(2, 'Azúcar glas', 2500),
(3, 'Harina de trigo', 10000),
(4, 'Harina de almendra', 5000),
(5, 'Cacao en polvo', 1000),
(6, 'Huevos', 60),
(7, 'Mantequilla', 1000),
(8, 'Leche', 7000),
(9, 'Crema de leche', 1000),
(10, 'Polvo de hornear', 1000),
(11, 'Esencia de vainilla', 750),
(12, 'Chocolate negro', 1000),
(13, 'Chocolate blanco', 1000),
(14, 'Queso crema', 750),
(15, 'Gelatina sin sabor', 10),
(16, 'Glucosa', 5000),
(17, 'Glicerina', 2000),
(18, 'Dulce de leche', 25000),
(19, 'Limones', 10),
(20, 'Frutillas', 1000),
(21, 'Maicena', 5000),
(22, 'Fresas', 1000),
(23, 'Agua', NULL),
(24, 'Frutas secas', 2500),
(25, 'Frutos rojos', 2500);

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
(1, 3, 1, 200),
(2, 1, 1, 200),
(3, 6, 1, 4),
(4, 8, 1, 120),
(5, 7, 1, 100),
(6, 10, 1, 5),
(7, 3, 2, 200),
(8, 5, 2, 50),
(9, 1, 2, 200),
(10, 6, 2, 4),
(11, 8, 2, 120),
(12, 7, 2, 100),
(13, 10, 2, 5),
(14, 3, 3, 200),
(15, 1, 3, 200),
(16, 6, 3, 4),
(17, 8, 3, 120),
(18, 7, 3, 100),
(19, 10, 3, 5),
(20, 11, 3, 5),
(21, 4, 4, 150),
(22, 3, 4, 50),
(23, 1, 4, 200),
(24, 6, 4, 4),
(25, 8, 4, 120),
(26, 7, 4, 100),
(27, 10, 4, 5),
(28, 6, 5, 4),
(29, 1, 5, 200),
(30, 6, 6, 4),
(31, 1, 6, 200),
(32, 12, 7, 200),
(33, 9, 7, 200),
(34, 13, 8, 200),
(35, 9, 8, 200),
(36, 7, 9, 250),
(37, 2, 9, 300),
(38, 8, 9, 50),
(39, 11, 9, 5),
(40, 9, 10, 250),
(41, 7, 10, 100),
(42, 2, 11, 200),
(43, 11, 10, 5),
(44, 9, 11, 500),
(45, 2, 11, 50),
(46, 11, 11, 5),
(47, 8, 12, 500),
(48, 1, 12, 100),
(49, 6, 12, 4),
(50, 21, 12, 40),
(51, 11, 12, 5),
(52, 7, 12, 20),
(53, 12, 13, 200),
(54, 9, 13, 400),
(55, 1, 13, 50),
(56, 6, 13, 4),
(57, 11, 13, 5),
(58, 22, 14, 300),
(59, 9, 14, 400),
(60, 1, 14, 100),
(61, 6, 14, 3),
(62, 15, 14, 1),
(63, 19, 14, 1),
(64, 1, 15, 200),
(65, 23, 15, 200),
(66, 1, 16, 200),
(67, 23, 15, 200),
(68, 11, 16, 5),
(69, 24, 17, 300),
(70, 1, 17, 50),
(71, 19, 17, 1),
(72, 18, 18, 250),
(73, 7, 18, 50),
(74, 2, 18, 100),
(75, 2, 19, 200),
(76, 23, 19, 20),
(77, 11, 19, 3),
(78, 1, 20, 500),
(79, 16, 20, 60),
(80, 23, 20, 60),
(81, 17, 20, 5),
(82, 15, 20, 1),
(83, 11, 20, 5),
(84, 22, 22, 300),
(85, 14, 25, 300),
(86, 9, 26, 150),
(87, 19, 26, 2),
(88, 22, 28, 200),
(89, 14, 29, 500),
(90, 25, 29, 200),
(91, 15, 29, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pasos`
--

CREATE TABLE `pasos` (
  `idPaso` int(11) NOT NULL,
  `descripcionPaso` varchar(500) DEFAULT NULL,
  `idReceta` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `pasos`
--

INSERT INTO `pasos` (`idPaso`, `descripcionPaso`, `idReceta`) VALUES
(1, 'Engrasar y enharinar un molde redondo de 20-24 cm.', 1),
(2, 'En un bol, batir los huevos con el azúcar hasta obtener una mezcla espumosa.', 1),
(3, 'Tamizar la harina y el polvo de hornear y añadirlos poco a poco.', 1),
(4, 'Agregar la leche y la mantequilla, y mezclar hasta que todo esté homogéneo.', 1),
(5, 'Verter la mezcla en el molde y hornear a 180 °C durante 30-35 minutos.', 1),
(6, 'Engrasar y enharinar un molde redondo de 20-24 cm.', 2),
(7, 'Batir los huevos con el azúcar hasta que la mezcla esté suave.', 2),
(8, 'Tamizar la harina, el cacao y el polvo de hornear, y añadirlos poco a poco.', 2),
(9, 'Incorporar la leche y la mantequilla y mezclar bien.', 2),
(10, 'Hornear a 180 °C durante 30-35 minutos o hasta que un palillo salga limpio.', 2),
(11, 'Engrasar y enharinar un molde de 20-24 cm.', 3),
(12, 'Batir los huevos con el azúcar hasta que estén bien espumosos.', 3),
(13, 'Tamizar la harina y el polvo de hornear, y añadirlos lentamente.', 3),
(14, 'Agregar la leche, la mantequilla y la esencia de vainilla, mezclando hasta homogeneizar.', 3),
(15, 'Colocar la mezcla en el molde y hornear a 180 °C durante 30-35 minutos.', 3),
(16, 'Engrasar y enharinar un molde de 20-24 cm.', 4),
(17, 'Batir los huevos con el azúcar hasta obtener una mezcla ligera.', 4),
(18, ' Añadir poco a poco la harina de almendra, la harina de trigo y el polvo de hornear.', 4),
(19, 'Añadir la leche y la mantequilla, y mezclar bien.', 4),
(20, 'Colocar la mezcla en el molde y hornear a 180 °C durante 30-35 minutos.', 4),
(21, 'Colocar las claras y el azúcar en un bol y calentarlas al baño maría, removiendo hasta que el azúcar se disuelva.', 5),
(22, 'Retirar del baño maría y batir con una batidora eléctrica hasta obtener picos firmes y que el merengue esté a temperatura ambiente.', 5),
(23, 'Usar el merengue para decorar o como cobertura.', 5),
(24, 'En una cacerola, calentar el agua y el azúcar a fuego medio, hasta que llegue a 115°C (usar un termómetro).', 6),
(25, 'Mientras el almíbar se calienta, batir las claras con la crema tártara (si se usa) hasta que comiencen a formar picos suaves.', 6),
(26, ' Verter el almíbar caliente en las claras batidas lentamente, batiendo a alta velocidad hasta que se forme un merengue brillante y firme.', 6),
(27, 'Dejar enfriar el merengue antes de usarlo.', 6),
(28, 'Calienta la crema en una cacerola a fuego medio hasta que empiece a hervir.', 7),
(29, ' Coloca el chocolate troceado en un bol y vierte la crema caliente sobre él.', 7),
(30, 'Remueve hasta que el chocolate esté completamente derretido y la mezcla esté suave.', 7),
(31, 'Deja enfriar a temperatura ambiente antes de usar.', 7),
(32, ' Calienta la crema en una cacerola a fuego medio hasta que empiece a hervir.', 8),
(33, 'Coloca el chocolate blanco troceado en un bol y vierte la crema caliente sobre él.', 8),
(34, 'Remueve hasta que el chocolate blanco esté completamente derretido y la mezcla esté suave.', 8),
(35, 'Deja enfriar antes de utilizar.', 8),
(36, 'Batir la mantequilla a temperatura ambiente hasta que esté suave y cremosa.', 9),
(37, 'Incorporar el azúcar glas poco a poco, batiendo bien después de cada adición.', 9),
(38, 'Agregar la leche y la esencia de vainilla, y continuar batiendo hasta obtener una mezcla suave y homogénea.', 9),
(39, 'Batir el queso crema y la mantequilla hasta obtener una mezcla cremosa.', 10),
(40, 'Agregar el azúcar glas poco a poco, batiendo bien.', 10),
(41, 'Añadir la esencia de vainilla y mezclar hasta que la crema esté suave.', 10),
(42, 'Enfriar la crema de leche en el refrigerador durante al menos 1 hora.', 11),
(43, 'Batir la crema con una batidora a velocidad alta hasta que forme picos suaves.', 11),
(44, 'Incorporar el azúcar glas y la esencia de vainilla, y continuar batiendo hasta obtener picos firmes.', 11),
(45, 'Calienta la leche con la mitad del azúcar a fuego medio hasta que hierva.', 12),
(46, 'Mientras tanto, bate las yemas con el azúcar restante y la maicena en un bol hasta que quede suave.', 12),
(47, 'Vierte lentamente la leche caliente sobre la mezcla de yemas, batiendo constantemente.', 12),
(48, 'Regresa la mezcla al fuego y cocina a fuego bajo, batiendo constantemente, hasta que espese.', 12),
(49, 'Retira del fuego, agrega la mantequilla y la esencia de vainilla, y mezcla bien. Deja enfriar antes de usar.', 12),
(50, 'Derrite el chocolate en baño maría o en el microondas y deja enfriar un poco.', 13),
(51, 'Bate la crema de leche con el azúcar hasta que forme picos firmes.', 13),
(52, 'Bate las claras de huevo hasta que estén a punto de nieve.', 13),
(53, 'Incorpora el chocolate derretido a la crema batida y mezcla suavemente. Luego agrega las claras batidas con movimientos envolventes.', 13),
(54, 'Coloca la mousse en copas y refrigera por al menos 2 horas antes de servir.', 13),
(55, 'Si usas fresas enteras, haz un puré con ellas en una licuadora.', 14),
(56, 'Bate la crema de leche con el azúcar hasta que forme picos firmes.', 14),
(57, 'Disuelve la gelatina en un poco de agua caliente y mezcla con el puré de fresa y el jugo de limón.', 14),
(58, 'Bate las claras de huevo a punto de nieve.', 14),
(59, 'Incorpora la mezcla de fresa con la crema batida y las claras de huevo montadas. Refrigera por 2 horas.', 14),
(60, 'Coloca el azúcar y el agua en una cacerola.', 15),
(61, ' Lleva a ebullición y cocina a fuego medio por 3-5 minutos hasta que el azúcar se disuelva completamente.', 15),
(62, 'Deja enfriar antes de usar en los bizcochos.', 15),
(63, 'Coloca el azúcar y el agua en una cacerola y calienta a fuego medio hasta que el azúcar se disuelva completamente.', 16),
(64, 'Añade la esencia de vainilla y mezcla bien.', 16),
(65, 'Deja enfriar antes de utilizar para humedecer los bizcochos.', 16),
(66, 'Corta las frutas en pequeños trozos y colócalas en un bol.', 17),
(67, 'Mezcla las frutas con el azúcar y el jugo de limón.', 17),
(68, 'Deja reposar las frutas durante 10-15 minutos para que suelten algo de jugo antes de usarlas como relleno.', 17),
(69, 'Bate el dulce de leche con la mantequilla hasta obtener una mezcla suave.', 18),
(70, 'Si deseas mayor consistencia, añade el azúcar glas y mezcla bien.', 18),
(71, 'Utiliza como relleno para tortas o pasteles.', 18),
(72, 'Tamiza el azúcar glas en un bol para evitar grumos.', 19),
(73, 'Añade agua o jugo de limón, poco a poco, hasta obtener una consistencia suave pero espesa.', 19),
(74, 'Si deseas, añade la esencia de vainilla y mezcla bien.', 19),
(75, 'Usa el glaseado para cubrir bizcochos o como decoración.', 19),
(76, 'Hidrata la gelatina en el agua y deja reposar durante 5 minutos.', 20),
(77, 'Calienta la mezcla de gelatina en el microondas o en baño maría hasta que se disuelva completamente.', 20),
(78, 'En un bol grande, mezcla la glucosa, el azúcar glas y la glicerina.', 20),
(79, 'Añade la gelatina disuelta y mezcla bien hasta obtener una masa homogénea y suave.', 20),
(80, 'Saca la masa y amásala sobre una superficie plana espolvoreada con azúcar glas hasta que quede suave y manejable.', 20),
(81, 'Cubre la masa con film transparente y deja reposar por 30 minutos antes de usar. Puedes teñir el fondant con colorantes comestibles.', 20),
(82, 'Hornear el bizcochuelo de chocolate y dejar enfriar.', 21),
(83, 'Empapar cada capa de bizcochuelo con el jarabe simple para añadir humedad.', 21),
(84, 'Rellenar cada capa con ganache de chocolate y cubrir toda la torta.', 21),
(85, 'Hornea el bizcochuelo y déjalo enfriar.', 22),
(86, 'Empapa el bizcochuelo con el jarabe simple para darle mayor humedad.', 22),
(87, 'Cubre la superficie de la tarta con una capa generosa de crema chantilly.', 22),
(88, 'Añade las fresas en rodajas o enteras por encima y alrededor de la tarta.', 22),
(89, 'Preparar los bizcochuelos de vainilla y dejar enfriar.', 23),
(90, 'Aplicar jarabe simple en cada capa de bizcochuelo.', 23),
(91, 'Colocar una capa de crema de mantequilla entre cada nivel de bizcochuelo.', 23),
(92, 'Extender el fondant y cubrir toda la torta, alisando para lograr un acabado perfecto.', 23),
(93, 'Agregar decoraciones de fondant o flores comestibles al gusto.', 23),
(94, 'Hornea el bizcochuelo básico y déjalo enfriar.', 24),
(95, 'Pincha el bizcochuelo con un tenedor y vierte la mezcla de tres leches.', 24),
(96, 'Decora con crema chantilly en la superficie.', 24),
(97, 'Hornear el bizcochuelo Red Velvet y dejar enfriar.\r\n', 25),
(98, 'Empapar con jarabe simple cada capa de bizcochuelo.', 25),
(99, 'Colocar crema de queso entre cada capa y en la parte superior.', 25),
(100, 'Hornear la base de bizcochuelo y dejar enfriar.', 26),
(101, 'Extiende una capa uniforme de crema de limón sobre la base.', 26),
(102, 'Colocar el merengue suizo en la parte superior y dorar ligeramente con un soplete.', 26),
(103, 'Divide la masa de bizcochuelo en moldes y hornea.', 27),
(104, 'Aplica una capa de ganache de chocolate en la parte superior de cada cupcake.', 27),
(105, 'Hornear y enfriar', 28),
(106, 'Colocar una capa de mousse de fresa sobre el bizcocho.', 28),
(107, 'Llevar al congelador por 2 horas', 28),
(108, 'Agregar fresas frescas al gusto.', 28),
(109, 'Mezcla galletas trituradas con mantequilla y presiona en el molde.', 29),
(110, 'Agrega la crema de queso sobre la base y deja enfriar.', 29),
(111, 'Añade frutos rojos en la parte superior.', 29),
(112, 'Hornea y deja enfriar.', 30),
(113, 'Coloca el mousse entre capas de bizcochuelo.', 30),
(114, 'Aplica una capa de ganache para sellar.\r\n', 30);

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
(1, 'Torta de chocolate', 7500, 3, 0, 'Grande', 1, 21),
(2, 'Tarta de frutas con crema', 9000, 1, 0, 'Grande', 2, 22),
(3, 'Torta de bodas', 160000, 0, 0, 'Grande', 3, 23),
(4, 'Torta de tres leches', 8000, 4, 0, 'Grande', 4, 24),
(5, 'Torta Red Velvet', 9500, 2, 0, 'Grande', 5, 25),
(6, 'Tarta de merengue y limón', 10000, 3, 0, 'Mediano', 6, 26),
(7, 'Cupcakes de chocolate con gana', 2000, 24, 0, 'Individual', 7, 27),
(8, 'Torta helada de fresa', 11500, 1, 0, 'Grande', 8, 28),
(9, 'Cheesecake de frutos rojos', 14000, 0, 1, 'Mediano', 9, 29),
(10, 'Torta de mousse de chocolate', 9500, 2, 0, 'Grande', 10, 30);

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
(1, 'Bizcochuelo Básico', '45 minutos', 8),
(2, 'Bizcochuelo de Chocolate', '50 minutos', 8),
(3, 'Bizcochuelo de Vainilla', '45 minutos', 8),
(4, 'Bizcochuelo de Almendra ', '45 minutos', 8),
(5, 'Merengue Suizo', '25 minutos', 20),
(6, 'Merengue Italiano', '25 minutos', 20),
(7, 'Ganache de Chocolate', '15 minutos ', 20),
(8, 'Ganache de Chocolate Blanco', '15 minutos', 20),
(9, 'Relleno de crema de mantequill', '20 minutos', 20),
(10, 'Relleno de crema de queso', '15 minutos', 20),
(11, 'Crema chantilly', '15 minutos', 20),
(12, 'Crema pastelera', '20 minutos', 20),
(13, 'Mousse de chocolate', '30 minutos', 10),
(14, 'Mousse de fresa', '30 minutos', 10),
(15, 'Jarabe simple', '10 minutos', 20),
(16, 'Almíbar de vainilla', '10 minutos', 20),
(17, 'Relleno de frutas', '15 minutos', 20),
(18, 'Relleno de dulce de leche', '10 minutos', 20),
(19, 'Glaseado de azúcar', '10 minutos', 20),
(20, 'Fondant básico', '40 minutos', 20),
(21, 'Torta de Chocolate', '90 minutos', 12),
(22, 'Tarta de Fresa con Crema', '60 minutos', 10),
(23, 'Torta de Bodas', '300 minutos', 40),
(24, 'Torta de Tres Leches', '120 minutos', 12),
(25, 'Torta Red Velvet', '120 minutos', 12),
(26, 'Tarta de Merengue y Limón', '90 minutos', 8),
(27, 'Cupcakes de Chocolate con Gana', '60 minutos', 12),
(28, 'Torta Helada de Fresa', '180 minutos', 10),
(29, 'Cheesecake de Frutos Rojos', '150 minutos', 12),
(30, 'Torta de Mousse de Chocolate', '120 minutos', 10),
(31, 'Torta Garnache', '90 minutos', 8);

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
(1, 'Grande', 1),
(2, 'Grande', 2),
(3, 'Grande', 3),
(4, 'Grande', 4),
(5, 'Mediano', 5),
(6, 'Mediano', 6),
(7, 'Mediano', 7),
(8, 'Mediano', 8),
(9, 'Mediano', 9),
(10, 'Mediano', 10),
(11, 'Mediano', 11),
(12, 'Mediano', 12),
(13, 'Mediano', 13),
(14, 'Mediano', 14),
(15, 'Pequeño', 15),
(16, 'Pequeño', 16),
(17, 'Mediano', 17),
(18, 'Mediano', 18),
(19, 'Pequeño', 19),
(20, 'Grande', 20);

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
(1, 21),
(2, 22),
(3, 23),
(4, 24),
(5, 25),
(6, 26),
(7, 27),
(8, 28),
(9, 29),
(10, 30),
(11, 31);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `recetasderivadasxrecetasbases`
--

CREATE TABLE `recetasderivadasxrecetasbases` (
  `IdRecetasDerivadasXrecetasBases` int(11) NOT NULL,
  `idRecetaDerivada` int(11) NOT NULL,
  `idRecetaBase` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `recetasderivadasxrecetasbases`
--

INSERT INTO `recetasderivadasxrecetasbases` (`IdRecetasDerivadasXrecetasBases`, `idRecetaDerivada`, `idRecetaBase`) VALUES
(1, 1, 2),
(2, 1, 9),
(3, 1, 7),
(4, 2, 3),
(5, 2, 12),
(6, 2, 17),
(7, 3, 3),
(8, 3, 12),
(9, 3, 16),
(10, 3, 20),
(11, 4, 1),
(12, 4, 15),
(13, 4, 11),
(14, 5, 3),
(15, 5, 11),
(16, 6, 4),
(17, 6, 12),
(18, 6, 6),
(19, 7, 2),
(20, 7, 7),
(21, 8, 1),
(22, 8, 14),
(23, 8, 11),
(24, 9, 4),
(25, 9, 11),
(26, 9, 17),
(27, 10, 2),
(28, 10, 13);

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
  ADD PRIMARY KEY (`IdRecetasDerivadasXrecetasBases`),
  ADD KEY `fk_RecetasDerivadas_has_RecetasBases_RecetasBases1_idx` (`idRecetaBase`),
  ADD KEY `fk_RecetasDerivadas_has_RecetasBases_RecetasDerivadas1_idx` (`idRecetaDerivada`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `ingredientes`
--
ALTER TABLE `ingredientes`
  MODIFY `idIngrediente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT de la tabla `ingredientesxrecetas`
--
ALTER TABLE `ingredientesxrecetas`
  MODIFY `idIngredienteXrecetas` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=92;

--
-- AUTO_INCREMENT de la tabla `pasos`
--
ALTER TABLE `pasos`
  MODIFY `idPaso` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=115;

--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `idProducto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT de la tabla `recetas`
--
ALTER TABLE `recetas`
  MODIFY `idReceta` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT de la tabla `recetasbases`
--
ALTER TABLE `recetasbases`
  MODIFY `idRecetaBase` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT de la tabla `recetasderivadas`
--
ALTER TABLE `recetasderivadas`
  MODIFY `idRecetaDerivada` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT de la tabla `recetasderivadasxrecetasbases`
--
ALTER TABLE `recetasderivadasxrecetasbases`
  MODIFY `IdRecetasDerivadasXrecetasBases` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

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
  ADD CONSTRAINT `fk_Producto_recetaDerivada1` FOREIGN KEY (`idRecetaDerivada`,`idReceta`) REFERENCES `recetasderivadas` (`idRecetaDerivada`, `idReceta`) ON DELETE NO ACTION ON UPDATE NO ACTION;

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
  ADD CONSTRAINT `fk_RecetasDerivadas_has_RecetasBases_RecetasBases1` FOREIGN KEY (`idRecetaBase`) REFERENCES `recetasbases` (`idRecetaBase`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_RecetasDerivadas_has_RecetasBases_RecetasDerivadas1` FOREIGN KEY (`idRecetaDerivada`) REFERENCES `recetasderivadas` (`idRecetaDerivada`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
