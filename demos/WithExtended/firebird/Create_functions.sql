SET TERM ^ ;

CREATE PROCEDURE fc_base_compose_uniquement
		(BASE_COMPOSE varchar(20),NIVEAU integer,INDICE integer)
RETURNS
(ARDE_Table varchar ( 100 ),
  ARDE_Clep integer,	
  ARDE_Parent varchar ( 250 ),
  ARDE_Table_parent  varchar (20), -- La clé parent de la table
  ARDE_Table_clep  varchar (20), -- La clé de la table
  ARDE_Type SMALLINT,
  ARDE_Selection SMALLINT,
  ARDE_Prix DECIMAL(12,4),
  ARDE_Prixfutur DECIMAL(12,4),
  ARDE_Libelle VARCHAR ( 360 ),
  ARDE_Libcom VARCHAR ( 200 ),
  ARDE_Position int) -- Le comportement
AS
DECLARE NUMERO integer;
BEGIN
NUMERO=0;
FOR
SELECT  'BASE_COMPOSE',
	(:NIVEAU*1000)+:INDICE+:NUMERO,
	NULL,
	NULL,
	BACO_Clep,
	0,
	9, 
	BACO_Pxactu, 
	BACO_Pxfutur, 
	BACO_Libcom,
	BACO_Libcom,
	-1
FROM BASE_COMPOSE
WHERE  BACO_Clep= :BASE_COMPOSE
AND BACO_Compose = 1
INTO
  :ARDE_Table,
  :ARDE_Clep,	
  :ARDE_Parent,
  :ARDE_Table_parent, -- La clé parent de la table
  :ARDE_Table_clep, -- La clé de la table
  :ARDE_Type,
  :ARDE_Selection,
  :ARDE_Prix,
  :ARDE_Prixfutur,
  :ARDE_Libelle,
  :ARDE_Libcom,
  :ARDE_Position
  do 
   begin
     NUMERO=:NUMERO+1;
     suspend;
   end  
END^


CREATE PROCEDURE fc_composants_base_compose
		(STRU_Clep varchar(20),Cleparent varchar(20),NIVEAU integer,INDICE integer)
RETURNS
( ARDE_Table varchar ( 100 ),
  ARDE_Clep varchar ( 250 ),	
  ARDE_Parent varchar ( 250 ),
  ARDE_Table_parent  varchar (20), -- La clé parent de la table
  ARDE_Table_clep  varchar (20), -- La clé de la table
  ARDE_Type SMALLINT,
  ARDE_Selection SMALLINT,
  ARDE_Prix  DECIMAL(12,4) ,
  ARDE_Prixfutur DECIMAL(12,4),
  ARDE_Libelle VARCHAR ( 360 ),
  ARDE_Libcom VARCHAR ( 200 ),
  ARDE_Position int) -- Le comportement
AS
DECLARE NUMERO integer;
DECLARE CleTable varchar (20);
DECLARE Cle varchar (20);
BEGIN
----------- Insertion des modes de règlement ------------- 
FOR SELECT DISTINCT 'STRUCTURE_COMPOSANT',
	:NIVEAU+:INDICE+:NUMERO,
	:CleParent,
	STRU_Clep,
	COMP_Clep,
	STRU_Type,
	9, 
	COMP_Prixactuel,
	COMP_Prixfutur,
	COMP_Lib,
	COMP_Libcom,
	STRU_Position
FROM STRUCTURE LEFT OUTER JOIN STRUCTURE_COMPOSANT ON ( SCOM__STRU = STRU_Clep ) LEFT OUTER JOIN COMPOSANT ON ( SCOM__COMP = COMP_Clep )
WHERE SCOM__STRU = STRU_Clep
ORDER BY STRU_Position, COMP_Lib
INTO
  :ARDE_Table,
  :ARDE_Clep,	
  :ARDE_Parent,
  :ARDE_Table_parent, -- La clé parent de la table
  :ARDE_Table_clep, -- La clé de la table
  :ARDE_Type,
  :ARDE_Selection,
  :ARDE_Prix,
  :ARDE_Prixfutur,
  :ARDE_Libelle,
  :ARDE_Libcom,
  :ARDE_Position
