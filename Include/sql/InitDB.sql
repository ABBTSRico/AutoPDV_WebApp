-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema Anlagedaten
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema Anlagedaten
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `Anlagedaten`;

CREATE SCHEMA IF NOT EXISTS `Anlagedaten` DEFAULT CHARACTER SET utf8 ;
USE `Anlagedaten` ;

-- -----------------------------------------------------
-- Table `Anlagedaten`.`NETZEBENE`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Anlagedaten`.`NETZEBENE` (
  `NeID` INT(11) NOT NULL AUTO_INCREMENT,
  `AKS_Bezeichnung` VARCHAR(3) NOT NULL,
  `Bezeichnung` VARCHAR(45) NOT NULL,
  `Bereich` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`NeID`),
  UNIQUE INDEX `NeID_UNIQUE` (`NeID` ASC),
  UNIQUE INDEX `AKS_Bezeichnung_UNIQUE` (`AKS_Bezeichnung` ASC))
ENGINE = InnoDB
AUTO_INCREMENT = 8
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `Anlagedaten`.`LAND`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Anlagedaten`.`LAND` (
  `LandID` CHAR(2) NOT NULL,
  `en` VARCHAR(100) NOT NULL DEFAULT '',
  `de` VARCHAR(100) NOT NULL DEFAULT '',
  `es` VARCHAR(100) NOT NULL,
  `fr` VARCHAR(100) NOT NULL,
  `it` VARCHAR(100) NOT NULL,
  `ru` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`LandID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `Anlagedaten`.`ORT`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Anlagedaten`.`ORT` (
  `OrtID` INT(11) NOT NULL AUTO_INCREMENT,
  `PLZ` INT(5) NOT NULL,
  `Ortsname` VARCHAR(45) NOT NULL,
  `LandID` CHAR(2) NOT NULL,
  PRIMARY KEY (`OrtID`),
  UNIQUE INDEX `OrtID_UNIQUE` (`OrtID` ASC),
  INDEX `fk_LandID` (`LandID` ASC),
  CONSTRAINT `fk_LandID`
    FOREIGN KEY (`LandID`)
    REFERENCES `Anlagedaten`.`LAND` (`LandID`))
ENGINE = InnoDB
AUTO_INCREMENT = 23
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `Anlagedaten`.`VERTEILNETZ`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Anlagedaten`.`VERTEILNETZ` (
  `VnID` INT(11) NOT NULL AUTO_INCREMENT,
  `AKS_Bezeichnung` VARCHAR(2) NOT NULL,
  `Verteilnetzname` VARCHAR(45) NOT NULL,
  `NLZ` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`VnID`),
  UNIQUE INDEX `VnID_UNIQUE` (`VnID` ASC),
  UNIQUE INDEX `AKS_Bezeichnung_UNIQUE` (`AKS_Bezeichnung` ASC),
  UNIQUE INDEX `Verteilnetzname_UNIQUE` (`Verteilnetzname` ASC))
ENGINE = InnoDB
AUTO_INCREMENT = 3
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `Anlagedaten`.`ANLAGE`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Anlagedaten`.`ANLAGE` (
  `AnID` INT(11) NOT NULL AUTO_INCREMENT,
  `VnID` INT(11) NOT NULL,
  `NeID` INT(11) NOT NULL,
  `AKS_Bezeichnung` INT(5) UNSIGNED ZEROFILL NOT NULL,
  `Anlagename` VARCHAR(45) NOT NULL,
  `Kurzzeichen` VARCHAR(3) NOT NULL,
  `Adresse` VARCHAR(45) NULL DEFAULT NULL,
  `OrtID` INT(11) NULL DEFAULT NULL,
  `Telefon` VARCHAR(45) NULL DEFAULT NULL,
  `Baujahr` INT(4) NULL DEFAULT '-1',
  `Geloescht` TINYINT(1) NOT NULL,
  `Datum` DATETIME NOT NULL,
  `Visum` VARCHAR(16) NOT NULL,
  PRIMARY KEY (`AnID`),
  UNIQUE INDEX `AnID_UNIQUE` (`AnID` ASC),
  UNIQUE INDEX `Anlagename_UNIQUE` (`Anlagename` ASC),
  UNIQUE INDEX `Kurzzeichen_UNIQUE` (`Kurzzeichen` ASC),
  INDEX `fk_VnID` (`VnID` ASC),
  INDEX `fk_NeID` (`NeID` ASC) ,
  INDEX `fk_OrtID_on_ANLAGE` (`OrtID` ASC),
  CONSTRAINT `fk_NeID`
    FOREIGN KEY (`NeID`)
    REFERENCES `Anlagedaten`.`NETZEBENE` (`NeID`),
  CONSTRAINT `fk_OrtID_on_ANLAGE`
    FOREIGN KEY (`OrtID`)
    REFERENCES `Anlagedaten`.`ORT` (`OrtID`),
  CONSTRAINT `fk_VnID`
    FOREIGN KEY (`VnID`)
    REFERENCES `Anlagedaten`.`VERTEILNETZ` (`VnID`))
ENGINE = InnoDB
AUTO_INCREMENT = 39
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `Anlagedaten`.`INFRASTRUKTUROBJEKT`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Anlagedaten`.`INFRASTRUKTUROBJEKT` (
  `InfObID` INT(11) NOT NULL AUTO_INCREMENT,
  `AnID` INT(11) NOT NULL,
  `AKS_Bezeichnung` VARCHAR(3) NOT NULL,
  `Infrastrukturobjektbezeichnung` VARCHAR(45) NOT NULL,
  `Geloescht` TINYINT(1) NOT NULL,
  `Datum` DATETIME NOT NULL,
  `Visum` VARCHAR(16) NOT NULL,
  PRIMARY KEY (`InfObID`),
  INDEX `fk_AnID` (`AnID` ASC),
  CONSTRAINT `fk_AnID`
    FOREIGN KEY (`AnID`)
    REFERENCES `Anlagedaten`.`ANLAGE` (`AnID`))
ENGINE = InnoDB
AUTO_INCREMENT = 10
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `Anlagedaten`.`FELD`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Anlagedaten`.`FELD` (
  `FeID` INT(11) NOT NULL AUTO_INCREMENT,
  `InfObID` INT(11) NOT NULL,
  `AKS_Bezeichnung` VARCHAR(3) NOT NULL,
  `Feldbezeichnung` VARCHAR(45) NOT NULL,
  `Geloescht` TINYINT(1) NOT NULL,
  `Datum` DATETIME NOT NULL,
  `Visum` VARCHAR(16) NOT NULL,
  PRIMARY KEY (`FeID`),
  INDEX `fk_InfObID` (`InfObID` ASC),
  CONSTRAINT `fk_InfObID`
    FOREIGN KEY (`InfObID`)
    REFERENCES `Anlagedaten`.`INFRASTRUKTUROBJEKT` (`InfObID`))
ENGINE = InnoDB
AUTO_INCREMENT = 26
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `Anlagedaten`.`PROTOKOLLVORLAGE`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Anlagedaten`.`PROTOKOLLVORLAGE` (
  `ProtVoID` INT(11) NOT NULL AUTO_INCREMENT,
  `Dateipfad` VARCHAR(45) NOT NULL,
  `Dateiname` VARCHAR(45) NOT NULL,
  `Ersteller` VARCHAR(45) NOT NULL,
  `Erstelldatum` DATE NOT NULL,
  `Bearbeiter` VARCHAR(45) NULL DEFAULT NULL,
  `Aenderungsdatum` DATE NULL DEFAULT NULL,
  PRIMARY KEY (`ProtVoID`),
  UNIQUE INDEX `Dateiname_UNIQUE` (`Dateiname` ASC))
ENGINE = InnoDB
AUTO_INCREMENT = 6
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `Anlagedaten`.`BETRIEBSMITTEL`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Anlagedaten`.`BETRIEBSMITTEL` (
  `BmID` INT(11) NOT NULL AUTO_INCREMENT,
  `Equipment` INT(8) NOT NULL,
  `Bezeichnung` VARCHAR(45) NOT NULL,
  `FeID` INT(11) NOT NULL,
  `AKS_Bezeichnung` VARCHAR(45) NOT NULL,
  `ProtVoID` INT(11) NOT NULL,
  `SerienNr` VARCHAR(45) NULL DEFAULT NULL,
  `Geloescht` TINYINT(1) NOT NULL,
  `Datum` DATETIME NOT NULL,
  `Visum` VARCHAR(16) NOT NULL,
  PRIMARY KEY (`BmID`),
  UNIQUE INDEX `Equipment_UNIQUE` (`Equipment` ASC),
  INDEX `fk_FeID` (`FeID` ASC),
  INDEX `fk_ProtVoID` (`ProtVoID` ASC),
  CONSTRAINT `fk_FeID`
    FOREIGN KEY (`FeID`)
    REFERENCES `Anlagedaten`.`FELD` (`FeID`),
  CONSTRAINT `fk_ProtVoID`
    FOREIGN KEY (`ProtVoID`)
    REFERENCES `Anlagedaten`.`PROTOKOLLVORLAGE` (`ProtVoID`))
ENGINE = InnoDB
AUTO_INCREMENT = 131
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `Anlagedaten`.`BETRIEBSMITTELKLASSE`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Anlagedaten`.`BETRIEBSMITTELKLASSE` (
  `BmKlID` VARCHAR(1) NOT NULL,
  `Tabellenverweis` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`BmKlID`),
  UNIQUE INDEX `Tabellenverweis_UNIQUE` (`Tabellenverweis` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `Anlagedaten`.`HERSTELLER`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Anlagedaten`.`HERSTELLER` (
  `HeID` INT(11) NOT NULL AUTO_INCREMENT,
  `Herstellername` VARCHAR(45) NOT NULL,
  `Addresse` VARCHAR(45) NULL DEFAULT NULL,
  `OrtID` INT(11) NULL DEFAULT NULL,
  `Telefon` VARCHAR(45) NULL DEFAULT NULL,
  `Mail` VARCHAR(45) NULL DEFAULT NULL,
  `Webseite` VARCHAR(45) NULL DEFAULT NULL,
  `Geloescht` TINYINT(1) NOT NULL,
  PRIMARY KEY (`HeID`),
  UNIQUE INDEX `Herstellername_UNIQUE` (`Herstellername` ASC),
  INDEX `fk_OrtID_on_HERSTELLER` (`OrtID` ASC),
  CONSTRAINT `fk_OrtID_on_HERSTELLER`
    FOREIGN KEY (`OrtID`)
    REFERENCES `Anlagedaten`.`ORT` (`OrtID`))
ENGINE = InnoDB
AUTO_INCREMENT = 4
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `Anlagedaten`.`BETRIEBSMITTELTYP`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Anlagedaten`.`BETRIEBSMITTELTYP` (
  `BmTID` INT(11) NOT NULL AUTO_INCREMENT,
  `HeID` INT(11) NOT NULL,
  `ArtikelNr` VARCHAR(45) NOT NULL,
  `BmKlID` VARCHAR(1) NOT NULL,
  PRIMARY KEY (`BmTID`),
  INDEX `fk_HeID` (`HeID` ASC),
  INDEX `fk_BmKlID` (`BmKlID` ASC),
  CONSTRAINT `fk_BmKlID`
    FOREIGN KEY (`BmKlID`)
    REFERENCES `Anlagedaten`.`BETRIEBSMITTELKLASSE` (`BmKlID`),
  CONSTRAINT `fk_HeID`
    FOREIGN KEY (`HeID`)
    REFERENCES `Anlagedaten`.`HERSTELLER` (`HeID`))
ENGINE = InnoDB
AUTO_INCREMENT = 9
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `Anlagedaten`.`PRUEFDATEIVORLAGE`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Anlagedaten`.`PRUEFDATEIVORLAGE` (
  `PDatVoID` INT(11) NOT NULL AUTO_INCREMENT,
  `Dateipfad` VARCHAR(45) NOT NULL,
  `Dateiname` VARCHAR(45) NOT NULL,
  `Ersteller` VARCHAR(45) NOT NULL,
  `Erstelldatum` DATE NOT NULL,
  `Bearbeiter` VARCHAR(45) NULL DEFAULT NULL,
  `Aenderungsdatum` DATE NULL DEFAULT NULL,
  PRIMARY KEY (`PDatVoID`),
  UNIQUE INDEX `Dateiname_UNIQUE` (`Dateiname` ASC))
ENGINE = InnoDB
AUTO_INCREMENT = 6
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `Anlagedaten`.`FUNKTION`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Anlagedaten`.`FUNKTION` (
  `FkID` INT(11) NOT NULL AUTO_INCREMENT,
  `Funktionsname` VARCHAR(45) NOT NULL,
  `PDatVoID` INT(11) NOT NULL,
  PRIMARY KEY (`FkID`),
  UNIQUE INDEX `Funktionsname_UNIQUE` (`Funktionsname` ASC),
  INDEX `fk_PDatVoID` (`PDatVoID` ASC),
  CONSTRAINT `fk_PDatVoID`
    FOREIGN KEY (`PDatVoID`)
    REFERENCES `Anlagedaten`.`PRUEFDATEIVORLAGE` (`PDatVoID`))
ENGINE = InnoDB
AUTO_INCREMENT = 5
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `Anlagedaten`.`BAUTEIL`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Anlagedaten`.`BAUTEIL` (
  `BtID` INT(11) NOT NULL AUTO_INCREMENT,
  `Index` INT(11) NOT NULL,
  `BmID` INT(11) NOT NULL,
  `FkID` INT(11) NOT NULL,
  `BmTID` INT(11) NOT NULL,
  PRIMARY KEY (`BtID`),
  INDEX `fk_BmID_on_BAUTEIL` (`BmID` ASC),
  INDEX `fk_FkID` (`FkID` ASC),
  INDEX `fk_BmTID` (`BmTID` ASC),
  CONSTRAINT `fk_BmID_on_BAUTEIL`
    FOREIGN KEY (`BmID`)
    REFERENCES `Anlagedaten`.`BETRIEBSMITTEL` (`BmID`),
  CONSTRAINT `fk_BmTID`
    FOREIGN KEY (`BmTID`)
    REFERENCES `Anlagedaten`.`BETRIEBSMITTELTYP` (`BmTID`),
  CONSTRAINT `fk_FkID`
    FOREIGN KEY (`FkID`)
    REFERENCES `Anlagedaten`.`FUNKTION` (`FkID`))
ENGINE = InnoDB
AUTO_INCREMENT = 42
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `Anlagedaten`.`BENUTZERGRUPPE`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Anlagedaten`.`BENUTZERGRUPPE` (
  `GrID` INT(11) NOT NULL AUTO_INCREMENT,
  `Gruppenname` VARCHAR(45) NOT NULL,
  `Berechtigungen` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`GrID`),
  UNIQUE INDEX `Gruppenname_UNIQUE` (`Gruppenname` ASC))
ENGINE = InnoDB
AUTO_INCREMENT = 7
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `Anlagedaten`.`EINHEIT`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Anlagedaten`.`EINHEIT` (
  `UID` INT(11) NOT NULL AUTO_INCREMENT,
  `Einheitszeichen` VARCHAR(45) NOT NULL,
  `Einheitsname` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`UID`),
  UNIQUE INDEX `Einheitszeichen_UNIQUE` (`Einheitszeichen` ASC),
  UNIQUE INDEX `Einheitsname_UNIQUE` (`Einheitsname` ASC))
