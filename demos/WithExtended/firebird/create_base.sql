
CREATE DOMAIN BOOLEAN
AS SMALLINT
CHECK (value is null or value in (0, 1));


/************** Création des TABLES **************/
CREATE TABLE AFFECTATION (
	AFFE__CLIE varchar (10) NOT NULL,
	AFFE_Clep int NOT NULL,
	AFFE_Libelle varchar (100),
 	PRIMARY KEY(AFFE__CLIE,AFFE_Clep));

CREATE TABLE BASE_COMPOSE (
	BACO_Clep varchar (12) NOT NULL,
	BACO__FOUR int NOT NULL,
	BACO_Codecom varchar (12),
	BACO_Libcom varchar (80),
	BACO_Desdev varchar (720),
	BACO_Pxactu decimal (10,4),
	BACO_Pxfutur decimal (10,4),
	BACO_Cubage decimal(4, 2),
	BACO_Coefcub decimal(3, 2),
	BACO_Indicspe boolean,
	BACO_Poids decimal(6, 2),
	BACO_Datecrea timestamp,
	BACO__CARA varchar (20),
	BACO__TYPR varchar (12),
	BACO__GAMM varchar (5),
	BACO_Compose boolean NOT NULL,
	BACO_Declasse boolean NOT NULL,
 	PRIMARY KEY(BACO_Clep));

CREATE TABLE BASE_COMPOSE_STRUCTURE (
	ARST__BACO varchar (12) NOT NULL,
	ARST__STRU varchar (20) NOT NULL,
 	PRIMARY KEY(ARST__BACO,ARST__STRU));

CREATE TABLE ASSISTANTE (
	ASSI_Clep varchar (15) NOT NULL,
	ASSI__PAYS varchar (3),
	ASSI_Civilite varchar (5),
	ASSI_Nom varchar (40),
	ASSI_Prenom varchar (40),
	ASSI_Adresse1 varchar (40),
	ASSI_Adresse2 varchar (40),
	ASSI_Adresse3 varchar (40),
	ASSI_Codepostal varchar (10),
	ASSI_Ville varchar (40),
	ASSI_Telephone varchar (20),
	ASSI_Numposte varchar (6),
	ASSI_Mobile varchar (20),
	ASSI_Fax varchar (20),
	ASSI_Email varchar (100),
	ASSI_Website varchar (100),
 	PRIMARY KEY(ASSI_Clep));

CREATE TABLE CARACTERISTIQUE (
	CARA_Clep varchar (20) NOT NULL,
	CARA_Libelle varchar (150),
 	PRIMARY KEY(CARA_Clep));

CREATE TABLE CATEGORIE (
	CATE_Clep int NOT NULL,
	CATE_Lib varchar (20),
	CATE_Valide boolean,
 	PRIMARY KEY(CATE_Clep));

CREATE TABLE CHECKER_ARBRE (
	CHAR_Clep smallint NOT NULL,
	CHAR_Libelle varchar (100),
	PRIMARY KEY(CHAR_Clep));

CREATE TABLE CIVILITE (
	CIVI_Clep varchar (5) NOT NULL,
	CIVI_Libelle varchar (150),
 	PRIMARY KEY(CIVI_Clep));

CREATE TABLE CLIENT (
	CLIE_Clep varchar (10) NOT NULL,
	CLIE__FAMI smallint NOT NULL,
	CLIE__PAYS varchar (3),
	CLIE_Civilite varchar (5),
	CLIE_Nom varchar (40),
	CLIE_Prenom varchar (40),
	CLIE_Adresse1 varchar (40),
	CLIE_Adresse2 varchar (40),
	CLIE_Adresse3 varchar (40),
	CLIE_Codepostal varchar (10),
	CLIE_Ville varchar (40),
	CLIE_Telephone varchar (20),
	CLIE_Numposte varchar (6),
	CLIE_Mobile varchar (20),
	CLIE_Fax varchar (20),
	CLIE_Email varchar (100),
	CLIE_Website varchar (100),
 	PRIMARY KEY(CLIE_Clep));

