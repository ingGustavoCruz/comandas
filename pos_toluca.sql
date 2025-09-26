-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jul 02, 2025 at 11:35 PM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 7.4.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `pos_santos`
--

-- --------------------------------------------------------

--
-- Table structure for table `categorias`
--

CREATE TABLE `categorias` (
  `id_categoria` int(11) NOT NULL,
  `nombre_categoria` varchar(100) NOT NULL,
  `id_tipo` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `categorias`
--

INSERT INTO `categorias` (`id_categoria`, `nombre_categoria`, `id_tipo`) VALUES
(1, 'COMIDA RAPIDA', 2),
(2, 'SNAKCS', 2),
(3, 'SIN ALCOHOL', 1),
(4, 'CERVEZA', 1),
(5, 'BOTELLAS', 1),
(6, 'BOTELLAS CON SERVICIOS', 1),
(7, 'TRAGOS + VASO', 1),
(8, 'CERVEZA + VASO', 1),
(9, 'SIN ALCOHOL + VASO', 1),
(10, 'PACKS SIN ALCOHOL', 1),
(11, 'PACKS CERVEZA', 1),
(12, 'REFILL', 1);

-- --------------------------------------------------------

--
-- Table structure for table `detalle_orden`
--

CREATE TABLE `detalle_orden` (
  `id_detalle_orden` int(11) NOT NULL,
  `id_orden` int(11) DEFAULT NULL,
  `id_producto` int(11) DEFAULT NULL,
  `cantidad` int(11) NOT NULL,
  `precio_venta` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `detalle_orden`
--

INSERT INTO `detalle_orden` (`id_detalle_orden`, `id_orden`, `id_producto`, `cantidad`, `precio_venta`) VALUES
(1, 1, 1, 2, '90.00'),
(2, 1, 2, 2, '120.00'),
(3, 1, 3, 1, '130.00'),
(4, 1, 4, 2, '130.00'),
(5, 1, 5, 2, '110.00'),
(6, 1, 6, 2, '65.00'),
(7, 1, 7, 2, '200.00'),
(8, 1, 8, 2, '65.00'),
(9, 1, 9, 2, '110.00'),
(10, 1, 10, 2, '110.00'),
(11, 1, 11, 2, '85.00'),
(12, 1, 12, 2, '65.00'),
(13, 1, 13, 2, '125.00'),
(14, 1, 15, 2, '125.00'),
(15, 2, 2, 1, '120.00'),
(16, 2, 6, 1, '65.00'),
(17, 2, 8, 1, '65.00'),
(18, 3, 1, 2, '90.00'),
(19, 3, 3, 1, '130.00'),
(20, 3, 4, 2, '130.00'),
(21, 3, 5, 2, '110.00'),
(22, 3, 6, 2, '65.00'),
(23, 3, 8, 2, '65.00'),
(24, 3, 9, 2, '110.00'),
(25, 3, 10, 2, '110.00'),
(26, 3, 11, 2, '85.00'),
(27, 3, 12, 2, '65.00'),
(28, 3, 15, 2, '125.00'),
(29, 3, 25, 6, '400.00'),
(30, 3, 27, 1, '70.00'),
(31, 3, 28, 1, '70.00'),
(32, 3, 29, 4, '70.00'),
(33, 3, 30, 1, '70.00'),
(34, 3, 31, 1, '70.00'),
(35, 3, 32, 1, '70.00'),
(36, 3, 34, 5, '70.00'),
(37, 3, 37, 6, '65.00'),
(38, 3, 38, 6, '70.00'),
(39, 3, 39, 6, '70.00'),
(40, 3, 49, 1, '2300.00'),
(41, 4, 1, 1, '90.00'),
(42, 5, 3, 2, '130.00'),
(43, 5, 4, 1, '130.00'),
(44, 6, 4, 1, '130.00'),
(45, 7, 4, 1, '130.00'),
(46, 8, 4, 1, '130.00'),
(47, 9, 4, 1, '130.00'),
(48, 10, 1, 2, '90.00'),
(49, 10, 2, 2, '120.00'),
(50, 11, 2, 1, '120.00'),
(51, 11, 3, 1, '130.00'),
(52, 12, 3, 2, '130.00'),
(53, 12, 19, 2, '50.00'),
(54, 13, 2, 1, '120.00'),
(55, 13, 7, 1, '200.00'),
(56, 13, 9, 1, '110.00'),
(57, 13, 11, 1, '85.00'),
(58, 13, 16, 1, '150.00'),
(59, 13, 24, 1, '40.00'),
(60, 14, 1, 1, '90.00'),
(61, 14, 4, 1, '130.00'),
(62, 14, 6, 1, '65.00'),
(63, 14, 8, 1, '65.00'),
(64, 15, 35, 1, '65.00'),
(65, 15, 36, 1, '65.00'),
(66, 15, 37, 1, '65.00'),
(67, 16, 35, 1, '65.00'),
(68, 16, 36, 1, '65.00'),
(69, 16, 37, 1, '65.00'),
(70, 17, 5, 1, '110.00'),
(71, 17, 9, 1, '110.00'),
(72, 17, 12, 1, '65.00'),
(73, 17, 58, 1, '340.00');

-- --------------------------------------------------------

--
-- Table structure for table `favoritos`
--

CREATE TABLE `favoritos` (
  `id_favorito` int(11) NOT NULL,
  `id_producto` int(11) DEFAULT NULL,
  `ventas` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ordenes`
--

CREATE TABLE `ordenes` (
  `id_orden` int(11) NOT NULL,
  `id_usuario` int(11) DEFAULT NULL,
  `fecha_orden` timestamp NOT NULL DEFAULT current_timestamp(),
  `total` decimal(10,2) NOT NULL,
  `estado` varchar(50) DEFAULT 'En preparación'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `ordenes`
--

INSERT INTO `ordenes` (`id_orden`, `id_usuario`, `fecha_orden`, `total`, `estado`) VALUES
(1, 16, '2024-10-25 21:45:41', '2930.00', 'Completado'),
(2, 16, '2024-10-25 21:48:25', '250.00', 'Completado'),
(3, 16, '2024-10-25 22:12:51', '8950.00', 'Completado'),
(4, 16, '2024-10-25 22:14:18', '90.00', 'Completado'),
(5, 16, '2024-10-25 22:15:00', '390.00', 'Completado'),
(6, 16, '2024-10-25 22:53:21', '130.00', 'Completado'),
(7, 16, '2024-10-25 22:53:21', '130.00', 'Completado'),
(8, 16, '2024-10-25 22:53:21', '130.00', 'Completado'),
(9, 16, '2024-10-25 22:53:22', '130.00', 'Completado'),
(10, 16, '2024-10-25 23:32:49', '420.00', 'Completado'),
(11, 16, '2024-10-25 23:33:12', '250.00', 'Completado'),
(12, 1, '2025-04-03 17:06:54', '360.00', 'Completado'),
(13, 18, '2025-04-03 17:17:19', '705.00', 'Completado'),
(14, 15, '2025-04-03 17:18:25', '350.00', 'Completado'),
(15, 18, '2025-04-03 17:21:21', '195.00', 'Completado'),
(16, 18, '2025-04-03 17:21:22', '195.00', 'Leída'),
(17, 22, '2025-07-02 16:31:47', '625.00', 'Leída');

-- --------------------------------------------------------

--
-- Table structure for table `productos`
--

CREATE TABLE `productos` (
  `id_producto` int(11) NOT NULL,
  `nombre_producto` varchar(100) NOT NULL,
  `descripcion_producto` text DEFAULT NULL,
  `precio` decimal(10,2) NOT NULL,
  `img_producto` varchar(150) DEFAULT NULL,
  `id_categoria` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `productos`
--

INSERT INTO `productos` (`id_producto`, `nombre_producto`, `descripcion_producto`, `precio`, `img_producto`, `id_categoria`) VALUES
(1, 'HAMBURGUESA MAX RK', 'Jugosa carne premium de res acompañada con queso amarillo, tomate, cebolla, lechuga fresca y aderezos', '90.00', 'hamburguesa-max-rk', 1),
(2, 'HOT-DOG NATHANS', 'Delicioso Hot Dog con salchicha Nathan’s', '120.00', 'hot-dog-nathans', 1),
(3, 'LAS FLAUTAS RK', 'Deliciosas flautas de pollo con un poco de lechuga, queso rallado, y salsa verde', '130.00', 'las-flautas-rk', 1),
(4, 'PAPA BROTHERS', 'Cono de papas a la francesa con una especialidad (boneless) y algunos de los aderezos al gusto', '130.00', 'papa-brothers', 1),
(5, 'GORDITAS LA PESTAÑA', 'Paquete de 3 gorditas de harina rellena de chicharrón prensado, picadillo y frijoles', '110.00', 'gorditas-la-pestaña', 1),
(6, 'PIZZA INDIVIDUAL', 'Masa con base de salsa de tomate, especias, mezcla de 3 quesos (manchego, mozzarella y chihuahua) con pepperoni', '65.00', 'pizza-individual', 1),
(7, 'TACOS PAI', 'Orden de 3 tacos al estilo Lagunero de bistec', '200.00', 'tacos-pai', 1),
(8, 'BANDERILLA GUERRILLERA', 'Deliciosa banderilla de salchicha de pavo Frankfurt JUMBO', '65.00', 'banderilla-guerrillera', 1),
(9, 'ALITAS', 'Orden de alitas de 8 piezas acompañada con la salsa de tu preferencia', '110.00', 'alitas', 1),
(10, 'BONELESS', 'Orden de boneless de 8 a 10 piezas acompañada con la salsa de tu preferencia', '110.00', 'boneless', 1),
(11, 'PAPAS A LA FRANCESA', 'Orden de papas a la francesa', '85.00', 'papas-a-la-francesa', 1),
(12, 'DEDOS DE QUESO', 'Orden de 8 dedos de queso acompañados del aderezo de tu preferencia', '65.00', 'dedos-de-queso', 1),
(13, 'ENCOMENDEROS', 'Orden de tacos al pastor o de bistec acompañado de salsa y verdura', '125.00', 'encomenderos', 1),
(14, 'LONCHE 1', 'Delicioso lonche estilo lagunero de queso o aguacate', '80.00', 'lonche-1', 1),
(15, 'LONCHE 2', 'Delicioso lonche estilo lagunero de adobada o carnitas', '125.00', 'lonche-2', 1),
(16, 'LONCHE 3', 'Delicioso lonche estilo lagunero de adobada o carnitas con aguacate o queso', '150.00', 'lonche-3', 1),
(17, 'LONCHE 4', 'Delicioso lonche estilo lagunero de aguacate con queso', '150.00', 'lonche-4', 1),
(18, 'SOPA MARUCHAN', 'Sopa instantánea maruchan', '90.00', 'sopa-maruchan', 2),
(19, 'SABRITAS', 'Papas Sabritas', '50.00', 'sabritas', 2),
(20, 'PALOMITAS', 'Palomitas Mr. Pop Corn', '65.00', 'palomitas', 2),
(21, 'PAPAS', 'Papas Mr. Pop Corn', '70.00', 'papas', 2),
(22, 'BOTANA', 'Botana Mr. Pop Corn', '60.00', 'botana', 2),
(23, 'CLAMATO', 'Clamato botella 296ml', '40.00', 'clamato', 3),
(24, 'AGUA NATURAL', 'Agua natural en botella 500ml', '40.00', 'aguafiel', 3),
(25, 'AGUA MINERAL', 'Agua mineral en lata 355ml', '400.00', 'agua-mineral', 3),
(26, 'DR. PEPPER', 'Refresco Dr. Pepper sabor cereza 600ml', '70.00', 'dr-pepper', 3),
(27, 'MANZANITA', 'Refresco sabor manzana 600ml', '70.00', 'manzanita', 3),
(28, 'FRESA', 'Refresco sabor fresa 600ml', '70.00', 'fresa', 3),
(29, 'TORONJA', 'Refresco sabor toronja 600ml', '70.00', 'toronja', 3),
(30, 'LIMONADA', 'Limonada mineral 600ml', '70.00', 'limonada', 3),
(31, 'ORANGE CRUSH', 'Refresco Orange Crush sabor Naranja 600ml', '70.00', 'orange-crush', 3),
(32, 'TWIST LIMÓN', 'Twist de limón Peñafiel 600ml', '70.00', 'twist-limon', 3),
(33, 'PEPSI LIGHT', 'Refresco Pepsi Light 600ml', '70.00', 'pepsi-light', 3),
(34, 'RC COLA', 'Refresco RC sabor Cola 600ml', '70.00', 'rc-cola', 3),
(35, 'VICTORIA', 'Victoria 355ml', '65.00', 'victoria', 4),
(36, 'CORONA EXTRA', 'Corona 355ml', '65.00', 'corona-extra', 4),
(37, 'CORONA LIGHT', 'Corona Light 355ml', '65.00', 'corona-light', 4),
(38, 'MODELO ESPECIAL', 'Modelo Especial 355ml', '70.00', 'modelo-especial', 4),
(39, 'MICHELOB ULTRA', 'Michelob Ultra 355ml', '70.00', 'michelob-ultra', 4),
(40, 'STELLA ARTOIS', 'Stella Artois 355ml', '70.00', 'stella-artois', 4),
(41, 'BACARDI BLANCO', 'Botella de Ron Bacardí Blanco de 750ml', '1100.00', 'bacardi-blanco', 5),
(42, 'CAPTAIN MORGAN', 'Botella de Ron Captain Morgan de 750ml', '1100.00', 'captain-morgan', 5),
(43, 'ABSOLUT AZUL', 'Botella de Vodka Absolut Azul de 750ml', '1300.00', 'absolut-azul', 5),
(44, 'JOSE CUERVO TRADICIONAL', 'Botella de Tequila José Cuervo Tradicional de 695ml', '1350.00', 'jose-cuervo-tradicional', 5),
(45, 'BLACK LABEL', 'Botella de Whisky Johnny Walker etiqueta negra de 750ml', '1900.00', 'black-label', 5),
(46, 'MACALLAN', 'Botella de Whisky Macallan de 750ml', '2700.00', 'macallan', 5),
(47, 'DON LEO', 'Botella de Vino Tinto Don Leo de 750ml', '1300.00', 'don-leo', 5),
(48, 'CASA MADERO', 'Botella de Vino Tinto 3V Casa Madero 750ml', '1100.00', 'casa-madero', 5),
(49, 'MAESTRO DOBEL DIAMANTE', 'Botella de Tequila Maestro Dobel Diamante 750ml', '2300.00', 'maestro-dobel-diamante', 5),
(50, 'ZACAPA', 'Botella de Ron Zacapa de 750ml', '1600.00', 'zacapa', 5),
(51, 'BUCHANAN’S', 'Botella de Whisky Buchanan’s de 750ml', '1900.00', 'buchanans', 5),
(52, 'CLAMATO 2', '2 botellas de clamato de 296ml', '80.00', 'clamato-2', 10),
(53, 'SIX AGUA FIEL', '6 botellas de agua natural de 500ml', '210.00', 'six-agua-fiel', 10),
(54, 'SIX AGUA QUINADA', '6 latas de agua quina de 355ml', '240.00', 'six-agua-quinada', 10),
(55, 'SIX AGUA MINERAL', '6 latas de agua mineral de 355ml', '270.00', 'six-agua-mineral', 10),
(56, 'SIX REFRESCO', '6 latas de refresco de 355ml', '280.00', 'six-refresco', 10),
(57, 'SIX VICTORIA', '6 de Cerveza Victoria de 355ml', '340.00', 'victoria', 11),
(58, 'SIX CORONA EXTRA', '6 de Cerveza Corona de 355ml', '340.00', 'corona-extra', 11),
(59, 'SIX CORONA LIGHT', '6 de Cerveza Corona Light de 355ml', '340.00', 'corona-light', 11),
(60, 'SIX MODELO ESPECIAL', '6 de Cerveza Modelo Especial de 355ml', '400.00', 'modelo-especial', 11),
(61, 'SIX MICHELOB ULTRA', '6 de Cerveza Michelob Ultra de 355ml', '400.00', 'michelob-ultra', 11),
(62, 'SIX STELLA ARTOIS', '6 de Cerveza Stella Artois de 355ml', '430.00', 'stella-artois', 11),
(63, 'SIX SELTZER SABORES', '6 Hard Seltzer Michelob de diferentes Sabores de 355ml', '400.00', 'six-seltzer-sabores', 11),
(64, 'SIX CORONA RIFADITAS', '6 Coronas Rifaditas de diferentes Sabores de 355ml', '400.00', 'six-corona-rifaditas', 11),
(65, 'BEEFFEA LONDON DRY', '1 Botella de Ginebra de 750ml, 5 piezas de refresco, 5 Kilos de Hielo', '1700.00', 'beeffeater', 6),
(66, 'BOMBAY SAPHIRE', '1 Botella de Ginebra de 750ml, 5 piezas de refresco, 5 Kilos de Hielo', '1600.00', 'bombay', 6),
(67, 'LICOR 43', '1 Botella de Licor 43 de 750ml, 5 piezas de refresco, 5 Kilos de Hielo (Incluye café)', '1500.00', 'licor-43', 6),
(68, 'TORRES 10', '1 Botella de Brandy de 700ml, 5 piezas de refresco, 5 Kilos de Hielo', '1800.00', 'torres-10', 6),
(69, '400 CONEJOS', '1 Botella de Mezcal de 750ml, 5 piezas de refresco, 5 Kilos de hielo', '1500.00', '400-conejos', 6),
(70, 'ZIGNUM BLANCO', '1 Botella de Mezcal de 700ml, 5 piezas de refresco, 5 Kilos de hielo', '1400.00', 'zignum-blanco', 6),
(71, 'BACARDI BLANCO', 'Ron Bacardí Blanco Preparado + Vaso OFICIAL', '195.00', 'bacardi-blanco', 7),
(72, 'BACARDI BLANCO RECARGA', 'Ron Bacardí Blanco Preparado', '170.00', 'bacardi-blanco', 12),
(73, 'CAPTAIN MORGAN', 'Ron Captain Morgan Preparado + Vaso OFICIAL', '195.00', 'captain-morgan', 7),
(74, 'CAPTAIN MORGAN RECARGA', 'Ron Captain Morgan Preparado', '170.00', 'captain-morgan', 12),
(75, 'JOSE CUERVO TRADICIONAL', 'Tequila José Cuervo Tradicional Preparado + Vaso OFICIAL', '195.00', 'jose-cuervo-tradicional', 7),
(76, 'JOSE CUERVO TRADICIONAL RECARGA', 'Tequila José Cuervo Tradicional Preparado', '170.00', 'jose-cuervo-tradicional', 12),
(77, 'ABSOLUT', 'Vodka Absolut Preparado + Vaso OFICIAL', '195.00', 'absolut-azul', 7),
(78, 'ABSOLUT RECARGA', 'Vodka Absolut Preparado', '170.00', 'absolut-azul', 12),
(79, 'BLACK & WHITE', 'Whisky Black & White Preparado + Vaso OFICIAL', '195.00', 'black-white', 7),
(80, 'BLACK & WHITE RECARGA', 'Whisky Black & White Preparado', '170.00', 'black-white', 12),
(81, 'BUCHANAN’S 12', 'Whisky Buchanan’s 12 Preparado + Vaso OFICIAL', '195.00', 'buchanans', 7),
(82, 'BUCHANAN’S 12 RECARGA', 'Whisky Buchanan’s Preparado', '170.00', 'buchanans', 12),
(83, 'BLACK LABEL', 'Whisky Black Label Preparado + Vaso OFICIAL', '195.00', 'black-label', 7),
(84, 'BLACK LABEL RECARGA', 'Whisky Black Label Preparado', '170.00', 'black-label', 12),
(85, 'CORONA LIGHT', 'Cerveza Corona Light + Vaso OFICIAL', '145.00', 'corona-light', 8),
(86, 'CORONA LIGHT RECARGA', 'Cerveza Corona Light', '120.00', 'corona-light', 12),
(87, 'CORONA EXTRA', 'Cerveza Corona Extra + Vaso OFICIAL', '145.00', 'corona-extra', 8),
(88, 'CORONA EXTRA RECARGA', 'Cerveza Corona Extra', '120.00', 'corona-extra', 12),
(89, 'MICHELOB ULTRA', 'Cerveza Michelob Ultra + Vaso OFICIAL', '155.00', 'michelob-ultra', 8),
(90, 'MICHELOB ULTRA RECARGA', 'Cerveza Michelob Ultra', '130.00', 'michelob-ultra', 12),
(91, 'STELLA ARTOIS', 'Cerveza Stella Artois + Vaso OFICIAL', '155.00', 'stella-artois', 8),
(92, 'STELLA ARTOIS RECARGA', 'Cerveza Stella Artois', '130.00', 'stella-artois', 12),
(93, 'REFRESCO', 'Refresco de 600ml + Vaso OFICIAL', '90.00', 'refresco', 9),
(94, 'REFRESCO RECARGA', 'Refresco de 600ml', '65.00', 'refresco', 12),
(95, 'AGUAFIEL', 'Aguafiel de 500ml + Vaso OFICIAL', '65.00', 'aguafiel', 9),
(96, 'AGUAFIEL RECARGA', 'Aguafiel 500ml', '40.00', 'aguafiel', 12);

--
-- Triggers `productos`
--
DELIMITER $$
CREATE TRIGGER `before_insert_producto` BEFORE INSERT ON `productos` FOR EACH ROW BEGIN
    SET NEW.img_producto = LOWER(REPLACE(NEW.nombre_producto, ' ', '-'));
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id_rol` int(11) NOT NULL,
  `nombre_rol` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id_rol`, `nombre_rol`) VALUES
(1, 'cliente'),
(2, 'palco'),
(3, 'admin'),
(4, 'cocina');

-- --------------------------------------------------------

--
-- Table structure for table `tipo`
--

CREATE TABLE `tipo` (
  `id_tipo` int(11) NOT NULL,
  `tipo` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tipo`
--

INSERT INTO `tipo` (`id_tipo`, `tipo`) VALUES
(1, 'BEBIDAS'),
(2, 'ALIMENTOS');

-- --------------------------------------------------------

--
-- Table structure for table `usuarios`
--

CREATE TABLE `usuarios` (
  `id_usuario` int(11) NOT NULL,
  `usuario` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `id_rol` int(11) DEFAULT NULL,
  `nombre` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `usuarios`
--

INSERT INTO `usuarios` (`id_usuario`, `usuario`, `password`, `id_rol`, `nombre`) VALUES
(1, 'palco1', '$2y$10$n37T7opcqk9AoZRKuvFeEOwC/BOtq6RKeU742pDmQNuVTfcmF9442', 2, 'PALCO 1'),
(2, 'palco2', '$2y$10$n37T7opcqk9AoZRKuvFeEOwC/BOtq6RKeU742pDmQNuVTfcmF9442', 2, 'PALCO 2'),
(3, 'palco3', '$2y$10$n37T7opcqk9AoZRKuvFeEOwC/BOtq6RKeU742pDmQNuVTfcmF9442', 2, 'PALCO 3'),
(4, 'palco4', '$2y$10$n37T7opcqk9AoZRKuvFeEOwC/BOtq6RKeU742pDmQNuVTfcmF9442', 2, 'PALCO 4'),
(5, 'palco5', '$2y$10$n37T7opcqk9AoZRKuvFeEOwC/BOtq6RKeU742pDmQNuVTfcmF9442', 2, 'PALCO 5'),
(6, 'palco6', '$2y$10$n37T7opcqk9AoZRKuvFeEOwC/BOtq6RKeU742pDmQNuVTfcmF9442', 2, 'PALCO 6'),
(7, 'palco7', '$2y$10$n37T7opcqk9AoZRKuvFeEOwC/BOtq6RKeU742pDmQNuVTfcmF9442', 2, 'PALCO 7'),
(8, 'palco8', '$2y$10$n37T7opcqk9AoZRKuvFeEOwC/BOtq6RKeU742pDmQNuVTfcmF9442', 2, 'PALCO 8'),
(9, 'palco9', '$2y$10$n37T7opcqk9AoZRKuvFeEOwC/BOtq6RKeU742pDmQNuVTfcmF9442', 2, 'PALCO 9'),
(10, 'palco10', '$2y$10$n37T7opcqk9AoZRKuvFeEOwC/BOtq6RKeU742pDmQNuVTfcmF9442', 2, 'PALCO 10'),
(11, 'palco11', '$2y$10$n37T7opcqk9AoZRKuvFeEOwC/BOtq6RKeU742pDmQNuVTfcmF9442', 2, 'PALCO 11'),
(12, 'palco12', '$2y$10$n37T7opcqk9AoZRKuvFeEOwC/BOtq6RKeU742pDmQNuVTfcmF9442', 2, 'PALCO 12'),
(13, 'palco13', '$2y$10$n37T7opcqk9AoZRKuvFeEOwC/BOtq6RKeU742pDmQNuVTfcmF9442', 2, 'PALCO 13'),
(14, 'palco14', '$2y$10$n37T7opcqk9AoZRKuvFeEOwC/BOtq6RKeU742pDmQNuVTfcmF9442', 2, 'PALCO 14'),
(15, 'palco15', '$2y$10$n37T7opcqk9AoZRKuvFeEOwC/BOtq6RKeU742pDmQNuVTfcmF9442', 2, 'PALCO 15'),
(16, 'palco16', '$2y$10$n37T7opcqk9AoZRKuvFeEOwC/BOtq6RKeU742pDmQNuVTfcmF9442', 2, 'PALCO 16'),
(17, 'palco17', '$2y$10$n37T7opcqk9AoZRKuvFeEOwC/BOtq6RKeU742pDmQNuVTfcmF9442', 2, 'PALCO 17'),
(18, 'palco18', '$2y$10$n37T7opcqk9AoZRKuvFeEOwC/BOtq6RKeU742pDmQNuVTfcmF9442', 2, 'PALCO 18'),
(19, 'palco19', '$2y$10$n37T7opcqk9AoZRKuvFeEOwC/BOtq6RKeU742pDmQNuVTfcmF9442', 2, 'PALCO 19'),
(20, 'palco20', '$2y$10$n37T7opcqk9AoZRKuvFeEOwC/BOtq6RKeU742pDmQNuVTfcmF9442', 2, 'PALCO 20'),
(21, 'palco21', '$2y$10$n37T7opcqk9AoZRKuvFeEOwC/BOtq6RKeU742pDmQNuVTfcmF9442', 2, 'PALCO 21'),
(22, 'palco22', '$2y$10$n37T7opcqk9AoZRKuvFeEOwC/BOtq6RKeU742pDmQNuVTfcmF9442', 2, 'PALCO 22'),
(23, 'palco23', '$2y$10$n37T7opcqk9AoZRKuvFeEOwC/BOtq6RKeU742pDmQNuVTfcmF9442', 2, 'PALCO 23'),
(24, 'palco24', '$2y$10$n37T7opcqk9AoZRKuvFeEOwC/BOtq6RKeU742pDmQNuVTfcmF9442', 2, 'PALCO 24'),
(25, 'palco25', '$2y$10$n37T7opcqk9AoZRKuvFeEOwC/BOtq6RKeU742pDmQNuVTfcmF9442', 2, 'PALCO 25'),
(26, 'palco26', '$2y$10$n37T7opcqk9AoZRKuvFeEOwC/BOtq6RKeU742pDmQNuVTfcmF9442', 2, 'PALCO 26'),
(27, 'palco27', '$2y$10$n37T7opcqk9AoZRKuvFeEOwC/BOtq6RKeU742pDmQNuVTfcmF9442', 2, 'PALCO 27'),
(28, 'palco28', '$2y$10$n37T7opcqk9AoZRKuvFeEOwC/BOtq6RKeU742pDmQNuVTfcmF9442', 2, 'PALCO 28'),
(29, 'palco29', '$2y$10$n37T7opcqk9AoZRKuvFeEOwC/BOtq6RKeU742pDmQNuVTfcmF9442', 2, 'PALCO 29'),
(30, 'palco30', '$2y$10$n37T7opcqk9AoZRKuvFeEOwC/BOtq6RKeU742pDmQNuVTfcmF9442', 2, 'PALCO 30'),
(31, 'palco31', '$2y$10$n37T7opcqk9AoZRKuvFeEOwC/BOtq6RKeU742pDmQNuVTfcmF9442', 2, 'PALCO 31'),
(32, 'palco32', '$2y$10$n37T7opcqk9AoZRKuvFeEOwC/BOtq6RKeU742pDmQNuVTfcmF9442', 2, 'PALCO 32'),
(33, 'palco33', '$2y$10$n37T7opcqk9AoZRKuvFeEOwC/BOtq6RKeU742pDmQNuVTfcmF9442', 2, 'PALCO 33'),
(34, 'palco34', '$2y$10$n37T7opcqk9AoZRKuvFeEOwC/BOtq6RKeU742pDmQNuVTfcmF9442', 2, 'PALCO 34'),
(35, 'palco35', '$2y$10$n37T7opcqk9AoZRKuvFeEOwC/BOtq6RKeU742pDmQNuVTfcmF9442', 2, 'PALCO 35'),
(36, 'palco36', '$2y$10$n37T7opcqk9AoZRKuvFeEOwC/BOtq6RKeU742pDmQNuVTfcmF9442', 2, 'PALCO 36'),
(37, 'palco37', '$2y$10$n37T7opcqk9AoZRKuvFeEOwC/BOtq6RKeU742pDmQNuVTfcmF9442', 2, 'PALCO 37'),
(38, 'palco38', '$2y$10$n37T7opcqk9AoZRKuvFeEOwC/BOtq6RKeU742pDmQNuVTfcmF9442', 2, 'PALCO 38'),
(39, 'palco39', '$2y$10$n37T7opcqk9AoZRKuvFeEOwC/BOtq6RKeU742pDmQNuVTfcmF9442', 2, 'PALCO 39'),
(40, 'palco40', '$2y$10$n37T7opcqk9AoZRKuvFeEOwC/BOtq6RKeU742pDmQNuVTfcmF9442', 2, 'PALCO 40'),
(41, 'palco41', '$2y$10$n37T7opcqk9AoZRKuvFeEOwC/BOtq6RKeU742pDmQNuVTfcmF9442', 2, 'PALCO 41'),
(42, 'palco42', '$2y$10$n37T7opcqk9AoZRKuvFeEOwC/BOtq6RKeU742pDmQNuVTfcmF9442', 2, 'PALCO 42'),
(43, 'palco43', '$2y$10$n37T7opcqk9AoZRKuvFeEOwC/BOtq6RKeU742pDmQNuVTfcmF9442', 2, 'PALCO 43'),
(44, 'palco44', '$2y$10$n37T7opcqk9AoZRKuvFeEOwC/BOtq6RKeU742pDmQNuVTfcmF9442', 2, 'PALCO 44'),
(45, 'palco45', '$2y$10$n37T7opcqk9AoZRKuvFeEOwC/BOtq6RKeU742pDmQNuVTfcmF9442', 2, 'PALCO 45'),
(46, 'palco46', '$2y$10$n37T7opcqk9AoZRKuvFeEOwC/BOtq6RKeU742pDmQNuVTfcmF9442', 2, 'PALCO 46'),
(47, 'palco47', '$2y$10$n37T7opcqk9AoZRKuvFeEOwC/BOtq6RKeU742pDmQNuVTfcmF9442', 2, 'PALCO 47'),
(48, 'palco48', '$2y$10$n37T7opcqk9AoZRKuvFeEOwC/BOtq6RKeU742pDmQNuVTfcmF9442', 2, 'PALCO 48'),
(49, 'palco49', '$2y$10$n37T7opcqk9AoZRKuvFeEOwC/BOtq6RKeU742pDmQNuVTfcmF9442', 2, 'PALCO 49'),
(50, 'palco50', '$2y$10$n37T7opcqk9AoZRKuvFeEOwC/BOtq6RKeU742pDmQNuVTfcmF9442', 2, 'PALCO 50'),
(51, 'palco51', '$2y$10$n37T7opcqk9AoZRKuvFeEOwC/BOtq6RKeU742pDmQNuVTfcmF9442', 2, 'PALCO 51'),
(52, 'palco52', '$2y$10$n37T7opcqk9AoZRKuvFeEOwC/BOtq6RKeU742pDmQNuVTfcmF9442', 2, 'PALCO 52'),
(53, 'palco53', '$2y$10$n37T7opcqk9AoZRKuvFeEOwC/BOtq6RKeU742pDmQNuVTfcmF9442', 2, 'PALCO 53'),
(54, 'palco54', '$2y$10$n37T7opcqk9AoZRKuvFeEOwC/BOtq6RKeU742pDmQNuVTfcmF9442', 2, 'PALCO 54'),
(55, 'palco55', '$2y$10$n37T7opcqk9AoZRKuvFeEOwC/BOtq6RKeU742pDmQNuVTfcmF9442', 2, 'PALCO 55'),
(56, 'palco56', '$2y$10$n37T7opcqk9AoZRKuvFeEOwC/BOtq6RKeU742pDmQNuVTfcmF9442', 2, 'PALCO 56'),
(57, 'palco57', '$2y$10$n37T7opcqk9AoZRKuvFeEOwC/BOtq6RKeU742pDmQNuVTfcmF9442', 2, 'PALCO 57'),
(58, 'palco58', '$2y$10$n37T7opcqk9AoZRKuvFeEOwC/BOtq6RKeU742pDmQNuVTfcmF9442', 2, 'PALCO 58'),
(59, 'palco59', '$2y$10$n37T7opcqk9AoZRKuvFeEOwC/BOtq6RKeU742pDmQNuVTfcmF9442', 2, 'PALCO 59'),
(60, 'palco60', '$2y$10$n37T7opcqk9AoZRKuvFeEOwC/BOtq6RKeU742pDmQNuVTfcmF9442', 2, 'PALCO 60'),
(61, 'palco61', '$2y$10$n37T7opcqk9AoZRKuvFeEOwC/BOtq6RKeU742pDmQNuVTfcmF9442', 2, 'PALCO 61'),
(62, 'palco62', '$2y$10$n37T7opcqk9AoZRKuvFeEOwC/BOtq6RKeU742pDmQNuVTfcmF9442', 2, 'PALCO 62'),
(63, 'palco63', '$2y$10$n37T7opcqk9AoZRKuvFeEOwC/BOtq6RKeU742pDmQNuVTfcmF9442', 2, 'PALCO 63'),
(64, 'palco64', '$2y$10$n37T7opcqk9AoZRKuvFeEOwC/BOtq6RKeU742pDmQNuVTfcmF9442', 2, 'PALCO 64'),
(65, 'palco65', '$2y$10$n37T7opcqk9AoZRKuvFeEOwC/BOtq6RKeU742pDmQNuVTfcmF9442', 2, 'PALCO 65'),
(66, 'palco66', '$2y$10$n37T7opcqk9AoZRKuvFeEOwC/BOtq6RKeU742pDmQNuVTfcmF9442', 2, 'PALCO 66'),
(67, 'palco67', '$2y$10$n37T7opcqk9AoZRKuvFeEOwC/BOtq6RKeU742pDmQNuVTfcmF9442', 2, 'PALCO 67'),
(68, 'palco68', '$2y$10$n37T7opcqk9AoZRKuvFeEOwC/BOtq6RKeU742pDmQNuVTfcmF9442', 2, 'PALCO 68'),
(69, 'palco69', '$2y$10$n37T7opcqk9AoZRKuvFeEOwC/BOtq6RKeU742pDmQNuVTfcmF9442', 2, 'PALCO 69'),
(70, 'palco70', '$2y$10$n37T7opcqk9AoZRKuvFeEOwC/BOtq6RKeU742pDmQNuVTfcmF9442', 2, 'PALCO 70'),
(71, 'palco71', '$2y$10$n37T7opcqk9AoZRKuvFeEOwC/BOtq6RKeU742pDmQNuVTfcmF9442', 2, 'PALCO 71'),
(72, 'palco72', '$2y$10$n37T7opcqk9AoZRKuvFeEOwC/BOtq6RKeU742pDmQNuVTfcmF9442', 2, 'PALCO 72'),
(73, 'palco73', '$2y$10$n37T7opcqk9AoZRKuvFeEOwC/BOtq6RKeU742pDmQNuVTfcmF9442', 2, 'PALCO 73'),
(74, 'palco74', '$2y$10$n37T7opcqk9AoZRKuvFeEOwC/BOtq6RKeU742pDmQNuVTfcmF9442', 2, 'PALCO 74'),
(75, 'palco75', '$2y$10$n37T7opcqk9AoZRKuvFeEOwC/BOtq6RKeU742pDmQNuVTfcmF9442', 2, 'PALCO 75'),
(76, 'palco76', '$2y$10$n37T7opcqk9AoZRKuvFeEOwC/BOtq6RKeU742pDmQNuVTfcmF9442', 2, 'PALCO 76'),
(77, 'palco77', '$2y$10$n37T7opcqk9AoZRKuvFeEOwC/BOtq6RKeU742pDmQNuVTfcmF9442', 2, 'PALCO 77'),
(78, 'palco78', '$2y$10$n37T7opcqk9AoZRKuvFeEOwC/BOtq6RKeU742pDmQNuVTfcmF9442', 2, 'PALCO 78'),
(79, 'palco79', '$2y$10$n37T7opcqk9AoZRKuvFeEOwC/BOtq6RKeU742pDmQNuVTfcmF9442', 2, 'PALCO 79'),
(80, 'palco80', '$2y$10$n37T7opcqk9AoZRKuvFeEOwC/BOtq6RKeU742pDmQNuVTfcmF9442', 2, 'PALCO 80'),
(81, 'palco81', '$2y$10$n37T7opcqk9AoZRKuvFeEOwC/BOtq6RKeU742pDmQNuVTfcmF9442', 2, 'PALCO 81'),
(82, 'palco82', '$2y$10$n37T7opcqk9AoZRKuvFeEOwC/BOtq6RKeU742pDmQNuVTfcmF9442', 2, 'PALCO 82'),
(83, 'palco83', '$2y$10$n37T7opcqk9AoZRKuvFeEOwC/BOtq6RKeU742pDmQNuVTfcmF9442', 2, 'PALCO 83'),
(84, 'palco84', '$2y$10$n37T7opcqk9AoZRKuvFeEOwC/BOtq6RKeU742pDmQNuVTfcmF9442', 2, 'PALCO 84'),
(85, 'palco85', '$2y$10$n37T7opcqk9AoZRKuvFeEOwC/BOtq6RKeU742pDmQNuVTfcmF9442', 2, 'PALCO 85'),
(86, 'palco86', '$2y$10$n37T7opcqk9AoZRKuvFeEOwC/BOtq6RKeU742pDmQNuVTfcmF9442', 2, 'PALCO 86'),
(87, 'palco87', '$2y$10$n37T7opcqk9AoZRKuvFeEOwC/BOtq6RKeU742pDmQNuVTfcmF9442', 2, 'PALCO 87'),
(88, 'palco88', '$2y$10$n37T7opcqk9AoZRKuvFeEOwC/BOtq6RKeU742pDmQNuVTfcmF9442', 2, 'PALCO 88'),
(89, 'palco89', '$2y$10$n37T7opcqk9AoZRKuvFeEOwC/BOtq6RKeU742pDmQNuVTfcmF9442', 2, 'PALCO 89'),
(90, 'palco90', '$2y$10$n37T7opcqk9AoZRKuvFeEOwC/BOtq6RKeU742pDmQNuVTfcmF9442', 2, 'PALCO 90'),
(91, 'palco91', '$2y$10$n37T7opcqk9AoZRKuvFeEOwC/BOtq6RKeU742pDmQNuVTfcmF9442', 2, 'PALCO 91'),
(92, 'palco92', '$2y$10$n37T7opcqk9AoZRKuvFeEOwC/BOtq6RKeU742pDmQNuVTfcmF9442', 2, 'PALCO 92'),
(93, 'palco93', '$2y$10$n37T7opcqk9AoZRKuvFeEOwC/BOtq6RKeU742pDmQNuVTfcmF9442', 2, 'PALCO 93'),
(94, 'palco94', '$2y$10$n37T7opcqk9AoZRKuvFeEOwC/BOtq6RKeU742pDmQNuVTfcmF9442', 2, 'PALCO 94'),
(95, 'palco95', '$2y$10$n37T7opcqk9AoZRKuvFeEOwC/BOtq6RKeU742pDmQNuVTfcmF9442', 2, 'PALCO 95'),
(96, 'palco96', '$2y$10$n37T7opcqk9AoZRKuvFeEOwC/BOtq6RKeU742pDmQNuVTfcmF9442', 2, 'PALCO 96'),
(97, 'palco97', '$2y$10$n37T7opcqk9AoZRKuvFeEOwC/BOtq6RKeU742pDmQNuVTfcmF9442', 2, 'PALCO 97'),
(98, 'palco98', '$2y$10$n37T7opcqk9AoZRKuvFeEOwC/BOtq6RKeU742pDmQNuVTfcmF9442', 2, 'PALCO 98'),
(99, 'palco99', '$2y$10$n37T7opcqk9AoZRKuvFeEOwC/BOtq6RKeU742pDmQNuVTfcmF9442', 2, 'PALCO 99'),
(100, 'palco100', '$2y$10$n37T7opcqk9AoZRKuvFeEOwC/BOtq6RKeU742pDmQNuVTfcmF9442', 2, 'PALCO 100'),
(101, 'cocina', '$2y$10$n37T7opcqk9AoZRKuvFeEOwC/BOtq6RKeU742pDmQNuVTfcmF9442', 4, 'COCINA'),
(102, 'administrador', '$2y$10$n37T7opcqk9AoZRKuvFeEOwC/BOtq6RKeU742pDmQNuVTfcmF9442', 3, 'ADMINISTRADOR');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categorias`
--
ALTER TABLE `categorias`
  ADD PRIMARY KEY (`id_categoria`),
  ADD KEY `fk_tipo` (`id_tipo`);

--
-- Indexes for table `detalle_orden`
--
ALTER TABLE `detalle_orden`
  ADD PRIMARY KEY (`id_detalle_orden`),
  ADD KEY `id_orden` (`id_orden`),
  ADD KEY `id_producto` (`id_producto`);

--
-- Indexes for table `favoritos`
--
ALTER TABLE `favoritos`
  ADD PRIMARY KEY (`id_favorito`),
  ADD KEY `id_producto` (`id_producto`);

--
-- Indexes for table `ordenes`
--
ALTER TABLE `ordenes`
  ADD PRIMARY KEY (`id_orden`),
  ADD KEY `id_usuario` (`id_usuario`);

--
-- Indexes for table `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`id_producto`),
  ADD KEY `id_categoria` (`id_categoria`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id_rol`);

--
-- Indexes for table `tipo`
--
ALTER TABLE `tipo`
  ADD PRIMARY KEY (`id_tipo`);

--
-- Indexes for table `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id_usuario`),
  ADD KEY `id_rol` (`id_rol`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categorias`
--
ALTER TABLE `categorias`
  MODIFY `id_categoria` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `detalle_orden`
--
ALTER TABLE `detalle_orden`
  MODIFY `id_detalle_orden` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=74;

--
-- AUTO_INCREMENT for table `favoritos`
--
ALTER TABLE `favoritos`
  MODIFY `id_favorito` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ordenes`
--
ALTER TABLE `ordenes`
  MODIFY `id_orden` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `productos`
--
ALTER TABLE `productos`
  MODIFY `id_producto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=97;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id_rol` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `tipo`
--
ALTER TABLE `tipo`
  MODIFY `id_tipo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id_usuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=103;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `categorias`
--
ALTER TABLE `categorias`
  ADD CONSTRAINT `fk_tipo` FOREIGN KEY (`id_tipo`) REFERENCES `tipo` (`id_tipo`);

--
-- Constraints for table `detalle_orden`
--
ALTER TABLE `detalle_orden`
  ADD CONSTRAINT `detalle_orden_ibfk_1` FOREIGN KEY (`id_orden`) REFERENCES `ordenes` (`id_orden`),
  ADD CONSTRAINT `detalle_orden_ibfk_2` FOREIGN KEY (`id_producto`) REFERENCES `productos` (`id_producto`);

--
-- Constraints for table `favoritos`
--
ALTER TABLE `favoritos`
  ADD CONSTRAINT `favoritos_ibfk_1` FOREIGN KEY (`id_producto`) REFERENCES `productos` (`id_producto`);

--
-- Constraints for table `ordenes`
--
ALTER TABLE `ordenes`
  ADD CONSTRAINT `ordenes_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_usuario`);

--
-- Constraints for table `productos`
--
ALTER TABLE `productos`
  ADD CONSTRAINT `productos_ibfk_1` FOREIGN KEY (`id_categoria`) REFERENCES `categorias` (`id_categoria`);

--
-- Constraints for table `usuarios`
--
ALTER TABLE `usuarios`
  ADD CONSTRAINT `usuarios_ibfk_1` FOREIGN KEY (`id_rol`) REFERENCES `roles` (`id_rol`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
