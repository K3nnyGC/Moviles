-- phpMyAdmin SQL Dump
-- version 4.0.10deb1
-- http://www.phpmyadmin.net
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 07-12-2018 a las 01:59:48
-- Versión del servidor: 5.5.57-0ubuntu0.14.04.1
-- Versión de PHP: 5.5.9-1ubuntu4.22

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de datos: `test`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `advertisement`
--

CREATE TABLE IF NOT EXISTS `advertisement` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(64) NOT NULL,
  `status` int(11) NOT NULL,
  `description` varchar(512) NOT NULL,
  `image` text NOT NULL,
  `latitude` double NOT NULL,
  `longitude` double NOT NULL,
  `address` varchar(128) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `flag` tinyint(1) NOT NULL DEFAULT '0',
  `id_user` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=21 ;

--
-- Volcado de datos para la tabla `advertisement`
--

INSERT INTO `advertisement` (`id`, `title`, `status`, `description`, `image`, `latitude`, `longitude`, `address`, `date`, `flag`, `id_user`) VALUES
(7, 'mi mascota ', 0, 'se perdiÃ³ mi perro puchi. ', '', 0, 0, 'por una calle oscura ', '2018-11-10 08:34:52', 0, 1),
(9, 'Lagarto encontrado en piscina ', 1, 'encontrÃ© un cocodrilo ðŸŠ nadando en mi piscina, quien loyquiere?  lo entrego gratis!  no hay roche! ', '', 0, 0, 'av Benavides 5467 ', '2018-11-10 19:43:43', 0, 1),
(10, 'Se escapÃ³ mi torutuga', 0, 'Lo deje en el parque las AmÃ©ricas, le quite la correa y saliÃ³ corriendo, no lo pude alcanzar, si lo ven me llaman. \nPD es muy peligroso. ', '', 0, 0, 'Hell st. 355', '2018-11-12 02:34:00', 0, 1),
(11, 'Beethoven busca a su familia', 1, 'Beethoven fue encontrado por el distrito de Lince y esta en busca de su familia....', '', 0, 0, 'Jr. Mariscal Castilla 987', '2018-11-12 02:44:56', 0, 1),
(14, 'perro fugado ', 0, 'se escapÃ³ porque no tiene nada de comer.', '', -12.077049255371, -77.093444824219, 'av parque de las leyendas 234', '2018-11-16 09:06:10', 0, 15),
(15, 'Ayuda a canela', 0, 'canela es un perrito de avanzada edad, se ha perdido cerca al metro de la marina con av del parque, lleva un collar rojo, el perro es de color marrÃ³n de estatura media.\nes super noble no muerde y no ladra mucho, si lo encuentras o sabes algo de Ã©l, por favor comunicate a la brevedad conmigo. ', '', -12.077618598938, -77.088882446289, 'av parque de las leyendas 222', '2018-11-18 16:25:13', 0, 1),
(16, 'Perrito en peligro', 1, 'Hay un animalito en el cruce de Alfonso ugarte y Venezuela, si alguien lo reconoce, pase a recogerlo a la brevedad. ', '', -12.054417610168, -77.042121887207, 'Av Alfonso ugarte con Venezuela ', '2018-11-20 07:45:21', 0, 1),
(17, 'Orejon Perdido', 0, 'Se ha encontrado un cachorro de raza Basset Hound de aprox. 1 aÃ±o. Es macho, muy docil y cariÃ±oso. \nEl cachorro se encuentra en un hogar temporal. Si alguien lo esta buscando enviar mensaje con alguna prueba que dicha mascota sea suya.', '', -12.074395179749, -77.100219726562, 'Av. La Marina 3367. San Miguel', '2018-11-21 06:56:53', 0, 14),
(18, 'Milo quiere encontrar su casa', 1, 'Milo es un lindo bulldog inglÃ©s el cual fue encontrado en la Ovalo de La Perla deambulando, tiene 5 aÃ±os aprox.  Por el momento se encuentra en un hogar temporal para su cuidado. Si alguien lo reconoce por favor comumicarse conmigo.', '', -12.065347671509, -77.118988037109, 'Ovalo de La Perla', '2018-11-22 10:56:41', 0, 14),
(19, 'Loremzo', 0, 'Lorenzo es un travieso Golden Retriever de 4 aÃ±os, color negro.Se viÃ³ por Ãºltima cerca a Plaza San Miguel. Lorenzo es muy dÃ³cil y juguetÃ³n. Si alguiÃ©n lo ha visto por favor comunicarse con nosotros, una pequeÃ±a de 5 aÃ±os lo espera ansiosamente.', '', -12.076192855835, -77.083129882812, 'Plaza San Miguel', '2018-11-22 11:54:47', 0, 14),
(20, 'Gatita encontrada en Lince', 1, 'Se encontrÃ³ gatita por municipalidad de Lince. EstÃ¡ llorando y asustada. Por favor, ayÃºdanos a encontrar su casa', '', -12.077005386353, -77.092842102051, 'Municipalidad de Lince', '2018-11-23 02:56:03', 0, 14);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `image`
--

CREATE TABLE IF NOT EXISTS `image` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `img` text NOT NULL,
  `idad` int(11) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idad` (`idad`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `log`
--

CREATE TABLE IF NOT EXISTS `log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `consulta` varchar(1024) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=214 ;

--
-- Volcado de datos para la tabla `log`
--