CREATE TABLE CODE_POSTAL (
	COPO_Clep char (10) NOT NULL,
	COPO_Numcod smallint NOT NULL,
	COPO_Burdist varchar (40),
	COPO_Codinsee varchar (5),
	COPO_Ville varchar (40),
	COPO_Latitude int,
	COPO_Longitude int,
 	PRIMARY KEY(COPO_Clep));

CREATE TABLE COMPORTEMENT (
	CPTM_Clep varchar (50) NOT NULL,
	CPTM_Obligatoire smallint,
	CPTM_Selection smallint,
 	PRIMARY KEY(CPTM_Clep));

CREATE TABLE COMPORTEMENT_SELECTION (
	COSE_Clep smallint NOT NULL,
	COSE_Libelle varchar (100) NOT NULL,
 	PRIMARY KEY(COSE_Clep));

CREATE TABLE COMPOSANT (
	COMP_Clep varchar (12) NOT NULL,
	COMP__FOUR int NOT NULL,
	COMP__SGRP int,
	COMP_Codecom varchar (12),
	COMP_Lib varchar (80),
	COMP_Lib2 varchar (280),
	COMP_Prixactuel decimal (10,4),
	COMP_Prixfutur decimal (10,4),
	COMP_Cubage decimal(4, 2),
	COMP_Coefcubage decimal(3, 2),
	COMP_Datecreation timestamp,
	COMP_Poids decimal(6, 2),
	COMP_Indicspecial boolean,
	COMP_Libcom varchar (150),
	COMP_Declasse boolean NOT NULL,
 	PRIMARY KEY(COMP_Clep));

CREATE TABLE DICO (
	DICO_Fiche varchar (50) NOT NULL,
	DICO_Table varchar (50) NOT NULL,
	DICO_Nocol int NOT NULL,
	DICO_Nomcol varchar (50),
	DICO_Libcol varchar (100),
	DICO_Libhint varchar (100),
	DICO_Affichage int NOT NULL,
	DICO_Recc int,
	DICO_Help int NOT NULL,
	DICO_Tablefk varchar (50),
	DICO_Colfk varchar (50),
	DICO_Coldsp varchar (50),
	DICO_Colobl boolean NOT NULL,
 PRIMARY KEY(DICO_Fiche,DICO_Table,DICO_Nocol));


CREATE TABLE FAMILLE (
	FAMI_Clep smallint NOT NULL,
	FAMI_Lib varchar (30),
	FAMI_Valide boolean,
 PRIMARY KEY(FAMI_Clep));

CREATE TABLE GAMME (
	GAMM_Clep varchar (5) NOT NULL,
	GAMM_Libelle varchar (100),
 PRIMARY KEY(GAMM_Clep));

CREATE TABLE GAMME_TYPR (
	GATY__GAMM varchar (5) NOT NULL,
	GATY__TYPR varchar (12) NOT NULL,
 PRIMARY KEY(GATY__GAMM,GATY__TYPR));

CREATE TABLE PAYS (
	PAYS_Clep varchar (3) NOT NULL,
	PAYS_Nom varchar (50) NOT NULL,
	PAYS_Numtel smallint NOT NULL,
 PRIMARY KEY(PAYS_Clep));

CREATE TABLE STRUCTURE (
	STRU_Clep varchar (20) NOT NULL,
	STRU_Type smallint NOT NULL,
	STRU_Libelle varchar (150) NOT NULL,
	STRU_Selectionne smallint NOT NULL,
	STRU_Position smallint NOT NULL,
 	PRIMARY KEY(STRU_Clep));

CREATE TABLE STRUCTURE_COMPOSANT (
	SCOM__STRU varchar (20) NOT NULL,
	SCOM__COMP varchar (12) NOT NULL,
 PRIMARY KEY(SCOM__STRU,SCOM__COMP));