ENGINE = InnoDB
AUTO_INCREMENT = 5
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `Anlagedaten`.`KLASSE`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Anlagedaten`.`KLASSE` (
  `KlID` INT(11) NOT NULL AUTO_INCREMENT,
  `Name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`KlID`),
  UNIQUE INDEX `Name_UNIQUE` (`Name` ASC))
ENGINE = InnoDB
AUTO_INCREMENT = 3
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `Anlagedaten`.`MITARBEITER`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Anlagedaten`.`MITARBEITER` (
  `MaID` INT(11) NOT NULL AUTO_INCREMENT,
  `GrID` INT(11) NOT NULL,
  `Vorname` VARCHAR(45) NOT NULL,
  `Nachname` VARCHAR(45) NOT NULL,
  `Kurzzeichen` VARCHAR(45) NOT NULL,
  `Ausgetreten` TINYINT(1) NOT NULL,
  `Mutiert` TINYINT(1) NOT NULL,
  `Datum` DATETIME NOT NULL,
  `Visum` VARCHAR(16) NOT NULL,
  PRIMARY KEY (`MaID`),
  INDEX `fk_GrID` (`GrID` ASC),
  CONSTRAINT `fk_GrID`
    FOREIGN KEY (`GrID`)
    REFERENCES `Anlagedaten`.`BENUTZERGRUPPE` (`GrID`))
ENGINE = InnoDB
AUTO_INCREMENT = 44
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `Anlagedaten`.`STATUS`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Anlagedaten`.`STATUS` (
  `StID` INT(11) NOT NULL AUTO_INCREMENT,
  `Status` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`StID`),
  UNIQUE INDEX `Status_UNIQUE` (`Status` ASC))