INSERT INTO `log` (`id`, `consulta`, `date`) VALUES
(1, '0', '0000-00-00 00:00:00'),
(2, '0', '0000-00-00 00:00:00'),
(3, '0', '0000-00-00 00:00:00'),
(4, 'SELECT * FROM owner WHERE email = ''kenny%40mail.com''', '0000-00-00 00:00:00'),
(5, 'SELECT * FROM owner', '0000-00-00 00:00:00'),
(6, 'SELECT * FROM owner WHERE email = ''kenny@mail.com''', '0000-00-00 00:00:00'),
(7, 'SELECT * FROM owner WHERE email = ''kenny%40mail.com''', '0000-00-00 00:00:00'),
(8, 'SELECT * FROM owner WHERE email = ''kenny%40mail.com''', '2018-10-27 18:23:53'),
(9, 'SELECT * FROM owner WHERE email = ''kenny@mail.com''', '2018-10-27 18:32:51'),
(10, 'SELECT * FROM owner WHERE email = ''kenny@mail.com''', '2018-10-27 18:33:07'),
(11, 'SELECT * FROM owner WHERE email = ''kenny@mail.com''', '2018-10-27 18:33:18'),
(12, 'SELECT * FROM owner WHERE email = ''kenny@mail.co''', '2018-10-27 18:33:31'),
(13, 'SELECT * FROM owner WHERE email = ''kenny@mail.co''', '2018-10-27 18:34:51'),
(14, 'SELECT * FROM owner WHERE email = ''kenny@mail.co''', '2018-10-27 18:34:58'),
(15, 'SELECT * FROM owner WHERE email = ''kenny@mail.co''', '2018-10-27 18:35:13'),
(16, 'SELECT * FROM owner WHERE email = ''kenny@mail.co''', '2018-10-27 18:35:46'),
(17, 'SELECT * FROM owner WHERE email = ''kenny@mail.com''', '2018-10-27 18:36:11'),
(18, 'SELECT * FROM owner WHERE email = ''ffff@mail.com''', '2018-10-27 18:37:16'),
(19, 'SELECT * FROM owner WHERE email = ''kenny@mail.com''', '2018-10-27 18:41:32'),
(20, 'SELECT * FROM owner WHERE email = ''kenny@mail.com''', '2018-10-27 18:55:57'),
(21, 'SELECT * FROM owner WHERE email = ''kenny@mail.com''', '2018-10-27 18:56:31'),
(22, 'SELECT * FROM owner WHERE email = ''kenny@mail.com''', '2018-10-27 19:08:54'),
(23, 'SELECT * FROM owner WHERE email = ''kenny@mail.com''', '2018-10-27 19:27:54'),
(24, 'SELECT * FROM owner WHERE email = ''kenny@mail.com''', '2018-10-27 19:31:26'),
(25, 'SELECT * FROM owner WHERE email = ''kenny@mail.com''', '2018-10-27 19:32:46'),
(26, 'SELECT * FROM owner WHERE email = ''kenny@mail.com''', '2018-10-27 19:47:21'),
(27, 'SELECT * FROM owner WHERE email = ''kenny@mail.com''', '2018-10-27 19:47:28'),
(28, 'SELECT * FROM owner WHERE email = ''kenny@mail.com''', '2018-10-27 19:49:55'),
(29, 'SELECT * FROM owner WHERE email = ''kenny@mail.com''', '2018-10-27 19:50:07'),
(30, 'SELECT * FROM owner WHERE email = ''kenny@mail.com''', '2018-10-27 19:51:14'),
(31, 'SELECT * FROM owner WHERE email = ''kenny@mail.com''', '2018-10-27 19:51:34'),
(32, 'UPDATE owner SET  dni = ''12233445'', name = ''Kenny'', lastname = ''Gonzales'', email = ''kenny@mail.com'', password = ''123'' WHERE id=', '2018-11-09 06:46:35'),
(33, 'UPDATE owner SET  dni = ''12233445'', name = ''Kenny'', lastname = ''Gonzales'', password = ''123'' WHERE id=', '2018-11-09 06:49:33'),
(34, 'UPDATE owner SET  dni = ''12233445'', name = ''Kenny'', lastname = ''Gonzales'', password = ''123'' WHERE email=''kenny@mail.com''', '2018-11-09 06:54:39'),
(35, 'SELECT * FROM owner WHERE email = ''kenny@mail.com''', '2018-11-09 06:54:39'),
(36, 'UPDATE owner SET  dni = ''12233446'', name = ''Kenny'', lastname = ''Gonzales'', password = ''123'' WHERE email=''kenny@mail.com''', '2018-11-09 06:55:04'),
(37, 'SELECT * FROM owner WHERE email = ''kenny@mail.com''', '2018-11-09 06:55:04'),
(38, 'UPDATE owner SET  dni = ''12233446'', name = ''Kenny 2'', lastname = ''Gonzales'', password = ''123'' WHERE email=''kenny@mail.com''', '2018-11-09 06:55:12'),
(39, 'SELECT * FROM owner WHERE email = ''kenny@mail.com''', '2018-11-09 06:55:12'),
(40, 'UPDATE owner SET  dni = ''12233446'', name = ''Kenny 2'', lastname = ''Gonzales'', email = ''kenny@mail.com'', password = ''123'' WHERE email=''kenny@mail.com''', '2018-11-09 06:57:39'),
(41, 'SELECT * FROM owner WHERE email = ''kenny@mail.com''', '2018-11-09 06:57:39'),
(42, 'UPDATE owner SET  dni = ''12233446'', name = ''Kenny 2'', lastname = ''Gonzales'', password = ''123'' WHERE email=''kenny@mail.com''', '2018-11-09 06:59:39'),
(43, 'SELECT * FROM owner WHERE email = ''kenny@mail.com''', '2018-11-09 06:59:39'),
(44, 'UPDATE owner SET  dni = ''12233446'', name = ''Kenny 2'', lastname = ''Gonzales'', password = ''123'' WHERE email=''kenny@mail.com''', '2018-11-09 07:02:16'),
(45, 'SELECT * FROM owner WHERE email = ''kenny@mail.com''', '2018-11-09 07:02:16'),
(46, 'UPDATE owner SET  dni = ''12233446'', name = ''Kenny 2'', lastname = ''Gonzales'', password = ''123'' WHERE email=''kenny@mail.com''', '2018-11-09 07:02:36'),
(47, 'SELECT * FROM owner WHERE email = ''kenny@mail.com''', '2018-11-09 07:02:36'),
(48, 'UPDATE owner SET  dni = ''12233446'', name = ''Kenny 2'', lastname = ''Gonzales'', password = ''123'' WHERE email=''kenny@mail.comf''', '2018-11-09 07:05:15'),
(49, 'SELECT * FROM owner WHERE email = ''kenny@mail.comf''', '2018-11-09 07:05:15'),
(50, 'UPDATE owner SET  dni = ''12233446'', name = ''Kenny 2'', lastname = ''Gonzales'', password = ''123'' WHERE email=''kenny@mail.com''', '2018-11-09 07:05:48'),
(51, 'SELECT * FROM owner WHERE email = ''kenny@mail.com''', '2018-11-09 07:05:48'),
(52, 'DELETE FROM owner WHERE email=''keiko@rata.china''', '2018-11-09 07:14:21'),
(53, 'DELETE FROM owner WHERE email=''keiko@rata.china''', '2018-11-09 07:17:33'),
(54, 'DELETE FROM owner WHERE email=''keiko@rata.china''', '2018-11-09 07:17:38'),
(55, 'DELETE FROM owner WHERE email=''keiko@rata.china''', '2018-11-09 07:19:13'),
(56, 'UPDATE owner SET  dni = ''12233446'', name = ''Kenny 2'', lastname = ''Gonzales'', password = ''123'' WHERE email=''keiko@rata.china''', '2018-11-09 07:20:43'),
(57, 'SELECT * FROM owner WHERE email = ''keiko@rata.china''', '2018-11-09 07:20:43'),
(58, 'SELECT * FROM owner WHERE email = ''keiko@rata.china''', '2018-11-09 07:23:27'),
(59, 'UPDATE owner SET  dni = ''12233446'', name = ''Kenny 2'', lastname = ''Gonzales'', password = ''123'' WHERE email=''keiko@rata.china''', '2018-11-09 07:24:06'),
(60, 'SELECT * FROM owner WHERE email = ''keiko@rata.china''', '2018-11-09 07:24:06'),
(61, 'UPDATE owner SET  dni = ''12233446'', name = ''Kenny 2'', lastname = ''Gonzales'', password = ''123'' WHERE email=''keiko@rata.china''', '2018-11-09 07:27:44'),
(62, 'SELECT * FROM owner WHERE email = ''keiko@rata.china''', '2018-11-09 07:27:44'),
(63, 'UPDATE owner SET  dni = ''12233446'', name = ''Kenny 2'', lastname = ''Gonzales'', password = ''123'' WHERE email=''keiko@rata.china''', '2018-11-09 07:28:02'),
(64, 'SELECT * FROM owner WHERE email = ''keiko@rata.china''', '2018-11-09 07:28:02'),
(65, 'UPDATE owner SET  dni = ''12233446'', name = ''Kenny 2'', lastname = ''Gonzales'', password = ''123'' WHERE email=''nuevo@gmail.com''', '2018-11-09 07:30:16'),
(66, 'SELECT * FROM owner WHERE email = ''nuevo@gmail.com''', '2018-11-09 07:30:16'),
(67, 'DELETE FROM owner WHERE email=''nuevo@gmail.com''', '2018-11-09 07:30:35'),
(68, 'INSERT INTO owner ( dni, name, lastname, email, password) VALUES( ''88778877'', ''gato '', ''mon'', ''gatomon@digimon.net'', ''123'');', '2018-11-09 07:35:35'),
(69, 'SELECT * FROM owner WHERE email = ''gatomon@digimon.net''', '2018-11-09 07:35:35'),
(70, 'SELECT * FROM owner WHERE email = ''nuevo@gmail.com''', '2018-11-10 06:33:43'),
(71, 'SELECT * FROM advertisement', '2018-11-10 06:33:53'),
(72, 'INSERT INTO advertisement ( title, status, description, image, latitude, longitude, address, flag, id_user) VALUES( ''Tirulo'', 0, ''Y ahora como es la nuez'', '''', 0, 0, ''av la mar 32'', , 1);', '2018-11-10 06:40:31'),
(73, 'INSERT INTO advertisement ( title, status, description, image, latitude, longitude, address, flag, id_user) VALUES( ''Tirulo'', 0, ''Y ahora como es la nuez'', '''', 0, 0, ''av la mar 32'', , 1);', '2018-11-10 06:40:47'),
(74, 'INSERT INTO advertisement ( title, status, description, image, latitude, longitude, address, flag, id_user) VALUES( ''Tirulo'', 0, ''Y ahora como es la nuez'', '''', 0, 0, ''av la mar 32'', ''false'', 1);', '2018-11-10 06:50:47'),
(75, 'SELECT * FROM advertisement WHERE id = ', '2018-11-10 06:50:47'),
(76, 'INSERT INTO advertisement ( title, status, description, image, latitude, longitude, address, flag, id_user) VALUES( ''Tirulo'', 0, ''Y ahora como es la nuez'', '''', 0, 0, ''av la mar 32'', , 1);', '2018-11-10 06:51:21'),
(77, 'INSERT INTO advertisement ( title, status, description, image, latitude, longitude, address, flag, id_user) VALUES( ''Tirulo'', 0, ''Y ahora como es la nuez'', '''', 0, 0, ''av la mar 32'', ''false'', 1);', '2018-11-10 06:51:32'),
(78, 'SELECT * FROM advertisement WHERE id = ', '2018-11-10 06:51:32'),
(79, 'INSERT INTO advertisement ( title, status, description, image, latitude, longitude, address, flag, id_user) VALUES( ''Tirulo'', 0, ''Y ahora como es la nuez'', '''', 0, 0, ''av la mar 32'', ''false'', 1);', '2018-11-10 06:53:21'),
(80, 'SELECT * FROM advertisement WHERE id = ', '2018-11-10 06:53:21'),
(81, 'INSERT INTO advertisement ( title, status, description, image, latitude, longitude, address, flag, id_user) VALUES( ''Tirulo'', 0, ''Y ahora como es la nuez'', '''', 0, 0, ''av la mar 32'', , 1);', '2018-11-10 06:53:31'),
(82, 'INSERT INTO advertisement ( title, status, description, image, latitude, longitude, address, flag, id_user) VALUES( ''Tirulo'', 0, ''Y ahora como es la nuez'', '''', 0, 0, ''av la mar 32'', ''false'', 1);', '2018-11-10 06:53:40'),
(83, 'SELECT * FROM advertisement WHERE id = ', '2018-11-10 06:53:40'),
(84, 'SELECT * FROM advertisement', '2018-11-10 06:58:44'),
(85, 'SELECT * FROM advertisement WHERE id = ''1''', '2018-11-10 06:59:02'),
(86, 'INSERT INTO advertisement ( title, status, description, image, latitude, longitude, address, flag, id_user) VALUES( ''Tirulo 32'', 0, ''Y ahora como es la nuez mmmm'', '''', 0, 0, ''av la mar 32'', ''false'', 1);', '2018-11-10 07:11:40'),
(87, 'SELECT * FROM advertisement ORDER BY id DESC LIMIT 1', '2018-11-10 07:11:40'),
(88, 'INSERT INTO advertisement ( title, status, description, image, latitude, longitude, address, flag, id_user) VALUES( ''ohhhhhhhhhhhhhh'', 0, ''Y ahora como es la nuez mmmm'', '''', 0, 0, ''av la mar 32'', ''false'', 1);', '2018-11-10 07:13:14'),
(89, 'SELECT * FROM advertisement ORDER BY id DESC LIMIT 1', '2018-11-10 07:13:14'),
(90, 'INSERT INTO advertisement ( title, status, description, image, latitude, longitude, address, flag, id_user) VALUES( ''mi mascota '', 0, ''se perdiÃ³ mi perro auxilio! '', '''', 0, 0, ''por una calle '', , 1);', '2018-11-10 08:28:11'),
(91, 'SELECT * FROM owner WHERE email = ''kenny@mail.com''', '2018-11-10 08:34:18'),
(92, 'INSERT INTO advertisement ( title, status, description, image, latitude, longitude, address, flag, id_user) VALUES( ''mi mascota '', 0, ''se perdiÃ³ mi perro puchi. '', '''', 0, 0, ''por una calle oscura '', 0, 1);', '2018-11-10 08:34:52'),
(93, 'SELECT * FROM advertisement ORDER BY id DESC LIMIT 1', '2018-11-10 08:34:52'),
(94, 'SELECT * FROM advertisement', '2018-11-10 08:35:05'),
(95, 'SELECT * FROM owner WHERE email = ''kenny@mail.com''', '2018-11-10 09:02:26'),
(96, 'SELECT * FROM owner WHERE email = ''kenny@mail.com''', '2018-11-10 09:14:58'),
(97, 'SELECT * FROM owner WHERE email = ''kenny@mail.com''', '2018-11-10 09:32:15'),
(98, 'SELECT * FROM owner WHERE email = ''kenny@mail.com''', '2018-11-10 15:10:48'),
(99, 'SELECT * FROM owner WHERE email = ''kenny@mail.com''', '2018-11-10 15:45:30'),
(100, 'SELECT * FROM owner WHERE email = ''kenny@mail.com''', '2018-11-10 17:01:23'),
(101, 'SELECT * FROM owner WHERE email = ''kenny@mail.com''', '2018-11-10 17:15:03'),
(102, 'SELECT * FROM owner WHERE email = ''kenny@mail.com''', '2018-11-10 17:15:29'),
(103, 'SELECT * FROM owner WHERE email = ''kenny@mail.com''', '2018-11-10 17:29:58'),
(104, 'SELECT * FROM owner WHERE email = ''kenny@mail.com''', '2018-11-10 17:59:08'),
(105, 'SELECT * FROM owner WHERE email = ''kenny@mail.com''', '2018-11-10 17:59:57'),
(106, 'SELECT * FROM owner WHERE email = ''kenny@mail.com''', '2018-11-10 18:33:20'),
(107, 'SELECT * FROM advertisement', '2018-11-10 18:33:21'),
(108, 'INSERT INTO advertisement ( title, status, description, image, latitude, longitude, address, flag, id_user) VALUES( ''gato olvidado '', 1, ''deje mi gato por feo. '', '''', 0, 0, ''no se '', 0, 1);', '2018-11-10 18:34:11'),
(109, 'SELECT * FROM advertisement ORDER BY id DESC LIMIT 1', '2018-11-10 18:34:11'),
(110, 'SELECT * FROM advertisement', '2018-11-10 18:34:11'),
(111, 'SELECT * FROM advertisement', '2018-11-10 18:37:51'),
(112, 'SELECT * FROM advertisement', '2018-11-10 18:38:57'),
(113, 'SELECT * FROM owner WHERE email = ''kenny@mail.com''', '2018-11-10 18:48:48'),
(114, 'SELECT * FROM advertisement', '2018-11-10 18:48:49'),
(115, 'SELECT * FROM advertisement', '2018-11-10 18:49:55'),
(116, 'SELECT * FROM advertisement', '2018-11-10 18:51:16'),
(117, 'SELECT * FROM advertisement ORDER BY id DESC LIMIT 10', '2018-11-10 18:53:41'),
(118, 'SELECT * FROM owner WHERE email = ''kenny@mail.com''', '2018-11-10 19:32:39'),
(119, 'SELECT * FROM advertisement ORDER BY id DESC LIMIT 10', '2018-11-10 19:32:41'),
(120, 'SELECT * FROM owner WHERE email = ''kenny@mail.com''', '2018-11-10 19:39:35'),
(121, 'SELECT * FROM advertisement ORDER BY id DESC LIMIT 10', '2018-11-10 19:39:36'),
(122, 'INSERT INTO advertisement ( title, status, description, image, latitude, longitude, address, flag, id_user) VALUES( ''Lagarto encontrado en piscina '', 1, ''encontrÃ© un cocodrilo ðŸŠ nadando en mi piscina, quien loyquiere?  lo entrego gratis!  no hay roche! '', '''', 0, 0, ''av Benavides 5467 '', 0, 1);', '2018-11-10 19:43:43'),
(123, 'SELECT * FROM advertisement ORDER BY id DESC LIMIT 1', '2018-11-10 19:43:43'),
(124, 'SELECT * FROM advertisement ORDER BY id DESC LIMIT 10', '2018-11-10 19:43:44'),
(125, 'SELECT * FROM owner WHERE email = ''kenny@mail.com''', '2018-11-10 19:43:52'),
(126, 'SELECT * FROM advertisement ORDER BY id DESC LIMIT 10', '2018-11-10 19:43:52'),
(127, 'SELECT * FROM owner WHERE email = ''kenny@mail.com''', '2018-11-10 19:57:19'),
(128, 'SELECT * FROM advertisement ORDER BY id DESC LIMIT 10', '2018-11-10 19:57:20'),
(129, 'SELECT * FROM owner WHERE email = ''kenny@mail.com''', '2018-11-10 20:00:03'),
(130, 'SELECT * FROM advertisement ORDER BY id DESC LIMIT 10', '2018-11-10 20:00:05'),
(131, 'SELECT * FROM owner WHERE email = ''kenny@mail.com''', '2018-11-10 20:03:10'),
(132, 'SELECT * FROM advertisement ORDER BY id DESC LIMIT 10', '2018-11-10 20:03:11'),
(133, 'SELECT * FROM owner WHERE email = ''kenny@mail.com''', '2018-11-10 20:11:08'),
(134, 'SELECT * FROM advertisement ORDER BY id DESC LIMIT 10', '2018-11-10 20:11:09'),
(135, 'SELECT * FROM advertisement ORDER BY id DESC LIMIT 10', '2018-11-10 20:12:40'),
(136, 'SELECT * FROM owner WHERE email = ''kenny@mail.com''', '2018-11-10 20:44:02'),
(137, 'SELECT * FROM advertisement ORDER BY id DESC LIMIT 10', '2018-11-10 20:44:03'),
(138, 'SELECT * FROM owner WHERE email = ''kenny@mail.com''', '2018-11-10 20:45:54'),
(139, 'SELECT * FROM advertisement ORDER BY id DESC LIMIT 10', '2018-11-10 20:45:56'),
(140, 'SELECT * FROM owner WHERE email = ''kenny@mail.com''', '2018-11-15 08:44:08'),
(141, 'SELECT * FROM advertisement ORDER BY id DESC LIMIT 10', '2018-11-15 08:44:08'),
(142, 'SELECT * FROM owner WHERE email = ''kenny@mail.com''', '2018-11-15 08:57:10'),
(143, 'INSERT INTO token ( id_user, tk) VALUES( 1, ''esZp-SNh8kQ:APA91bEMNfDTQ0k67eo2zCpRZWB1S5ghwxuFds9RgRxZACm7x9mqzimtDokfD_nSqK2T1QUe6GksUAUU0mYS0Sw2bveMaea8ux40YMeUjf55nXuEt_XSYBUFYG5i5Wh3bFcg1mUXo0kF'');', '2018-11-15 08:57:11'),
(144, 'SELECT * FROM token ORDER BY id DESC LIMIT 1', '2018-11-15 08:57:11'),
(145, 'SELECT * FROM advertisement ORDER BY id DESC LIMIT 10', '2018-11-15 08:57:11'),
(146, 'SELECT * FROM token WHERE id = ''1''', '2018-11-15 08:57:38'),
(147, 'SELECT * FROM owner WHERE email = ''kenny@mail.com''', '2018-11-15 09:17:45'),
(148, 'INSERT INTO token ( id_user, tk) VALUES( 1, ''esZp-SNh8kQ:APA91bEMNfDTQ0k67eo2zCpRZWB1S5ghwxuFds9RgRxZACm7x9mqzimtDokfD_nSqK2T1QUe6GksUAUU0mYS0Sw2bveMaea8ux40YMeUjf55nXuEt_XSYBUFYG5i5Wh3bFcg1mUXo0kF'');', '2018-11-15 09:17:47'),
(149, 'SELECT * FROM token ORDER BY id DESC LIMIT 1', '2018-11-15 09:17:47'),
(150, 'SELECT * FROM advertisement ORDER BY id DESC LIMIT 10', '2018-11-15 09:17:47'),
(151, 'SELECT * FROM token ORDER BY id DESC LIMIT 10', '2018-11-15 09:18:13'),
(152, 'SELECT * FROM owner WHERE email = ''anonimo@gmail.com''', '2018-11-15 09:19:44'),
(153, 'INSERT INTO token ( id_user, tk) VALUES( 13, ''esZp-SNh8kQ:APA91bEMNfDTQ0k67eo2zCpRZWB1S5ghwxuFds9RgRxZACm7x9mqzimtDokfD_nSqK2T1QUe6GksUAUU0mYS0Sw2bveMaea8ux40YMeUjf55nXuEt_XSYBUFYG5i5Wh3bFcg1mUXo0kF'');', '2018-11-15 09:19:44'),
(154, 'SELECT * FROM token ORDER BY id DESC LIMIT 1', '2018-11-15 09:19:44'),
(155, 'SELECT * FROM advertisement ORDER BY id DESC LIMIT 10', '2018-11-15 09:19:45'),
(156, 'SELECT * FROM token ORDER BY id DESC LIMIT 10', '2018-11-15 09:19:59'),
(157, 'SELECT * FROM owner WHERE email = ''anonimo@gmail.com''', '2018-11-15 09:35:57'),
(158, 'INSERT INTO token ( id_user, tk) VALUES( 13, ''esZp-SNh8kQ:APA91bEMNfDTQ0k67eo2zCpRZWB1S5ghwxuFds9RgRxZACm7x9mqzimtDokfD_nSqK2T1QUe6GksUAUU0mYS0Sw2bveMaea8ux40YMeUjf55nXuEt_XSYBUFYG5i5Wh3bFcg1mUXo0kF'');', '2018-11-15 09:35:57'),
(159, 'SELECT * FROM token ORDER BY id DESC LIMIT 1', '2018-11-15 09:35:57'),
(160, 'SELECT * FROM advertisement ORDER BY id DESC LIMIT 10', '2018-11-15 09:35:58'),
(161, 'SELECT * FROM owner WHERE email = ''anonimo@gmail.com''', '2018-11-15 09:45:14'),
(162, 'INSERT INTO token ( id_user, tk) VALUES( 13, ''esZp-SNh8kQ:APA91bEMNfDTQ0k67eo2zCpRZWB1S5ghwxuFds9RgRxZACm7x9mqzimtDokfD_nSqK2T1QUe6GksUAUU0mYS0Sw2bveMaea8ux40YMeUjf55nXuEt_XSYBUFYG5i5Wh3bFcg1mUXo0kF'');', '2018-11-15 09:45:15'),
(163, 'SELECT * FROM token ORDER BY id DESC LIMIT 1', '2018-11-15 09:45:15'),
(164, 'SELECT * FROM advertisement ORDER BY id DESC LIMIT 10', '2018-11-15 09:45:16'),
(165, 'INSERT INTO advertisement ( title, status, description, image, latitude, longitude, address, flag, id_user) VALUES( ''perro '', 1, ''omg'', '''', 0, 0, ''ni idea'', 0, 1);', '2018-11-15 09:45:45'),
(166, 'SELECT * FROM advertisement ORDER BY id DESC LIMIT 1', '2018-11-15 09:45:45'),
(167, 'SELECT * FROM advertisement ORDER BY id DESC LIMIT 10', '2018-11-15 09:45:45'),
(168, 'SELECT * FROM advertisement ORDER BY id DESC LIMIT 10', '2018-11-15 09:48:31'),
(169, 'SELECT * FROM owner WHERE email = ''anonimo@gmail.com''', '2018-11-15 09:50:06'),
(170, 'INSERT INTO token ( id_user, tk) VALUES( 13, ''esZp-SNh8kQ:APA91bEMNfDTQ0k67eo2zCpRZWB1S5ghwxuFds9RgRxZACm7x9mqzimtDokfD_nSqK2T1QUe6GksUAUU0mYS0Sw2bveMaea8ux40YMeUjf55nXuEt_XSYBUFYG5i5Wh3bFcg1mUXo0kF'');', '2018-11-15 09:50:08'),
(171, 'SELECT * FROM token ORDER BY id DESC LIMIT 1', '2018-11-15 09:50:08'),
(172, 'SELECT * FROM advertisement ORDER BY id DESC LIMIT 10', '2018-11-15 09:50:08'),
(173, 'INSERT INTO advertisement ( title, status, description, image, latitude, longitude, address, flag, id_user) VALUES( ''mascota '', 1, ''zzzzzzz zzzzzzz zzzzzz '', '''', 0, 0, ''en una calle '', 0, 13);', '2018-11-15 09:50:39'),
(174, 'SELECT * FROM advertisement ORDER BY id DESC LIMIT 1', '2018-11-15 09:50:39'),
(175, 'SELECT * FROM advertisement ORDER BY id DESC LIMIT 10', '2018-11-15 09:50:39'),
(176, 'INSERT INTO message ( iduser, iduserdest, title, msg) VALUES( 14, 1, ''Hola tienes un mensaje'', ''Lorem ipson mmm okkk nne no no no ke keke jamirn'');', '2018-11-25 07:05:28'),
(177, 'SELECT * FROM message ORDER BY id DESC LIMIT 1', '2018-11-25 07:05:28'),
(178, 'SELECT * FROM token WHERE id_user = 1  ORDER BY t.id DESC LIMIT 1', '2018-11-25 07:05:28'),
(179, 'SELECT * FROM message ORDER BY id DESC LIMIT 1', '2018-11-25 07:05:28'),
(180, 'INSERT INTO message ( iduser, iduserdest, title, msg) VALUES( 14, 1, ''Hola tienes un mensaje'', ''Lorem ipson mmm okkk nne no no no ke keke jamirn'');', '2018-11-25 07:07:27'),
(181, 'SELECT * FROM message ORDER BY id DESC LIMIT 1', '2018-11-25 07:07:27'),
(182, 'SELECT * FROM token WHERE id_user = 1  ORDER BY id DESC LIMIT 1', '2018-11-25 07:07:27'),
(183, 'SELECT * FROM message ORDER BY id DESC LIMIT 1', '2018-11-25 07:07:27'),
(184, 'INSERT INTO message ( iduser, iduserdest, title, msg) VALUES( 14, 1, ''Hola tienes un mensaje'', ''Lorem ipson mmm okkk nne no no no ke keke jamirn'');', '2018-11-25 07:12:40'),
(185, 'SELECT * FROM message ORDER BY id DESC LIMIT 1', '2018-11-25 07:12:40'),
(186, 'SELECT * FROM token WHERE id_user = 1  ORDER BY id DESC LIMIT 1', '2018-11-25 07:12:40'),
(187, 'SELECT * FROM message ORDER BY id DESC LIMIT 1', '2018-11-25 07:12:40'),
(188, 'SELECT * FROM message ORDER BY id DESC LIMIT 10', '2018-11-25 07:15:56'),
(189, 'SELECT * FROM message ORDER BY id DESC LIMIT 10', '2018-11-25 07:16:08'),
(190, 'SELECT * FROM message WHERE iduserdest = ''1'' ORDER BY id DESC LIMIT 10', '2018-11-25 07:16:53'),
(191, 'SELECT * FROM message WHERE iduserdest = ''14'' ORDER BY id DESC LIMIT 10', '2018-11-25 07:17:32'),
(192, 'SELECT * FROM message ORDER BY id DESC LIMIT 10', '2018-11-25 07:17:41'),
(193, 'SELECT * FROM message WHERE id = ''1''', '2018-11-25 07:17:48'),
(194, 'SELECT * FROM message ORDER BY id DESC LIMIT 10', '2018-11-25 07:18:01'),
(195, 'SELECT * FROM message WHERE iduserdest = ''2'' ORDER BY id DESC LIMIT 10', '2018-11-25 07:18:12'),
(196, 'SELECT * FROM message WHERE iduserdest = ''1'' ORDER BY id DESC LIMIT 10', '2018-11-25 07:18:17'),
(197, 'SELECT * FROM advertisement ORDER BY id DESC LIMIT 10', '2018-11-25 07:19:56'),
(198, 'INSERT INTO message ( iduser, iduserdest, title, msg) VALUES( 15, 1, ''Hola tienes un mensaje +2'', ''Lorem ipson mmm okkk nne no no no ke keke jamirn'');', '2018-11-25 07:24:36'),
(199, 'SELECT * FROM message ORDER BY id DESC LIMIT 1', '2018-11-25 07:24:36'),
(200, 'SELECT * FROM token WHERE id_user = 1  ORDER BY id DESC LIMIT 1', '2018-11-25 07:24:36'),
(201, 'SELECT * FROM message ORDER BY id DESC LIMIT 1', '2018-11-25 07:24:37'),
(202, 'SELECT * FROM owner WHERE email = ''kenny@mail.com''', '2018-11-25 23:48:30'),
(203, 'INSERT INTO token ( id_user, tk) VALUES( 1, ''cgioG8ai-3g:APA91bG5IwQHw-YZW9Xl1BCFo3WtDRZ5pdzoMz7CTDzjNYlU0B980upAGE2rIRVfrExl0-O98gCd5VQrC4vzR04lWVJYCEabCfXHXtaiDVGb5LEibzvsX0VJxej12B3MmpeNCcQv2ROW'');', '2018-11-25 23:48:32'),
(204, 'SELECT * FROM token ORDER BY id DESC LIMIT 1', '2018-11-25 23:48:32'),
(205, 'SELECT * FROM advertisement ORDER BY id DESC LIMIT 10', '2018-11-25 23:48:33'),
(206, 'SELECT * FROM owner WHERE email = ''l.craft@gmail.com''', '2018-11-26 01:35:06'),
(207, 'INSERT INTO token ( id_user, tk) VALUES( 14, ''cfMWUMnalW0:APA91bHsiOinTyc1B3NUZ6Qs-5MUNJzdu-k-DzjoDSJHSQMb2MAOW_CYSGOZ2h0RX0MIPTG27bw7kvMKtr2lCU1ExR3eSaHmRyIkgdF_fr7wehTLmWZNdu31s2y9pGnC3yctlymJaHlD'');', '2018-11-26 01:35:07'),
(208, 'SELECT * FROM token ORDER BY id DESC LIMIT 1', '2018-11-26 01:35:07'),
(209, 'SELECT * FROM advertisement ORDER BY id DESC LIMIT 10', '2018-11-26 01:35:08'),
(210, 'SELECT * FROM owner ORDER BY id DESC LIMIT 10', '2018-11-26 02:52:12'),
(211, 'SELECT * FROM owner WHERE id = ''1''', '2018-11-26 02:52:20'),
(212, 'SELECT * FROM image ORDER BY id DESC LIMIT 10', '2018-11-27 05:22:19'),
(213, 'SELECT * FROM image WHERE id = ''1''', '2018-11-27 05:22:30');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `message`
--

