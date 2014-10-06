-- phpMyAdmin SQL Dump
-- version 4.0.4.1
-- http://www.phpmyadmin.net
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 06-10-2014 a las 22:30:47
-- Versión del servidor: 5.5.32
-- Versión de PHP: 5.4.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de datos: `agioletto`
--
CREATE DATABASE IF NOT EXISTS `agioletto` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `agioletto`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `category`
--

CREATE TABLE IF NOT EXISTS `category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Volcado de datos para la tabla `category`
--

INSERT INTO `category` (`id`, `name`) VALUES
(1, 'Categoria 1'),
(2, 'Categoria 2'),
(3, 'Categoria 3');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `claims`
--

CREATE TABLE IF NOT EXISTS `claims` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `client`
--

CREATE TABLE IF NOT EXISTS `client` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `address` text NOT NULL,
  `phone` text NOT NULL,
  `dni` text NOT NULL,
  `cuit` text NOT NULL,
  `email` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `client_condition`
--

CREATE TABLE IF NOT EXISTS `client_condition` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `component`
--

CREATE TABLE IF NOT EXISTS `component` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Component of a Product' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `currency`
--

CREATE TABLE IF NOT EXISTS `currency` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Volcado de datos para la tabla `currency`
--

INSERT INTO `currency` (`id`, `name`) VALUES
(1, 'Pesos'),
(2, 'Dolares'),
(3, 'Euros');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `deposit_type`
--

CREATE TABLE IF NOT EXISTS `deposit_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `family`
--

CREATE TABLE IF NOT EXISTS `family` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Volcado de datos para la tabla `family`
--