ENGINE = InnoDB
AUTO_INCREMENT = 6
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `Anlagedaten`.`PRUEFLOS`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Anlagedaten`.`PRUEFLOS` (
  `PlID` INT(11) NOT NULL,
  `Losname` VARCHAR(45) NOT NULL,
  `StID` INT(11) NOT NULL,
  `MaID` INT(11) NOT NULL,
  PRIMARY KEY (`PlID`),
  UNIQUE INDEX `Losname_UNIQUE` (`Losname` ASC),
  INDEX `fk_StID` (`StID` ASC),
  INDEX `fk_MaID` (`MaID` ASC),
  CONSTRAINT `fk_MaID`
    FOREIGN KEY (`MaID`)
    REFERENCES `Anlagedaten`.`MITARBEITER` (`MaID`),
  CONSTRAINT `fk_StID`
    FOREIGN KEY (`StID`)
    REFERENCES `Anlagedaten`.`STATUS` (`StID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `Anlagedaten`.`PRUEFPROTOKOLL`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Anlagedaten`.`PRUEFPROTOKOLL` (
  `PpID` INT(11) NOT NULL AUTO_INCREMENT,
  `Dateipfad` VARCHAR(45) NOT NULL,
  `Dateiname` VARCHAR(45) NOT NULL,
  `Ersteller` VARCHAR(45) NOT NULL,
  `Erstelldatum` DATE NOT NULL,
  `Pruefer` VARCHAR(45) NULL DEFAULT NULL,
  `Pruefdatum` DATE NULL DEFAULT NULL,
  `Freigeber` VARCHAR(45) NULL DEFAULT NULL,
  `Freigabedatum` DATE NULL DEFAULT NULL,
  `Bearbeiter` VARCHAR(45) NULL DEFAULT NULL,
  `Aenderungsdatum` DATE NULL DEFAULT NULL,
  `Ergebnisse` LONGTEXT NULL DEFAULT NULL,
  PRIMARY KEY (`PpID`),
  UNIQUE INDEX `Dateiname_UNIQUE` (`Dateiname` ASC))
ENGINE = InnoDB
AUTO_INCREMENT = 30
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `Anlagedaten`.`PRUEFLING`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Anlagedaten`.`PRUEFLING` (
  `PrueflingID` INT(11) NOT NULL AUTO_INCREMENT,
  `BmID` INT(11) NOT NULL,
  `PlID` INT(11) NOT NULL,
  `PpID` INT(11) NOT NULL,
  `Dateipfad` VARCHAR(45) NOT NULL,
  `Dateiname` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`PrueflingID`),
  INDEX `fk_BmID_on_PRUEFLING` (`BmID` ASC),
  INDEX `fk_PlID` (`PlID` ASC),
  INDEX `fk_PpID` (`PpID` ASC),
  CONSTRAINT `fk_BmID_on_PRUEFLING`
    FOREIGN KEY (`BmID`)
    REFERENCES `Anlagedaten`.`BETRIEBSMITTEL` (`BmID`),
  CONSTRAINT `fk_PlID`
    FOREIGN KEY (`PlID`)
    REFERENCES `Anlagedaten`.`PRUEFLOS` (`PlID`),
  CONSTRAINT `fk_PpID`
    FOREIGN KEY (`PpID`)
    REFERENCES `Anlagedaten`.`PRUEFPROTOKOLL` (`PpID`))