CREATE TABLE IF NOT EXISTS `message` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `iduser` int(11) NOT NULL,
  `iduserdest` int(11) NOT NULL,
  `title` varchar(64) NOT NULL,
  `msg` varchar(256) NOT NULL,
  `state` int(11) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=9 ;

--
-- Volcado de datos para la tabla `message`
--

INSERT INTO `message` (`id`, `iduser`, `iduserdest`, `title`, `msg`, `state`, `date`) VALUES
(1, 14, 1, 'Hola tienes un mensaje', 'Lorem ipson mmm okkk nne no no no ke keke jamirn', 0, '2018-11-25 06:52:56'),
(2, 14, 1, 'Hola tienes un mensaje', 'Lorem ipson mmm okkk nne no no no ke keke jamirn', 0, '2018-11-25 06:53:58'),
(3, 14, 1, 'Hola tienes un mensaje', 'Lorem ipson mmm okkk nne no no no ke keke jamirn', 0, '2018-11-25 07:01:33'),
(4, 14, 1, 'Hola tienes un mensaje', 'Lorem ipson mmm okkk nne no no no ke keke jamirn', 0, '2018-11-25 07:03:21'),
(5, 14, 1, 'Hola tienes un mensaje', 'Lorem ipson mmm okkk nne no no no ke keke jamirn', 0, '2018-11-25 07:05:28'),
(6, 14, 1, 'Hola tienes un mensaje', 'Lorem ipson mmm okkk nne no no no ke keke jamirn', 0, '2018-11-25 07:07:27'),
(7, 14, 1, 'Hola tienes un mensaje', 'Lorem ipson mmm okkk nne no no no ke keke jamirn', 0, '2018-11-25 07:12:40'),
(8, 15, 1, 'Hola tienes un mensaje +2', 'Lorem ipson mmm okkk nne no no no ke keke jamirn', 0, '2018-11-25 07:24:36');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `owner`
--