CREATE TABLE STRUCTURE_CPTM_ACT (
	SCPA__STRU varchar (20) NOT NULL,
	SCPA__CPTM varchar (50) NOT NULL,
 PRIMARY KEY(SCPA__STRU,SCPA__CPTM));

CREATE TABLE STRUCTURE_CPTM_SEL (
	SCPS__STRU varchar (20) NOT NULL,
	SCPS__CPTM varchar (50) NOT NULL,
 	PRIMARY KEY(SCPS__STRU,SCPS__CPTM));

CREATE TABLE STRUCTURE_LIEE (
	STLI__Parent varchar (20) NOT NULL,
	STLI__Enfant varchar (20) NOT NULL,
 	PRIMARY KEY(STLI__Parent,STLI__Enfant));

CREATE TABLE TYPE_STRUCTURE (
	TYST_Clep smallint NOT NULL,
	TYST_Libelle varchar (100) NOT NULL,
 	PRIMARY KEY(TYST_Clep));

/************** Ajout des clés étrangères **************/
ALTER TABLE AFFECTATION ADD 
	CONSTRAINT FK_AFFE_CLIE FOREIGN KEY 
	(
		AFFE__CLIE
	) REFERENCES CLIENT (
		CLIE_Clep
	) ON DELETE CASCADE  ON UPDATE CASCADE 
;

ALTER TABLE BASE_COMPOSE ADD 
	CONSTRAINT FK_BACO_CARA FOREIGN KEY 
	(
		BACO__CARA
	) REFERENCES CARACTERISTIQUE (
		CARA_Clep
	),
	 ADD CONSTRAINT FK_BACO_GAMM FOREIGN KEY 
	(
		BACO__GAMM
	) REFERENCES GAMME (
		GAMM_Clep
	) ON UPDATE CASCADE;

ALTER TABLE BASE_COMPOSE_STRUCTURE ADD 
	CONSTRAINT FK_ARST_BACO FOREIGN KEY 
	(
		ARST__BACO
	) REFERENCES BASE_COMPOSE (
		BACO_Clep
	) ON DELETE CASCADE  ON UPDATE CASCADE ,
	 ADD CONSTRAINT FK_ARST_STRU FOREIGN KEY 
	(
		ARST__STRU
	) REFERENCES STRUCTURE (
		STRU_Clep
	) ON DELETE CASCADE  ON UPDATE CASCADE 
;

ALTER TABLE ASSISTANTE ADD 
	CONSTRAINT FK_ASSI_PAYS FOREIGN KEY 
	(
		ASSI__PAYS
	) REFERENCES PAYS (
		PAYS_Clep
	) ON UPDATE CASCADE 
;

ALTER TABLE CLIENT ADD 
	CONSTRAINT FK_CLIE_PAYS FOREIGN KEY 
	(
		CLIE__PAYS
	) REFERENCES PAYS (
		PAYS_Clep
	) ON UPDATE CASCADE 
;

ALTER TABLE COMPORTEMENT ADD 
	CONSTRAINT FK_CPTM_COSE FOREIGN KEY 
	(
		CPTM_Selection
	) REFERENCES COMPORTEMENT_SELECTION (
		COSE_Clep
	) ON UPDATE CASCADE 
;

ALTER TABLE GAMME_TYPR ADD 
	CONSTRAINT FK_GATY_GAMM FOREIGN KEY 
	(
		GATY__GAMM
	) REFERENCES GAMME (
		GAMM_Clep
	) ON DELETE CASCADE  ON UPDATE CASCADE;


ALTER TABLE STRUCTURE ADD 
	CONSTRAINT FK_STRU_TYST FOREIGN KEY 
	(
		STRU_Type
	) REFERENCES TYPE_STRUCTURE (
		TYST_Clep
	) ON UPDATE CASCADE 