ENGINE = InnoDB
AUTO_INCREMENT = 19
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `Anlagedaten`.`SCHUTZGERAET`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Anlagedaten`.`SCHUTZGERAET` (
  `BmTID` INT(11) NOT NULL,
  `In I>` DOUBLE NOT NULL,
  `t I>` DOUBLE NOT NULL,
  `In I>>` DOUBLE NOT NULL,
  `t I>>` DOUBLE NOT NULL,
  `IDelta` DOUBLE NOT NULL,
  `tDelta` DOUBLE NOT NULL,
  PRIMARY KEY (`BmTID`),
  CONSTRAINT `fk_BmTID_on_SCHUTZGERATE`
    FOREIGN KEY (`BmTID`)
    REFERENCES `Anlagedaten`.`BETRIEBSMITTELTYP` (`BmTID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `Anlagedaten`.`WANDLER`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Anlagedaten`.`WANDLER` (
  `BmTID` INT(11) NOT NULL,
  `PrimWert` INT(11) NOT NULL,
  `SekWert` INT(11) NOT NULL,
  `UID` INT(11) NOT NULL,
  `Buerde` INT(11) NOT NULL,
  `KlID` INT(11) NOT NULL,
  PRIMARY KEY (`BmTID`),
  INDEX `fk_UID` (`UID` ASC),
  INDEX `fk_KlID` (`KlID` ASC),
  CONSTRAINT `BmTID`
    FOREIGN KEY (`BmTID`)
    REFERENCES `Anlagedaten`.`BETRIEBSMITTELTYP` (`BmTID`),
  CONSTRAINT `fk_KlID`
    FOREIGN KEY (`KlID`)
    REFERENCES `Anlagedaten`.`KLASSE` (`KlID`),
  CONSTRAINT `fk_UID`
    FOREIGN KEY (`UID`)
    REFERENCES `Anlagedaten`.`EINHEIT` (`UID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

USE `Anlagedaten` ;

-- -----------------------------------------------------
-- Placeholder table for view `Anlagedaten`.`view_getDevices`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Anlagedaten`.`view_getDevices` (`FilterID` INT, `ID` INT, `AKS_Bezeichnung` INT, `Bezeichnung` INT, `Equipment` INT, `SerienNr` INT, `BtID` INT, `BmTID` INT, `Kern` INT, `ArtikelNr` INT, `Herstellername` INT, `FkID` INT, `Funktionsname` INT, `PrimWert` INT, `SekWert` INT, `Einheitszeichen` INT, `Buerde` INT);

-- -----------------------------------------------------
-- Placeholder table for view `Anlagedaten`.`view_getEmployee`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Anlagedaten`.`view_getEmployee` (`MaID` INT, `GrID` INT, `Vorname` INT, `Nachname` INT, `Kurzzeichen` INT, `Gruppenname` INT);

-- -----------------------------------------------------
-- Placeholder table for view `Anlagedaten`.`view_getEquipment`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Anlagedaten`.`view_getEquipment` (`ID` INT, `AKS_Bezeichnung` INT, `FilterID` INT, `Bezeichnung` INT);

-- -----------------------------------------------------
-- Placeholder table for view `Anlagedaten`.`view_getFields`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Anlagedaten`.`view_getFields` (`ID` INT, `AKS_Bezeichnung` INT, `Bezeichnung` INT, `FilterID` INT);

-- -----------------------------------------------------
-- Placeholder table for view `Anlagedaten`.`view_getInfObj`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Anlagedaten`.`view_getInfObj` (`ID` INT, `AKS_Bezeichnung` INT, `InfObjBez` INT, `FilterID` INT);

-- -----------------------------------------------------
-- Placeholder table for view `Anlagedaten`.`view_getStations`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Anlagedaten`.`view_getStations` (`ID` INT, `AKS_Bezeichnung` INT, `Anlagename` INT, `Kurzzeichen` INT, `Verteilnetzname` INT, `Bezeichnung` INT);

-- -----------------------------------------------------
-- Placeholder table for view `Anlagedaten`.`view_getTestLot`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Anlagedaten`.`view_getTestLot` (`Losname` INT);

-- -----------------------------------------------------
-- Placeholder table for view `Anlagedaten`.`view_getTestObject`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Anlagedaten`.`view_getTestObject` (`PlID` INT, `AKS_Bezeichnung` INT, `Equipment` INT, `Einbauort` INT, `SerienNr` INT, `Kern` INT, `ArtikelNr` INT, `Herstellername` INT, `Funktionsname` INT, `PrimWert` INT, `SekWert` INT, `Einheitszeichen` INT, `Buerde` INT);

-- -----------------------------------------------------
-- Placeholder table for view `Anlagedaten`.`view_getTransformers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Anlagedaten`.`view_getTransformers` (`BmTID` INT, `ArtikelNr` INT, `Einheitszeichen` INT, `Name` INT, `PrimWert` INT, `SekWert` INT, `Buerde` INT);

-- -----------------------------------------------------
-- procedure sps_addUser
-- -----------------------------------------------------

DELIMITER $$;
USE `Anlagedaten`$$;
CREATE PROCEDURE `sps_addUser`(userGroup INT,
firstName TEXT,
lastname TEXT,
sign TEXT,
pw TEXT,
datum DATETIME,
visum TEXT)
BEGIN
	INSERT INTO MITARBEITER VALUES (DEFAULT,userGroup,firstName,lastName,sign,0,0,datum,visum);
	CALL sps_setPrivFromGroup(userGroup,sign);
END$$;

DELIMITER ;

-- -----------------------------------------------------
-- procedure sps_deleteUser
-- -----------------------------------------------------

DELIMITER $$;
USE `Anlagedaten`$$;
CREATE PROCEDURE `sps_deleteUser`(MaID INT, datum DATETIME, visum VARCHAR(16))
BEGIN
	DECLARE  sign Text DEFAULT (SELECT Kurzzeichen FROM MITARBEITER WHERE MaID = MITARBEITER.MaID);
	UPDATE MITARBEITER SET Ausgetreten = 1, MITARBEITER.Datum = datum, MITARBEITER.Visum=visum WHERE MaID = MITARBEITER.MaID;
    CALL sps_exeStatement(CONCAT('REVOKE ALL ON *.* FROM ',sign));
    CALL sps_exeStatement(CONCAT('REVOKE GRANT OPTION ON *.* FROM ',sign));
END$$;

DELIMITER ;

-- -----------------------------------------------------
-- procedure sps_exeStatement
-- -----------------------------------------------------

DELIMITER $$;
USE `Anlagedaten`$$;
CREATE PROCEDURE `sps_exeStatement`(statement TEXT)
BEGIN
	SET @sql := statement;
	PREPARE stmt FROM @sql;
	EXECUTE stmt; 
	DEALLOCATE PREPARE stmt;
END$$;

DELIMITER ;

-- -----------------------------------------------------
-- procedure sps_mutateUser
-- -----------------------------------------------------