DO
BEGIN
     NUMERO=:NUMERO+1;
SUSPEND;
END
END
^

CREATE PROCEDURE fc_branches_base_compose
		(STRU_Clep varchar(20), CleParent varchar (250))
RETURNS
(ARDE_Table varchar ( 100 ),
  ARDE_Clep varchar ( 250 ),	
  ARDE_Parent varchar ( 250 ),
  ARDE_Table_parent  varchar (20), -- La clé parent de la table
  ARDE_Table_clep  varchar (20), -- La clé de la table
  ARDE_Type SMALLINT,
  ARDE_Selection SMALLINT,
  ARDE_Prix DECIMAL(12,4),
  ARDE_Prixfutur DECIMAL(12,4),
  ARDE_Libelle VARCHAR ( 360 ),
  ARDE_Libcom VARCHAR ( 200 ),
  ARDE_Position int) -- Le comportement
AS
BEGIN
----------- Insertion des modes de règlement -------------
DECLARE CleTable varchar (20)
DECLARE Cle varchar (250)

^ 
SELECT  'STRUCTURE_LIEE',
	CleParent+CAST ( STRU_Clep CHAR (20)),
	CleParent,
	STRU_Clep,
	STRU_Clep,
	STRU_Type,
	STRU_Selectionne, 
	NULL,
	NULL,
	STRU_Libelle,
	NULL,
	STRU_Position
FROM STRUCTURE,STRUCTURE_LIEE
WHERE STLI__Enfant = STRU_Clep
AND STLI__Parent= STRU_Clep
ORDER BY STRU_Position,STRU_Libelle

UPDATE liste
SET ARDE_Prix  = ( SELECT SUM ( COMP_Prixactuel )FROM STRUCTURE_COMPOSANT, COMPOSANT 
WHERE ARDE_Type=3
AND ARDE_Parent = CleParent
AND ARDE_Table = 'STRUCTURE_LIEE'
AND SCOM__STRU = ARDE_Table_clep
AND SCOM__COMP = COMP_Clep )
,
ARDE_Prixfutur = ( SELECT SUM ( COMP_Prixfutur ) FROM STRUCTURE_COMPOSANT, COMPOSANT 
WHERE ARDE_Type=3
AND ARDE_Parent = CleParent
AND ARDE_Table = 'STRUCTURE_LIEE'
AND SCOM__STRU = ARDE_Table_clep
AND SCOM__COMP = COMP_Clep )
WHERE ARDE_Type=3
AND ARDE_Parent = CleParent

DECLARE curseur CURSOR FOR SELECT ARDE_Table_clep, ARDE_Clep FROM liste WHERE ARDE_Type=2 AND ARDE_Parent = CleParent

OPEN curseur

FETCH NEXT FROM curseur INTO CleTable, Cle

while fetch_status = 0
BEGIN
  ^ SELECT * FROM fc_branches_base_compose ( CleTable, Cle )
  FETCH NEXT FROM curseur INTO CleTable, Cle
END
DEALLOCATE curseur

DO
BEGIN
SUSPEND;
END
END
^

if exists (select * from sysobjects where id = object_id(N'fc_arbre_base_compose') and xtype in (N'FN', N'IF', N'TF'))
drop PROCEDURE fc_arbre_base_compose
^

CREATE PROCEDURE fc_arbre_base_compose
		(BASE_COMPOSE varchar(20), composants SMALLINT )