INSERT INTO `family` (`id`, `name`) VALUES
(1, 'Familia 1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `furniture_type`
--

CREATE TABLE IF NOT EXISTS `furniture_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Volcado de datos para la tabla `furniture_type`
--

INSERT INTO `furniture_type` (`id`, `name`) VALUES
(1, 'Tipo de Mueble 1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `order`
--

CREATE TABLE IF NOT EXISTS `order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `client` int(11) NOT NULL,
  `observations` text NOT NULL,
  `source` int(11) NOT NULL,
  `discount_percentage` int(11) NOT NULL,
  `total_exc_tax` double NOT NULL,
  `total_inc_tax` double NOT NULL,
  `current_debt` double NOT NULL,
  `initial_deposit` double NOT NULL,
  `order_date` date NOT NULL,
  `seller` int(11) NOT NULL,
  `delivery_expected_days` double NOT NULL,
  `delivery_expected_date` date NOT NULL,
  `store` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `client` (`client`,`source`),
  KEY `seller` (`seller`,`store`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `order_line`
--

CREATE TABLE IF NOT EXISTS `order_line` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `order_status`
--

CREATE TABLE IF NOT EXISTS `order_status` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `payment`
--

CREATE TABLE IF NOT EXISTS `payment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `payment_method` int(11) NOT NULL,
  `order` int(11) NOT NULL,
  `amount` double NOT NULL,
  `current_debt` double NOT NULL,
  `client` int(11) NOT NULL,
  `currency` int(11) NOT NULL,
  `is_deposit` tinyint(1) NOT NULL,
  `is_additional_deposit` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `payment_method` (`payment_method`,`order`,`client`,`currency`),
  KEY `order` (`order`),
  KEY `client` (`client`),
  KEY `currency` (`currency`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `payment_method`
--

CREATE TABLE IF NOT EXISTS `payment_method` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Volcado de datos para la tabla `payment_method`
--

INSERT INTO `payment_method` (`id`, `name`) VALUES
(1, 'Efectivo'),
(2, 'Tarjeta de Credito'),
(3, 'Tarjeta de Débito'),
(4, 'Cheque'),
(5, 'Transferencia Bancaria');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `product`
--

CREATE TABLE IF NOT EXISTS `product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` text NOT NULL,
  `family` int(11) NOT NULL,
  `furniture_type` int(11) NOT NULL,
  `price` double NOT NULL,
  `list_price` double NOT NULL,
  `stock` int(11) NOT NULL,
  `visible` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `family` (`family`,`furniture_type`),
  KEY `furniture_type` (`furniture_type`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Volcado de datos para la tabla `product`
--

INSERT INTO `product` (`id`, `name`, `family`, `furniture_type`, `price`, `list_price`, `stock`, `visible`) VALUES
(1, 'Producto 1', 1, 1, 150, 155, 300, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `product_category`
--

CREATE TABLE IF NOT EXISTS `product_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product` int(11) NOT NULL,
  `category` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `product` (`product`,`category`),
  KEY `category` (`category`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `role`
--

CREATE TABLE IF NOT EXISTS `role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` text NOT NULL,
  `level` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Volcado de datos para la tabla `role`
--

INSERT INTO `role` (`id`, `name`, `level`) VALUES
(1, 'Vendedor', 1),
(2, 'Administrador', 99);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `source`
--

CREATE TABLE IF NOT EXISTS `source` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `source` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=8 ;

--
-- Volcado de datos para la tabla `source`
--

INSERT INTO `source` (`id`, `source`) VALUES
(1, 'Internet'),
(2, 'Promocion'),
(3, 'Facebook '),
(4, 'Twitter'),
(5, 'Diario'),
(6, 'Cupones'),
(7, 'Otros');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `store`
--

CREATE TABLE IF NOT EXISTS `store` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` text NOT NULL,
  `address` text NOT NULL,
  `phone` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Volcado de datos para la tabla `store`
--

INSERT INTO `store` (`id`, `name`, `address`, `phone`) VALUES
(1, 'Libertador', 'Av Libertador 7900 - Nuñez, CABA', '5263-0363'),
(2, '', 'Av. Cabildo 4932 - Saavedra, CABA', '-');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `user`
--

CREATE TABLE IF NOT EXISTS `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` text NOT NULL,
  `password` text NOT NULL,
  `email` text NOT NULL,
  `role` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `role` (`role`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Volcado de datos para la tabla `user`
--

INSERT INTO `user` (`id`, `username`, `password`, `email`, `role`) VALUES
(2, 'vendedor', '$1$kk3.d0/.$4EHh3G.TGwX6cU8IPHNqh0', 'vendedor@agioletto.com', 1),
(3, 'admin', '$1$ME/.lt..$emJImx78xHVC0aKqY3rgl0', 'admin@agioletto.com', 2);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `payment`
--
ALTER TABLE `payment`
  ADD CONSTRAINT `payment_ibfk_1` FOREIGN KEY (`payment_method`) REFERENCES `payment_method` (`id`),
  ADD CONSTRAINT `payment_ibfk_2` FOREIGN KEY (`order`) REFERENCES `order` (`id`),
  ADD CONSTRAINT `payment_ibfk_3` FOREIGN KEY (`client`) REFERENCES `client` (`id`),
  ADD CONSTRAINT `payment_ibfk_4` FOREIGN KEY (`currency`) REFERENCES `currency` (`id`);

--
-- Filtros para la tabla `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `product_ibfk_1` FOREIGN KEY (`family`) REFERENCES `family` (`id`),
  ADD CONSTRAINT `product_ibfk_2` FOREIGN KEY (`furniture_type`) REFERENCES `furniture_type` (`id`);

--
-- Filtros para la tabla `product_category`
--
ALTER TABLE `product_category`
  ADD CONSTRAINT `product_category_ibfk_1` FOREIGN KEY (`product`) REFERENCES `product` (`id`),
  ADD CONSTRAINT `product_category_ibfk_2` FOREIGN KEY (`category`) REFERENCES `category` (`id`);

--
-- Filtros para la tabla `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `user_ibfk_1` FOREIGN KEY (`role`) REFERENCES `role` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