DELIMITER $$;
USE `Anlagedaten`$$;
CREATE PROCEDURE `sps_mutateUser`(MaID INT , userGroup INTEGER, datum DATETIME, visum TEXT) 
BEGIN 
	DECLARE sign Text DEFAULT (SELECT Kurzzeichen FROM MITARBEITER WHERE MaID = MITARBEITER.MaID);
	INSERT INTO MITARBEITER (GrID,Vorname,Nachname,Kurzzeichen,Ausgetreten,Mutiert,datum,visum)
	SELECT userGroup,Vorname,Nachname,Kurzzeichen,0,0,datum,visum FROM MITARBEITER WHERE  MaID = MITARBEITER.MaID;
	UPDATE MITARBEITER SET Mutiert = 1, MITARBEITER.Datum=datum, MITARBEITER.Visum=visum  WHERE MaID = MITARBEITER.MaID;
	#REVOKE ALL PRIVILEGES, GRANT OPTION FROM sign;
    CALL sps_exeStatement(CONCAT('REVOKE ALL ON *.* FROM ',sign));
    CALL sps_exeStatement(CONCAT('REVOKE GRANT OPTION ON *.* FROM ',sign));
	CALL sps_setPrivFromGroup(userGroup,sign);
END$$;

DELIMITER ;

-- -----------------------------------------------------
-- procedure sps_setPrivFromGroup
-- -----------------------------------------------------

DELIMITER $$;
USE `Anlagedaten`$$;
CREATE PROCEDURE `sps_setPrivFromGroup`(userGroup INTEGER, sign TEXT)
BEGIN
	CASE userGroup
		WHEN 1 THEN
			call sps_exeStatement(CONCAT('GRANT ALL PRIVILEGES ON *.* TO ' , sign ,' WITH GRANT OPTION'));	
		WHEN 2 THEN
			call sps_exeStatement(CONCAT('GRANT INSERT,SELECT,UPDATE,DELETE ON Anlagedaten.VERTEILNETZ TO ' , sign));	
			call sps_exeStatement(CONCAT('GRANT INSERT,SELECT,UPDATE,DELETE ON Anlagedaten.NETZEBENE TO ' , sign));	
			call sps_exeStatement(CONCAT('GRANT INSERT,SELECT,UPDATE,DELETE ON Anlagedaten.ORT TO ' , sign));	
			call sps_exeStatement(CONCAT('GRANT INSERT,SELECT,UPDATE,DELETE ON Anlagedaten.ANLAGE TO ' , sign));	
			call sps_exeStatement(CONCAT('GRANT INSERT,SELECT,UPDATE,DELETE ON Anlagedaten.INFRASTRUKTUROBJEKT TO ' , sign));	
			call sps_exeStatement(CONCAT('GRANT INSERT,SELECT,UPDATE,DELETE ON Anlagedaten.FELD TO ' , sign));
            call sps_exeStatement(CONCAT('GRANT INSERT,SELECT,UPDATE,DELETE ON Anlagedaten.BETRIEBSMITTEL TO ' , sign));	
			call sps_exeStatement(CONCAT('GRANT INSERT,SELECT,UPDATE,DELETE ON Anlagedaten.BAUTEIL TO ' , sign));	
			call sps_exeStatement(CONCAT('GRANT INSERT,SELECT,UPDATE,DELETE ON Anlagedaten.BETRIEBSMITTELTYP TO ' , sign));	
			call sps_exeStatement(CONCAT('GRANT INSERT,SELECT,UPDATE,DELETE ON Anlagedaten.BETRIEBSMITTELKLASSE TO ' , sign));	
			call sps_exeStatement(CONCAT('GRANT INSERT,SELECT,UPDATE,DELETE ON Anlagedaten.FUNKTION TO ' , sign));	
			call sps_exeStatement(CONCAT('GRANT INSERT,SELECT,UPDATE,DELETE ON Anlagedaten.HERSTELLER TO ' , sign));	
			call sps_exeStatement(CONCAT('GRANT INSERT,SELECT,UPDATE,DELETE ON Anlagedaten.WANDLER TO ' , sign));	
			call sps_exeStatement(CONCAT('GRANT INSERT,SELECT,UPDATE,DELETE ON Anlagedaten.KLASSE TO ' , sign));	
			call sps_exeStatement(CONCAT('GRANT INSERT,SELECT,UPDATE,DELETE ON Anlagedaten.EINHEIT TO ' , sign));	
			call sps_exeStatement(CONCAT('GRANT INSERT,SELECT,UPDATE,DELETE ON Anlagedaten.SCHUTZGERAET TO ' , sign));		
			call sps_exeStatement(CONCAT('GRANT SELECT ON Anlagedaten.PRUEFDATEIVORLAGE TO ' , sign));	
			call sps_exeStatement(CONCAT('GRANT SELECT ON Anlagedaten.PROTOKOLLVORLAGE TO ' , sign));	
        WHEN 3 THEN
			call sps_exeStatement(CONCAT('GRANT SELECT ON Anlagedaten.view_getTestLot TO ', sign));
			call sps_exeStatement(CONCAT('GRANT INSERT,SELECT,UPDATE ON Anlagedaten.PRUEFPROTOKOLL TO ' , sign));	
        	call sps_exeStatement(CONCAT('GRANT INSERT,SELECT,UPDATE ON Anlagedaten.PRUEFLOS TO ' , sign));	
        	call sps_exeStatement(CONCAT('GRANT INSERT,SELECT,UPDATE ON Anlagedaten.PRUEFLING TO ' , sign));	
        WHEN 4 THEN
			call sps_exeStatement(CONCAT('GRANT SELECT ON Anlagedaten.view_getTestLot TO ', sign));
			call sps_exeStatement(CONCAT('GRANT SELECT ON Anlagedaten.view_getTestObject TO ', sign));            
			call sps_exeStatement(CONCAT('GRANT UPDATE ON Anlagedaten.PRUEFPROTOKOLL TO ' , sign ));            
			call sps_exeStatement(CONCAT('GRANT UPDATE ON Anlagedaten.PRUEFLOS TO ' , sign ));            
			call sps_exeStatement(CONCAT('GRANT SELECT,UPDATE ON Anlagedaten.PRUEFLING TO ' , sign ));
        WHEN 5 THEN
			call sps_exeStatement(CONCAT('GRANT INSERT,SELECT,UPDATE ON Anlagedaten.PRUEFDATEIVORLAGE TO ' , sign));	
			call sps_exeStatement(CONCAT('GRANT INSERT,SELECT,UPDATE ON Anlagedaten.PROTOKOLLVORLAGE TO ' , sign));	
		WHEN 6 THEN
			call sps_exeStatement(CONCAT('GRANT SELECT,INSERT,UPDATE ON Anlagedaten.MITARBEITER TO ', sign));            
			call sps_exeStatement(CONCAT('GRANT CREATE USER ON *.* TO ' , sign , ' WITH GRANT OPTION' ));
	END CASE;
    FLUSH PRIVILEGES;
END$$;

DELIMITER ;

-- -----------------------------------------------------
-- function submitInt
-- -----------------------------------------------------

DELIMITER $$;
USE `Anlagedaten`$$;
CREATE FUNCTION `submitInt`() RETURNS int(11)
    NO SQL
    DETERMINISTIC
return @submitInt$$;

DELIMITER ;

-- -----------------------------------------------------
-- function submitString
-- -----------------------------------------------------

DELIMITER $$;
USE `Anlagedaten`$$;
CREATE FUNCTION `submitString`() RETURNS varchar(32) CHARSET utf8
    NO SQL
    DETERMINISTIC
return @submitString$$;

DELIMITER ;