RETURNS
(ARDE_Table varchar ( 100 ),
  ARDE_Clep varchar ( 250 ),	
  ARDE_Parent varchar ( 250 ),
  ARDE_Table_parent  varchar (20), -- La clé parent de la table
  ARDE_Table_clep  varchar (20), -- La clé de la table
  ARDE_Type SMALLINT,
  ARDE_Selection SMALLINT,
  ARDE_Prix DECIMAL(12,4),
  ARDE_Prixfutur DECIMAL(12,4),
  ARDE_Libelle VARCHAR ( 360 ),
  ARDE_Libcom VARCHAR ( 200 ),
  ARDE_Position int,
  ARDE__COMP  varchar (12)) -- Le comportement
AS
BEGIN
----------- Insertion de l'BASE_COMPOSE -------------
DECLARE CleTable varchar (20)
DECLARE Cle varchar (250)

^  
	SELECT  'ARTC_STRU',
	CAST ( BASE_COMPOSE CHAR (20))+CAST ( STRU_Clep CHAR (20)),
	CAST ( BASE_COMPOSE CHAR (20)),
	BASE_COMPOSE,
	STRU_Clep,
	STRU_Type,
	STRU_Selectionne, 
	NULL,
	NULL,
	STRU_Libelle,
	NULL,
	STRU_Position,
	NULL
	FROM STRUCTURE, BASE_COMPOSE_STRUCTURE 
	WHERE ARST__STRU = STRU_Clep 
	AND ARST__BACO= BASE_COMPOSE
	ORDER BY STRU_Position,STRU_Libelle
DECLARE curseur CURSOR FOR SELECT ARDE_Table_clep, ARDE_Clep FROM liste WHERE ARDE_Type=1 AND ARDE_Parent = CAST ( BASE_COMPOSE CHAR (20 ))

OPEN curseur

FETCH NEXT FROM curseur INTO CleTable, Cle
while fetch_status = 0
Begin
  ^ SELECT *, NULL FROM fc_branches_base_compose ( CleTable, Cle )
  FETCH NEXT FROM curseur INTO CleTable, Cle
End
DEALLOCATE curseur

IF composants = 1
  BEGIN
	DECLARE curseur CURSOR FOR SELECT ARDE_Table_clep, ARDE_Clep FROM liste WHERE ARDE_Type=3

	OPEN curseur

	FETCH NEXT FROM curseur INTO CleTable, Cle
	while fetch_status = 0
	BEGIN
	  ^ SELECT *, NULL FROM fc_composants_base_compose ( CleTable, Cle )
	  FETCH NEXT FROM curseur INTO CleTable, Cle
	END
	DEALLOCATE curseur
  END

IF composants = 2
  BEGIN
	UPDATE liste
	SET ARDE__COMP = SCOM__COMP
	FROM STRUCTURE_COMPOSANT
	WHERE ARDE_Table_clep = SCOM__STRU
  END

^ 
SELECT *, NULL FROM fc_base_compose_uniquement (BASE_COMPOSE)

DO
BEGIN
SUSPEND;
END
END
^

if exists (select * from sysobjects where id = object_id(N'fc_retrouve_base_compose') and xtype in (N'FN', N'IF', N'TF'))
drop PROCEDURE fc_retrouve_base_compose
^

CREATE PROCEDURE fc_retrouve_base_compose
		(STRU_Clep varchar(20))
RETURNS
(ARDE_Clep varchar(20))
AS
BEGIN
----------- Insertion des modes de règlement -------------
DECLARE Cle varchar ( 20 )
DECLARE Type int

SET Type = ( SELECT STRU_Type FROM STRUCTURE WHERE STRU_Clep = STRU_Clep )

IF Type = 1
	BEGIN
	INSERT liste
		SELECT
		ARST__BACO
		FROM BASE_COMPOSE_STRUCTURE
		WHERE ARST__STRU = STRU_Clep 
	END
