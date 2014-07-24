object M_Article: TM_Article
  OldCreateOrder = False
  left = 97
  top = 65516
  Height = 823
  HorizontalOffset = 0
  VerticalOffset = 24
  Width = 1032
  object ds_article: TDatasource
    DataSet = zq_Article1
    left = 8
    top = 13
  end
  object zq_artcoul: TIBQuery
    Database = M_Donnees.Database
    BeforeInsert = zq_Article1BeforeEdit
    BeforeEdit = zq_Article1BeforeEdit
    BeforePost = zq_artcoulBeforePost
    AfterCancel = zq_artcoulAfterCancel
    BeforeDelete = zq_Article1BeforeEdit
    OnNewRecord = zq_artcoulNewRecord
    SQL.Strings = (
      'select * '
      'from ARTICLE_FINITION'
      'where ARFI__ARTI = :article'
    )
    Params = <    
      item
        DataType = ftUnknown
        Name = 'article'
        ParamType = ptUnknown
        Size = -1
      end>
    left = 88
    top = 61
    ParamData = <    
      item
        DataType = ftUnknown
        Name = 'article'
        ParamType = ptUnknown
        Size = -1
      end>
  end
  object ds_ARCO: TDatasource
    DataSet = zq_artcoul
    left = 8
    top = 61
  end
  object ds_GamTProIn: TDatasource
    DataSet = zq_GamTProIn
    left = 515
    top = 64
  end
  object zq_GamTProIn: TIBQuery
    Database = M_Donnees.Database
    SQL.Strings = (
      'select  TYPR_Clep, TYPR_Libelle FROM TYPE_PRODUIT, GAMME_TYPR'
      'where TYPR_Clep = GATY__TYPR'
      'and GATY__GAMM = :groupe'
      'ORDER BY TYPR_Libelle'
    )
    Params = <    
      item
        DataType = ftString
        Name = 'groupe'
        NumericScale = 255
        ParamType = ptUnknown
        Precision = 255
        Size = 5
      end>
    left = 592
    top = 64
    ParamData = <    
      item
        DataType = ftString
        Name = 'groupe'
        NumericScale = 255
        ParamType = ptUnknown
        Precision = 255
        Size = 5
      end>
  end
  object ds_GamTProOut: TDatasource
    DataSet = zq_GamTProOut
    left = 515
    top = 109
  end
  object zq_GamTProOut: TIBQuery
    Database = M_Donnees.Database
    SQL.Strings = (
      'select  TYPR_Clep, TYPR_Libelle FROM TYPE_PRODUIT'
      'where TYPR_Clep NOT in (select GATY__TYPR from GAMME_TYPR'
      'where GATY__GAMM = :groupe)'
      'ORDER BY TYPR_Libelle'
    )
    Params = <    
      item
        DataType = ftString
        Name = 'groupe'
        ParamType = ptUnknown
        Size = -1
      end>
    left = 592
    top = 109
    ParamData = <    
      item
        DataType = ftString
        Name = 'groupe'
        ParamType = ptUnknown
        Size = -1
      end>
  end
  object zq_Gamme: TIBQuery
    Database = M_Donnees.Database
    SQL.Strings = (
      'SELECT * from GAMME'
    )
    Params = <>
    left = 592
    top = 17
  end
  object ds_Gamme: TDatasource
    DataSet = zq_Gamme
    left = 515
    top = 17
  end
  object ds_TyPGamIn: TDatasource
    DataSet = zq_TyPGamIn
    left = 515
    top = 204
  end
  object zq_TyPGamIn: TIBQuery
    Database = M_Donnees.Database
    SQL.Strings = (
      'select  GAMM_Clep, GAMM_Libelle FROM GAMME, GAMME_TYPR'
      'where GAMM_Clep = GATY__GAMM'
      'and GATY__TYPR = :groupe'
      'ORDER BY GAMM_Libelle'
    )
    Params = <    
      item
        DataType = ftString
        Name = 'groupe'
        NumericScale = 255
        ParamType = ptUnknown
        Precision = 255
        Size = 12
      end>
    left = 592
    top = 204
    ParamData = <    
      item
        DataType = ftString
        Name = 'groupe'
        NumericScale = 255
        ParamType = ptUnknown
        Precision = 255
        Size = 12
      end>
  end
  object zq_TypProduit: TIBQuery
    Database = M_Donnees.Database
    SQL.Strings = (
      'SELECT * from TYPE_PRODUIT'
    )
    Params = <>
    left = 592
    top = 157
  end
  object ds_TypProduit: TDatasource
    DataSet = zq_TypProduit
    left = 515
    top = 157
  end
  object ds_TyPGamOut: TDatasource
    DataSet = zq_TyPGamOut
    left = 515
    top = 252
  end
  object zq_TyPGamOut: TIBQuery
    Database = M_Donnees.Database
    SQL.Strings = (
      'select  GAMM_Clep, GAMM_Libelle FROM GAMME'
      'where GAMM_Clep not in (select GATY__GAMM from GAMME_TYPR'
      'where GATY__TYPR = :groupe)'
      'ORDER BY GAMM_Libelle'
    )
    Params = <    
      item
        DataType = ftString
        Name = 'groupe'
        ParamType = ptUnknown
        Size = -1
      end>
    left = 592
    top = 252
    ParamData = <    
      item
        DataType = ftString
        Name = 'groupe'
        ParamType = ptUnknown
        Size = -1
      end>
  end
  object ds_TyPCaraIn: TDatasource
    DataSet = zq_TyPCaraIn
    left = 515
    top = 300
  end
  object zq_TyPCaraIn: TIBQuery
    Database = M_Donnees.Database
    SQL.Strings = (
      'select  CARA_Clep, CARA_Libelle FROM CARACTERISTIQUE,TYPE_PRODUIT_CARA'
      'where CARA_Clep =TYPC__CARA '
      'and TYPC__TYPR = :groupe'
      'ORDER BY CARA_Libelle'
    )
    Params = <    
      item
        DataType = ftString
        Name = 'groupe'
        NumericScale = 255
        ParamType = ptUnknown
        Precision = 255
        Size = 12
      end>
    left = 592
    top = 300
    ParamData = <    
      item
        DataType = ftString
        Name = 'groupe'
        NumericScale = 255
        ParamType = ptUnknown
        Precision = 255
        Size = 12
      end>
  end
  object ds_TyPCaraOut: TDatasource
    DataSet = zq_TyPCaraOut
    left = 515
    top = 348
  end
  object zq_TyPCaraOut: TIBQuery
    Database = M_Donnees.Database
    SQL.Strings = (
      'select  CARA_Clep, CARA_Libelle FROM CARACTERISTIQUE'
      'where CARA_Clep NOT in (select TYPC__CARA from TYPE_PRODUIT_CARA'
      'where TYPC__TYPR = :groupe)'
      'ORDER BY CARA_Libelle'
    )
    Params = <    
      item
        DataType = ftString
        Name = 'groupe'
        ParamType = ptUnknown
        Size = -1
      end>
    left = 592
    top = 348
    ParamData = <    
      item
        DataType = ftString
        Name = 'groupe'
        ParamType = ptUnknown
        Size = -1
      end>
  end
  object ds_CaraTPIn: TDatasource
    DataSet = zq_CaraTPIn
    left = 684
    top = 308
  end
  object zq_CaraTPIn: TIBQuery
    Database = M_Donnees.Database
    SQL.Strings = (
      'select  TYPR_Clep, TYPR_Libelle FROM TYPE_PRODUIT, TYPE_PRODUIT_CARA'
      'where TYPR_Clep = TYPC__TYPR '
      'and TYPC__CARA = :groupe'
      'ORDER BY TYPR_Libelle'
    )
    Params = <    
      item
        DataType = ftString
        Name = 'groupe'
        NumericScale = 255
        ParamType = ptUnknown
        Precision = 255
        Size = 20
      end>
    left = 779
    top = 308
    ParamData = <    
      item
        DataType = ftString
        Name = 'groupe'
        NumericScale = 255
        ParamType = ptUnknown
        Precision = 255
        Size = 20
      end>
  end
  object zq_Carac: TIBQuery
    Database = M_Donnees.Database
    SQL.Strings = (
      'SELECT * from CARACTERISTIQUE'
    )
    Params = <>
    left = 779
    top = 260
  end
  object ds_Carac: TDatasource
    DataSet = zq_Carac
    left = 684
    top = 260
  end
  object ds_CaraTPOut: TDatasource
    DataSet = zq_CaraTPOut
    left = 684
    top = 356
  end
  object zq_CaraTPOut: TIBQuery
    Database = M_Donnees.Database
    SQL.Strings = (
      'select  TYPR_Clep, TYPR_Libelle FROM TYPE_PRODUIT'
      'where TYPR_Clep not in (select TYPC__TYPR from TYPE_PRODUIT_CARA'
      'where TYPC__CARA = :groupe)'
      'ORDER BY TYPR_Libelle'
    )
    Params = <    
      item
        DataType = ftString
        Name = 'groupe'
        ParamType = ptUnknown
        Size = 20
      end>
    left = 779
    top = 356
    ParamData = <    
      item
        DataType = ftString
        Name = 'groupe'
        ParamType = ptUnknown
        Size = 20
      end>
  end
  object ds_SelCarac: TDatasource
    DataSet = zq_SelCarac
    left = 688
    top = 113
  end
  object zq_SelCarac: TIBQuery
    Database = M_Donnees.Database
    SQL.Strings = (
      'select  * FROM CARACTERISTIQUE'
    )
    Params = <>
    left = 768
    top = 113
  end
  object zq_SelTypPro: TIBQuery
    Database = M_Donnees.Database
    AfterOpen = zq_SelTypProAfterOpen
    AfterScroll = zq_SelTypProAfterScroll
    SQL.Strings = (
      'select * FROM TYPE_PRODUIT'
    )
    Params = <>
    left = 768
    top = 61
  end
  object ds_SelTypPro: TDatasource
    DataSet = zq_SelTypPro
    left = 688
    top = 61
  end
  object zq_SelGamme: TIBQuery
    Database = M_Donnees.Database
    AfterOpen = zq_SelGammeAfterOpen
    AfterScroll = zq_SelGammeAfterScroll
    SQL.Strings = (
      'SELECT * from GAMME'
    )
    Params = <>
    left = 768
    top = 13
  end
  object ds_SelGamme: TDatasource
    DataSet = zq_SelGamme
    left = 688
    top = 13
  end
  object ds_Sel1Carac: TDatasource
    DataSet = zq_Sel1Carac
    left = 688
    top = 208
  end
  object zq_Sel1Carac: TIBQuery
    Database = M_Donnees.Database
    SQL.Strings = (
      'select  CARA_Clep, CARA_Libelle FROM CARACTERISTIQUE, TYPE_PRODUIT_CARA'
      'where CARA_Clep = TYPC__CARA'
      'AND TYPC__TYPR = :groupe'
      'ORDER BY CARA_Libelle'
    )
    Params = <    
      item
        DataType = ftString
        Name = 'groupe'
        NumericScale = 255
        ParamType = ptUnknown
        Precision = 255
        Size = 12
      end>
    left = 768
    top = 208
    ParamData = <    
      item
        DataType = ftString
        Name = 'groupe'
        NumericScale = 255
        ParamType = ptUnknown
        Precision = 255
        Size = 12
      end>
  end
  object zq_Sel1TypPro: TIBQuery
    Database = M_Donnees.Database
    AfterOpen = zq_SelTypProAfterOpen
    AfterScroll = zq_SelTypProAfterScroll
    SQL.Strings = (
      'select  TYPR_Clep, TYPR_Libelle FROM TYPE_PRODUIT, GAMME_TYPR'
      'where TYPR_Clep = GATY__TYPR'
      'AND GATY__GAMM = :groupe'
      'ORDER BY TYPR_Libelle'
    )
    Params = <    
      item
        DataType = ftString
        Name = 'groupe'
        NumericScale = 255
        ParamType = ptUnknown
        Precision = 255
        Size = 5
      end>
    left = 768
    top = 161
    ParamData = <    
      item
        DataType = ftString
        Name = 'groupe'
        NumericScale = 255
        ParamType = ptUnknown
        Precision = 255
        Size = 5
      end>
  end
  object ds_Sel1TypPro: TDatasource
    DataSet = zq_Sel1TypPro
    left = 688
    top = 161
  end
  object ds_SelCarac2: TDatasource
    DataSet = zq_SelCarac2
    left = 352
    top = 213
  end
  object zq_SelCarac2: TIBQuery
    Database = M_Donnees.Database
    SQL.Strings = (
      'select  * FROM CARACTERISTIQUE'
    )
    Params = <>
    left = 426
    top = 213
  end
  object zq_SelTypPro2: TIBQuery
    Database = M_Donnees.Database
    AfterOpen = zq_SelTypPro2AfterOpen
    AfterScroll = zq_SelTypPro2AfterScroll
    SQL.Strings = (
      'select * FROM TYPE_PRODUIT'
    )
    Params = <>
    left = 426
    top = 168
  end
  object ds_SelTypPro2: TDatasource
    DataSet = zq_SelTypPro2
    left = 352
    top = 168
  end
  object zq_GammeE: TIBQuery
    Database = M_Donnees.Database
    AfterOpen = zq_GammeEAfterOpen
    AfterScroll = zq_GammeEAfterScroll
    SQL.Strings = (
      'SELECT * from GAMME'
    )
    Params = <>
    left = 426
    top = 121
  end
  object ds_GammeE: TDatasource
    DataSet = zq_GammeE
    left = 352
    top = 121
  end
  object ds_Sel1Carac2: TDatasource
    DataSet = zq_Sel1Carac2
    left = 352
    top = 308
  end
  object zq_Sel1Carac2: TIBQuery
    Database = M_Donnees.Database
    SQL.Strings = (
      'select  CARA_Clep, CARA_Libelle FROM CARACTERISTIQUE, TYPE_PRODUIT_CARA'
      'where CARA_Clep = TYPC__CARA'
      'AND TYPC__TYPR = :groupe'
      'ORDER BY CARA_Libelle'
    )
    Params = <    
      item
        DataType = ftString
        Name = 'groupe'
        NumericScale = 255
        ParamType = ptUnknown
        Precision = 255
        Size = 12
      end>
    left = 426
    top = 308
    ParamData = <    
      item
        DataType = ftString
        Name = 'groupe'
        NumericScale = 255
        ParamType = ptUnknown
        Precision = 255
        Size = 12
      end>
  end
  object zq_Sel1TypPro2: TIBQuery
    Database = M_Donnees.Database
    AfterOpen = zq_Sel1TypPro2AfterOpen
    AfterScroll = zq_Sel1TypPro2AfterScroll
    SQL.Strings = (
      'select  TYPR_Clep, TYPR_Libelle FROM TYPE_PRODUIT, GAMME_TYPR'
      'where TYPR_Clep = GATY__TYPR'
      'AND GATY__GAMM = :groupe'
      'ORDER BY TYPR_Libelle'
    )
    Params = <    
      item
        DataType = ftString
        Name = 'groupe'
        NumericScale = 255
        ParamType = ptUnknown
        Precision = 255
        Size = 5
      end>
    left = 426
    top = 261
    ParamData = <    
      item
        DataType = ftString
        Name = 'groupe'
        NumericScale = 255
        ParamType = ptUnknown
        Precision = 255
        Size = 5
      end>
  end
  object ds_Sel1TypPro2: TDatasource
    DataSet = zq_Sel1TypPro2
    left = 352
    top = 261
  end
  object ds_ArFini: TDatasource
    DataSet = zq_ArFini
    left = 8
    top = 161
  end
  object zq_CocoCoul: TIBQuery
    Database = M_Donnees.Database
    Filter = 'FINI_Clep=NULL'
    Filtered = True
    SQL.Strings = (
      'SELECT * FROM FINITION'
    )
    Params = <>
    left = 88
    top = 208
  end
  object ds_CocoCoul: TDatasource
    DataSet = zq_CocoCoul
    left = 8
    top = 208
  end
  object zq_TyfiInFini: TIBQuery
    Database = M_Donnees.Database
    SQL.Strings = (
      'select  TYFI_Clep, TYFI_Libelle FROM TYPE_FINITION,GROUPE_FINITION'
      'where TYFI_Clep= GRFI__TYFI'
      'AND GRFI__FINI = :groupe'
      'ORDER BY TYFI_Libelle'
    )
    Params = <    
      item
        DataType = ftString
        Name = 'groupe'
        ParamType = ptUnknown
        Size = -1
      end>
    left = 88
    top = 253
    ParamData = <    
      item
        DataType = ftString
        Name = 'groupe'
        ParamType = ptUnknown
        Size = -1
      end>
  end
  object ds_TyfiInFini: TDatasource
    DataSet = zq_TyfiInFini
    left = 8
    top = 253
  end
  object zq_TyfiOutFini: TIBQuery
    Database = M_Donnees.Database
    SQL.Strings = (
      'select  TYFI_Clep, TYFI_Libelle FROM TYPE_FINITION'
      'where TYFI_Clep not in (select GRFI__TYFI from GROUPE_FINITION'
      'where GRFI__FINI = :groupe)'
      'ORDER BY TYFI_Libelle'
    )
    Params = <    
      item
        DataType = ftString
        Name = 'groupe'
        ParamType = ptUnknown
        Size = -1
      end>
    left = 88
    top = 301
    ParamData = <    
      item
        DataType = ftString
        Name = 'groupe'
        ParamType = ptUnknown
        Size = -1
      end>
  end
  object ds_TyfiOutFini: TDatasource
    DataSet = zq_TyfiOutFini
    left = 8
    top = 301
  end
  object zq_FiniInTyFi: TIBQuery
    Database = M_Donnees.Database
    Filter = 'FINI_Lib <> ''Integrite'' and FINI_Lib <> ''Intégrité'''
    Filtered = True
    SQL.Strings = (
      'select  FINI_Clep, FINI_Lib FROM FINITION,GROUPE_FINITION'
      'where FINI_Clep= GRFI__FINI'
      'AND GRFI__TYFI = :groupe'
      'ORDER BY FINI_Lib'
    )
    Params = <    
      item
        DataType = ftString
        Name = 'groupe'
        ParamType = ptUnknown
        Size = -1
      end>
    left = 88
    top = 348
    ParamData = <    
      item
        DataType = ftString
        Name = 'groupe'
        ParamType = ptUnknown
        Size = -1
      end>
  end
  object ds_FiniInTyFi: TDatasource
    DataSet = zq_FiniInTyFi
    left = 8
    top = 348
  end
  object zq_FiniOutTyFi: TIBQuery
    Database = M_Donnees.Database
    Filter = 'FINI_Lib <> ''Integrite'' and FINI_Lib <> ''Intégrité'''
    Filtered = True
    SQL.Strings = (
      'select  FINI_Clep, FINI_Lib FROM FINITION'
      'where FINI_Clep not in (select GRFI__FINI from GROUPE_FINITION'
      'where GRFI__TYFI = :groupe)'
      'ORDER BY FINI_Lib'
    )
    Params = <    
      item
        DataType = ftString
        Name = 'groupe'
        ParamType = ptUnknown
        Size = -1
      end>
    left = 88
    top = 396
    ParamData = <    
      item
        DataType = ftString
        Name = 'groupe'
        ParamType = ptUnknown
        Size = -1
      end>
  end
  object ds_FiniOutTyFi: TDatasource
    DataSet = zq_FiniOutTyFi
    left = 8
    top = 396
  end
  object ds_FiltreProduit: TDatasource
    DataSet = zq_FiltreProduit
    left = 170
    top = 61
  end
  object zq_FiltreProduit: TIBQuery
    Database = M_Donnees.Database
    SQL.Strings = (
      'SELECT * FROM FILTRE_PRODUIT'
    )
    Params = <>
    left = 248
    top = 61
  end
  object zq_Article1: TIBQuery
    Database = M_Donnees.Database
    Filter = 'ARTI_Libcom <> ''Integrite'' and ARTI_Libcom <> ''Intégrité'''
    Filtered = True
    AfterInsert = zq_Article1AfterInsert
    BeforeEdit = zq_Article1BeforeEdit
    AfterPost = zq_Article1AfterPost
    OnNewRecord = zq_Article1NewRecord
    SQL.Strings = (
      'select * '
      'from ARTICLE'
    )
    Params = <>
    left = 72
    top = 13
  end
  object zq_prod_acces: TIBQuery
    Database = M_Donnees.Database
    SQL.Strings = (
      'PRODUCTION_MC_ACCES_REPR'
      ':serveur_ref, :bdd_ref, :serveur, :bdd ,'
      ':location, :representant, :bdd_acces, :bdd_travail'
    )
    Params = <    
      item
        DataType = ftString
        Name = 'serveur_ref'
        NumericScale = 255
        ParamType = ptUnknown
        Precision = 255
        Size = 32
      end    
      item
        DataType = ftString
        Name = 'bdd_ref'
        NumericScale = 255
        ParamType = ptUnknown
        Precision = 255
        Size = 32
      end    
      item
        DataType = ftString
        Name = 'serveur'
        NumericScale = 255
        ParamType = ptUnknown
        Precision = 255
        Size = 32
      end    
      item
        DataType = ftString
        Name = 'bdd'
        NumericScale = 255
        ParamType = ptUnknown
        Precision = 255
        Size = 32
      end    
      item
        DataType = ftString
        Name = 'location'
        NumericScale = 255
        ParamType = ptUnknown
        Precision = 255
        Size = 512
      end    
      item
        DataType = ftString
        Name = 'representant'
        NumericScale = 255
        ParamType = ptUnknown
        Precision = 255
        Size = 15
      end    
      item
        DataType = ftString
        Name = 'bdd_acces'
        NumericScale = 255
        ParamType = ptUnknown
        Precision = 255
        Size = 32
      end    
      item
        DataType = ftString
        Name = 'bdd_travail'
        NumericScale = 255
        ParamType = ptUnknown
        Precision = 255
        Size = 32
      end>
    left = 419
    top = 61
    ParamData = <    
      item
        DataType = ftString
        Name = 'serveur_ref'
        NumericScale = 255
        ParamType = ptUnknown
        Precision = 255
        Size = 32
      end    
      item
        DataType = ftString
        Name = 'bdd_ref'
        NumericScale = 255
        ParamType = ptUnknown
        Precision = 255
        Size = 32
      end    
      item
        DataType = ftString
        Name = 'serveur'
        NumericScale = 255
        ParamType = ptUnknown
        Precision = 255
        Size = 32
      end    
      item
        DataType = ftString
        Name = 'bdd'
        NumericScale = 255
        ParamType = ptUnknown
        Precision = 255
        Size = 32
      end    
      item
        DataType = ftString
        Name = 'location'
        NumericScale = 255
        ParamType = ptUnknown
        Precision = 255
        Size = 512
      end    
      item
        DataType = ftString
        Name = 'representant'
        NumericScale = 255
        ParamType = ptUnknown
        Precision = 255
        Size = 15
      end    
      item
        DataType = ftString
        Name = 'bdd_acces'
        NumericScale = 255
        ParamType = ptUnknown
        Precision = 255
        Size = 32
      end    
      item
        DataType = ftString
        Name = 'bdd_travail'
        NumericScale = 255
        ParamType = ptUnknown
        Precision = 255
        Size = 32
      end>
  end
  object ds_prod_acces: TDatasource
    DataSet = zq_prod_acces
    left = 338
    top = 61
  end
  object ds_prodNonDeclasse: TDatasource
    DataSet = zq_prodNonDeclasse
    left = 160
    top = 165
  end
  object zq_prodDeclasse: TIBQuery
    Database = M_Donnees.Database
    OnFilterRecord = zq_prodDeclasseFilterRecord
    SQL.Strings = (
      'select ARTI_Clep, ARTI_Libcom, ARTI_Declasse'
      'from ARTICLE'
      'where  ARTI_Declasse = 1'
      'ORDER BY ARTI_Libcom'
    )
    Params = <>
    left = 248
    top = 117
  end
  object zq_prodNonDeclasse: TIBQuery
    Database = M_Donnees.Database
    OnFilterRecord = zq_prodDeclasseFilterRecord
    SQL.Strings = (
      'select ARTI_Clep, ARTI_Libcom, ARTI_Declasse'
      'from ARTICLE'
      'where  ARTI_Declasse = 0'
      'ORDER BY ARTI_Libcom'
    )
    Params = <>
    left = 248
    top = 165
  end
  object ds_ArbreArt: TDatasource
    DataSet = zq_ArbreArt
    left = 168
    top = 536
  end
  object zq_ArbreArt: TIBQuery
    Database = M_Donnees.Database
    AfterOpen = zq_ArbreArtAfterOpen
    SQL.Strings = (
      'select ARDE_Table as ''ARDE_Table'', ARDE_Clep as ''ARDE_Clep'', ARDE_Parent as ''ARDE_Parent'','
      '(case when ARDE_Table = ''STRUCTURE_COMPOSANT'' then ARDE_Table_clep else '''' end) as ''ARDE_Table_clep'','
      'ARDE_Type,ARDE_Selection,'
      '(case when ARDE_Table = ''STRUCTURE_COMPOSANT'' then null else ARDE_Prix end) as ''ARDE_Prix'''
      ', ARDE_Prixfutur, ARDE_Libelle, ARDE_Libcom, ARDE_Position'
      'from fn_mc_arbre_article_compose ( :ArticleC, 1 )'
    )
    Params = <    
      item
        DataType = ftString
        Name = 'ArticleC'
        ParamType = ptUnknown
        Size = 20
      end>
    left = 240
    top = 536
    ParamData = <    
      item
        DataType = ftString
        Name = 'ArticleC'
        ParamType = ptUnknown
        Size = 20
      end>
  end
  object zq_code_copieart: TIBQuery
    Database = M_Donnees.Database
    SQL.Strings = (
      'declare @clep1 varchar (12)'
      ''
      'SET @clep1 = :clep1'
      ''
      'select cast(substring(ARTI_Clep,len(''Z''+ @clep1) +1,len(ARTI_Clep)) as int) '
      'from ARTICLE'
      'where ARTI_Clep like (''Z'' + @clep1 +''%'')'
      'and len(@clep1) + 2 <= 12 '
      'order by 1 desc'
    )
    Params = <    
      item
        DataType = ftUnknown
        Name = 'clep1'
        ParamType = ptUnknown
        Size = -1
      end>
    left = 456
    top = 536
    ParamData = <    
      item
        DataType = ftUnknown
        Name = 'clep1'
        ParamType = ptUnknown
        Size = -1
      end>
  end
  object zq_copieart: TIBQuery
    Database = M_Donnees.Database
    SQL.Strings = (
      'exec ps_copie_selearticle :cle1, :cle2'
    )
    Params = <    
      item
        DataType = ftUnknown
        Name = 'cle1'
        ParamType = ptUnknown
        Size = -1
      end    
      item
        DataType = ftUnknown
        Name = 'cle2'
        ParamType = ptUnknown
        Size = -1
      end>
    left = 344
    top = 536
    ParamData = <    
      item
        DataType = ftUnknown
        Name = 'cle1'
        ParamType = ptUnknown
        Size = -1
      end    
      item
        DataType = ftUnknown
        Name = 'cle2'
        ParamType = ptUnknown
        Size = -1
      end>
  end
  object zq_ArFini: TIBQuery
    Database = M_Donnees.Database
    OnNewRecord = zq_ArFiniNewRecord
    SQL.Strings = (
      'select * '
      'from FINITION'
      'WHERE FINI_Clep = :finition'
    )
    Params = <    
      item
        DataType = ftString
        Name = 'finition'
        ParamType = ptUnknown
        Size = 200
      end>
    left = 88
    top = 164
    ParamData = <    
      item
        DataType = ftString
        Name = 'finition'
        ParamType = ptUnknown
        Size = 200
      end>
  end
  object zq_Article2: TIBQuery
    Database = M_Donnees.Database
    Filter = 'ARTI_Libcom <> ''Integrite'' and ARTI_Libcom <> ''Intégrité'''
    Filtered = True
    AfterInsert = zq_Article1AfterInsert
    BeforeEdit = zq_Article1BeforeEdit
    AfterPost = zq_Article1AfterPost
    OnNewRecord = zq_Article1NewRecord
    SQL.Strings = (
      'SELECT '
      'ARTI_Clep,ARTI__FOUR,ARTI_Codecom,ARTI_Libcom,'
      'ARTI_Desdev,ARTI_Pxactu,ARTI_Pxfutur,ARTI_Cubage,'
      'ARTI_Coefcub,ARTI_Indicspe,ARTI_Poids,ARTI_Datecrea,'
      'ARTI__GAMM,ARTI__TYPR,ARTI__CARA,ARTI_Compose,'
      'ARTI_Declasse'
      'FROM ARTICLE, FOURNISSEUR_TYPE_DEVIS '
      'WHERE ARTI_Indicspe = 0 AND ARTI__FOUR = FOTD__FOUR AND FOTD__TYDE = :Tyde'
    )
    Params = <    
      item
        DataType = ftInteger
        Name = 'Tyde'
        ParamType = ptUnknown
        Size = -1
      end>
    left = 144
    top = 13
    ParamData = <    
      item
        DataType = ftInteger
        Name = 'Tyde'
        ParamType = ptUnknown
        Size = -1
      end>
  end
  object zq_Article3: TIBQuery
    Database = M_Donnees.Database
    Filter = 'ARTI_Libcom <> ''Integrite'' and ARTI_Libcom <> ''Intégrité'''
    Filtered = True
    AfterInsert = zq_Article1AfterInsert
    BeforeEdit = zq_Article1BeforeEdit
    AfterPost = zq_Article1AfterPost
    OnNewRecord = zq_Article1NewRecord
    SQL.Strings = (
      'select * '
      'from ARTICLE '
      'where ARTI_Declasse = 0'
    )
    Params = <>
    left = 216
    top = 13
  end
  object zq_Article4: TIBQuery
    Database = M_Donnees.Database
    Filter = 'ARTI_Libcom <> ''Integrite'' and ARTI_Libcom <> ''Intégrité'''
    Filtered = True
    AfterInsert = zq_Article1AfterInsert
    BeforeEdit = zq_Article1BeforeEdit
    AfterPost = zq_Article1AfterPost
    OnNewRecord = zq_Article1NewRecord
    SQL.Strings = (
      'SELECT '
      'ARTI_Clep,ARTI__FOUR,ARTI_Codecom,ARTI_Libcom,'
      'ARTI_Desdev,ARTI_Pxactu,ARTI_Pxfutur,ARTI_Cubage,'
      'ARTI_Coefcub,ARTI_Indicspe,ARTI_Poids,ARTI_Datecrea,'
      'ARTI__GAMM,ARTI__TYPR,ARTI__CARA,ARTI_Compose,'
      'ARTI_Declasse'
      'FROM ARTICLE, FOURNISSEUR_TYPE_DEVIS '
      'WHERE ARTI_Indicspe = 0 AND ARTI__FOUR = FOTD__FOUR AND FOTD__TYDE = :Tyde and  ARTI_Declasse = 0'
    )
    Params = <    
      item
        DataType = ftInteger
        Name = 'Tyde'
        ParamType = ptUnknown
        Size = -1
      end>
    left = 288
    top = 13
    ParamData = <    
      item
        DataType = ftInteger
        Name = 'Tyde'
        ParamType = ptUnknown
        Size = -1
      end>
  end
  object zq_Article5: TIBQuery
    Database = M_Donnees.Database
    Filter = 'ARTI_Libcom <> ''Integrite'' and ARTI_Libcom <> ''Intégrité'''
    Filtered = True
    AfterInsert = zq_Article1AfterInsert
    BeforeEdit = zq_Article1BeforeEdit
    AfterPost = zq_Article1AfterPost
    OnNewRecord = zq_Article1NewRecord
    SQL.Strings = (
      'select * '
      'from ARTICLE '
      'where ARTI_Declasse = 0 AND ARTI_Indicspe = 0'
    )
    Params = <>
    left = 360
    top = 13
  end
  object zq_Article6: TIBQuery
    Database = M_Donnees.Database
    Filter = 'ARTI_Libcom <> ''Integrite'' and ARTI_Libcom <> ''Intégrité'''
    Filtered = True
    AfterInsert = zq_Article1AfterInsert
    BeforeEdit = zq_Article1BeforeEdit
    AfterPost = zq_Article1AfterPost
    OnNewRecord = zq_Article1NewRecord
    SQL.Strings = (
      'SELECT '
      'ARTI_Clep,ARTI__FOUR,ARTI_Codecom,ARTI_Libcom,'
      'ARTI_Desdev,ARTI_Pxactu,ARTI_Pxfutur,ARTI_Cubage,'
      'ARTI_Coefcub,ARTI_Indicspe,ARTI_Poids,ARTI_Datecrea,'
      'ARTI__GAMM,ARTI__TYPR,ARTI__CARA,ARTI_Compose,'
      'ARTI_Declasse'
      'FROM ARTICLE, FOURNISSEUR_TYPE_DEVIS '
      'WHERE ARTI_Indicspe = 0 AND ARTI__FOUR = FOTD__FOUR AND FOTD__TYDE = :Tyde and  ARTI_Declasse = 0 AND ARTI_Indicspe = 0'
    )
    Params = <    
      item
        DataType = ftInteger
        Name = 'Tyde'
        ParamType = ptUnknown
        Size = -1
      end>
    left = 432
    top = 13
    ParamData = <    
      item
        DataType = ftInteger
        Name = 'Tyde'
        ParamType = ptUnknown
        Size = -1
      end>
  end
  object ds_ProdDeclasse: TDatasource
    DataSet = zq_prodDeclasse
    left = 168
    top = 117
  end
end
