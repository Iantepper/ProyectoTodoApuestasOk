-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 30-09-2023 a las 23:51:10
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
-- Base de datos: `apuestatodook`
--

-- DROP database apuestatodo;    CREATE database apuestatodo;    crea la base de datos 

-- --------------------------------------------------------  

-- Borra las tablas si existen 

-- SET FOREIGN_KEY_CHECKS = 0;     desactivando el chequeo de datos para evitar error con las fk

-- DROP TABLE IF EXISTS apuesta, partido, persona, resultado, usuario;

-- SET FOREIGN_KEY_CHECKS = 1;      activando el chequeo de datos 



--
-- Estructura de tabla para la tabla `apuesta`
--

CREATE TABLE `apuesta` (
  `id_apuesta` int(11) NOT NULL,
  `monto` decimal(10,2) NOT NULL,
  `premio` decimal(10,2) NOT NULL,
  `por_quien` enum ('local', 'visitante') NOT NULL,  -- tal vez se agregue empate
  `fk_id_persona` int(11) DEFAULT NULL,
  `fk_id_resultado` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `partido`
--

CREATE TABLE `partido` (
  `id_partido` int(11) NOT NULL,
  `local` varchar(255) NOT NULL,
  `visitante` varchar(255) NOT NULL,
  `fecha` date DEFAULT NULL 
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


-- Agregando datos a la tabla partido
INSERT INTO `partido` VALUES (1,'Real Madrid','FC Barcelona','2023-11-01',NULL,NULL),(2,'Manchester City','Liverpool FC','2023-11-02',NULL,NULL),(3,'Bayern Munich','Borussia Dortmund','2023-11-03',NULL,NULL),(4,'Paris Saint-Germain','AC Milan','2023-11-04',NULL,NULL),(5,'Juventus','Inter Milan','2023-11-05',NULL,NULL),(6,'Chelsea FC','Arsenal FC','2023-11-06',NULL,NULL),(7,'Atletico Madrid','Sevilla FC','2023-11-07',NULL,NULL),(8,'Borussia Monchengladbach','Hertha Berlin','2023-11-08',NULL,NULL),(9,'Ajax Amsterdam','PSV Eindhoven','2023-11-09',NULL,NULL),(10,'AS Roma','SS Lazio','2023-11-10',NULL,NULL),(11,'FC Porto','SL Benfica','2023-11-11',NULL,NULL),(12,'Tottenham Hotspur','Manchester United','2023-11-12',NULL,NULL),(13,'ACF Fiorentina','Napoli','2023-11-13',NULL,NULL),(14,'Everton FC','Leeds United','2023-11-14',NULL,NULL),(15,'Ajax Cape Town','Kaizer Chiefs','2023-11-15',NULL,NULL);



-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `persona`
--

CREATE TABLE `persona` (
  `id_persona` int(11) NOT NULL,
  `dni` varchar(255) NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `apellido` varchar(255) NOT NULL,
  `edad` int(11) DEFAULT NULL,
  `dinero` decimal(10,2) NOT NULL,
  `fk_id_usuario` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci; 


-- Agrega datos a la tabla persona 

INSERT INTO `persona` VALUES (1,'42382349','Nombre1','Apellido1',NULL,0.00,NULL),(2,'25560981','Nombre2','Apellido2',NULL,0.00,NULL),(3,'19632400','Nombre3','Apellido3',NULL,0.00,NULL),(4,'33254417','Nombre4','Apellido4',NULL,0.00,NULL),(5,'28385463','Nombre5','Apellido5',NULL,0.00,NULL),(6,'37334279','Nombre6','Apellido6',NULL,0.00,NULL),(7,'32529631','Nombre7','Apellido7',NULL,0.00,NULL),(8,'35995411','Nombre8','Apellido8',NULL,0.00,NULL),(9,'37579419','Nombre9','Apellido9',NULL,0.00,NULL),(10,'25469541','Nombre10','Apellido10',NULL,0.00,NULL),(11,'31799881','Nombre11','Apellido11',NULL,0.00,NULL),(12,'41034616','Nombre12','Apellido12',NULL,0.00,NULL),(13,'40482394','Nombre13','Apellido13',NULL,0.00,NULL),(14,'35720751','Nombre14','Apellido14',NULL,0.00,NULL),(15,'26382240','Nombre15','Apellido15',NULL,0.00,NULL); 


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `resultado`
--

CREATE TABLE `resultado` (
  `id_resultado` int(11) NOT NULL,
  `ganador` enum ("local", "visitante", "empate") DEFAULT NULL, 
  `fk_id_partido` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `id_usuario` int(11) NOT NULL,
  `usuario` varchar(255) NOT NULL,
  `contrasenia` varchar(255) NOT NULL 
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci; 

-- Agregando datos a la tabla usuario 
INSERT INTO `usuario` VALUES (1,'Usuario1','Contraseña1'),(2,'Usuario2','Contraseña2'),(3,'Usuario3','Contraseña3'),(4,'Usuario4','Contraseña4'),(5,'Usuario5','Contraseña5'),(6,'Usuario6','Contraseña6'),(7,'Usuario7','Contraseña7'),(8,'Usuario8','Contraseña8'),(9,'Usuario9','Contraseña9'),(10,'Usuario10','Contraseña10'),(11,'Usuario11','Contraseña11'),(12,'Usuario12','Contraseña12'),(13,'Usuario13','Contraseña13'),(14,'Usuario14','Contraseña14'),(15,'Usuario15','Contraseña15');



--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `apuesta`
--
ALTER TABLE `apuesta`
  ADD PRIMARY KEY (`id_apuesta`),
  ADD KEY `fk_id_resultado` (`fk_id_resultado`),
  ADD KEY `fk_id_persona` (`fk_id_persona`);

--
-- Indices de la tabla `partido`
--
ALTER TABLE `partido`
  ADD PRIMARY KEY (`id_partido`);

--
-- Indices de la tabla `persona`
--
ALTER TABLE `persona`
  ADD PRIMARY KEY (`id_persona`),
  ADD KEY `fk_id_usuario` (`fk_id_usuario`);

--
-- Indices de la tabla `resultado`
--
ALTER TABLE `resultado`
  ADD PRIMARY KEY (`id_resultado`),
  ADD KEY `fk_id_partido` (`fk_id_partido`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`id_usuario`);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `apuesta`
--
ALTER TABLE `apuesta`
  ADD CONSTRAINT `apuesta_ibfk_3` FOREIGN KEY (`fk_id_resultado`) REFERENCES `resultado` (`id_resultado`),
  ADD CONSTRAINT `apuesta_ibfk_4` FOREIGN KEY (`fk_id_persona`) REFERENCES `persona` (`id_persona`);

--
-- Filtros para la tabla `persona`
--
ALTER TABLE `persona`
  ADD CONSTRAINT `persona_ibfk_1` FOREIGN KEY (`fk_id_usuario`) REFERENCES `usuario` (`id_usuario`);

--
-- Filtros para la tabla `resultado`
--
ALTER TABLE `resultado`
  ADD CONSTRAINT `resultado_ibfk_1` FOREIGN KEY (`fk_id_partido`) REFERENCES `partido` (`id_partido`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