CREATE TABLE IF NOT EXISTS `owner` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dni` varchar(8) NOT NULL,
  `name` varchar(32) NOT NULL,
  `lastname` varchar(64) NOT NULL,
  `email` varchar(128) NOT NULL,
  `password` varchar(32) NOT NULL,
  `phone` varchar(9) NOT NULL DEFAULT '---------',
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=17 ;

--
-- Volcado de datos para la tabla `owner`
--

INSERT INTO `owner` (`id`, `dni`, `name`, `lastname`, `email`, `password`, `phone`) VALUES
(1, '12233446', 'Kenny 2', 'Gonzales', 'kenny@mail.com', '123', '---------'),
(2, '00000000', 'Kenny 2', 'Gonzales', 'kenny2@mail.com', '123', '---------'),
(5, '00000000', 'Kenny 2', 'Gonzales', 'kenny3@mail.com', '123', '---------'),
(8, '1235678', 'Mauricio ', 'peÃ±a', 'mauricio@gmail.com', '123', '---------'),
(9, '42854389', 'Ross', 'Galarza Contreras', 'galarza.ross@gmail.com', 'queteimporta', '---------'),
(10, '88778877', 'gato ', 'mon', 'gatomon@digimon.net', '123', '---------'),
(11, '45454545', 'Tfuru', 'Geenu', 'manonthemirror@gmail.com', '123', '---------'),
(12, '54981092', 'fake', 'zero', 'fake@gmail.com', '123', '---------'),
(13, '12341212', 'anonimo', 'best', 'anonimo@gmail.com', '123', '---------'),
(14, '47395624', 'Lara', 'Craft', 'l.craft@gmail.com', 'queteimporta', '---------'),
(15, '111111', 'Kenny ', 'hhh', 'ttt@gmail.com', '123', '---------'),
(16, '11112223', 'Mauricio ', 'martinex', 'tonio@gmail.com', '123', '---------');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `token`
--

CREATE TABLE IF NOT EXISTS `token` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_user` int(11) NOT NULL,
  `tk` text NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=141 ;

--
-- Volcado de datos para la tabla `token`
--

