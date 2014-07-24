object M_DmCompose: TM_DmCompose
  OldCreateOrder = False
  Left = 162
  Top = 68
  Height = 679
  Width = 814
  object zq_Structure: TIBQuery
    Database = M_Donnees.Database
    CursorType = ctStatic
    AfterInsert = zq_StructureAfterInsert
    BeforePost = zq_StructureBeforePost
    AfterPost = zq_StructureAfterPost
    AfterScroll = zq_StructureAfterScroll
    OnDeleteError = zq_StructureDeleteError
    Params = <
      item
        Name = 'ArticleC'
        DataType = ftString
        Size = 20
        Value = ''
      end>
    SQL.Strings = (
      'select * FROM STRUCTURE')
    Left = 112
    Top = 16
  end
  object ds_Structure: TDataSource
    DataSet = zq_Structure
    Left = 24
    Top = 16
  end
  object zq_BranInBran: TIBQuery
    Database = M_Donnees.Database
    CursorType = ctStatic
    Params = <
      item
        Name = 'groupe'
        Attributes = [paSigned, paNullable]
        DataType = ftString
        Size = -1
        Value = ''
      end>
    SQL.Strings = (
      'select  STRU_Clep, STRU_Libelle FROM STRUCTURE,STRUCTURE_LIEE'
      'where STRU_Clep = STLI__Enfant '
      'and STLI__Parent = :groupe'
      'ORDER BY STRU_Libelle')
    Left = 112
    Top = 64
  end
  object ds_BranInBran: TDataSource
    DataSet = zq_BranInBran
    Left = 24
    Top = 64
  end
  object zq_BranOutBr: TIBQuery
    Database = M_Donnees.Database
    CursorType = ctStatic
    OnFilterRecord = zq_BranOutBrFilterRecord
    Params = <
      item
        Name = 'groupe'
        Attributes = [paSigned, paNullable]
        DataType = ftString
        Size = -1
        Value = ''
      end>
    SQL.Strings = (
      'DECLARE @Stru_groupe AS varchar ( 30 )'
      ''
      'SET @Stru_groupe = :groupe'
      ''
      'select  STRU_Clep, STRU_Libelle FROM STRUCTURE'
      'where STRU_Clep <> @Stru_groupe'
      
        'AND STRU_Clep NOT IN ( SELECT * FROM fn_mc_retrouve_branches_enf' +
        'ants  ( @Stru_groupe ))'
      
        'AND STRU_Clep NOT IN ( SELECT * FROM fn_mc_retrouve_branches_par' +
        'entes ( @Stru_groupe ))'
      'AND STRU_Type > 1'
      'ORDER BY STRU_Libelle')
    Left = 112
    Top = 112
  end
  object ds_BranOutBr: TDataSource
    DataSet = zq_BranOutBr
    Left = 24
    Top = 112
  end
  object zq_ComInBran: TIBQuery
    Database = M_Donnees.Database
    CursorType = ctStatic
    Params = <
      item
        Name = 'groupe'
        Attributes = [paSigned, paNullable]
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 20
        Value = ''
      end>
    SQL.Strings = (
      'select  COMP_Clep, COMP_Lib FROM COMPOSANT,STRUCTURE_COMPOSANT'
      'where COMP_Clep = SCOM__COMP'
      'and SCOM__STRU = :groupe'
      'ORDER BY COMP_Lib')
    Left = 112
    Top = 160
  end
  object ds_ComInBran: TDataSource
    DataSet = zq_ComInBran
    Left = 24
    Top = 160
  end
  object zq_ComOutBran: TIBQuery
    Database = M_Donnees.Database
    CursorType = ctStatic
    OnFilterRecord = zq_ComOutBranFilterRecord
    Params = <
      item
        Name = 'groupe'
        Attributes = [paSigned, paNullable]
        DataType = ftString
        Size = 30
        Value = ''
      end>
    SQL.Strings = (
      'select  COMP_Clep, COMP_Lib FROM COMPOSANT'
      
        'where COMP_Clep not in (select SCOM__COMP from STRUCTURE_COMPOSA' +
        'NT'
      'where SCOM__STRU = :groupe)'
      'ORDER BY COMP_Lib'
      '')
    Left = 112
    Top = 208
  end
  object ds_ComOutBra: TDataSource
    DataSet = zq_ComOutBran
    Left = 24
    Top = 208
  end
  object zq_CompInBra: TIBQuery
    Database = M_Donnees.Database
    CursorType = ctStatic
    Params = <
      item
        Name = 'groupe'
        Attributes = [paSigned, paNullable]
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 20
        Value = ''
      end>
    SQL.Strings = (
      'select  CPTM_Clep FROM COMPORTEMENT,STRUCTURE_CPTM_ACT'
      'where CPTM_Clep = SCPA__CPTM'
      'and SCPA__STRU = :groupe'
      'ORDER BY CPTM_Clep')
    Left = 112
    Top = 256
  end
  object ds_CompInBra: TDataSource
    DataSet = zq_CompInBra
    Left = 24
    Top = 256
  end
  object zq_CompOutBra: TIBQuery
    Database = M_Donnees.Database
    CursorType = ctStatic
    OnFilterRecord = zq_CompOutBraFilterRecord
    Params = <
      item
        Name = 'groupe'
        Attributes = [paSigned, paNullable]
        DataType = ftString
        Size = 2
        Value = '-1'
      end>
    SQL.Strings = (
      'declare @groupe as varchar ( 30 )'
      ''
      'SET @groupe = :groupe'
      'select  CPTM_Clep FROM COMPORTEMENT'
      
        'where CPTM_Clep not in (select SCPA__CPTM from STRUCTURE_CPTM_AC' +
        'T'
      'where SCPA__STRU = @groupe)'
      'ORDER BY CPTM_Clep')
    Left = 112
    Top = 304
  end
  object ds_CompOutBra: TDataSource
    DataSet = zq_CompOutBra
    Left = 24
    Top = 304
  end
  object zq_ComsInBra: TIBQuery
    Database = M_Donnees.Database
    CursorType = ctStatic
    Params = <
      item
        Name = 'groupe'
        Attributes = [paSigned, paNullable]
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 20
        Value = ''
      end>
    SQL.Strings = (
      'select  CPTM_Clep FROM COMPORTEMENT,STRUCTURE_CPTM_SEL'
      'where CPTM_Clep=SCPS__CPTM'
      'and SCPS__STRU = :groupe'
      'ORDER BY CPTM_Clep')
    Left = 112
    Top = 352
  end
  object ds_ComsInBra: TDataSource
    DataSet = zq_ComsInBra
    Left = 24
    Top = 352
  end
  object zq_ComsOutBra: TIBQuery
    Database = M_Donnees.Database
    CursorType = ctStatic
    OnFilterRecord = zq_ComsOutBraFilterRecord
    Params = <
      item
        Name = 'groupe'
        Attributes = [paSigned, paNullable]
        DataType = ftString
        Size = -1
        Value = ''
      end>
    SQL.Strings = (
      'declare @groupe as varchar ( 30 )'
      ''
      'SET @groupe = :groupe'
      'select  CPTM_Clep FROM COMPORTEMENT'
      
        'where CPTM_Clep not in (select SCPS__CPTM from STRUCTURE_CPTM_SE' +
        'L'
      'where SCPS__STRU = @groupe)'
      'ORDER BY CPTM_Clep')
    Left = 112
    Top = 400
  end
  object ds_ComsOutBra: TDataSource
    DataSet = zq_ComsOutBra
    Left = 24
    Top = 400
  end
  object ds_Comportem: TDataSource
    DataSet = zq_Comportem
    Left = 208
    Top = 16
  end
  object zq_Comportem: TIBQuery
    Database = M_Donnees.Database
    CursorType = ctStatic
    OnDeleteError = zq_ComportemDeleteError
    Params = <>
    SQL.Strings = (
      'select * FROM COMPORTEMENT')
    Left = 296
    Top = 16
  end
  object zq_ArtInBran: TIBQuery
    Database = M_Donnees.Database
    CursorType = ctStatic
    Params = <
      item
        Name = 'groupe'
        Attributes = [paSigned, paNullable]
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 20
        Value = ''
      end>
    SQL.Strings = (
      'select  ARTI_Clep, ARTI_Libcom FROM ARTICLE, ARTICLE_STRUCTURE'
      'where ARTI_Clep = ARST__ARTI'
      'and ARST__STRU = :groupe'
      'ORDER BY ARTI_Libcom')
    Left = 112
    Top = 448
  end
  object ds_ArtInBran: TDataSource
    DataSet = zq_ArtInBran
    Left = 24
    Top = 448
  end
  object zq_ArtOutBran: TIBQuery
    Database = M_Donnees.Database
    CursorType = ctStatic
    OnFilterRecord = zq_ArtOutBranFilterRecord
    Params = <
      item
        Name = 'groupe'
        Attributes = [paSigned, paNullable]
        DataType = ftString
        Size = -1
        Value = ''
      end>
    SQL.Strings = (
      'select  ARTI_Clep, ARTI_Libcom FROM ARTICLE'
      'where ARTI_Clep not in (select ARST__ARTI from ARTICLE_STRUCTURE'
      'where ARST__STRU = :groupe)'
      'AND  ARTI_Compose = 1'
      'ORDER BY ARTI_Libcom')
    Left = 112
    Top = 496
  end
  object ds_ArtOutBran: TDataSource
    DataSet = zq_ArtOutBran
    Left = 24
    Top = 496
  end
  object zq_RetrouvArt: TIBQuery
    Database = M_Donnees.Database
    CursorType = ctStatic
    Params = <
      item
        Name = 'STRU_Clep'
        Attributes = [paSigned, paNullable]
        DataType = ftString
        Size = 20
        Value = ''
      end>
    SQL.Strings = (
      'SELECT * FROM fn_mc_retrouve_article_compose (:STRU_Clep)')
    Left = 296
    Top = 64
  end
  object ds_RetrouvArt: TDataSource
    DataSet = zq_RetrouvArt
    Left = 208
    Top = 64
  end
  object zq_BranInComp: TIBQuery
    Database = M_Donnees.Database
    CursorType = ctStatic
    Params = <
      item
        Name = 'groupe'
        Attributes = [paSigned, paNullable]
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 50
        Value = ''
      end>
    SQL.Strings = (
      
        'select  STRU_Clep, STRU_Libelle FROM STRUCTURE,STRUCTURE_CPTM_AC' +
        'T'
      'where STRU_Clep = SCPA__STRU'
      'and SCPA__CPTM = :groupe'
      'ORDER BY STRU_Libelle')
    Left = 296
    Top = 112
  end
  object ds_BranInComp: TDataSource
    DataSet = zq_BranInComp
    Left = 208
    Top = 112
  end
  object zq_BranOutComp: TIBQuery
    Database = M_Donnees.Database
    CursorType = ctStatic
    OnFilterRecord = zq_BranOutCompFilterRecord
    Params = <
      item
        Name = 'groupe'
        Attributes = [paSigned, paNullable]
        DataType = ftString
        Size = -1
        Value = ''
      end>
    SQL.Strings = (
      'declare @groupe as varchar ( 50 )'
      ''
      'SET @groupe = :groupe'
      'select  STRU_Clep, STRU_Libelle FROM STRUCTURE'
      
        'where STRU_Clep not in (select SCPA__STRU from STRUCTURE_CPTM_AC' +
        'T'
      'where SCPA__CPTM = @groupe)'
      'ORDER BY STRU_Libelle')
    Left = 296
    Top = 160
  end
  object ds_BranOutCom: TDataSource
    DataSet = zq_BranOutComp
    Left = 208
    Top = 160
  end
  object zq_BranInSel: TIBQuery
    Database = M_Donnees.Database
    CursorType = ctStatic
    Params = <
      item
        Name = 'groupe'
        Attributes = [paSigned, paNullable]
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 50
        Value = ''
      end>
    SQL.Strings = (
      
        'select  STRU_Clep, STRU_Libelle FROM STRUCTURE,STRUCTURE_CPTM_SE' +
        'L'
      'where STRU_Clep=SCPS__STRU'
      'and SCPS__CPTM = :groupe'
      'ORDER BY STRU_Libelle')
    Left = 296
    Top = 208
  end
  object ds_BranInSel: TDataSource
    DataSet = zq_BranInSel
    Left = 208
    Top = 208
  end
  object zq_BranOutSel: TIBQuery
    Database = M_Donnees.Database
    CursorType = ctStatic
    OnFilterRecord = zq_BranOutSelFilterRecord
    Params = <
      item
        Name = 'groupe'
        Attributes = [paSigned, paNullable]
        DataType = ftString
        Size = -1
        Value = ''
      end>
    SQL.Strings = (
      'declare @groupe as varchar ( 50 )'
      ''
      'SET @groupe = :groupe'
      'select  STRU_Clep, STRU_Libelle FROM STRUCTURE'
      
        'where STRU_Clep not in (select SCPS__STRU from STRUCTURE_CPTM_SE' +
        'L'
      'where SCPS__CPTM = @groupe)'
      'ORDER BY STRU_Libelle')
    Left = 296
    Top = 256
  end
  object ds_BranOutSel: TDataSource
    DataSet = zq_BranOutSel
    Left = 208
    Top = 256
  end
  object zq_ArbreArtC: TIBQuery
    Database = M_Donnees.Database
    CursorType = ctStatic
    Params = <
      item
        Name = 'ArticleC'
        DataType = ftString
        Size = 20
        Value = ''
      end>
    SQL.Strings = (
      'select * '
      'from fn_mc_arbre_article_compose ( :ArticleC, 1)')
    Left = 296
    Top = 304
  end
  object ds_ArbreArtC: TDataSource
    DataSet = zq_ArbreArtC
    Left = 208
    Top = 304
  end
  object zq_BrLieBrIn: TIBQuery
    Database = M_Donnees.Database
    CursorType = ctStatic
    Params = <
      item
        Name = 'groupe'
        Attributes = [paSigned, paNullable]
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 20
        Value = ''
      end>
    SQL.Strings = (
      'select  STRU_Clep, STRU_Libelle FROM STRUCTURE,STRUCTURE_LIEE'
      'where STRU_Clep = STLI__Parent'
      'and STLI__Enfant = :groupe'
      'ORDER BY STRU_Libelle')
    Left = 296
    Top = 352
  end
  object ds_BrLieBrIn: TDataSource
    DataSet = zq_BrLieBrIn
    Left = 208
    Top = 352
  end
  object zq_BrLieBrOut: TIBQuery
    Database = M_Donnees.Database
    CursorType = ctStatic
    OnFilterRecord = zq_BrLieBrOutFilterRecord
    Params = <
      item
        Name = 'groupe'
        Attributes = [paSigned, paNullable]
        DataType = ftString
        Size = 20
        Value = ''
      end>
    SQL.Strings = (
      'declare @Stru_groupe as varchar ( 30 )'
      ''
      'SET @Stru_groupe = :groupe'
      ''
      'select  STRU_Clep, STRU_Libelle FROM STRUCTURE'
      
        'where STRU_Clep NOT IN ( SELECT * FROM fn_mc_retrouve_branches_e' +
        'nfants  ( @Stru_groupe ))'
      
        'AND STRU_Clep NOT IN ( SELECT * FROM fn_mc_retrouve_branches_par' +
        'entes ( @Stru_groupe ))'
      'AND STRU_Clep <> @Stru_groupe'
      'ORDER BY STRU_Libelle')
    Left = 296
    Top = 400
  end
  object ds_BrLieBrOut: TDataSource
    DataSet = zq_BrLieBrOut
    Left = 208
    Top = 400
  end
  object zq_BranInArt: TIBQuery
    Database = M_Donnees.Database
    CursorType = ctStatic
    Params = <
      item
        Name = 'groupe'
        Attributes = [paSigned, paNullable]
        DataType = ftString
        Size = -1
        Value = ''
      end>
    SQL.Strings = (
      'select  STRU_Clep, STRU_Libelle FROM STRUCTURE,ARTICLE_STRUCTURE'
      'where STRU_Clep= ARST__STRU'
      'AND ARST__ARTI = :groupe'
      'ORDER BY STRU_Libelle')
    Left = 288
    Top = 456
  end
  object ds_BranInArt: TDataSource
    DataSet = zq_BranInArt
    Left = 208
    Top = 456
  end
  object zq_BranOutArt: TIBQuery
    Database = M_Donnees.Database
    CursorType = ctStatic
    OnFilterRecord = zq_BranOutArtFilterRecord
    Params = <
      item
        Name = 'groupe'
        Attributes = [paSigned, paNullable]
        DataType = ftString
        Size = -1
        Value = ''
      end>
    SQL.Strings = (
      'select  STRU_Clep, STRU_Libelle FROM STRUCTURE'
      'where STRU_Clep not in (select ARST__STRU from ARTICLE_STRUCTURE'
      'where ARST__ARTI = :groupe)'
      'AND STRU_Type=1'
      'ORDER BY STRU_Libelle')
    Left = 288
    Top = 504
  end
  object ds_BranOutArt: TDataSource
    DataSet = zq_BranOutArt
    Left = 208
    Top = 504
  end
  object zq_ArticleC: TIBQuery
    Database = M_Donnees.Database
    CursorType = ctStatic
    Filter = 'ARTI_Compose=1'
    Filtered = True
    SQL.Strings = ('SELECT * FROM ARTICLE')
    Left = 456
    Top = 16
  end
  object ds_ArticleC: TDataSource
    DataSet = zq_ArticleC
    Left = 384
    Top = 16
  end
  object zq_ArbreArt: TIBQuery
    Database = M_Donnees.Database
    CursorType = ctStatic
    AfterOpen = zq_ArbreArtAfterOpen
    Params = <
      item
        Name = 'ArticleC'
        DataType = ftString
        Size = 20
        Value = ''
      end>
    SQL.Strings = (
      'select * '
      'from fn_mc_arbre_article_compose ( :ArticleC, 2 )')
    Left = 456
    Top = 64
  end
  object ds_ArbreArt: TDataSource
    DataSet = zq_ArbreArt
    Left = 384
    Top = 64
  end
  object zq_Temp: TIBQuery
    Database = M_Donnees.Database
    CursorType = ctStatic
    LockType = ltReadOnly
    AfterOpen = zq_TempAfterOpen
    Params = <
      item
        Name = 'ArticleC'
        DataType = ftString
        Size = 20
        Value = ''
      end>
    SQL.Strings = (
      
        'select SUM (ARDE_Prix) AS ARDE_Prix, SUM (ARDE_Prixfutur) AS ARD' +
        'E_Prixfutur'
      'from fn_mc_arbre_article_compose ( :ArticleC, 1 )'
      'WHERE ARDE_Table = '#39'STRU_COMP'#39)
    Left = 456
    Top = 112
  end
  object ds_Temp: TDataSource
    DataSet = zq_Temp
    Left = 384
    Top = 112
  end
  object ds_Compose: TDataSource
    DataSet = zq_Compose
    Left = 384
    Top = 160
  end
  object zq_Compose: TIBQuery
    Database = M_Donnees.Database
    CursorType = ctStatic
    LockType = ltReadOnly
    AfterOpen = zq_ComposeAfterOpen
    Params = <
      item
        Name = 'ArticleC'
        DataType = ftString
        Size = 20
        Value = ''
      end>
    SQL.Strings = (
      '')
    Left = 456
    Top = 160
  end
  object zq_Comporte: TIBQuery
    Database = M_Donnees.Database
    CursorType = ctStatic
    BeforeOpen = zq_ComporteBeforeOpen
    Params = <
      item
        Name = 'groupe'
        DataType = ftString
        Size = 30
        Value = ''
      end>
    SQL.Strings = (
      'select  * FROM COMPORTEMENT'
      'where CPTM_Clep in (select SCPA__CPTM from STRUCTURE_CPTM_ACT'
      'where SCPA__STRU = :groupe)')
    Left = 456
    Top = 208
  end
  object ds_Comporte: TDataSource
    DataSet = zq_Comporte
    Left = 384
    Top = 208
  end
  object zq_SelectStru: TIBQuery
    Database = M_Donnees.Database
    CursorType = ctStatic
    BeforeOpen = zq_SelectStruBeforeOpen
    Params = <
      item
        Name = 'groupe'
        DataType = ftString
        Size = 30
        Value = ''
      end>
    SQL.Strings = (
      'select  * FROM COMPORTEMENT'
      'where CPTM_Clep in (select SCPS__CPTM from STRUCTURE_CPTM_SEL'
      'where SCPS__STRU = :groupe)')
    Left = 460
    Top = 256
  end
  object ds_SelectStru: TDataSource
    DataSet = zq_SelectStru
    Left = 388
    Top = 256
  end
  object zq_ArbrDevi: TIBQuery
    Database = M_Donnees.Database
    CursorType = ctStatic
    LockType = ltReadOnly
    Params = <
      item
        Name = 'ArticleC'
        DataType = ftString
        Size = 20
        Value = ''
      end>
    SQL.Strings = (
      'select *'
      'from fn_mc_arbre_article_compose ( :ArticleC, 1 )'
      'WHERE ARDE_Table = '#39'STRUCTURE_COMPOSANT'#39)
    Left = 464
    Top = 304
  end
  object ds_BrType: TDataSource
    DataSet = zq_BrType
    Left = 376
    Top = 352
  end
  object zq_BrType: TIBQuery
    Database = M_Donnees.Database
    CursorType = ctStatic
    OnDeleteError = zq_ComportemDeleteError
    Params = <>
    SQL.Strings = (
      'select * FROM TYPE_STRUCTURE'
      'ORDER BY TYST_Libelle')
    Left = 456
    Top = 352
  end
  object ds_BrSelect: TDataSource
    DataSet = zq_BrSelect
    Left = 376
    Top = 400
  end
  object zq_BrSelect: TIBQuery
    Database = M_Donnees.Database
    CursorType = ctStatic
    AfterOpen = zq_BrSelectAfterOpen
    OnDeleteError = zq_ComportemDeleteError
    Params = <>
    SQL.Strings = (
      'select * FROM CHECKER_ARBRE'
      'ORDER BY CHAR_Libelle')
    Left = 456
    Top = 400
  end
  object zq_Comclasse: TIBQuery
    Database = M_Donnees.Database
    CursorType = ctStatic
    OnFilterRecord = zq_ComclasseFilterRecord
    Params = <
      item
        Name = 'groupe'
        Attributes = [paSigned, paNullable]
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 20
        Value = ''
      end>
    SQL.Strings = (
      'select  COMP_Clep, COMP_Lib, COMP_Declasse FROM COMPOSANT'
      'where COMP_Declasse=0'
      'ORDER BY COMP_Lib')
    Left = 456
    Top = 448
  end
  object ds_Comclasse: TDataSource
    DataSet = zq_Comclasse
    Left = 376
    Top = 448
  end
  object zq_ComDeclas: TIBQuery
    Database = M_Donnees.Database
    CursorType = ctStatic
    OnFilterRecord = zq_ComDeclasFilterRecord
    Params = <
      item
        Name = 'groupe'
        Attributes = [paSigned, paNullable]
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 20
        Value = ''
      end>
    SQL.Strings = (
      'select  COMP_Clep, COMP_Lib, COMP_Declasse FROM COMPOSANT'
      'where COMP_Declasse=1'
      'ORDER BY COMP_Lib')
    Left = 456
    Top = 496
  end
  object ds_ComDeclas: TDataSource
    DataSet = zq_ComDeclas
    Left = 376
    Top = 496
  end
  object zq_CompCoul: TIBQuery
    Database = M_Donnees.Database
    CursorType = ctStatic
    BeforePost = zq_CompCoulBeforePost
    AfterCancel = zq_CompCoulAfterCancel
    OnNewRecord = zq_CompCoulNewRecord
    Params = <>
    SQL.Strings = (
      'select * '
      'from COMPOSANT_FINITION')
    Left = 624
    Top = 452
  end
  object ds_CompCoul: TDataSource
    DataSet = zq_CompCoul
    Left = 544
    Top = 452
  end
  object zq_composant: TIBQuery
    Database = M_Donnees.Database
    CursorType = ctStatic
    AfterOpen = zq_composantAfterOpen
    AfterPost = zq_composantAfterPost
    AfterScroll = zq_composantAfterScroll
    OnNewRecord = zq_composantNewRecord
    Params = <>
    SQL.Strings = (
      'select * from COMPOSANT'
      'where COMP_Lib <> '#39'Integrite'#39
      'and COMP_Lib <> '#39'Int'#233'grit'#233#39
      'and COMP_Declasse = 0')
    Left = 627
    Top = 499
  end
  object ds_Composant: TDataSource
    DataSet = zq_composant
    Left = 540
    Top = 499
  end
  object ds_CoFini: TDataSource
    DataSet = zq_CoFini
    Left = 544
    Top = 403
  end
  object zq_code_copiecomp: TIBQuery
    Database = M_Donnees.Database
    Params = <
      item
        Name = 'clep1'
        Size = -1
        Value = Null
      end>
    SQL.Strings = (
      'declare @clep1 varchar (12)'
      ''
      'SET @clep1 = :clep1'
      ''
      
        'select cast(substring(COMP_Clep,len('#39'Z'#39'+ RTRIM(@clep1)) +1,len(C' +
        'OMP_Clep)) as int) '
      'from COMPOSANT'
      'where COMP_Clep like ('#39'Z'#39' + RTRIM(@clep1) +'#39'%'#39')'
      'and len(RTRIM(@clep1)) + 2 <= 12 '
      'order by 1 desc')
    Left = 544
    Top = 544
  end
  object zq_copiecomp: TIBQuery
    Database = M_Donnees.Database
    Params = <
      item
        Name = 'cle1'
        Size = -1
        Value = Null
      end
      item
        Name = 'cle2'
        Size = -1
        Value = Null
      end>
    SQL.Strings = (
      'exec ps_copie_composant :cle1, :cle2')
    Left = 648
    Top = 544
  end
  object zq_CoFini: TIBQuery
    Database = M_Donnees.Database
    CursorType = ctStatic
    BeforePost = zq_CompCoulBeforePost
    OnNewRecord = zq_CompCoulNewRecord
    Params = <
      item
        Name = 'finition'
        Attributes = [paSigned, paNullable]
        DataType = ftString
        Size = 200
        Value = ''
      end>
    SQL.Strings = (
      'select * '
      'from FINITION'
      'WHERE FINI_Clep = :finition')
    Left = 624
    Top = 404
  end
end