-- -----------------------------------------------------
-- View `Anlagedaten`.`view_getDevices`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Anlagedaten`.`view_getDevices`;
USE `Anlagedaten`;
CREATE  OR REPLACE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `Anlagedaten`.`view_getDevices` AS select `Anlagedaten`.`BETRIEBSMITTEL`.`FeID` AS `FilterID`,`Anlagedaten`.`BETRIEBSMITTEL`.`BmID` AS `ID`,`Anlagedaten`.`BETRIEBSMITTEL`.`AKS_Bezeichnung` AS `AKS_Bezeichnung`,`Anlagedaten`.`BETRIEBSMITTEL`.`Bezeichnung` AS `Bezeichnung`,`Anlagedaten`.`BETRIEBSMITTEL`.`Equipment` AS `Equipment`,`Anlagedaten`.`BETRIEBSMITTEL`.`SerienNr` AS `SerienNr`,`Anlagedaten`.`BAUTEIL`.`BtID` AS `BtID`,`Anlagedaten`.`BAUTEIL`.`BmTID` AS `BmTID`,`Anlagedaten`.`BAUTEIL`.`Index` AS `Kern`,`Anlagedaten`.`BETRIEBSMITTELTYP`.`ArtikelNr` AS `ArtikelNr`,`Anlagedaten`.`HERSTELLER`.`Herstellername` AS `Herstellername`,`Anlagedaten`.`FUNKTION`.`FkID` AS `FkID`,`Anlagedaten`.`FUNKTION`.`Funktionsname` AS `Funktionsname`,`Anlagedaten`.`WANDLER`.`PrimWert` AS `PrimWert`,`Anlagedaten`.`WANDLER`.`SekWert` AS `SekWert`,`Anlagedaten`.`EINHEIT`.`Einheitszeichen` AS `Einheitszeichen`,`Anlagedaten`.`WANDLER`.`Buerde` AS `Buerde` from (((((`Anlagedaten`.`BETRIEBSMITTEL` join (`Anlagedaten`.`BETRIEBSMITTELTYP` join `Anlagedaten`.`BAUTEIL` on((`Anlagedaten`.`BAUTEIL`.`BmTID` = `Anlagedaten`.`BETRIEBSMITTELTYP`.`BmTID`))) on((`Anlagedaten`.`BAUTEIL`.`BmID` = `Anlagedaten`.`BETRIEBSMITTEL`.`BmID`))) join `Anlagedaten`.`FUNKTION` on((`Anlagedaten`.`FUNKTION`.`FkID` = `Anlagedaten`.`BAUTEIL`.`FkID`))) join `Anlagedaten`.`WANDLER` on((`Anlagedaten`.`BETRIEBSMITTELTYP`.`BmTID` = `Anlagedaten`.`WANDLER`.`BmTID`))) join `Anlagedaten`.`EINHEIT` on((`Anlagedaten`.`EINHEIT`.`UID` = `Anlagedaten`.`WANDLER`.`UID`))) join `Anlagedaten`.`HERSTELLER` on((`Anlagedaten`.`HERSTELLER`.`HeID` = `Anlagedaten`.`BETRIEBSMITTELTYP`.`HeID`)));

-- -----------------------------------------------------
-- View `Anlagedaten`.`view_getEmployee`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Anlagedaten`.`view_getEmployee`;
USE `Anlagedaten`;
CREATE  OR REPLACE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `Anlagedaten`.`view_getEmployee` AS select `Anlagedaten`.`MITARBEITER`.`MaID` AS `MaID`,`Anlagedaten`.`MITARBEITER`.`GrID` AS `GrID`,`Anlagedaten`.`MITARBEITER`.`Vorname` AS `Vorname`,`Anlagedaten`.`MITARBEITER`.`Nachname` AS `Nachname`,`Anlagedaten`.`MITARBEITER`.`Kurzzeichen` AS `Kurzzeichen`,`Anlagedaten`.`BENUTZERGRUPPE`.`Gruppenname` AS `Gruppenname` from (`Anlagedaten`.`MITARBEITER` join `Anlagedaten`.`BENUTZERGRUPPE` on((`Anlagedaten`.`MITARBEITER`.`GrID` = `Anlagedaten`.`BENUTZERGRUPPE`.`GrID`))) where ((`Anlagedaten`.`MITARBEITER`.`Ausgetreten` = 0) and (`Anlagedaten`.`MITARBEITER`.`Mutiert` = 0));

