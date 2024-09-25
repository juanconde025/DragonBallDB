CREATE DATABASE  IF NOT EXISTS `dragonball`
USE `dragonball`;

CREATE TABLE `combates` (
  `idCombate` int NOT NULL AUTO_INCREMENT,
  `Ganador` varchar(45) NOT NULL,
  `Combatientes` text,
  PRIMARY KEY (`idCombate`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `objetos` (
  `idObjetos` int NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(45) NOT NULL,
  `Tipo` varchar(30) NOT NULL,
  PRIMARY KEY (`idObjetos`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `objetos_sagas` (
  `Objetos_idObjetos` int NOT NULL,
  `Sagas_idSaga` int NOT NULL,
  KEY `fk_Objetos_Sagas_Objetos1_idx` (`Objetos_idObjetos`),
  KEY `fk_Objetos_Sagas_Sagas1_idx` (`Sagas_idSaga`),
  CONSTRAINT `fk_Objetos_Sagas_Objetos1` FOREIGN KEY (`Objetos_idObjetos`) REFERENCES `objetos` (`idObjetos`),
  CONSTRAINT `fk_Objetos_Sagas_Sagas1` FOREIGN KEY (`Sagas_idSaga`) REFERENCES `sagas` (`idSaga`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `organizaciones` (
  `idOrganización` int NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(45) NOT NULL,
  `Tipo` varchar(30) NOT NULL,
  PRIMARY KEY (`idOrganización`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `películas` (
  `idPelícula` int NOT NULL AUTO_INCREMENT,
  `Título` varchar(45) NOT NULL,
  `Año` int NOT NULL,
  PRIMARY KEY (`idPelícula`),
  UNIQUE KEY `Título_UNIQUE` (`Título`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `personajes` (
  `idPersonaje` int NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(45) NOT NULL,
  `Raza_idRaza` int NOT NULL,
  `Organizaciones_idOrganización` int NOT NULL,
  `Planetas_idPlaneta` int NOT NULL,
  PRIMARY KEY (`idPersonaje`),
  KEY `fk_Personajes_Raza_idx` (`Raza_idRaza`),
  KEY `fk_Personajes_Organizaciones1_idx` (`Organizaciones_idOrganización`),
  KEY `fk_Personajes_Planetas1_idx` (`Planetas_idPlaneta`),
  CONSTRAINT `fk_Personajes_Organizaciones1` FOREIGN KEY (`Organizaciones_idOrganización`) REFERENCES `organizaciones` (`idOrganización`),
  CONSTRAINT `fk_Personajes_Planetas1` FOREIGN KEY (`Planetas_idPlaneta`) REFERENCES `planetas` (`idPlaneta`),
  CONSTRAINT `fk_Personajes_Raza` FOREIGN KEY (`Raza_idRaza`) REFERENCES `raza` (`idRaza`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `personajes_combates` (
  `Personajes_idPersonaje` int NOT NULL,
  `Combates_idCombate` int NOT NULL,
  KEY `fk_Personajes_Combates_Personajes1_idx` (`Personajes_idPersonaje`),
  KEY `fk_Personajes_Combates_Combates1_idx` (`Combates_idCombate`),
  CONSTRAINT `fk_Personajes_Combates_Combates1` FOREIGN KEY (`Combates_idCombate`) REFERENCES `combates` (`idCombate`),
  CONSTRAINT `fk_Personajes_Combates_Personajes1` FOREIGN KEY (`Personajes_idPersonaje`) REFERENCES `personajes` (`idPersonaje`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `personajes_películas` (
  `Personajes_idPersonaje` int NOT NULL,
  `Películas_idPelícula` int NOT NULL,
  KEY `fk_Personajes_Películas_Personajes1_idx` (`Personajes_idPersonaje`),
  KEY `fk_Personajes_Películas_Películas1_idx` (`Películas_idPelícula`),
  CONSTRAINT `fk_Personajes_Películas_Películas1` FOREIGN KEY (`Películas_idPelícula`) REFERENCES `películas` (`idPelícula`),
  CONSTRAINT `fk_Personajes_Películas_Personajes1` FOREIGN KEY (`Personajes_idPersonaje`) REFERENCES `personajes` (`idPersonaje`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `personajes_sagas` (
  `Sagas_idSaga` int NOT NULL,
  `Personajes_idPersonaje` int NOT NULL,
  KEY `fk_Personajes_Sagas_Sagas1_idx` (`Sagas_idSaga`),
  KEY `fk_Personajes_Sagas_Personajes1_idx` (`Personajes_idPersonaje`),
  CONSTRAINT `fk_Personajes_Sagas_Personajes1` FOREIGN KEY (`Personajes_idPersonaje`) REFERENCES `personajes` (`idPersonaje`),
  CONSTRAINT `fk_Personajes_Sagas_Sagas1` FOREIGN KEY (`Sagas_idSaga`) REFERENCES `sagas` (`idSaga`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `planetas` (
  `idPlaneta` int NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(45) NOT NULL,
  `Tipo` varchar(30) NOT NULL,
  `Habitantes` int NOT NULL,
  PRIMARY KEY (`idPlaneta`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `raza` (
  `idRaza` int NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(45) NOT NULL,
  PRIMARY KEY (`idRaza`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `sagas` (
  `idSaga` int NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(45) NOT NULL,
  `Villano` varchar(45) NOT NULL,
  PRIMARY KEY (`idSaga`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `sagas_películas` (
  `Películas_idPelícula` int NOT NULL,
  `Sagas_idSaga` int NOT NULL,
  KEY `fk_Sagas_Películas_Películas1_idx` (`Películas_idPelícula`),
  KEY `fk_Sagas_Películas_Sagas1_idx` (`Sagas_idSaga`),
  CONSTRAINT `fk_Sagas_Películas_Películas1` FOREIGN KEY (`Películas_idPelícula`) REFERENCES `películas` (`idPelícula`),
  CONSTRAINT `fk_Sagas_Películas_Sagas1` FOREIGN KEY (`Sagas_idSaga`) REFERENCES `sagas` (`idSaga`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `transformaciones` (
  `idTransformación` int NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(45) NOT NULL,
  `Requisitos` text NOT NULL,
  `Efectos` text NOT NULL,
  `Raza_idRaza` int NOT NULL,
  PRIMARY KEY (`idTransformación`),
  KEY `fk_Transformaciones_Raza1_idx` (`Raza_idRaza`),
  CONSTRAINT `fk_Transformaciones_Raza1` FOREIGN KEY (`Raza_idRaza`) REFERENCES `raza` (`idRaza`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `transformaciones_personajes` (
  `Transformaciones_idTransformación` int NOT NULL,
  `Personajes_idPersonaje` int NOT NULL,
  KEY `fk_Transformaciones_Personajes_Transformaciones1_idx` (`Transformaciones_idTransformación`),
  KEY `fk_Transformaciones_Personajes_Personajes1_idx` (`Personajes_idPersonaje`),
  CONSTRAINT `fk_Transformaciones_Personajes_Personajes1` FOREIGN KEY (`Personajes_idPersonaje`) REFERENCES `personajes` (`idPersonaje`),
  CONSTRAINT `fk_Transformaciones_Personajes_Transformaciones1` FOREIGN KEY (`Transformaciones_idTransformación`) REFERENCES `transformaciones` (`idTransformación`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `técnicas` (
  `idTécnica` int NOT NULL,
  `Nombre` varchar(45) NOT NULL,
  `Tipo` varchar(30) NOT NULL,
  PRIMARY KEY (`idTécnica`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `técnicas_personajes` (
  `Personajes_idPersonaje` int NOT NULL,
  `Técnicas_idTécnica` int NOT NULL,
  KEY `fk_Técnicas_Personajes_Personajes1_idx` (`Personajes_idPersonaje`),
  KEY `fk_Técnicas_Personajes_Técnicas1_idx` (`Técnicas_idTécnica`),
  CONSTRAINT `fk_Técnicas_Personajes_Personajes1` FOREIGN KEY (`Personajes_idPersonaje`) REFERENCES `personajes` (`idPersonaje`),
  CONSTRAINT `fk_Técnicas_Personajes_Técnicas1` FOREIGN KEY (`Técnicas_idTécnica`) REFERENCES `técnicas` (`idTécnica`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;