INSERT INTO `token` (`id`, `id_user`, `tk`, `date`) VALUES
(1, 1, 'esZp-SNh8kQ:APA91bEMNfDTQ0k67eo2zCpRZWB1S5ghwxuFds9RgRxZACm7x9mqzimtDokfD_nSqK2T1QUe6GksUAUU0mYS0Sw2bveMaea8ux40YMeUjf55nXuEt_XSYBUFYG5i5Wh3bFcg1mUXo0kF', '2018-11-15 08:57:11'),
(2, 1, 'esZp-SNh8kQ:APA91bEMNfDTQ0k67eo2zCpRZWB1S5ghwxuFds9RgRxZACm7x9mqzimtDokfD_nSqK2T1QUe6GksUAUU0mYS0Sw2bveMaea8ux40YMeUjf55nXuEt_XSYBUFYG5i5Wh3bFcg1mUXo0kF', '2018-11-15 09:17:47'),
(3, 13, 'esZp-SNh8kQ:APA91bEMNfDTQ0k67eo2zCpRZWB1S5ghwxuFds9RgRxZACm7x9mqzimtDokfD_nSqK2T1QUe6GksUAUU0mYS0Sw2bveMaea8ux40YMeUjf55nXuEt_XSYBUFYG5i5Wh3bFcg1mUXo0kF', '2018-11-15 09:19:44'),
(4, 13, 'esZp-SNh8kQ:APA91bEMNfDTQ0k67eo2zCpRZWB1S5ghwxuFds9RgRxZACm7x9mqzimtDokfD_nSqK2T1QUe6GksUAUU0mYS0Sw2bveMaea8ux40YMeUjf55nXuEt_XSYBUFYG5i5Wh3bFcg1mUXo0kF', '2018-11-15 09:35:57'),
(5, 13, 'esZp-SNh8kQ:APA91bEMNfDTQ0k67eo2zCpRZWB1S5ghwxuFds9RgRxZACm7x9mqzimtDokfD_nSqK2T1QUe6GksUAUU0mYS0Sw2bveMaea8ux40YMeUjf55nXuEt_XSYBUFYG5i5Wh3bFcg1mUXo0kF', '2018-11-15 09:45:15'),
(6, 13, 'esZp-SNh8kQ:APA91bEMNfDTQ0k67eo2zCpRZWB1S5ghwxuFds9RgRxZACm7x9mqzimtDokfD_nSqK2T1QUe6GksUAUU0mYS0Sw2bveMaea8ux40YMeUjf55nXuEt_XSYBUFYG5i5Wh3bFcg1mUXo0kF', '2018-11-15 09:50:08'),
(7, 13, 'esZp-SNh8kQ:APA91bEMNfDTQ0k67eo2zCpRZWB1S5ghwxuFds9RgRxZACm7x9mqzimtDokfD_nSqK2T1QUe6GksUAUU0mYS0Sw2bveMaea8ux40YMeUjf55nXuEt_XSYBUFYG5i5Wh3bFcg1mUXo0kF', '2018-11-15 10:13:39'),
(8, 13, 'esZp-SNh8kQ:APA91bEMNfDTQ0k67eo2zCpRZWB1S5ghwxuFds9RgRxZACm7x9mqzimtDokfD_nSqK2T1QUe6GksUAUU0mYS0Sw2bveMaea8ux40YMeUjf55nXuEt_XSYBUFYG5i5Wh3bFcg1mUXo0kF', '2018-11-15 21:18:46'),
(9, 14, 'd8o8PJrYoEc:APA91bEX4WsgT2u8fUaZ8thH6chTRd7HtZpLyaUfKdfTXF8RGoQehDJom0e-iNoGNzH6Un1A9RdlyXaJhxj7Yyq3ighydNipt6Pe-01NZXm-bp47IN0u7EszU0YKfsY-YyaK3aHYi13E', '2018-11-16 00:58:02'),
(10, 13, 'esZp-SNh8kQ:APA91bEMNfDTQ0k67eo2zCpRZWB1S5ghwxuFds9RgRxZACm7x9mqzimtDokfD_nSqK2T1QUe6GksUAUU0mYS0Sw2bveMaea8ux40YMeUjf55nXuEt_XSYBUFYG5i5Wh3bFcg1mUXo0kF', '2018-11-16 01:00:39'),
(11, 15, 'esZp-SNh8kQ:APA91bEMNfDTQ0k67eo2zCpRZWB1S5ghwxuFds9RgRxZACm7x9mqzimtDokfD_nSqK2T1QUe6GksUAUU0mYS0Sw2bveMaea8ux40YMeUjf55nXuEt_XSYBUFYG5i5Wh3bFcg1mUXo0kF', '2018-11-16 01:03:49'),
(12, 14, 'd8o8PJrYoEc:APA91bEX4WsgT2u8fUaZ8thH6chTRd7HtZpLyaUfKdfTXF8RGoQehDJom0e-iNoGNzH6Un1A9RdlyXaJhxj7Yyq3ighydNipt6Pe-01NZXm-bp47IN0u7EszU0YKfsY-YyaK3aHYi13E', '2018-11-16 03:55:31'),
(13, 14, 'd8o8PJrYoEc:APA91bEX4WsgT2u8fUaZ8thH6chTRd7HtZpLyaUfKdfTXF8RGoQehDJom0e-iNoGNzH6Un1A9RdlyXaJhxj7Yyq3ighydNipt6Pe-01NZXm-bp47IN0u7EszU0YKfsY-YyaK3aHYi13E', '2018-11-16 04:01:07'),
(14, 15, 'esZp-SNh8kQ:APA91bEMNfDTQ0k67eo2zCpRZWB1S5ghwxuFds9RgRxZACm7x9mqzimtDokfD_nSqK2T1QUe6GksUAUU0mYS0Sw2bveMaea8ux40YMeUjf55nXuEt_XSYBUFYG5i5Wh3bFcg1mUXo0kF', '2018-11-16 04:30:08'),
(15, 15, 'esZp-SNh8kQ:APA91bEMNfDTQ0k67eo2zCpRZWB1S5ghwxuFds9RgRxZACm7x9mqzimtDokfD_nSqK2T1QUe6GksUAUU0mYS0Sw2bveMaea8ux40YMeUjf55nXuEt_XSYBUFYG5i5Wh3bFcg1mUXo0kF', '2018-11-16 06:01:00'),
(16, 15, 'esZp-SNh8kQ:APA91bEMNfDTQ0k67eo2zCpRZWB1S5ghwxuFds9RgRxZACm7x9mqzimtDokfD_nSqK2T1QUe6GksUAUU0mYS0Sw2bveMaea8ux40YMeUjf55nXuEt_XSYBUFYG5i5Wh3bFcg1mUXo0kF', '2018-11-16 06:09:50'),
(17, 15, 'd4oGB3wFJvo:APA91bFc5vNrQR-rb39b4CdY_cY-3MkN95NI1kC3OhReL7EWkVETY8m9Jm0W4f3jgwQqBpiqNIsgIXRAZ8AqbwGG73286UJ9eGu9ziY7M5tsDjHXbCLbCnIp7wNTY6BuiMltGcf9uIGt', '2018-11-16 07:01:26'),
(18, 15, 'd4oGB3wFJvo:APA91bFc5vNrQR-rb39b4CdY_cY-3MkN95NI1kC3OhReL7EWkVETY8m9Jm0W4f3jgwQqBpiqNIsgIXRAZ8AqbwGG73286UJ9eGu9ziY7M5tsDjHXbCLbCnIp7wNTY6BuiMltGcf9uIGt', '2018-11-16 07:06:06'),
(19, 15, 'd4oGB3wFJvo:APA91bFc5vNrQR-rb39b4CdY_cY-3MkN95NI1kC3OhReL7EWkVETY8m9Jm0W4f3jgwQqBpiqNIsgIXRAZ8AqbwGG73286UJ9eGu9ziY7M5tsDjHXbCLbCnIp7wNTY6BuiMltGcf9uIGt', '2018-11-16 07:14:49'),
(20, 15, 'd4oGB3wFJvo:APA91bFc5vNrQR-rb39b4CdY_cY-3MkN95NI1kC3OhReL7EWkVETY8m9Jm0W4f3jgwQqBpiqNIsgIXRAZ8AqbwGG73286UJ9eGu9ziY7M5tsDjHXbCLbCnIp7wNTY6BuiMltGcf9uIGt', '2018-11-16 07:23:47'),
(21, 15, 'd4oGB3wFJvo:APA91bFc5vNrQR-rb39b4CdY_cY-3MkN95NI1kC3OhReL7EWkVETY8m9Jm0W4f3jgwQqBpiqNIsgIXRAZ8AqbwGG73286UJ9eGu9ziY7M5tsDjHXbCLbCnIp7wNTY6BuiMltGcf9uIGt', '2018-11-16 08:00:50'),
(22, 15, 'd4oGB3wFJvo:APA91bFc5vNrQR-rb39b4CdY_cY-3MkN95NI1kC3OhReL7EWkVETY8m9Jm0W4f3jgwQqBpiqNIsgIXRAZ8AqbwGG73286UJ9eGu9ziY7M5tsDjHXbCLbCnIp7wNTY6BuiMltGcf9uIGt', '2018-11-16 08:13:13'),
(23, 15, 'd4oGB3wFJvo:APA91bFc5vNrQR-rb39b4CdY_cY-3MkN95NI1kC3OhReL7EWkVETY8m9Jm0W4f3jgwQqBpiqNIsgIXRAZ8AqbwGG73286UJ9eGu9ziY7M5tsDjHXbCLbCnIp7wNTY6BuiMltGcf9uIGt', '2018-11-16 09:01:35'),
(24, 15, 'd4oGB3wFJvo:APA91bFc5vNrQR-rb39b4CdY_cY-3MkN95NI1kC3OhReL7EWkVETY8m9Jm0W4f3jgwQqBpiqNIsgIXRAZ8AqbwGG73286UJ9eGu9ziY7M5tsDjHXbCLbCnIp7wNTY6BuiMltGcf9uIGt', '2018-11-16 09:04:22'),
(25, 15, 'd4oGB3wFJvo:APA91bFc5vNrQR-rb39b4CdY_cY-3MkN95NI1kC3OhReL7EWkVETY8m9Jm0W4f3jgwQqBpiqNIsgIXRAZ8AqbwGG73286UJ9eGu9ziY7M5tsDjHXbCLbCnIp7wNTY6BuiMltGcf9uIGt', '2018-11-16 09:11:06'),
(26, 15, 'd4oGB3wFJvo:APA91bFc5vNrQR-rb39b4CdY_cY-3MkN95NI1kC3OhReL7EWkVETY8m9Jm0W4f3jgwQqBpiqNIsgIXRAZ8AqbwGG73286UJ9eGu9ziY7M5tsDjHXbCLbCnIp7wNTY6BuiMltGcf9uIGt', '2018-11-16 09:18:14'),
(27, 16, 'd4oGB3wFJvo:APA91bFc5vNrQR-rb39b4CdY_cY-3MkN95NI1kC3OhReL7EWkVETY8m9Jm0W4f3jgwQqBpiqNIsgIXRAZ8AqbwGG73286UJ9eGu9ziY7M5tsDjHXbCLbCnIp7wNTY6BuiMltGcf9uIGt', '2018-11-16 09:27:06'),
(28, 15, 'd4oGB3wFJvo:APA91bFc5vNrQR-rb39b4CdY_cY-3MkN95NI1kC3OhReL7EWkVETY8m9Jm0W4f3jgwQqBpiqNIsgIXRAZ8AqbwGG73286UJ9eGu9ziY7M5tsDjHXbCLbCnIp7wNTY6BuiMltGcf9uIGt', '2018-11-16 09:40:18'),
(29, 15, 'd4oGB3wFJvo:APA91bFc5vNrQR-rb39b4CdY_cY-3MkN95NI1kC3OhReL7EWkVETY8m9Jm0W4f3jgwQqBpiqNIsgIXRAZ8AqbwGG73286UJ9eGu9ziY7M5tsDjHXbCLbCnIp7wNTY6BuiMltGcf9uIGt', '2018-11-16 13:10:05'),
(30, 15, 'd4oGB3wFJvo:APA91bFc5vNrQR-rb39b4CdY_cY-3MkN95NI1kC3OhReL7EWkVETY8m9Jm0W4f3jgwQqBpiqNIsgIXRAZ8AqbwGG73286UJ9eGu9ziY7M5tsDjHXbCLbCnIp7wNTY6BuiMltGcf9uIGt', '2018-11-16 14:11:25'),
(31, 15, 'd4oGB3wFJvo:APA91bFc5vNrQR-rb39b4CdY_cY-3MkN95NI1kC3OhReL7EWkVETY8m9Jm0W4f3jgwQqBpiqNIsgIXRAZ8AqbwGG73286UJ9eGu9ziY7M5tsDjHXbCLbCnIp7wNTY6BuiMltGcf9uIGt', '2018-11-16 16:58:49'),
(32, 15, 'd4oGB3wFJvo:APA91bFc5vNrQR-rb39b4CdY_cY-3MkN95NI1kC3OhReL7EWkVETY8m9Jm0W4f3jgwQqBpiqNIsgIXRAZ8AqbwGG73286UJ9eGu9ziY7M5tsDjHXbCLbCnIp7wNTY6BuiMltGcf9uIGt', '2018-11-16 17:00:14'),
(33, 14, 'ehx1vsL8pa0:APA91bEBOWYTOkt5tA3IIWCWbFCDLGH-BA5a4PNJM1OFb2Cfgtmh_5aujgrQwI9ufNa82D0MsFVmeSvaxLG6VAwRuWF1wJCxg3MyFOnqFbFd6X8_S6iTrxl_etIADbLYF8iYkUEUq7xI', '2018-11-16 17:00:24'),
(34, 1, 'eeL4eIgfVEk:APA91bFZZ_BfbL4QhDgsZW25eQPfvP6RYQJKs5rAcJdi-H5-Kv1_Kw6O-mbv1Ui8XtfE-nKsqEU3JJQVOvf9-C_NWVtv8eCmIWhxSTcGCBtA1N4hNvFgt-tnT4f2pS_J3uGepk_5ZwKS', '2018-11-16 17:28:27'),
(35, 15, 'd4oGB3wFJvo:APA91bFc5vNrQR-rb39b4CdY_cY-3MkN95NI1kC3OhReL7EWkVETY8m9Jm0W4f3jgwQqBpiqNIsgIXRAZ8AqbwGG73286UJ9eGu9ziY7M5tsDjHXbCLbCnIp7wNTY6BuiMltGcf9uIGt', '2018-11-17 02:02:04'),
(36, 15, 'd4oGB3wFJvo:APA91bFc5vNrQR-rb39b4CdY_cY-3MkN95NI1kC3OhReL7EWkVETY8m9Jm0W4f3jgwQqBpiqNIsgIXRAZ8AqbwGG73286UJ9eGu9ziY7M5tsDjHXbCLbCnIp7wNTY6BuiMltGcf9uIGt', '2018-11-17 03:38:21'),
(37, 1, 'fdJZv2ECVUQ:APA91bGsBrHnvRCu3lDAJnri4BaFXA9Ii_J6-LDDdLO1YeFIbcKiUJ9Jfkso2-p7oTEikIZ6FFlWOc5IAKMxHKLVmB55VzwmjSMed1OhfrGDHyaFjmtiuYL9no2MYSJbNlgs2TL2pMmL', '2018-11-17 05:53:52'),
(38, 1, 'c7zh6-quCVA:APA91bHgXFgjabG6XgcVqUKgPL_c440L8G0vNExv393E60UliiKZgpBKahtuOv5g0lPVbeja4FSVARneHeTh_7mHDqsWOWw6HbQvocJEOFhDEruguTPRjBzup1lJooFd4l5USMrIFVPF', '2018-11-17 06:26:34'),
(39, 1, 'cxSctfogJlY:APA91bFozT14zBPGrfGPg11K01wnnjMrdlHq8c-28yYFKa7Tx5uwurvm3ET3Qy0YotnrdeQBLhZFNDq2ESv8OQMBqxgfmkMS7EJR5BLSz8aQK8gDWlbB9SKZpbCxMRFPSBBISWxywi9r', '2018-11-17 06:34:44'),
(40, 1, 'cxSctfogJlY:APA91bFozT14zBPGrfGPg11K01wnnjMrdlHq8c-28yYFKa7Tx5uwurvm3ET3Qy0YotnrdeQBLhZFNDq2ESv8OQMBqxgfmkMS7EJR5BLSz8aQK8gDWlbB9SKZpbCxMRFPSBBISWxywi9r', '2018-11-18 03:24:44'),
(41, 1, 'cgioG8ai-3g:APA91bG5IwQHw-YZW9Xl1BCFo3WtDRZ5pdzoMz7CTDzjNYlU0B980upAGE2rIRVfrExl0-O98gCd5VQrC4vzR04lWVJYCEabCfXHXtaiDVGb5LEibzvsX0VJxej12B3MmpeNCcQv2ROW', '2018-11-18 03:30:08'),
(42, 1, 'cgioG8ai-3g:APA91bG5IwQHw-YZW9Xl1BCFo3WtDRZ5pdzoMz7CTDzjNYlU0B980upAGE2rIRVfrExl0-O98gCd5VQrC4vzR04lWVJYCEabCfXHXtaiDVGb5LEibzvsX0VJxej12B3MmpeNCcQv2ROW', '2018-11-18 04:18:56'),
(43, 1, 'cgioG8ai-3g:APA91bG5IwQHw-YZW9Xl1BCFo3WtDRZ5pdzoMz7CTDzjNYlU0B980upAGE2rIRVfrExl0-O98gCd5VQrC4vzR04lWVJYCEabCfXHXtaiDVGb5LEibzvsX0VJxej12B3MmpeNCcQv2ROW', '2018-11-18 04:29:30'),
(44, 1, 'cgioG8ai-3g:APA91bG5IwQHw-YZW9Xl1BCFo3WtDRZ5pdzoMz7CTDzjNYlU0B980upAGE2rIRVfrExl0-O98gCd5VQrC4vzR04lWVJYCEabCfXHXtaiDVGb5LEibzvsX0VJxej12B3MmpeNCcQv2ROW', '2018-11-18 04:32:15'),
(45, 1, 'cgioG8ai-3g:APA91bG5IwQHw-YZW9Xl1BCFo3WtDRZ5pdzoMz7CTDzjNYlU0B980upAGE2rIRVfrExl0-O98gCd5VQrC4vzR04lWVJYCEabCfXHXtaiDVGb5LEibzvsX0VJxej12B3MmpeNCcQv2ROW', '2018-11-18 04:35:05'),
(46, 1, 'cgioG8ai-3g:APA91bG5IwQHw-YZW9Xl1BCFo3WtDRZ5pdzoMz7CTDzjNYlU0B980upAGE2rIRVfrExl0-O98gCd5VQrC4vzR04lWVJYCEabCfXHXtaiDVGb5LEibzvsX0VJxej12B3MmpeNCcQv2ROW', '2018-11-18 04:35:33'),
(47, 1, 'cgioG8ai-3g:APA91bG5IwQHw-YZW9Xl1BCFo3WtDRZ5pdzoMz7CTDzjNYlU0B980upAGE2rIRVfrExl0-O98gCd5VQrC4vzR04lWVJYCEabCfXHXtaiDVGb5LEibzvsX0VJxej12B3MmpeNCcQv2ROW', '2018-11-18 04:51:03'),
(48, 1, 'cgioG8ai-3g:APA91bG5IwQHw-YZW9Xl1BCFo3WtDRZ5pdzoMz7CTDzjNYlU0B980upAGE2rIRVfrExl0-O98gCd5VQrC4vzR04lWVJYCEabCfXHXtaiDVGb5LEibzvsX0VJxej12B3MmpeNCcQv2ROW', '2018-11-18 04:54:21'),
(49, 1, 'cgioG8ai-3g:APA91bG5IwQHw-YZW9Xl1BCFo3WtDRZ5pdzoMz7CTDzjNYlU0B980upAGE2rIRVfrExl0-O98gCd5VQrC4vzR04lWVJYCEabCfXHXtaiDVGb5LEibzvsX0VJxej12B3MmpeNCcQv2ROW', '2018-11-18 05:03:23'),
(50, 1, 'cgioG8ai-3g:APA91bG5IwQHw-YZW9Xl1BCFo3WtDRZ5pdzoMz7CTDzjNYlU0B980upAGE2rIRVfrExl0-O98gCd5VQrC4vzR04lWVJYCEabCfXHXtaiDVGb5LEibzvsX0VJxej12B3MmpeNCcQv2ROW', '2018-11-18 05:07:29'),
(51, 1, 'cgioG8ai-3g:APA91bG5IwQHw-YZW9Xl1BCFo3WtDRZ5pdzoMz7CTDzjNYlU0B980upAGE2rIRVfrExl0-O98gCd5VQrC4vzR04lWVJYCEabCfXHXtaiDVGb5LEibzvsX0VJxej12B3MmpeNCcQv2ROW', '2018-11-18 05:16:03'),
(52, 1, 'cgioG8ai-3g:APA91bG5IwQHw-YZW9Xl1BCFo3WtDRZ5pdzoMz7CTDzjNYlU0B980upAGE2rIRVfrExl0-O98gCd5VQrC4vzR04lWVJYCEabCfXHXtaiDVGb5LEibzvsX0VJxej12B3MmpeNCcQv2ROW', '2018-11-18 05:17:02'),
(53, 1, 'cgioG8ai-3g:APA91bG5IwQHw-YZW9Xl1BCFo3WtDRZ5pdzoMz7CTDzjNYlU0B980upAGE2rIRVfrExl0-O98gCd5VQrC4vzR04lWVJYCEabCfXHXtaiDVGb5LEibzvsX0VJxej12B3MmpeNCcQv2ROW', '2018-11-18 05:19:54'),
(54, 1, 'cgioG8ai-3g:APA91bG5IwQHw-YZW9Xl1BCFo3WtDRZ5pdzoMz7CTDzjNYlU0B980upAGE2rIRVfrExl0-O98gCd5VQrC4vzR04lWVJYCEabCfXHXtaiDVGb5LEibzvsX0VJxej12B3MmpeNCcQv2ROW', '2018-11-18 06:34:03'),
(55, 1, 'cgioG8ai-3g:APA91bG5IwQHw-YZW9Xl1BCFo3WtDRZ5pdzoMz7CTDzjNYlU0B980upAGE2rIRVfrExl0-O98gCd5VQrC4vzR04lWVJYCEabCfXHXtaiDVGb5LEibzvsX0VJxej12B3MmpeNCcQv2ROW', '2018-11-18 06:35:17'),
(56, 1, 'cgioG8ai-3g:APA91bG5IwQHw-YZW9Xl1BCFo3WtDRZ5pdzoMz7CTDzjNYlU0B980upAGE2rIRVfrExl0-O98gCd5VQrC4vzR04lWVJYCEabCfXHXtaiDVGb5LEibzvsX0VJxej12B3MmpeNCcQv2ROW', '2018-11-18 06:43:07'),
(57, 1, 'cgioG8ai-3g:APA91bG5IwQHw-YZW9Xl1BCFo3WtDRZ5pdzoMz7CTDzjNYlU0B980upAGE2rIRVfrExl0-O98gCd5VQrC4vzR04lWVJYCEabCfXHXtaiDVGb5LEibzvsX0VJxej12B3MmpeNCcQv2ROW', '2018-11-18 06:47:50'),
(58, 1, 'cgioG8ai-3g:APA91bG5IwQHw-YZW9Xl1BCFo3WtDRZ5pdzoMz7CTDzjNYlU0B980upAGE2rIRVfrExl0-O98gCd5VQrC4vzR04lWVJYCEabCfXHXtaiDVGb5LEibzvsX0VJxej12B3MmpeNCcQv2ROW', '2018-11-18 06:52:14'),
(59, 1, 'cgioG8ai-3g:APA91bG5IwQHw-YZW9Xl1BCFo3WtDRZ5pdzoMz7CTDzjNYlU0B980upAGE2rIRVfrExl0-O98gCd5VQrC4vzR04lWVJYCEabCfXHXtaiDVGb5LEibzvsX0VJxej12B3MmpeNCcQv2ROW', '2018-11-18 06:54:01'),
(60, 14, 'ehx1vsL8pa0:APA91bEBOWYTOkt5tA3IIWCWbFCDLGH-BA5a4PNJM1OFb2Cfgtmh_5aujgrQwI9ufNa82D0MsFVmeSvaxLG6VAwRuWF1wJCxg3MyFOnqFbFd6X8_S6iTrxl_etIADbLYF8iYkUEUq7xI', '2018-11-18 07:06:08'),
(61, 1, 'cgioG8ai-3g:APA91bG5IwQHw-YZW9Xl1BCFo3WtDRZ5pdzoMz7CTDzjNYlU0B980upAGE2rIRVfrExl0-O98gCd5VQrC4vzR04lWVJYCEabCfXHXtaiDVGb5LEibzvsX0VJxej12B3MmpeNCcQv2ROW', '2018-11-18 07:28:18'),
(62, 1, 'cgioG8ai-3g:APA91bG5IwQHw-YZW9Xl1BCFo3WtDRZ5pdzoMz7CTDzjNYlU0B980upAGE2rIRVfrExl0-O98gCd5VQrC4vzR04lWVJYCEabCfXHXtaiDVGb5LEibzvsX0VJxej12B3MmpeNCcQv2ROW', '2018-11-18 07:36:14'),
(63, 1, 'cgioG8ai-3g:APA91bG5IwQHw-YZW9Xl1BCFo3WtDRZ5pdzoMz7CTDzjNYlU0B980upAGE2rIRVfrExl0-O98gCd5VQrC4vzR04lWVJYCEabCfXHXtaiDVGb5LEibzvsX0VJxej12B3MmpeNCcQv2ROW', '2018-11-18 07:47:13'),
(64, 1, 'cgioG8ai-3g:APA91bG5IwQHw-YZW9Xl1BCFo3WtDRZ5pdzoMz7CTDzjNYlU0B980upAGE2rIRVfrExl0-O98gCd5VQrC4vzR04lWVJYCEabCfXHXtaiDVGb5LEibzvsX0VJxej12B3MmpeNCcQv2ROW', '2018-11-18 07:50:46'),
(65, 1, 'cgioG8ai-3g:APA91bG5IwQHw-YZW9Xl1BCFo3WtDRZ5pdzoMz7CTDzjNYlU0B980upAGE2rIRVfrExl0-O98gCd5VQrC4vzR04lWVJYCEabCfXHXtaiDVGb5LEibzvsX0VJxej12B3MmpeNCcQv2ROW', '2018-11-18 07:53:55'),
(66, 1, 'cgioG8ai-3g:APA91bG5IwQHw-YZW9Xl1BCFo3WtDRZ5pdzoMz7CTDzjNYlU0B980upAGE2rIRVfrExl0-O98gCd5VQrC4vzR04lWVJYCEabCfXHXtaiDVGb5LEibzvsX0VJxej12B3MmpeNCcQv2ROW', '2018-11-18 09:24:22'),
(67, 1, 'cgioG8ai-3g:APA91bG5IwQHw-YZW9Xl1BCFo3WtDRZ5pdzoMz7CTDzjNYlU0B980upAGE2rIRVfrExl0-O98gCd5VQrC4vzR04lWVJYCEabCfXHXtaiDVGb5LEibzvsX0VJxej12B3MmpeNCcQv2ROW', '2018-11-18 09:26:12'),
(68, 1, 'cgioG8ai-3g:APA91bG5IwQHw-YZW9Xl1BCFo3WtDRZ5pdzoMz7CTDzjNYlU0B980upAGE2rIRVfrExl0-O98gCd5VQrC4vzR04lWVJYCEabCfXHXtaiDVGb5LEibzvsX0VJxej12B3MmpeNCcQv2ROW', '2018-11-18 09:44:44'),
(69, 1, 'cgioG8ai-3g:APA91bG5IwQHw-YZW9Xl1BCFo3WtDRZ5pdzoMz7CTDzjNYlU0B980upAGE2rIRVfrExl0-O98gCd5VQrC4vzR04lWVJYCEabCfXHXtaiDVGb5LEibzvsX0VJxej12B3MmpeNCcQv2ROW', '2018-11-18 09:57:25'),
(70, 1, 'cgioG8ai-3g:APA91bG5IwQHw-YZW9Xl1BCFo3WtDRZ5pdzoMz7CTDzjNYlU0B980upAGE2rIRVfrExl0-O98gCd5VQrC4vzR04lWVJYCEabCfXHXtaiDVGb5LEibzvsX0VJxej12B3MmpeNCcQv2ROW', '2018-11-18 10:01:46'),
(71, 1, 'cgioG8ai-3g:APA91bG5IwQHw-YZW9Xl1BCFo3WtDRZ5pdzoMz7CTDzjNYlU0B980upAGE2rIRVfrExl0-O98gCd5VQrC4vzR04lWVJYCEabCfXHXtaiDVGb5LEibzvsX0VJxej12B3MmpeNCcQv2ROW', '2018-11-18 10:03:06'),
(72, 1, 'cgioG8ai-3g:APA91bG5IwQHw-YZW9Xl1BCFo3WtDRZ5pdzoMz7CTDzjNYlU0B980upAGE2rIRVfrExl0-O98gCd5VQrC4vzR04lWVJYCEabCfXHXtaiDVGb5LEibzvsX0VJxej12B3MmpeNCcQv2ROW', '2018-11-18 10:24:32'),
(73, 1, 'cgioG8ai-3g:APA91bG5IwQHw-YZW9Xl1BCFo3WtDRZ5pdzoMz7CTDzjNYlU0B980upAGE2rIRVfrExl0-O98gCd5VQrC4vzR04lWVJYCEabCfXHXtaiDVGb5LEibzvsX0VJxej12B3MmpeNCcQv2ROW', '2018-11-18 10:29:46'),
(74, 1, 'cgioG8ai-3g:APA91bG5IwQHw-YZW9Xl1BCFo3WtDRZ5pdzoMz7CTDzjNYlU0B980upAGE2rIRVfrExl0-O98gCd5VQrC4vzR04lWVJYCEabCfXHXtaiDVGb5LEibzvsX0VJxej12B3MmpeNCcQv2ROW', '2018-11-18 10:37:27'),
(75, 1, 'cgioG8ai-3g:APA91bG5IwQHw-YZW9Xl1BCFo3WtDRZ5pdzoMz7CTDzjNYlU0B980upAGE2rIRVfrExl0-O98gCd5VQrC4vzR04lWVJYCEabCfXHXtaiDVGb5LEibzvsX0VJxej12B3MmpeNCcQv2ROW', '2018-11-18 10:47:58'),
(76, 1, 'cgioG8ai-3g:APA91bG5IwQHw-YZW9Xl1BCFo3WtDRZ5pdzoMz7CTDzjNYlU0B980upAGE2rIRVfrExl0-O98gCd5VQrC4vzR04lWVJYCEabCfXHXtaiDVGb5LEibzvsX0VJxej12B3MmpeNCcQv2ROW', '2018-11-18 10:52:32'),
(77, 1, 'cgioG8ai-3g:APA91bG5IwQHw-YZW9Xl1BCFo3WtDRZ5pdzoMz7CTDzjNYlU0B980upAGE2rIRVfrExl0-O98gCd5VQrC4vzR04lWVJYCEabCfXHXtaiDVGb5LEibzvsX0VJxej12B3MmpeNCcQv2ROW', '2018-11-18 16:18:29'),
(78, 1, 'cgioG8ai-3g:APA91bG5IwQHw-YZW9Xl1BCFo3WtDRZ5pdzoMz7CTDzjNYlU0B980upAGE2rIRVfrExl0-O98gCd5VQrC4vzR04lWVJYCEabCfXHXtaiDVGb5LEibzvsX0VJxej12B3MmpeNCcQv2ROW', '2018-11-18 16:25:44'),
(79, 1, 'cgioG8ai-3g:APA91bG5IwQHw-YZW9Xl1BCFo3WtDRZ5pdzoMz7CTDzjNYlU0B980upAGE2rIRVfrExl0-O98gCd5VQrC4vzR04lWVJYCEabCfXHXtaiDVGb5LEibzvsX0VJxej12B3MmpeNCcQv2ROW', '2018-11-18 16:41:02'),
(80, 1, 'cgioG8ai-3g:APA91bG5IwQHw-YZW9Xl1BCFo3WtDRZ5pdzoMz7CTDzjNYlU0B980upAGE2rIRVfrExl0-O98gCd5VQrC4vzR04lWVJYCEabCfXHXtaiDVGb5LEibzvsX0VJxej12B3MmpeNCcQv2ROW', '2018-11-18 18:59:11'),
(81, 1, 'cgioG8ai-3g:APA91bG5IwQHw-YZW9Xl1BCFo3WtDRZ5pdzoMz7CTDzjNYlU0B980upAGE2rIRVfrExl0-O98gCd5VQrC4vzR04lWVJYCEabCfXHXtaiDVGb5LEibzvsX0VJxej12B3MmpeNCcQv2ROW', '2018-11-18 21:46:09'),
(82, 14, 'f-dbDMZiuYc:APA91bHOKUaqquTgtoTfwd5wMar2lT-ZLOb1frc5JxyqJLNqEuQ4ptB8ezSEpBfj1Te6oPq0cHjNdbJjPBtFqpzVeICFF9uuCQnEw8QgLXZgnkZfDYxHrBuyqd3QgZOoxOnzhRVZ37hu', '2018-11-19 01:33:28'),
(83, 1, 'cgioG8ai-3g:APA91bG5IwQHw-YZW9Xl1BCFo3WtDRZ5pdzoMz7CTDzjNYlU0B980upAGE2rIRVfrExl0-O98gCd5VQrC4vzR04lWVJYCEabCfXHXtaiDVGb5LEibzvsX0VJxej12B3MmpeNCcQv2ROW', '2018-11-19 01:44:29'),
(84, 14, 'f-dbDMZiuYc:APA91bHOKUaqquTgtoTfwd5wMar2lT-ZLOb1frc5JxyqJLNqEuQ4ptB8ezSEpBfj1Te6oPq0cHjNdbJjPBtFqpzVeICFF9uuCQnEw8QgLXZgnkZfDYxHrBuyqd3QgZOoxOnzhRVZ37hu', '2018-11-19 03:20:35'),
(85, 1, 'cgioG8ai-3g:APA91bG5IwQHw-YZW9Xl1BCFo3WtDRZ5pdzoMz7CTDzjNYlU0B980upAGE2rIRVfrExl0-O98gCd5VQrC4vzR04lWVJYCEabCfXHXtaiDVGb5LEibzvsX0VJxej12B3MmpeNCcQv2ROW', '2018-11-19 04:05:19'),
(86, 14, 'e0s52szQ4GQ:APA91bF3f033tLE83LAEPPiHY0LafoVmTqe1zQ1YShyHzjUCK80T2aKZafutZRp-emRc3nSBA2fFgFrTzsOPM3_QJL94HPH_dJpKLNe8s5916UFkweWqezWjcXpyYeI18q9ZvXl8PtOY', '2018-11-19 05:35:41'),
(87, 1, 'cgioG8ai-3g:APA91bG5IwQHw-YZW9Xl1BCFo3WtDRZ5pdzoMz7CTDzjNYlU0B980upAGE2rIRVfrExl0-O98gCd5VQrC4vzR04lWVJYCEabCfXHXtaiDVGb5LEibzvsX0VJxej12B3MmpeNCcQv2ROW', '2018-11-20 02:20:02'),
(88, 1, 'cgioG8ai-3g:APA91bG5IwQHw-YZW9Xl1BCFo3WtDRZ5pdzoMz7CTDzjNYlU0B980upAGE2rIRVfrExl0-O98gCd5VQrC4vzR04lWVJYCEabCfXHXtaiDVGb5LEibzvsX0VJxej12B3MmpeNCcQv2ROW', '2018-11-20 06:46:05'),
(89, 1, 'cgioG8ai-3g:APA91bG5IwQHw-YZW9Xl1BCFo3WtDRZ5pdzoMz7CTDzjNYlU0B980upAGE2rIRVfrExl0-O98gCd5VQrC4vzR04lWVJYCEabCfXHXtaiDVGb5LEibzvsX0VJxej12B3MmpeNCcQv2ROW', '2018-11-20 06:55:43'),
(90, 1, 'cgioG8ai-3g:APA91bG5IwQHw-YZW9Xl1BCFo3WtDRZ5pdzoMz7CTDzjNYlU0B980upAGE2rIRVfrExl0-O98gCd5VQrC4vzR04lWVJYCEabCfXHXtaiDVGb5LEibzvsX0VJxej12B3MmpeNCcQv2ROW', '2018-11-20 07:05:46'),
(91, 1, 'cgioG8ai-3g:APA91bG5IwQHw-YZW9Xl1BCFo3WtDRZ5pdzoMz7CTDzjNYlU0B980upAGE2rIRVfrExl0-O98gCd5VQrC4vzR04lWVJYCEabCfXHXtaiDVGb5LEibzvsX0VJxej12B3MmpeNCcQv2ROW', '2018-11-20 07:15:28'),
(92, 1, 'cgioG8ai-3g:APA91bG5IwQHw-YZW9Xl1BCFo3WtDRZ5pdzoMz7CTDzjNYlU0B980upAGE2rIRVfrExl0-O98gCd5VQrC4vzR04lWVJYCEabCfXHXtaiDVGb5LEibzvsX0VJxej12B3MmpeNCcQv2ROW', '2018-11-20 07:28:53'),
(93, 1, 'cgioG8ai-3g:APA91bG5IwQHw-YZW9Xl1BCFo3WtDRZ5pdzoMz7CTDzjNYlU0B980upAGE2rIRVfrExl0-O98gCd5VQrC4vzR04lWVJYCEabCfXHXtaiDVGb5LEibzvsX0VJxej12B3MmpeNCcQv2ROW', '2018-11-20 07:32:45'),
(94, 1, 'cgioG8ai-3g:APA91bG5IwQHw-YZW9Xl1BCFo3WtDRZ5pdzoMz7CTDzjNYlU0B980upAGE2rIRVfrExl0-O98gCd5VQrC4vzR04lWVJYCEabCfXHXtaiDVGb5LEibzvsX0VJxej12B3MmpeNCcQv2ROW', '2018-11-20 07:35:44'),
(95, 1, 'cgioG8ai-3g:APA91bG5IwQHw-YZW9Xl1BCFo3WtDRZ5pdzoMz7CTDzjNYlU0B980upAGE2rIRVfrExl0-O98gCd5VQrC4vzR04lWVJYCEabCfXHXtaiDVGb5LEibzvsX0VJxej12B3MmpeNCcQv2ROW', '2018-11-20 07:41:52'),
(96, 1, 'cgioG8ai-3g:APA91bG5IwQHw-YZW9Xl1BCFo3WtDRZ5pdzoMz7CTDzjNYlU0B980upAGE2rIRVfrExl0-O98gCd5VQrC4vzR04lWVJYCEabCfXHXtaiDVGb5LEibzvsX0VJxej12B3MmpeNCcQv2ROW', '2018-11-20 07:57:23'),
(97, 1, 'cgioG8ai-3g:APA91bG5IwQHw-YZW9Xl1BCFo3WtDRZ5pdzoMz7CTDzjNYlU0B980upAGE2rIRVfrExl0-O98gCd5VQrC4vzR04lWVJYCEabCfXHXtaiDVGb5LEibzvsX0VJxej12B3MmpeNCcQv2ROW', '2018-11-20 08:01:03'),
(98, 1, 'cgioG8ai-3g:APA91bG5IwQHw-YZW9Xl1BCFo3WtDRZ5pdzoMz7CTDzjNYlU0B980upAGE2rIRVfrExl0-O98gCd5VQrC4vzR04lWVJYCEabCfXHXtaiDVGb5LEibzvsX0VJxej12B3MmpeNCcQv2ROW', '2018-11-20 08:28:27'),
(99, 1, 'cgioG8ai-3g:APA91bG5IwQHw-YZW9Xl1BCFo3WtDRZ5pdzoMz7CTDzjNYlU0B980upAGE2rIRVfrExl0-O98gCd5VQrC4vzR04lWVJYCEabCfXHXtaiDVGb5LEibzvsX0VJxej12B3MmpeNCcQv2ROW', '2018-11-20 09:19:11'),
(100, 1, 'cgioG8ai-3g:APA91bG5IwQHw-YZW9Xl1BCFo3WtDRZ5pdzoMz7CTDzjNYlU0B980upAGE2rIRVfrExl0-O98gCd5VQrC4vzR04lWVJYCEabCfXHXtaiDVGb5LEibzvsX0VJxej12B3MmpeNCcQv2ROW', '2018-11-20 09:24:42'),
(101, 1, 'cgioG8ai-3g:APA91bG5IwQHw-YZW9Xl1BCFo3WtDRZ5pdzoMz7CTDzjNYlU0B980upAGE2rIRVfrExl0-O98gCd5VQrC4vzR04lWVJYCEabCfXHXtaiDVGb5LEibzvsX0VJxej12B3MmpeNCcQv2ROW', '2018-11-20 09:28:55'),
(102, 1, 'cgioG8ai-3g:APA91bG5IwQHw-YZW9Xl1BCFo3WtDRZ5pdzoMz7CTDzjNYlU0B980upAGE2rIRVfrExl0-O98gCd5VQrC4vzR04lWVJYCEabCfXHXtaiDVGb5LEibzvsX0VJxej12B3MmpeNCcQv2ROW', '2018-11-20 09:31:37'),
(103, 1, 'cgioG8ai-3g:APA91bG5IwQHw-YZW9Xl1BCFo3WtDRZ5pdzoMz7CTDzjNYlU0B980upAGE2rIRVfrExl0-O98gCd5VQrC4vzR04lWVJYCEabCfXHXtaiDVGb5LEibzvsX0VJxej12B3MmpeNCcQv2ROW', '2018-11-20 09:37:17'),
(104, 1, 'cgioG8ai-3g:APA91bG5IwQHw-YZW9Xl1BCFo3WtDRZ5pdzoMz7CTDzjNYlU0B980upAGE2rIRVfrExl0-O98gCd5VQrC4vzR04lWVJYCEabCfXHXtaiDVGb5LEibzvsX0VJxej12B3MmpeNCcQv2ROW', '2018-11-20 13:41:47'),
(105, 14, 'cfMWUMnalW0:APA91bHsiOinTyc1B3NUZ6Qs-5MUNJzdu-k-DzjoDSJHSQMb2MAOW_CYSGOZ2h0RX0MIPTG27bw7kvMKtr2lCU1ExR3eSaHmRyIkgdF_fr7wehTLmWZNdu31s2y9pGnC3yctlymJaHlD', '2018-11-20 18:25:00'),
(106, 14, 'cfMWUMnalW0:APA91bHsiOinTyc1B3NUZ6Qs-5MUNJzdu-k-DzjoDSJHSQMb2MAOW_CYSGOZ2h0RX0MIPTG27bw7kvMKtr2lCU1ExR3eSaHmRyIkgdF_fr7wehTLmWZNdu31s2y9pGnC3yctlymJaHlD', '2018-11-20 18:37:05'),
(107, 1, 'cgioG8ai-3g:APA91bG5IwQHw-YZW9Xl1BCFo3WtDRZ5pdzoMz7CTDzjNYlU0B980upAGE2rIRVfrExl0-O98gCd5VQrC4vzR04lWVJYCEabCfXHXtaiDVGb5LEibzvsX0VJxej12B3MmpeNCcQv2ROW', '2018-11-20 21:59:53'),
(108, 14, 'e0s52szQ4GQ:APA91bF3f033tLE83LAEPPiHY0LafoVmTqe1zQ1YShyHzjUCK80T2aKZafutZRp-emRc3nSBA2fFgFrTzsOPM3_QJL94HPH_dJpKLNe8s5916UFkweWqezWjcXpyYeI18q9ZvXl8PtOY', '2018-11-21 06:43:57'),
(109, 14, 'cfMWUMnalW0:APA91bHsiOinTyc1B3NUZ6Qs-5MUNJzdu-k-DzjoDSJHSQMb2MAOW_CYSGOZ2h0RX0MIPTG27bw7kvMKtr2lCU1ExR3eSaHmRyIkgdF_fr7wehTLmWZNdu31s2y9pGnC3yctlymJaHlD', '2018-11-21 06:45:47'),
(110, 14, 'cfMWUMnalW0:APA91bHsiOinTyc1B3NUZ6Qs-5MUNJzdu-k-DzjoDSJHSQMb2MAOW_CYSGOZ2h0RX0MIPTG27bw7kvMKtr2lCU1ExR3eSaHmRyIkgdF_fr7wehTLmWZNdu31s2y9pGnC3yctlymJaHlD', '2018-11-21 06:58:28'),
(111, 1, 'cgioG8ai-3g:APA91bG5IwQHw-YZW9Xl1BCFo3WtDRZ5pdzoMz7CTDzjNYlU0B980upAGE2rIRVfrExl0-O98gCd5VQrC4vzR04lWVJYCEabCfXHXtaiDVGb5LEibzvsX0VJxej12B3MmpeNCcQv2ROW', '2018-11-21 07:02:54'),
(112, 1, 'cgioG8ai-3g:APA91bG5IwQHw-YZW9Xl1BCFo3WtDRZ5pdzoMz7CTDzjNYlU0B980upAGE2rIRVfrExl0-O98gCd5VQrC4vzR04lWVJYCEabCfXHXtaiDVGb5LEibzvsX0VJxej12B3MmpeNCcQv2ROW', '2018-11-21 16:12:19'),
(113, 1, 'cgioG8ai-3g:APA91bG5IwQHw-YZW9Xl1BCFo3WtDRZ5pdzoMz7CTDzjNYlU0B980upAGE2rIRVfrExl0-O98gCd5VQrC4vzR04lWVJYCEabCfXHXtaiDVGb5LEibzvsX0VJxej12B3MmpeNCcQv2ROW', '2018-11-21 16:29:47'),
(114, 1, 'cgioG8ai-3g:APA91bG5IwQHw-YZW9Xl1BCFo3WtDRZ5pdzoMz7CTDzjNYlU0B980upAGE2rIRVfrExl0-O98gCd5VQrC4vzR04lWVJYCEabCfXHXtaiDVGb5LEibzvsX0VJxej12B3MmpeNCcQv2ROW', '2018-11-21 16:31:48'),
(115, 1, 'cgioG8ai-3g:APA91bG5IwQHw-YZW9Xl1BCFo3WtDRZ5pdzoMz7CTDzjNYlU0B980upAGE2rIRVfrExl0-O98gCd5VQrC4vzR04lWVJYCEabCfXHXtaiDVGb5LEibzvsX0VJxej12B3MmpeNCcQv2ROW', '2018-11-22 09:51:13'),
(116, 14, 'cfMWUMnalW0:APA91bHsiOinTyc1B3NUZ6Qs-5MUNJzdu-k-DzjoDSJHSQMb2MAOW_CYSGOZ2h0RX0MIPTG27bw7kvMKtr2lCU1ExR3eSaHmRyIkgdF_fr7wehTLmWZNdu31s2y9pGnC3yctlymJaHlD', '2018-11-22 10:46:03'),
(117, 1, 'cgioG8ai-3g:APA91bG5IwQHw-YZW9Xl1BCFo3WtDRZ5pdzoMz7CTDzjNYlU0B980upAGE2rIRVfrExl0-O98gCd5VQrC4vzR04lWVJYCEabCfXHXtaiDVGb5LEibzvsX0VJxej12B3MmpeNCcQv2ROW', '2018-11-22 18:03:11'),
(118, 1, 'cgioG8ai-3g:APA91bG5IwQHw-YZW9Xl1BCFo3WtDRZ5pdzoMz7CTDzjNYlU0B980upAGE2rIRVfrExl0-O98gCd5VQrC4vzR04lWVJYCEabCfXHXtaiDVGb5LEibzvsX0VJxej12B3MmpeNCcQv2ROW', '2018-11-22 18:24:40'),
(119, 1, 'cgioG8ai-3g:APA91bG5IwQHw-YZW9Xl1BCFo3WtDRZ5pdzoMz7CTDzjNYlU0B980upAGE2rIRVfrExl0-O98gCd5VQrC4vzR04lWVJYCEabCfXHXtaiDVGb5LEibzvsX0VJxej12B3MmpeNCcQv2ROW', '2018-11-22 19:21:12'),
(120, 1, 'cgioG8ai-3g:APA91bG5IwQHw-YZW9Xl1BCFo3WtDRZ5pdzoMz7CTDzjNYlU0B980upAGE2rIRVfrExl0-O98gCd5VQrC4vzR04lWVJYCEabCfXHXtaiDVGb5LEibzvsX0VJxej12B3MmpeNCcQv2ROW', '2018-11-22 19:23:28'),
(121, 1, 'cgioG8ai-3g:APA91bG5IwQHw-YZW9Xl1BCFo3WtDRZ5pdzoMz7CTDzjNYlU0B980upAGE2rIRVfrExl0-O98gCd5VQrC4vzR04lWVJYCEabCfXHXtaiDVGb5LEibzvsX0VJxej12B3MmpeNCcQv2ROW', '2018-11-22 19:25:31'),
(122, 1, 'cgioG8ai-3g:APA91bG5IwQHw-YZW9Xl1BCFo3WtDRZ5pdzoMz7CTDzjNYlU0B980upAGE2rIRVfrExl0-O98gCd5VQrC4vzR04lWVJYCEabCfXHXtaiDVGb5LEibzvsX0VJxej12B3MmpeNCcQv2ROW', '2018-11-23 00:42:34'),
(123, 1, 'cgioG8ai-3g:APA91bG5IwQHw-YZW9Xl1BCFo3WtDRZ5pdzoMz7CTDzjNYlU0B980upAGE2rIRVfrExl0-O98gCd5VQrC4vzR04lWVJYCEabCfXHXtaiDVGb5LEibzvsX0VJxej12B3MmpeNCcQv2ROW', '2018-11-23 01:15:27'),
(124, 14, 'cfMWUMnalW0:APA91bHsiOinTyc1B3NUZ6Qs-5MUNJzdu-k-DzjoDSJHSQMb2MAOW_CYSGOZ2h0RX0MIPTG27bw7kvMKtr2lCU1ExR3eSaHmRyIkgdF_fr7wehTLmWZNdu31s2y9pGnC3yctlymJaHlD', '2018-11-23 01:16:04'),
(125, 1, 'cgioG8ai-3g:APA91bG5IwQHw-YZW9Xl1BCFo3WtDRZ5pdzoMz7CTDzjNYlU0B980upAGE2rIRVfrExl0-O98gCd5VQrC4vzR04lWVJYCEabCfXHXtaiDVGb5LEibzvsX0VJxej12B3MmpeNCcQv2ROW', '2018-11-23 01:37:25'),
(126, 1, 'cgioG8ai-3g:APA91bG5IwQHw-YZW9Xl1BCFo3WtDRZ5pdzoMz7CTDzjNYlU0B980upAGE2rIRVfrExl0-O98gCd5VQrC4vzR04lWVJYCEabCfXHXtaiDVGb5LEibzvsX0VJxej12B3MmpeNCcQv2ROW', '2018-11-23 02:02:08'),
(127, 1, 'cgioG8ai-3g:APA91bG5IwQHw-YZW9Xl1BCFo3WtDRZ5pdzoMz7CTDzjNYlU0B980upAGE2rIRVfrExl0-O98gCd5VQrC4vzR04lWVJYCEabCfXHXtaiDVGb5LEibzvsX0VJxej12B3MmpeNCcQv2ROW', '2018-11-23 02:05:08'),
(128, 14, 'cfMWUMnalW0:APA91bHsiOinTyc1B3NUZ6Qs-5MUNJzdu-k-DzjoDSJHSQMb2MAOW_CYSGOZ2h0RX0MIPTG27bw7kvMKtr2lCU1ExR3eSaHmRyIkgdF_fr7wehTLmWZNdu31s2y9pGnC3yctlymJaHlD', '2018-11-23 02:07:24'),
(129, 14, 'eXaN5JhmqQk:APA91bFuTjyqMYm5E8jVJj16GDcTEuE-59F7-mJuu4x6iIiBe8R6EAXpwWxdZ7UPF2XQPAjufhW8-hDMQ2v44yR2oJCuyuldPs9Kwzi51ucnnahLUgVou5MuVZ2n4gfdzmop0Vai2zDG', '2018-11-23 02:29:40'),
(130, 14, 'eXaN5JhmqQk:APA91bFuTjyqMYm5E8jVJj16GDcTEuE-59F7-mJuu4x6iIiBe8R6EAXpwWxdZ7UPF2XQPAjufhW8-hDMQ2v44yR2oJCuyuldPs9Kwzi51ucnnahLUgVou5MuVZ2n4gfdzmop0Vai2zDG', '2018-11-23 02:33:47'),
(131, 14, 'eXaN5JhmqQk:APA91bFuTjyqMYm5E8jVJj16GDcTEuE-59F7-mJuu4x6iIiBe8R6EAXpwWxdZ7UPF2XQPAjufhW8-hDMQ2v44yR2oJCuyuldPs9Kwzi51ucnnahLUgVou5MuVZ2n4gfdzmop0Vai2zDG', '2018-11-23 02:50:55'),
(132, 14, 'eXaN5JhmqQk:APA91bFuTjyqMYm5E8jVJj16GDcTEuE-59F7-mJuu4x6iIiBe8R6EAXpwWxdZ7UPF2XQPAjufhW8-hDMQ2v44yR2oJCuyuldPs9Kwzi51ucnnahLUgVou5MuVZ2n4gfdzmop0Vai2zDG', '2018-11-23 02:56:40'),
(133, 14, 'eXaN5JhmqQk:APA91bFuTjyqMYm5E8jVJj16GDcTEuE-59F7-mJuu4x6iIiBe8R6EAXpwWxdZ7UPF2XQPAjufhW8-hDMQ2v44yR2oJCuyuldPs9Kwzi51ucnnahLUgVou5MuVZ2n4gfdzmop0Vai2zDG', '2018-11-24 08:17:59'),
(134, 2, 'cgioG8ai-3g:APA91bG5IwQHw-YZW9Xl1BCFo3WtDRZ5pdzoMz7CTDzjNYlU0B980upAGE2rIRVfrExl0-O98gCd5VQrC4vzR04lWVJYCEabCfXHXtaiDVGb5LEibzvsX0VJxej12B3MmpeNCcQv2ROW', '2018-11-24 09:05:42'),
(135, 1, 'cgioG8ai-3g:APA91bG5IwQHw-YZW9Xl1BCFo3WtDRZ5pdzoMz7CTDzjNYlU0B980upAGE2rIRVfrExl0-O98gCd5VQrC4vzR04lWVJYCEabCfXHXtaiDVGb5LEibzvsX0VJxej12B3MmpeNCcQv2ROW', '2018-11-24 20:20:31'),
(136, 14, 'cfMWUMnalW0:APA91bHsiOinTyc1B3NUZ6Qs-5MUNJzdu-k-DzjoDSJHSQMb2MAOW_CYSGOZ2h0RX0MIPTG27bw7kvMKtr2lCU1ExR3eSaHmRyIkgdF_fr7wehTLmWZNdu31s2y9pGnC3yctlymJaHlD', '2018-11-24 23:31:53'),
(137, 1, 'cgioG8ai-3g:APA91bG5IwQHw-YZW9Xl1BCFo3WtDRZ5pdzoMz7CTDzjNYlU0B980upAGE2rIRVfrExl0-O98gCd5VQrC4vzR04lWVJYCEabCfXHXtaiDVGb5LEibzvsX0VJxej12B3MmpeNCcQv2ROW', '2018-11-25 03:54:02'),
(138, 1, 'cgioG8ai-3g:APA91bG5IwQHw-YZW9Xl1BCFo3WtDRZ5pdzoMz7CTDzjNYlU0B980upAGE2rIRVfrExl0-O98gCd5VQrC4vzR04lWVJYCEabCfXHXtaiDVGb5LEibzvsX0VJxej12B3MmpeNCcQv2ROW', '2018-11-25 06:54:31'),
(139, 1, 'cgioG8ai-3g:APA91bG5IwQHw-YZW9Xl1BCFo3WtDRZ5pdzoMz7CTDzjNYlU0B980upAGE2rIRVfrExl0-O98gCd5VQrC4vzR04lWVJYCEabCfXHXtaiDVGb5LEibzvsX0VJxej12B3MmpeNCcQv2ROW', '2018-11-25 23:48:32'),
(140, 14, 'cfMWUMnalW0:APA91bHsiOinTyc1B3NUZ6Qs-5MUNJzdu-k-DzjoDSJHSQMb2MAOW_CYSGOZ2h0RX0MIPTG27bw7kvMKtr2lCU1ExR3eSaHmRyIkgdF_fr7wehTLmWZNdu31s2y9pGnC3yctlymJaHlD', '2018-11-26 01:35:07');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