ELSE
	IF Type >= 2
	BEGIN
	DECLARE curseur CURSOR FOR SELECT
		STLI__Parent
		FROM STRUCTURE_LIEE
		WHERE STLI__Enfant = STRU_Clep

	OPEN curseur

	FETCH NEXT FROM curseur INTO Cle
	while fetch_status = 0
		Begin
		  ^ SELECT * FROM fc_retrouve_base_compose ( Cle )
		  FETCH NEXT FROM curseur INTO Cle
		End

	DEALLOCATE curseur
	END
DO
BEGIN
SUSPEND;
END
END
^


if exists (select * from sysobjects where id = object_id(N'fc_retrouve_branches_enfants') and xtype in (N'FN', N'IF', N'TF'))
drop PROCEDURE fc_retrouve_branches_enfants
^

CREATE PROCEDURE fc_retrouve_branches_enfants
		(STRU_Clep varchar(20))
RETURNS
(ARDE_Clep varchar(20))
AS
BEGIN
----------- Insertion des modes de règlement -------------
DECLARE Cle varchar ( 20 )
DECLARE Type int

SET Type = ( SELECT STRU_Type FROM STRUCTURE WHERE STRU_Clep = STRU_Clep )

IF Type <= 2
	BEGIN
	^ SELECT STLI__Enfant
		FROM STRUCTURE_LIEE
		WHERE STLI__Parent = STRU_Clep
	DECLARE curseur CURSOR FOR SELECT STLI__Enfant
		FROM STRUCTURE_LIEE
		WHERE STLI__Parent = STRU_Clep

	OPEN curseur

	FETCH NEXT FROM curseur INTO Cle
	while fetch_status = 0
		Begin
		  ^ SELECT * FROM fc_retrouve_branches_enfants ( Cle )
		  FETCH NEXT FROM curseur INTO Cle
		End

	DEALLOCATE curseur

	END
DO
BEGIN
SUSPEND;
END
END
^


if exists (select * from sysobjects where id = object_id(N'fc_retrouve_branches_parentes') and xtype in (N'FN', N'IF', N'TF'))
drop PROCEDURE fc_retrouve_branches_parentes
^

CREATE PROCEDURE fc_retrouve_branches_parentes
		(STRU_Clep varchar(20))
RETURNS
(ARDE_Clep varchar(20))
AS
DECLARE Cle varchar ( 20 )^
DECLARE Type int^
BEGIN
----------- Insertion des modes de règlement -------------
SET Type = ( SELECT STRU_Type FROM STRUCTURE WHERE STRU_Clep = STRU_Clep )

IF Type >= 2
	BEGIN
	^ SELECT STLI__Parent
		FROM STRUCTURE_LIEE
		WHERE STLI__Enfant = STRU_Clep
	DECLARE curseur CURSOR FOR SELECT
		STLI__Parent
		FROM STRUCTURE_LIEE
		WHERE STLI__Enfant = STRU_Clep

	OPEN curseur

	FETCH NEXT FROM curseur INTO Cle
	while fetch_status = 0
		Begin
		  ^ SELECT * FROM fc_retrouve_branches_parentes ( Cle )
		  FETCH NEXT FROM curseur INTO Cle
		End

	DEALLOCATE curseur
	END
DO
BEGIN
SUSPEND;
END
END
^


if exists (select * from sysobjects where id = object_id(N'fc_date_char') and xtype in (N'FN', N'IF', N'TF'))
drop PROCEDURE fc_date_char
^

CREATE PROCEDURE fc_date_char (DATE datetime) RETURNS char(8)
AS
BEGIN
declare ladate char(8)
set ladate = 	convert(char(4), datepart(yy, DATE))
		+ 	substring('0' + convert(char(2), datepart(mm, DATE)), 
			len( datepart(mm, DATE)), 2) 
		+ 	substring('0' + convert(char(2), datepart(dd, DATE)), 
			len( datepart(dd, DATE)), 2) 
DO
BEGIN
SUSPEND;
END (ladate)
END
^


SET TERM ; ^