;

ALTER TABLE STRUCTURE_COMPOSANT ADD 
	CONSTRAINT FK_SCOM_COMP FOREIGN KEY 
	(
		SCOM__COMP
	) REFERENCES COMPOSANT (
		COMP_Clep
	) ON DELETE CASCADE  ON UPDATE CASCADE ,
	 ADD CONSTRAINT FK_SCOM_STRU FOREIGN KEY 
	(
		SCOM__STRU
	) REFERENCES STRUCTURE (
		STRU_Clep
	) ON DELETE CASCADE  ON UPDATE CASCADE 
;

ALTER TABLE STRUCTURE_CPTM_ACT ADD 
	CONSTRAINT FK_SCPA_CPTM FOREIGN KEY 
	(
		SCPA__CPTM
	) REFERENCES COMPORTEMENT (
		CPTM_Clep
	) ON DELETE CASCADE  ON UPDATE CASCADE ,
	 ADD CONSTRAINT FK_SCPA_STRU FOREIGN KEY 
	(
		SCPA__STRU
	) REFERENCES STRUCTURE (
		STRU_Clep
	) ON DELETE CASCADE  ON UPDATE CASCADE 
;

ALTER TABLE STRUCTURE_CPTM_SEL ADD 
	CONSTRAINT FK_SCPS_CPTM FOREIGN KEY 
	(
		SCPS__CPTM
	) REFERENCES COMPORTEMENT (
		CPTM_Clep
	) ON DELETE CASCADE  ON UPDATE CASCADE ,
	 ADD CONSTRAINT FK_SCPS_STRU FOREIGN KEY 
	(
		SCPS__STRU
	) REFERENCES STRUCTURE (
		STRU_Clep
	) ON DELETE CASCADE  ON UPDATE CASCADE 
;

ALTER TABLE STRUCTURE_LIEE ADD 
	CONSTRAINT FK_STLI_STRU_PARENT FOREIGN KEY 
	(
		STLI__Parent
	) REFERENCES STRUCTURE (
		STRU_Clep
	) ON DELETE CASCADE  ON UPDATE CASCADE 
;


/************** Création des Triggers **************/
/* Les triggers remplaçant les FK */
SET TERM ^ ;

CREATE TRIGGER TR_STLI_STRU_ENFANT_INSERT FOR STRUCTURE_LIEE 
BEFORE INSERT OR UPDATE
AS
   DECLARE CLEP INTEGER;
BEGIN
for SELECT 1 FROM STRUCTURE WHERE STRU_Clep = new.STLI__Enfant INTO :CLEP DO
IF (CLEP is null) then
        /* raise error */
        new.STLI__Enfant = Null;
END^

CREATE TRIGGER TR_STRU_STLI_ENFANT_UPDATE FOR STRUCTURE 
BEFORE UPDATE
AS
BEGIN
IF ((old.STRU_Clep)<>(new.STRU_Clep)) then
	BEGIN
		ALTER TRIGGER  TR_STLI_STRU_ENFANT_INSERT INACTIVE;
		UPDATE STRUCTURE_LIEE SET STLI__Enfant = new.STRU_Clep WHERE STLI__Enfant = old.STRU_Clep;
		ALTER TRIGGER  TR_STLI_STRU_ENFANT_INSERT ACTIVE;
	END
END^

CREATE TRIGGER TR_STRU_STLI_ENFANT_DELETE FOR STRUCTURE 
BEFORE DELETE
AS
   DECLARE VARIABLE CLEP INTEGER;
BEGIN
    FOR SELECT 1 FROM STRUCTURE_LIEE WHERE  STLI__Enfant = old.STRU_Clep INTO .CLEP DO
IF (CLEP IS NULL) THEN
	DELETE FROM STRUCTURE_LIEE WHERE STLI__Enfant = old.STRU_Clep;
END^

SET TERM ; ^