-- -----------------------------------------------------
-- View `Anlagedaten`.`view_getEquipment`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Anlagedaten`.`view_getEquipment`;
USE `Anlagedaten`;
CREATE  OR REPLACE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `Anlagedaten`.`view_getEquipment` AS select `Anlagedaten`.`BAUTEIL`.`BmID` AS `ID`,concat(`Anlagedaten`.`VERTEILNETZ`.`AKS_Bezeichnung`,'-',`Anlagedaten`.`NETZEBENE`.`AKS_Bezeichnung`,`Anlagedaten`.`ANLAGE`.`AKS_Bezeichnung`,'-',`Anlagedaten`.`INFRASTRUKTUROBJEKT`.`AKS_Bezeichnung`,'-',`Anlagedaten`.`FELD`.`AKS_Bezeichnung`,'-',`Anlagedaten`.`BETRIEBSMITTEL`.`AKS_Bezeichnung`) AS `AKS_Bezeichnung`,`Anlagedaten`.`BETRIEBSMITTEL`.`FeID` AS `FilterID`, `Anlagedaten`.`BETRIEBSMITTEL`.`Bezeichnung` AS `Phase` from ((((((`Anlagedaten`.`BAUTEIL` join `Anlagedaten`.`BETRIEBSMITTEL` on((`Anlagedaten`.`BETRIEBSMITTEL`.`BmID` = `Anlagedaten`.`BAUTEIL`.`BmID`))) join `Anlagedaten`.`FELD` on((`Anlagedaten`.`FELD`.`FeID` = `Anlagedaten`.`BETRIEBSMITTEL`.`FeID`))) join `Anlagedaten`.`INFRASTRUKTUROBJEKT` on((`Anlagedaten`.`INFRASTRUKTUROBJEKT`.`InfObID` = `Anlagedaten`.`FELD`.`InfObID`))) join `Anlagedaten`.`ANLAGE` on((`Anlagedaten`.`ANLAGE`.`AnID` = `Anlagedaten`.`INFRASTRUKTUROBJEKT`.`AnID`))) join `Anlagedaten`.`VERTEILNETZ` on((`Anlagedaten`.`ANLAGE`.`VnID` = `Anlagedaten`.`VERTEILNETZ`.`VnID`))) join `Anlagedaten`.`NETZEBENE` on((`Anlagedaten`.`ANLAGE`.`NeID` = `Anlagedaten`.`NETZEBENE`.`NeID`))) where (`Anlagedaten`.`BETRIEBSMITTEL`.`Geloescht` = 0) order by concat(`Anlagedaten`.`VERTEILNETZ`.`AKS_Bezeichnung`,'-',`Anlagedaten`.`NETZEBENE`.`AKS_Bezeichnung`,`Anlagedaten`.`ANLAGE`.`AKS_Bezeichnung`,'-',`Anlagedaten`.`INFRASTRUKTUROBJEKT`.`AKS_Bezeichnung`,'-',`Anlagedaten`.`FELD`.`AKS_Bezeichnung`,'-',`Anlagedaten`.`BETRIEBSMITTEL`.`AKS_Bezeichnung`);

-- -----------------------------------------------------
-- View `Anlagedaten`.`view_getFields`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Anlagedaten`.`view_getFields`;
USE `Anlagedaten`;
CREATE  OR REPLACE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `Anlagedaten`.`view_getFields` AS select `Anlagedaten`.`FELD`.`FeID` AS `ID`,concat(`Anlagedaten`.`VERTEILNETZ`.`AKS_Bezeichnung`,'-',`Anlagedaten`.`NETZEBENE`.`AKS_Bezeichnung`,`Anlagedaten`.`ANLAGE`.`AKS_Bezeichnung`,'-',`Anlagedaten`.`INFRASTRUKTUROBJEKT`.`AKS_Bezeichnung`,'-',`Anlagedaten`.`FELD`.`AKS_Bezeichnung`) AS `AKS_Bezeichnung`,`Anlagedaten`.`FELD`.`Feldbezeichnung` AS `Bezeichnung`,`Anlagedaten`.`FELD`.`InfObID` AS `FilterID` from ((((`Anlagedaten`.`FELD` join `Anlagedaten`.`INFRASTRUKTUROBJEKT` on((`Anlagedaten`.`INFRASTRUKTUROBJEKT`.`InfObID` = `Anlagedaten`.`FELD`.`InfObID`))) join `Anlagedaten`.`ANLAGE` on((`Anlagedaten`.`ANLAGE`.`AnID` = `Anlagedaten`.`INFRASTRUKTUROBJEKT`.`AnID`))) join `Anlagedaten`.`VERTEILNETZ` on((`Anlagedaten`.`ANLAGE`.`VnID` = `Anlagedaten`.`VERTEILNETZ`.`VnID`))) join `Anlagedaten`.`NETZEBENE` on((`Anlagedaten`.`ANLAGE`.`NeID` = `Anlagedaten`.`NETZEBENE`.`NeID`))) where (`Anlagedaten`.`FELD`.`Geloescht` = 0) order by concat(`Anlagedaten`.`VERTEILNETZ`.`AKS_Bezeichnung`,'-',`Anlagedaten`.`NETZEBENE`.`AKS_Bezeichnung`,`Anlagedaten`.`ANLAGE`.`AKS_Bezeichnung`,'-',`Anlagedaten`.`INFRASTRUKTUROBJEKT`.`AKS_Bezeichnung`,'-',`Anlagedaten`.`FELD`.`AKS_Bezeichnung`);

-- -----------------------------------------------------
-- View `Anlagedaten`.`view_getInfObj`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Anlagedaten`.`view_getInfObj`;
USE `Anlagedaten`;
CREATE  OR REPLACE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `Anlagedaten`.`view_getInfObj` AS select `Anlagedaten`.`INFRASTRUKTUROBJEKT`.`InfObID` AS `ID`,concat(`Anlagedaten`.`VERTEILNETZ`.`AKS_Bezeichnung`,'-',`Anlagedaten`.`NETZEBENE`.`AKS_Bezeichnung`,`Anlagedaten`.`ANLAGE`.`AKS_Bezeichnung`,'-',`Anlagedaten`.`INFRASTRUKTUROBJEKT`.`AKS_Bezeichnung`) AS `AKS_Bezeichnung`,`Anlagedaten`.`INFRASTRUKTUROBJEKT`.`Infrastrukturobjektbezeichnung` AS `InfObjBez`,`Anlagedaten`.`ANLAGE`.`AnID` AS `FilterID` from (((`Anlagedaten`.`INFRASTRUKTUROBJEKT` join `Anlagedaten`.`ANLAGE` on((`Anlagedaten`.`ANLAGE`.`AnID` = `Anlagedaten`.`INFRASTRUKTUROBJEKT`.`AnID`))) join `Anlagedaten`.`VERTEILNETZ` on((`Anlagedaten`.`ANLAGE`.`VnID` = `Anlagedaten`.`VERTEILNETZ`.`VnID`))) join `Anlagedaten`.`NETZEBENE` on((`Anlagedaten`.`ANLAGE`.`NeID` = `Anlagedaten`.`NETZEBENE`.`NeID`))) where (`Anlagedaten`.`INFRASTRUKTUROBJEKT`.`Geloescht` = 0) order by concat(`Anlagedaten`.`VERTEILNETZ`.`AKS_Bezeichnung`,'-',`Anlagedaten`.`NETZEBENE`.`AKS_Bezeichnung`,`Anlagedaten`.`ANLAGE`.`AKS_Bezeichnung`,'-',`Anlagedaten`.`INFRASTRUKTUROBJEKT`.`AKS_Bezeichnung`);

-- -----------------------------------------------------
-- View `Anlagedaten`.`view_getStations`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Anlagedaten`.`view_getStations`;
USE `Anlagedaten`;
CREATE  OR REPLACE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `Anlagedaten`.`view_getStations` AS select `Anlagedaten`.`ANLAGE`.`AnID` AS `ID`,concat(`Anlagedaten`.`VERTEILNETZ`.`AKS_Bezeichnung`,'-',`Anlagedaten`.`NETZEBENE`.`AKS_Bezeichnung`,`Anlagedaten`.`ANLAGE`.`AKS_Bezeichnung`) AS `AKS_Bezeichnung`,`Anlagedaten`.`ANLAGE`.`Anlagename` AS `Anlagename`,`Anlagedaten`.`ANLAGE`.`Kurzzeichen` AS `Kurzzeichen`,`Anlagedaten`.`VERTEILNETZ`.`Verteilnetzname` AS `Verteilnetzname`,`Anlagedaten`.`NETZEBENE`.`Bezeichnung` AS `Bezeichnung` from ((`Anlagedaten`.`ANLAGE` join `Anlagedaten`.`VERTEILNETZ` on((`Anlagedaten`.`ANLAGE`.`VnID` = `Anlagedaten`.`VERTEILNETZ`.`VnID`))) join `Anlagedaten`.`NETZEBENE` on((`Anlagedaten`.`ANLAGE`.`NeID` = `Anlagedaten`.`NETZEBENE`.`NeID`))) where (`Anlagedaten`.`ANLAGE`.`Geloescht` = 0);

