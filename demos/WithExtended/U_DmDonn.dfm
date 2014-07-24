object M_Donn: TM_Donn
  OldCreateOrder = False
  Left = 34
  Top = 37
  Height = 823
  Width = 1032
  object ds_Finition: TDataSource
    DataSet = zq_Finition
    Left = 8
    Top = 492
  end
  object ds_client: TDataSource
    DataSet = zq_client
    OnStateChange = ds_clientStateChange
    Left = 170
    Top = 176
  end
  object ds_cp: TDataSource
    DataSet = zq_cp
    Left = 340
    Top = 492
  end
  object zq_cp: TIBQuery
    Database = M_Donnees.Database
    CursorType = ctStatic
    BeforePost = zq_cpBeforePost
    SQL.Strings = ('SELECT * FROM CODE_POSTAL')
    Left = 435
    Top = 492
  end
  object zq_four: TIBQuery
    Database = M_Donnees.Database
    CursorType = ctStatic
    Filter = 'FOUR_Nom <> '#39'Int'#233'grit'#233#39
    AfterOpen = zq_fourAfterOpen
    BeforeDelete = zq_fourBeforeDelete
    OnNewRecord = zq_fourNewRecord
    SQL.Strings = ('SELECT * FROM FOURNISSEUR')
    Left = 248
    Top = 221
  end
  object ds_four: TDataSource
    DataSet = zq_four
    Left = 170
    Top = 221
  end
  object zq_RechcliDevis: TIBQuery
    Database = M_Donnees.Database
    CursorType = ctStatic
    Params = <
      item
        Name = 'client1'
        DataType = ftString
        Size = 2
        Value = #39#39
      end
      item
        Name = 'client2'
        DataType = ftString
        Size = 2
        Value = #39#39
      end
      item
        Name = 'client3'
        DataType = ftString
        Size = 2
        Value = #39#39
      end>
    SQL.Strings = (
      'select count(*) from DEVIS '
      'where DEVI__CLIE1 = :client1'
      'or DEVI__CLIE2 = :client2'
      'or DEVI__CLIE3 = :client3'
      '')
    Left = 340
    Top = 253
  end
  object zq_Rechfourcomp: TIBQuery
    Database = M_Donnees.Database
    CursorType = ctStatic
    Params = <
      item
        Name = 'four'
        DataType = ftInteger
        Value = Null
      end>
    SQL.Strings = (
      'select count(*) from COMPOSANT'
      'where COMP__FOUR = :four')
    Left = 340
    Top = 301
  end
  object zq_Rechfourarti: TIBQuery
    Database = M_Donnees.Database
    CursorType = ctStatic
    Params = <
      item
        Name = 'four'
        DataType = ftInteger
        Value = Null
      end>
    SQL.Strings = (
      'select count(*) from ARTICLE'
      'where ARTI__FOUR = :four')
    Left = 435
    Top = 253
  end
  object ds_jalon: TDataSource
    DataSet = zq_jalon
    Left = 170
    Top = 13
  end
  object zq_jalon: TIBQuery
    Database = M_Donnees.Database
    SQL.Strings = ('SELECT * FROM JALONNEMENT')
    Left = 248
    Top = 13
  end
  object ds_famille: TDataSource
    DataSet = zq_famille
    Left = 170
    Top = 81
  end
  object zq_famille: TIBQuery
    Database = M_Donnees.Database
    Filtered = True
    OnNewRecord = zq_familleNewRecord
    SQL.Strings = ('SELECT * FROM FAMILLE')
    Left = 248
    Top = 81
  end
  object zq_Finition: TIBQuery
    Database = M_Donnees.Database
    CursorType = ctStatic
    AfterOpen = zq_FinitionAfterOpen
    AfterInsert = zq_FinitionAfterInsert
    Params = <
      item
        Name = 'user'
        DataType = ftString
        Size = 1
        Value = '0'
      end
      item
        Name = 'TyFi'
        DataType = ftString
        Size = 50
        Value = ''
      end>
    SQL.Strings = (
      'DECLARE @TyFi AS VARCHAR ( 50 )'
      'DECLARE @user int'
      'SET @user= :user'
      'SET @TyFi = :TyFi'
      ''
      ''
      '--FINITION DECLASSEES + FINITION NON DECLASSES'
      'IF @user = 0  '
      'BEGIN'
      ''
      'IF @TyFi <> '#39#39
      'SELECT * FROM FINITION, GROUPE_FINITION '
      'WHERE FINI_Lib <> '#39'Integrite'#39' and FINI_Lib <> '#39'Int'#233'grit'#233#39' '
      'AND FINI_Clep = GRFI__FINI '
      'AND GRFI__TYFI = @TyFi'
      'ELSE'
      'select * '
      'from FINITION'
      'where FINI_Lib <> '#39'Integrite'#39
      'and FINI_Lib <> '#39'Int'#233'grit'#233#39
      ''
      ''
      'END'
      'ELSE'
      'BEGIN'
      '-- FINITION NON DECLASSES SEULEMENT'
      ''
      ''
      'IF @TyFi <> '#39#39
      'SELECT * FROM FINITION, GROUPE_FINITION '
      'WHERE FINI_Lib <> '#39'Integrite'#39' and FINI_Lib <> '#39'Int'#233'grit'#233#39' '
      'AND FINI_Clep = GRFI__FINI '
      'AND GRFI__TYFI = @TyFi'
      'AND FINI_Declasse<>1'
      'ELSE'
      'select * '
      'from FINITION'
      'where FINI_Lib <> '#39'Integrite'#39
      'and FINI_Lib <> '#39'Int'#233'grit'#233#39
      'AND FINI_Declasse<>1'
      ''
      ''
      'END')
    Left = 88
    Top = 492
  end
  object ds_categ: TDataSource
    DataSet = zq_categ
    Left = 170
    Top = 129
  end
  object zq_categ: TIBQuery
    Database = M_Donnees.Database
    CursorType = ctStatic
    OnNewRecord = zq_categNewRecord
    SQL.Strings = ('SELECT * FROM CATEGORIE')
    Left = 248
    Top = 129
  end
  object zq_modalite: TIBQuery
    Database = M_Donnees.Database
    CursorType = ctStatic
    Filter = 'MODA_Designation <> '#39'Int'#233'grit'#233#39
    Filtered = True
    SQL.Strings = ('SELECT * FROM MODALITE')
    Left = 435
    Top = 61
  end
  object ds_modalite: TDataSource
    DataSet = zq_modalite
    Left = 340
    Top = 61
  end
  object zq_maj_groupe: TIBQuery
    Database = M_Donnees.Database
    Params = <>
    Left = 435
    Top = 301
  end
  object zq_client: TIBQuery
    Database = M_Donnees.Database
    CursorType = ctStatic
    AfterOpen = zq_clientAfterOpen
    BeforePost = zq_clientBeforePost
    AfterPost = zq_clientAfterPost
    AfterScroll = zq_clientAfterScroll
    OnNewRecord = zq_clientNewRecord
    Params = <
      item
        Name = 'Repr'
        Attributes = [paSigned, paNullable]
        DataType = ftString
        Size = 100
        Value = ''
      end>
    SQL.Strings = (
      'DECLARE @Repr AS VARCHAR ( 50 )'
      'SET @Repr = :Repr'
      'IF @Repr <> '#39#39
      'AND @Repr IS NOT NULL'
      'BEGIN'
      'SELECT * FROM CLIENT WHERE'
      
        ' CLIE_Clep IN ( SELECT DEVI__CLIE1 FROM DEVIS WHERE DEVI__REPR =' +
        ' @Repr )'
      
        ' OR CLIE_Clep IN ( SELECT DEVI__CLIE2 FROM DEVIS WHERE DEVI__REP' +
        'R = @Repr )'
      
        ' OR CLIE_Clep IN ( SELECT DEVI__CLIE3 FROM DEVIS WHERE DEVI__REP' +
        'R = @Repr )'
      
        ' OR CLIE_Clep IN ( SELECT Client_fac FROM COMMANDE WHERE COMM__R' +
        'EPR = @Repr )'
      
        ' OR CLIE_Clep IN ( SELECT Client_liv FROM COMMANDE WHERE COMM__R' +
        'EPR = @Repr )'
      ' OR CLIE__REPR = @Repr'
      'AND CLIE_Nom <> '#39'Int'#233'grit'#233#39
      'and CLIE_Nom <> '#39'Integrite'#39
      'END'
      'ELSE'
      'select * FROM CLIENT'
      'where CLIE_Nom <> '#39'Int'#233'grit'#233#39
      'and CLIE_Nom <> '#39'Integrite'#39)
    Left = 248
    Top = 176
  end
  object ds_Composant: TDataSource
    DataSet = zq_composant
    Left = 340
    Top = 208
  end
  object zq_composant: TIBQuery
    Database = M_Donnees.Database
    CursorType = ctStatic
    AfterOpen = zq_composantAfterOpen
    AfterScroll = zq_composantAfterScroll
    OnNewRecord = zq_composantNewRecord
    Params = <>
    SQL.Strings = (
      'select * from COMPOSANT'
      'where COMP_Lib <> '#39'Integrite'#39
      'and COMP_Lib <> '#39'Int'#233'grit'#233#39)
    Left = 435
    Top = 208
  end
  object ds_assist: TDataSource
    DataSet = zq_assist
    Left = 170
    Top = 396
  end
  object zq_assist: TIBQuery
    Database = M_Donnees.Database
    CursorType = ctStatic
    SQL.Strings = ('SELECT * FROM ASSISTANTE')
    Left = 248
    Top = 396
  end
  object ds_maxnumcod: TDataSource
    DataSet = zq_maxnumcod
    Left = 340
    Top = 541
  end
  object zq_maxnumcod: TIBQuery
    Database = M_Donnees.Database
    Params = <
      item
        Name = 'cle'
        Size = -1
        Value = Null
      end>
    SQL.Strings = (
      'select max(COPO_Numcod)'
      'from CODE_POSTAL'
      'where COPO_Clep = :cle')
    Left = 435
    Top = 541
  end
  object ds_repr: TDataSource
    DataSet = zq_repr
    Left = 170
    Top = 348
  end
  object zq_repr: TIBQuery
    Database = M_Donnees.Database
    AfterScroll = zq_reprAfterScroll
    Params = <>
    SQL.Strings = (
      'SELECT *'
      'FROM REPRESENTANT')
    Left = 248
    Top = 348
  end
  object ds_tva: TDataSource
    DataSet = zq_tva
    Left = 523
    Top = 13
  end
  object zq_tva: TIBQuery
    Database = M_Donnees.Database
    AfterOpen = zq_tvaAfterOpen
    Params = <>
    SQL.Strings = (
      'select * from TTVA'
      '')
    Left = 600
    Top = 13
  end
  object ds_typedevis: TDataSource
    DataSet = zq_typedevis
    Left = 523
    Top = 61
  end
  object zq_typedevis: TIBQuery
    Database = M_Donnees.Database
    Params = <>
    SQL.Strings = (
      'select * from TYPE_DEVIS'
      '')
    Left = 600
    Top = 61
  end
  object ds_motifclot: TDataSource
    DataSet = zq_motifclot
    Left = 523
    Top = 113
  end
  object zq_motifclot: TIBQuery
    Database = M_Donnees.Database
    Params = <>
    SQL.Strings = (
      'select * from MOTIF_CLOTURE')
    Left = 600
    Top = 113
  end
  object ds_fave: TDataSource
    DataSet = zq_fave
    Left = 698
    Top = 20
  end
  object zq_fave: TIBQuery
    Database = M_Donnees.Database
    CursorType = ctStatic
    OnDeleteError = zq_faveDeleteError
    Params = <>
    SQL.Strings = (
      'select * '
      'from FAMILLE_VENTE')
    Left = 770
    Top = 20
  end
  object ds_sofv: TDataSource
    DataSet = zq_sofv
    Left = 698
    Top = 68
  end
  object zq_sofv: TIBQuery
    Database = M_Donnees.Database
    CursorType = ctStatic
    OnDeleteError = zq_sofvDeleteError
    Params = <>
    SQL.Strings = (
      'select * '
      'from SOUS_FAMILLEV')
    Left = 770
    Top = 68
  end
  object ds_ssfv: TDataSource
    DataSet = zq_ssfv
    Left = 698
    Top = 116
  end
  object zq_ssfv: TIBQuery
    Database = M_Donnees.Database
    CursorType = ctStatic
    OnDeleteError = zq_ssfvDeleteError
    Params = <>
    SQL.Strings = (
      'select * '
      'from SOUS_SOUSFAMILLEV')
    Left = 770
    Top = 116
  end
  object ds_sofv_ssfv: TDataSource
    DataSet = zq_sofv_ssfv
    Left = 170
    Top = 492
  end
  object zq_sofv_ssfv: TIBQuery
    Database = M_Donnees.Database
    CursorType = ctStatic
    OnDeleteError = zq_sofv_ssfvDeleteError
    DataSource = ds_sofv
    Params = <
      item
        Name = 'ssfam'
        Size = -1
        Value = Null
      end>
    SQL.Strings = (
      'select SSFV_Clep, SSFV_Libelle'
      'from SOUS_SOUSFAMILLEV'
      'where SSFV__SOFV = :ssfam')
    Left = 248
    Top = 492
  end
  object ds_ssfv_pvr: TDataSource
    DataSet = zq_ssfv_pvr
    Left = 170
    Top = 541
  end
  object zq_ssfv_pvr: TIBQuery
    Database = M_Donnees.Database
    CursorType = ctStatic
    OnDeleteError = zq_sofv_ssfvDeleteError
    DataSource = ds_sofv
    Params = <
      item
        Name = 'ssfv'
        Size = -1
        Value = Null
      end>
    SQL.Strings = (
      'select ARTI_Clep, ARTI_Libcom'
      'from ARTICLE'
      'where ARTI__SSFA = :ssfv')
    Left = 248
    Top = 541
  end
  object ds_fave_sofv: TDataSource
    DataSet = zq_fave_sofv
    Left = 170
    Top = 444
  end
  object zq_fave_sofv: TIBQuery
    Database = M_Donnees.Database
    CursorType = ctStatic
    OnDeleteError = zq_sofv_ssfvDeleteError
    Params = <
      item
        Name = 'fam'
        Size = -1
        Value = Null
      end>
    SQL.Strings = (
      'select SOFV_Clep, SOFV_Libelle'
      'from SOUS_FAMILLEV'
      'where SOFV__FAVE = :fam')
    Left = 248
    Top = 444
  end
  object ds_ClieAffecte: TDataSource
    DataSet = zq_ClieAffecte
    Left = 170
    Top = 269
  end
  object ds_ClieInter: TDataSource
    DataSet = zq_ClieInter
    Left = 340
    Top = 13
  end
  object zq_Civilite: TIBQuery
    Database = M_Donnees.Database
    CursorType = ctStatic
    Params = <>
    SQL.Strings = (
      'select * '
      'from CIVILITE')
    Left = 608
    Top = 165
  end
  object ds_Civilite: TDataSource
    DataSet = zq_Civilite
    Left = 528
    Top = 165
  end
  object ds_pays: TDataSource
    DataSet = zq_Pays
    Left = 880
    Top = 220
  end
  object ds_PaysClient: TDataSource
    DataSet = zq_PaysClient
    Left = 864
    Top = 268
  end
  object zq_CliInRepr: TIBQuery
    Database = M_Donnees.Database
    CursorType = ctStatic
    Params = <
      item
        Name = 'repr'
        Size = -1
        Value = Null
      end>
    SQL.Strings = (
      
        'select  CLIE_Clep, CLIE_Nom,CLIE_Codepostal,CLIE_Ville,CLIE_Code' +
        'insee FROM CLIENT'
      'where CLIE__REPR = :repr'
      'ORDER BY  CLIE_Nom')
    Left = 608
    Top = 213
  end
  object ds_CliInRepr: TDataSource
    DataSet = zq_CliInRepr
    Left = 528
    Top = 213
  end
  object zq_CliOutRepr: TIBQuery
    Database = M_Donnees.Database
    CursorType = ctStatic
    Params = <>
    SQL.Strings = (
      
        'select  CLIE_Clep, CLIE_Nom,CLIE_Codepostal,CLIE_Ville,CLIE_Code' +
        'insee FROM CLIENT'
      'Where CLIE__REPR is null'
      'ORDER BY  CLIE_Nom')
    Left = 608
    Top = 260
  end
  object ds_CliOutRepr: TDataSource
    DataSet = zq_CliOutRepr
    Left = 528
    Top = 260
  end
  object ds_clidiffin: TDataSource
    DataSet = zq_clidiffin
    Left = 340
    Top = 113
  end
  object zq_clidiffin: TIBQuery
    Database = M_Donnees.Database
    CursorType = ctStatic
    Params = <
      item
        Name = 'groupe'
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 10
        Value = ''
      end>
    SQL.Strings = (
      'select  REPR_Clep, REPR_Nom FROM REPRESENTANT, CLIENT_DIFFUSION'
      'where REPR_Clep = CLDI__REPR'
      'AND CLDI__CLIE = :groupe'
      'ORDER BY  REPR_Nom')
    Left = 435
    Top = 113
  end
  object zq_clidiffout: TIBQuery
    Database = M_Donnees.Database
    CursorType = ctStatic
    Params = <
      item
        Name = 'groupe'
        DataType = ftString
        Size = 50
        Value = ''
      end>
    SQL.Strings = (
      'select  REPR_Clep, REPR_Nom FROM REPRESENTANT'
      'where REPR_Clep not in (select CLDI__REPR from CLIENT_DIFFUSION'
      'where CLDI__CLIE = :groupe)'
      'ORDER BY REPR_Nom')
    Left = 435
    Top = 161
  end
  object ds_clidiffout: TDataSource
    DataSet = zq_clidiffout
    Left = 340
    Top = 161
  end
  object zq_ClieAffecte: TIBQuery
    Database = M_Donnees.Database
    CursorType = ctStatic
    BeforePost = zq_ClieAffecteBeforePost
    AfterPost = Modifiezq_Clie
    BeforeDelete = zq_ClieAffecteBeforeDelete
    AfterDelete = Modifiezq_Clie
    SQL.Strings = ('SELECT * FROM AFFECTATION')
    Left = 248
    Top = 269
  end
  object ds_CliDevis: TDataSource
    DataSet = zq_CliDevis
    Left = 856
    Top = 13
  end
  object ds_CliCmde: TDataSource
    DataSet = zq_CliCmde
    Left = 856
    Top = 61
  end
  object zq_CliDevis: TIBQuery
    Database = M_Donnees.Database
    Params = <
      item
        Name = 'client'
        DataType = ftString
        Size = 10
        Value = ''
      end>
    SQL.Strings = (
      'SELECT DEVI_Clep1, DEVI_Clep2, DEVI__TYDE, '
      
        'DEVI_Dateenreg, DEVI_Datearrivee, DEVI_Aval, DEVI_Rectif, JALO_L' +
        'ib '
      'FROM DEVIS,JALONNEMENT '
      'WHERE'
      'DEVI__CLIE3= :client'
      'AND DEVI__JALO = JALO_Clep')
    Left = 930
    Top = 13
  end
  object zq_InteFonct: TIBQuery
    Database = M_Donnees.Database
    Params = <
      item
        Name = 'client'
        DataType = ftString
        Size = -1
        Value = ''
      end>
    SQL.Strings = (
      'SELECT DISTINCT INTE_Fonction FROM INTERLOCUTEUR')
    Left = 930
    Top = 113
  end
  object zq_AffeZone: TIBQuery
    Database = M_Donnees.Database
    Params = <>
    SQL.Strings = (
      'SELECT DISTINCT AFFE_Libelle FROM AFFECTATION')
    Left = 856
    Top = 113
  end
  object zq_CliCmde: TIBQuery
    Database = M_Donnees.Database
    Params = <
      item
        Name = 'client'
        DataType = ftString
        Size = 10
        Value = ''
      end>
    SQL.Strings = (
      'SELECT Num_cde, Dat_crea, Dat_modif,'
      'Num_rectif, Num_devis, Dat_devis'
      'FROM COMMANDE'
      'WHERE'
      'Client_fac= :client')
    Left = 930
    Top = 61
  end
  object ds_ville: TDataSource
    DataSet = zq_ville
    Left = 8
    Top = 541
  end
  object zq_ville: TIBQuery
    Database = M_Donnees.Database
    CursorType = ctStatic
    Params = <>
    SQL.Strings = (
      'SELECT     COPO_Clep, COPO_Ville, COPO_Codinsee'
      'FROM         CODE_POSTAL')
    Left = 88
    Top = 541
  end
  object zq_prod_travail: TIBQuery
    Database = M_Donnees.Database
    CommandTimeout = 0
    Params = <
      item
        Name = 'serveur_ref'
        Attributes = [paNullable]
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 32
        Value = Null
      end
      item
        Name = 'bdd_ref'
        Attributes = [paNullable]
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 32
        Value = Null
      end
      item
        Name = 'serveur'
        Attributes = [paNullable]
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 32
        Value = Null
      end
      item
        Name = 'bdd'
        Attributes = [paNullable]
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 32
        Value = Null
      end
      item
        Name = 'location'
        Attributes = [paNullable]
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 512
        Value = Null
      end
      item
        Name = 'representant'
        Attributes = [paNullable]
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 15
        Value = Null
      end
      item
        Name = 'prod'
        Size = -1
        Value = Null
      end
      item
        Name = 'result'
        Size = -1
        Value = Null
      end>
    SQL.Strings = (
      'PRODUCTION_MMO_REPR'
      ':serveur_ref, :bdd_ref, :serveur, :bdd ,'
      ':location, :representant, :prod, :result')
    Left = 104
    Top = 21
  end
  object zq_prod_acces: TIBQuery
    Database = M_Donnees.Database
    CommandTimeout = 0
    Params = <
      item
        Name = 'serveur_ref'
        Attributes = [paNullable]
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 32
        Value = Null
      end
      item
        Name = 'bdd_ref'
        Attributes = [paNullable]
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 32
        Value = Null
      end
      item
        Name = 'serveur'
        Attributes = [paNullable]
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 32
        Value = Null
      end
      item
        Name = 'bdd'
        Attributes = [paNullable]
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 32
        Value = Null
      end
      item
        Name = 'location'
        Attributes = [paNullable]
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 512
        Value = Null
      end
      item
        Name = 'representant'
        Attributes = [paNullable]
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 15
        Value = Null
      end
      item
        Name = 'bdd_acces'
        Attributes = [paNullable]
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 32
        Value = Null
      end
      item
        Name = 'bdd_travail'
        Attributes = [paNullable]
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 32
        Value = Null
      end>
    SQL.Strings = (
      'PRODUCTION_MC_ACCES_REPR'
      ':serveur_ref, :bdd_ref, :serveur, :bdd ,'
      ':location, :representant, :bdd_acces, :bdd_travail')
    Left = 99
    Top = 77
  end
  object zq_location: TIBQuery
    Database = M_Donnees.Database
    CursorType = ctStatic
    Params = <>
    SQL.Strings = (
      'SELECT LOTS_Lieuproducts'
      'FROM LOTS')
    Left = 768
    Top = 165
  end
  object zq_prod_fichiers: TIBQuery
    Database = M_Donnees.Database
    CommandTimeout = 0
    Params = <
      item
        Name = 'repr'
        DataType = ftString
        Size = 15
        Value = Null
      end>
    SQL.Strings = (
      'ps_export_representant :repr')
    Left = 696
    Top = 165
  end
  object ds_prod_travail: TDataSource
    DataSet = zq_prod_travail
    Left = 24
    Top = 21
  end
  object ds_prod_acces: TDataSource
    DataSet = zq_prod_acces
    Left = 18
    Top = 77
  end
  object ds_RepSecteur: TDataSource
    DataSet = zq_RepSecteur
    Left = 8
    Top = 597
  end
  object zq_RepSecteur: TIBQuery
    Database = M_Donnees.Database
    BeforePost = zq_RepSecteurBeforePost
    AfterPost = zq_RepSecteurAfterPost
    AfterCancel = zq_RepSecteurAfterCancel
    AfterDelete = zq_RepSecteurAfterDelete
    AfterScroll = zq_RepSecteurAfterScroll
    Params = <>
    SQL.Strings = (
      'select SECT__REPR,'
      
        #9'--case LEN(SECT_Codeinsee) WHEN 2 then SECT_Codeinsee else NULL' +
        ' end as dep,'
      
        #9'--case LEN(SECT_Codeinsee) WHEN 5 then SECT_Codeinsee else NULL' +
        ' end as ville,'
      '                SECT_Codeinsee'
      'from SECTEUR')
    Left = 88
    Top = 597
  end
  object zq_dep: TIBQuery
    Database = M_Donnees.Database
    Params = <>
    SQL.Strings = (
      'select distinct(LEFT(COPO_Codinsee,2)) as '#39'dep'#39
      'from CODE_POSTAL'
      'where COPO_Codinsee<>'#39#39
      'order by dep')
    Left = 248
    Top = 600
  end
  object ds_dep: TDataSource
    DataSet = zq_dep
    Left = 171
    Top = 595
  end
  object ds_villeInDep: TDataSource
    DataSet = zq_villeInDep
    Left = 344
    Top = 597
  end
  object zq_villeInDep: TIBQuery
    Database = M_Donnees.Database
    Params = <
      item
        Name = 'dep'
        DataType = ftString
        Size = 2
        Value = Null
      end>
    SQL.Strings = (
      
        'select COPO_Codinsee as '#39'ville'#39', '#39'('#39' + COPO_Codinsee + '#39') '#39' + CO' +
        'PO_Ville as Villes'
      'from CODE_POSTAL '
      'where COPO_Codinsee like :dep + '#39'%'#39
      'and COPO_Codinsee<>'#39#39
      
        'and COPO_Codinsee  not in (select  SECT_Codeinsee  from SECTEUR ' +
        'where LEN(COPO_Codinsee)=5)'
      'order by COPO_Codinsee')
    Left = 440
    Top = 597
  end
  object ds_villeSearched: TDataSource
    DataSet = zq_villeSearched
    Left = 8
    Top = 701
  end
  object zq_villeSearched: TIBQuery
    Database = M_Donnees.Database
    Params = <
      item
        Name = 'ville'
        Size = -1
        Value = Null
      end>
    SQL.Strings = (
      'select '#39'('#39' + COPO_Codinsee + '#39') '#39' + COPO_Ville as Ville'
      'from CODE_POSTAL '
      'where COPO_Codinsee= :ville'
      'order by COPO_Codinsee')
    Left = 88
    Top = 693
  end
  object zq_depSearched: TIBQuery
    Database = M_Donnees.Database
    Params = <
      item
        Name = 'dep'
        Size = -1
        Value = Null
      end>
    SQL.Strings = (
      'select * from SECTEUR'
      'where SECT_Codeinsee= :dep'
      '')
    Left = 612
    Top = 311
  end
  object ds_secteur: TDataSource
    DataSet = zq_secteur
    Left = 688
    Top = 221
  end
  object zq_secteur: TIBQuery
    Database = M_Donnees.Database
    Params = <
      item
        Name = 'rep'
        Size = -1
        Value = Null
      end>
    SQL.Strings = (
      'select LEFT(SECT_Codeinsee,2) as dep,'
      
        '          case LEN(SECT_Codeinsee) WHEN 5 then SECT_Codeinsee el' +
        'se NULL end as SECT_Codeinsee,'
      
        '          case LEN(SECT_Codeinsee) WHEN 5 then (select COPO_Vill' +
        'e from CODE_POSTAL where COPO_Codinsee = SECT_Codeinsee) else NU' +
        'LL end as ville'
      'from SECTEUR'
      'where SECT__REPR = :rep'
      '')
    Left = 768
    Top = 221
  end
  object ds_villeAlone: TDataSource
    DataSet = zq_villeAlone
    Left = 175
    Top = 701
  end
  object zq_villeAlone: TIBQuery
    Database = M_Donnees.Database
    Params = <>
    SQL.Strings = (
      'select LEFT(COPO_Codinsee,2) as dep,COPO_Codinsee, COPO_Ville'
      'from CODE_POSTAL'
      'where (LEFT(COPO_Codinsee,2) '
      '           not in (select SECT_Codeinsee '
      '                      from SECTEUR'
      '                      where LEN(SECT_Codeinsee) =2))'
      'and (COPO_Codinsee '
      '       not in (select SECT_Codeinsee '
      '                      from SECTEUR'
      '                      where LEN(SECT_Codeinsee) =5))'
      'and COPO_Codinsee<>'#39' '#39
      'order by dep,COPO_Codinsee')
    Left = 248
    Top = 701
  end
  object ds_filtreville: TDataSource
    DataSet = zq_filtreville
    Left = 8
    Top = 645
  end
  object zq_filtreville: TIBQuery
    Database = M_Donnees.Database
    CursorType = ctStatic
    Params = <
      item
        Name = 'laville'
        Size = -1
        Value = Null
      end>
    SQL.Strings = (
      'SELECT     COPO_Clep, COPO_Ville, COPO_Codinsee'
      'FROM         CODE_POSTAL'
      'WHERE COPO_Ville = :laville')
    Left = 88
    Top = 645
  end
  object ds_filtrecp: TDataSource
    DataSet = zq_filtrecp
    Left = 168
    Top = 653
  end
  object zq_filtrecp: TIBQuery
    Database = M_Donnees.Database
    CursorType = ctStatic
    Params = <
      item
        Name = 'lecp'
        Size = -1
        Value = Null
      end>
    SQL.Strings = (
      'SELECT     COPO_Clep, COPO_Ville, COPO_Codinsee'
      'FROM         CODE_POSTAL'
      'WHERE COPO_Clep = :lecp')
    Left = 248
    Top = 653
  end
  object zq_deleteVille: TIBQuery
    Database = M_Donnees.Database
    Params = <
      item
        Name = 'rep'
        Size = -1
        Value = Null
      end
      item
        Name = 'dep'
        Size = -1
        Value = Null
      end>
    SQL.Strings = (
      'delete from SECTEUR'
      'where SECT__REPR = :rep'
      'and SECT_Codeinsee like :dep + '#39'%'#39
      'and LEN(SECT_Codeinsee)=5')
    Left = 440
    Top = 653
  end
  object zq_deleteDep: TIBQuery
    Database = M_Donnees.Database
    Params = <
      item
        Name = 'ville'
        DataType = ftString
        Size = -1
        Value = Null
      end
      item
        Name = 'rep'
        DataType = ftString
        Size = -1
        Value = Null
      end>
    SQL.Strings = (
      'delete from SECTEUR'
      'where SECT__REPR = :rep'
      'and SECT_Codeinsee = LEFT(:ville,2)'
      '')
    Left = 344
    Top = 653
  end
  object ds_typModalite: TDataSource
    DataSet = zq_typModalite
    Left = 528
    Top = 421
  end
  object zq_typModalite: TIBQuery
    Database = M_Donnees.Database
    Params = <>
    SQL.Strings = (
      'select * from TYPE_MODALITE')
    Left = 616
    Top = 421
  end
  object ds_modalit: TDataSource
    DataSet = zq_modalit
    Left = 528
    Top = 477
  end
  object zq_modalit: TIBQuery
    Database = M_Donnees.Database
    AfterPost = zq_modalitAfterPost
    Params = <>
    SQL.Strings = (
      'select * from MODALITE'
      'where MODA_Clep<>'#39#39)
    Left = 944
    Top = 173
  end
  object zq_updModaliteDft: TIBQuery
    Database = M_Donnees.Database
    Params = <
      item
        Name = 'typ'
        Size = -1
        Value = Null
      end
      item
        Name = 'cle'
        Size = -1
        Value = Null
      end>
    SQL.Strings = (
      'update MODALITE'
      'set MODA_Defaut = 0'
      'where MODA__TYMO = :typ'
      'and MODA_Clep <> :cle')
    Left = 856
    Top = 171
  end
  object zq_devis_repr: TIBQuery
    Database = M_Donnees.Database
    CursorType = ctStatic
    Params = <
      item
        Name = 'repr'
        DataType = ftString
        Size = -1
        Value = Null
      end
      item
        Name = 'client'
        DataType = ftString
        Size = -1
        Value = Null
      end>
    SQL.Strings = (
      'Update DEVIS'
      'Set DEVI__REPR = :repr'
      'Where DEVI__CLIE1 = :client')
    Left = 432
    Top = 352
  end
  object zq_commande_repr: TIBQuery
    Database = M_Donnees.Database
    CursorType = ctStatic
    Params = <
      item
        Name = 'repr'
        DataType = ftString
        Size = -1
        Value = Null
      end
      item
        Name = 'client'
        DataType = ftString
        Size = -1
        Value = Null
      end>
    SQL.Strings = (
      'Update COMMANDE'
      'Set COMM__REPR = :repr'
      'Where Client_liv = :client')
    Left = 424
    Top = 410
  end
  object ds_cheminbase: TDataSource
    DataSet = zq_cheminbase
    Left = 8
    Top = 565
  end
  object zq_cheminbase: TIBQuery
    Database = M_Donnees.Database
    CursorType = ctStatic
    Filtered = True
    Params = <>
    SQL.Strings = (
      'Select filename from sysfiles'
      'where fileid = 1'
      '')
    Left = 88
    Top = 565
  end
  object zq_client_diffgen: TIBQuery
    Database = M_Donnees.Database
    CursorType = ctStatic
    Params = <
      item
        Name = 'client'
        DataType = ftString
        Size = -1
        Value = Null
      end>
    SQL.Strings = (
      'Update CLIENT'
      'Set CLIE_Diffgen = 1'
      'Where CLIE_Clep = :client')
    Left = 624
    Top = 365
  end
  object zq_attache_base: TIBQuery
    Database = M_Donnees.Database
    CursorType = ctStatic
    Filtered = True
    Params = <
      item
        Name = 'baseaccess'
        Size = -1
        Value = Null
      end
      item
        Name = 'baserepr'
        Size = -1
        Value = Null
      end
      item
        Name = 'baseficaccess'
        Size = -1
        Value = Null
      end
      item
        Name = 'baseficrepr'
        Size = -1
        Value = Null
      end>
    SQL.Strings = (
      
        'select * from fn_attache_base(:baseaccess,:baserepr, :baseficacc' +
        'ess, :baseficrepr)')
    Left = 928
    Top = 397
  end
  object zq_attache_cmd: TIBQuery
    Database = M_Donnees.Database
    CursorType = ctStatic
    Filtered = True
    Params = <
      item
        Name = 'serveur'
        Size = -1
        Value = Null
      end>
    SQL.Strings = (
      'select * from fn_attache_cmd(:serveur)')
    Left = 872
    Top = 397
  end
  object zq_ini_access: TIBQuery
    Database = M_Donnees.Database
    CursorType = ctStatic
    Filtered = True
    Params = <
      item
        Name = 'serveur'
        Size = -1
        Value = Null
      end
      item
        Name = 'baseaccess'
        Size = -1
        Value = Null
      end>
    SQL.Strings = (
      'select * from fn_fichier_ini_access(:serveur, :baseaccess)')
    Left = 944
    Top = 333
  end
  object ds_FinitionDeclasse: TDataSource
    DataSet = zq_FinitionDeclasse
    Left = 16
    Top = 376
  end
  object zq_FinitionDeclasse: TIBQuery
    Database = M_Donnees.Database
    Params = <>
    SQL.Strings = (
      'select FINI_Clep, FINI_Lib, FINI_Declasse from FINITION'
      'where FINI_Declasse = 1'
      'ORDER BY FINI_Lib')
    Left = 88
    Top = 379
  end
  object zq_FinitionNonDeclasse: TIBQuery
    Database = M_Donnees.Database
    Params = <>
    SQL.Strings = (
      'select FINI_Clep,FINI_Lib, FINI_Declasse from FINITION'
      'where FINI_Declasse = 0'
      'ORDER BY FINI_Lib')
    Left = 96
    Top = 432
  end
  object ds_FinitionNonDeclasse: TDataSource
    DataSet = zq_FinitionNonDeclasse
    Left = 8
    Top = 430
  end
  object zq_dts: TIBQuery
    Database = M_Donnees.Database
    CursorType = ctStatic
    Filtered = True
    Params = <>
    SQL.Strings = (
      'select * from fn_integration_dts()')
    Left = 856
    Top = 461
  end
  object zq_detache_cmd: TIBQuery
    Database = M_Donnees.Database
    CursorType = ctStatic
    Filtered = True
    Params = <
      item
        Name = 'serveur'
        Size = -1
        Value = Null
      end>
    SQL.Strings = (
      'select * from fn_detache_cmd(:serveur)')
    Left = 800
    Top = 469
  end
  object zq_detache_base: TIBQuery
    Database = M_Donnees.Database
    CursorType = ctStatic
    Filtered = True
    Params = <
      item
        Name = 'baseaccess'
        Size = -1
        Value = Null
      end
      item
        Name = 'baserepr'
        Size = -1
        Value = Null
      end>
    SQL.Strings = (
      'select * from fn_detache_base(:baseaccess,:baserepr)')
    Left = 912
    Top = 461
  end
  object zq_Pays: TIBQuery
    Database = M_Donnees.Database
    CursorLocation = clUseServer
    Params = <
      item
        Name = 'orderby'
        Attributes = [paLong]
        DataType = ftVariant
        Size = 150
        Value = 'PAYS_Clep ASC'
      end>
    SQL.Strings = (
      'SELECT * FROM PAYS'
      'ORDER BY PAYS_Clep')
    Left = 944
    Top = 224
  end
  object zq_ClieInter: TIBQuery
    Database = M_Donnees.Database
    CursorType = ctStatic
    AfterInsert = zq_ClieInterAfterInsert
    BeforePost = zq_ClieInterBeforePost
    AfterPost = zq_ClieInterAfterPost
    Params = <
      item
        Name = 'client'
        Attributes = [paSigned, paNullable]
        DataType = ftString
        Size = 100
        Value = ''
      end>
    SQL.Strings = (
      'select * from INTERLOCUTEUR'
      'where INTE__CLIE = :client')
    Left = 436
    Top = 13
  end
  object zq_PaysClient: TIBQuery
    Database = M_Donnees.Database
    CursorLocation = clUseServer
    Params = <
      item
        Name = 'pays'
        Attributes = [paSigned, paNullable]
        DataType = ftString
        Size = 100
        Value = ''
      end>
    SQL.Strings = (
      'SELECT * FROM CLIENT'
      'WHERE CLIE__PAYS = :pays')
    Left = 936
    Top = 272
  end
  object zq_TypeFini: TIBQuery
    Database = M_Donnees.Database
    CursorType = ctStatic
    SQL.Strings = ('SELECT * FROM TYPE_FINITION')
    Left = 88
    Top = 324
  end
  object ds_TypeFini: TDataSource
    DataSet = zq_TypeFini
    Left = 16
    Top = 324
  end
  object zq_affe_devi: TIBQuery
    Database = M_Donnees.Database
    Params = <
      item
        Name = 'client'
        Size = -1
        Value = Null
      end
      item
        Name = 'affe'
        Size = -1
        Value = Null
      end>
    SQL.Strings = (
      'select * from LIGNE_DEVIS, DEVIS'
      'where DEVI_Clep1 = LIDE__DEVI_1'
      'and DEVI_Clep2 = LIDE__DEVI_2'
      'and DEVI__TYDE = LIDE__TYDE'
      'and DEVI__CLIE1 = :client'
      'and LIDE__AFFE = :affe')
    Left = 248
    Top = 312
  end
end
