	CREATE TABLE `klant` (
 `klantID` int(3) NOT NULL AUTO_INCREMENT COMMENT 'Id van de klant',
 `klantNaam` varchar(30) NOT NULL COMMENT 'De naam van de klant',
 `telefoon` int(11) NOT NULL COMMENT 'Telefoon van de klant',
 PRIMARY KEY (`klantID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4

CREATE TABLE `gerecht` (
 `gerechtID` int(3) NOT NULL AUTO_INCREMENT COMMENT 'Code voor het type gerecht',
 `gerecht` varchar(10) NOT NULL COMMENT 'Type gerecht',
 PRIMARY KEY (`gerechtID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4

CREATE TABLE `subgerecht` (
 `subGerechtID` int(4) NOT NULL AUTO_INCREMENT COMMENT 'Code voor de onderverdeling van gerechten',
 `gerechtID` int(3) NOT NULL COMMENT 'Code voor het type gerecht',
 `subGerecht` varchar(25) NOT NULL COMMENT 'Onderverdeling van gerechten',
 PRIMARY KEY (`subGerechtID`),
 KEY `GerechtID` (`gerechtID`),
 CONSTRAINT `subgerecht_ibfk_1` FOREIGN KEY (`GerechtID`) REFERENCES `gerecht` (`gerechtID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4

CREATE TABLE `menuitem` (
 `menuItemID` int(4) NOT NULL AUTO_INCREMENT COMMENT 'Code voor het menuitem',
 `gerechtID` int(3) NOT NULL COMMENT 'Code voor het type gerecht',
 `subGerechtID` int(4) NOT NULL COMMENT 'Code voor de onderverdeling van gerechten',
 `MenuItem` varchar(30) NOT NULL COMMENT 'Naam van het menuitem',
 `prijs` decimal(5,2) NOT NULL COMMENT 'Prijs van het menuitem',
 PRIMARY KEY (`menuItemID`),
 KEY `gerechtID` (`gerechtID`),
 KEY `subGerechtID` (`subGerechtID`),
 CONSTRAINT `menuitem_ibfk_1` FOREIGN KEY (`gerechtID`) REFERENCES `gerecht` (`gerechtID`),
 CONSTRAINT `menuitem_ibfk_2` FOREIGN KEY (`subGerechtID`) REFERENCES `subgerecht` (`subGerechtID`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4

CREATE TABLE `reservering` (
 `reserveringID` int(3) NOT NULL AUTO_INCREMENT COMMENT 'ID van de reservering',
 `tafel` int(3) NOT NULL COMMENT 'tafelnummer',
 `datum` date NOT NULL COMMENT 'datum van der reservering',
 `tijd` time NOT NULL COMMENT 'tijd van de reservering',
 `aantal` int(2) NOT NULL COMMENT 'aantal mensen dat komt',
 `klantID` int(5) NOT NULL COMMENT 'ID van de klant',
 PRIMARY KEY (`reserveringID`),
 KEY `klantID` (`klantID`),
 CONSTRAINT `reservering_ibfk_1` FOREIGN KEY (`klantID`) REFERENCES `klant` (`klantID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4

CREATE TABLE `bestelling` (
 `tafel` int(3) NOT NULL COMMENT 'Het nummer van de tafel',
 `datum` date NOT NULL DEFAULT current_timestamp() COMMENT 'De datum van de bestelling (automatisch)',
 `tijd` datetime NOT NULL DEFAULT current_timestamp() COMMENT 'De tijd van de bestelling (automatisch)',
 `menuItemID` int(4) NOT NULL COMMENT 'Code van het bestelde menuitem',
 `aantal` int(2) NOT NULL COMMENT 'Het aantal bestelde menuitems',
 `prijs` decimal(5,2) NOT NULL COMMENT 'Prijs van het menuitem op het moment van bestelling (automatisch ingevuld)',
 `bestellingID` int(3) NOT NULL AUTO_INCREMENT COMMENT 'De ID van de bestelling',
 `reserveringID` int(3) NOT NULL COMMENT 'de ID van de reservering',
 PRIMARY KEY (`bestellingID`),
 KEY `menuItemID` (`menuItemID`),
 KEY `reserveringID` (`reserveringID`),
 KEY `tafel` (`tafel`),
 CONSTRAINT `bestelling_ibfk_1` FOREIGN KEY (`menuItemID`) REFERENCES `menuitem` (`menuItemID`),
 CONSTRAINT `bestelling_ibfk_2` FOREIGN KEY (`reserveringID`) REFERENCES `reservering` (`reserveringID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4

CREATE TABLE `bon` (
 `bonID` int(3) NOT NULL AUTO_INCREMENT COMMENT 'De ID voor de bon',
 `tafel` int(3) NOT NULL COMMENT 'tafelnummer',
 `bestellingID` int(3) NOT NULL COMMENT 'ID van de bestelling',
 `datum` date NOT NULL DEFAULT current_timestamp() COMMENT 'datum van de bon',
 `tijd` datetime NOT NULL DEFAULT current_timestamp() COMMENT 'tijd van de bon',
 PRIMARY KEY (`bonID`),
 KEY `tafel` (`tafel`),
 KEY `bestellingID` (`bestellingID`),
 CONSTRAINT `bon_ibfk_1` FOREIGN KEY (`bestellingID`) REFERENCES `bestelling` (`bestellingID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4