-- -----------------------------------------------------
-- View `Anlagedaten`.`view_getTestLot`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Anlagedaten`.`view_getTestLot`;
USE `Anlagedaten`;
CREATE  OR REPLACE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `Anlagedaten`.`view_getTestLot` AS select `Anlagedaten`.`PRUEFLOS`.`Losname` AS `Losname` from `Anlagedaten`.`PRUEFLOS` where (`Anlagedaten`.`PRUEFLOS`.`MaID` = (select `Anlagedaten`.`MITARBEITER`.`MaID` from `Anlagedaten`.`MITARBEITER` where (`Anlagedaten`.`MITARBEITER`.`Kurzzeichen` = `submitString`())));

-- -----------------------------------------------------
-- View `Anlagedaten`.`view_getTestObject`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Anlagedaten`.`view_getTestObject`;
USE `Anlagedaten`;
CREATE  OR REPLACE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `Anlagedaten`.`view_getTestObject` AS select `Anlagedaten`.`PRUEFLOS`.`PlID` AS `PlID`,concat(`Anlagedaten`.`VERTEILNETZ`.`AKS_Bezeichnung`,'-',`Anlagedaten`.`NETZEBENE`.`AKS_Bezeichnung`,`Anlagedaten`.`ANLAGE`.`AKS_Bezeichnung`,'-',`Anlagedaten`.`INFRASTRUKTUROBJEKT`.`AKS_Bezeichnung`,'-',`Anlagedaten`.`FELD`.`AKS_Bezeichnung`,'-',`Anlagedaten`.`BETRIEBSMITTEL`.`AKS_Bezeichnung`,'.',`Anlagedaten`.`BETRIEBSMITTEL`.`Bezeichnung`) AS `AKS_Bezeichnung`,`Anlagedaten`.`BETRIEBSMITTEL`.`Equipment` AS `Equipment`,concat(`Anlagedaten`.`ANLAGE`.`Kurzzeichen`,', ',`Anlagedaten`.`INFRASTRUKTUROBJEKT`.`Infrastrukturobjektbezeichnung`,', ',`Anlagedaten`.`FELD`.`AKS_Bezeichnung`,', ',`Anlagedaten`.`BETRIEBSMITTEL`.`AKS_Bezeichnung`,'.',`Anlagedaten`.`BETRIEBSMITTEL`.`Bezeichnung`,', ',`Anlagedaten`.`FELD`.`Feldbezeichnung`) AS `Einbauort`,`Anlagedaten`.`BETRIEBSMITTEL`.`SerienNr` AS `SerienNr`,`Anlagedaten`.`BAUTEIL`.`Index` AS `Kern`,`Anlagedaten`.`BETRIEBSMITTELTYP`.`ArtikelNr` AS `ArtikelNr`,`Anlagedaten`.`HERSTELLER`.`Herstellername` AS `Herstellername`,`Anlagedaten`.`FUNKTION`.`Funktionsname` AS `Funktionsname`,`Anlagedaten`.`WANDLER`.`PrimWert` AS `PrimWert`,`Anlagedaten`.`WANDLER`.`SekWert` AS `SekWert`,`Anlagedaten`.`EINHEIT`.`Einheitszeichen` AS `Einheitszeichen`,`Anlagedaten`.`WANDLER`.`Buerde` AS `Buerde` from (((((((((((`Anlagedaten`.`BETRIEBSMITTEL` join (`Anlagedaten`.`PRUEFLOS` join `Anlagedaten`.`PRUEFLING` on((`Anlagedaten`.`PRUEFLOS`.`PlID` = `Anlagedaten`.`PRUEFLING`.`PlID`))) on((`Anlagedaten`.`PRUEFLING`.`BmID` = `Anlagedaten`.`BETRIEBSMITTEL`.`BmID`))) join `Anlagedaten`.`FELD` on((`Anlagedaten`.`BETRIEBSMITTEL`.`FeID` = `Anlagedaten`.`FELD`.`FeID`))) join `Anlagedaten`.`INFRASTRUKTUROBJEKT` on((`Anlagedaten`.`INFRASTRUKTUROBJEKT`.`InfObID` = `Anlagedaten`.`FELD`.`InfObID`))) join `Anlagedaten`.`ANLAGE` on((`Anlagedaten`.`ANLAGE`.`AnID` = `Anlagedaten`.`INFRASTRUKTUROBJEKT`.`AnID`))) join `Anlagedaten`.`VERTEILNETZ` on((`Anlagedaten`.`VERTEILNETZ`.`VnID` = `Anlagedaten`.`ANLAGE`.`VnID`))) join `Anlagedaten`.`NETZEBENE` on((`Anlagedaten`.`NETZEBENE`.`NeID` = `Anlagedaten`.`ANLAGE`.`NeID`))) join (`Anlagedaten`.`BETRIEBSMITTELTYP` join `Anlagedaten`.`BAUTEIL` on((`Anlagedaten`.`BAUTEIL`.`BmTID` = `Anlagedaten`.`BETRIEBSMITTELTYP`.`BmTID`))) on((`Anlagedaten`.`BAUTEIL`.`BmID` = `Anlagedaten`.`BETRIEBSMITTEL`.`BmID`))) join `Anlagedaten`.`FUNKTION` on((`Anlagedaten`.`FUNKTION`.`FkID` = `Anlagedaten`.`BAUTEIL`.`FkID`))) join `Anlagedaten`.`WANDLER` on((`Anlagedaten`.`BETRIEBSMITTELTYP`.`BmTID` = `Anlagedaten`.`WANDLER`.`BmTID`))) join `Anlagedaten`.`EINHEIT` on((`Anlagedaten`.`EINHEIT`.`UID` = `Anlagedaten`.`WANDLER`.`UID`))) join `Anlagedaten`.`HERSTELLER` on((`Anlagedaten`.`HERSTELLER`.`HeID` = `Anlagedaten`.`BETRIEBSMITTELTYP`.`HeID`)));

-- -----------------------------------------------------
-- View `Anlagedaten`.`view_getTransformers`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Anlagedaten`.`view_getTransformers`;
USE `Anlagedaten`;
CREATE  OR REPLACE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `Anlagedaten`.`view_getTransformers` AS select `Anlagedaten`.`BETRIEBSMITTELTYP`.`BmTID` AS `BmTID`,`Anlagedaten`.`BETRIEBSMITTELTYP`.`ArtikelNr` AS `ArtikelNr`,`Anlagedaten`.`EINHEIT`.`Einheitszeichen` AS `Einheitszeichen`,`Anlagedaten`.`KLASSE`.`Name` AS `Name`,`Anlagedaten`.`WANDLER`.`PrimWert` AS `PrimWert`,`Anlagedaten`.`WANDLER`.`SekWert` AS `SekWert`,`Anlagedaten`.`WANDLER`.`Buerde` AS `Buerde` from (((`Anlagedaten`.`BETRIEBSMITTELTYP` join `Anlagedaten`.`WANDLER` on(((`Anlagedaten`.`BETRIEBSMITTELTYP`.`BmKlID` = 'T') and (`Anlagedaten`.`BETRIEBSMITTELTYP`.`BmTID` = `Anlagedaten`.`WANDLER`.`BmTID`)))) join `Anlagedaten`.`EINHEIT` on((`Anlagedaten`.`EINHEIT`.`UID` = `Anlagedaten`.`WANDLER`.`UID`))) join `Anlagedaten`.`KLASSE` on((`Anlagedaten`.`KLASSE`.`KlID` = `Anlagedaten`.`WANDLER`.`KlID`)));

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
