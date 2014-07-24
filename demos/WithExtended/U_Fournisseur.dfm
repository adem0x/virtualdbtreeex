object F_Fournisseur: TF_Fournisseur
  Left = 70
  Top = 93
  BorderStyle = bsNone
  Caption = 'Fournisseur'
  ClientHeight = 509
  ClientWidth = 858
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  Visible = True
  OnCloseQuery = F_FormDicoCloseQuery
  OnCreate = F_FormDicoCreate
  DBSources = <
    Item
  NavEdit = nv_saisie
  GridPanel = pa_2
  Navigator = nv_navigator
  Grid = gd_fournisseur
  Key = 'FOUR_Clep'
  Table = 'FOURNISSEUR'
      Datasource = M_Donn.ds_four
    end>
  MCVersion = '1.5.2.0'
  PixelsPerInch = 96
  TextHeight = 13
  object pa_1: TPanel
    Left = 0
    Top = 0
    Width = 858
    Height = 509
    Align = alClient
    BevelOuter = bvLowered
    TabOrder = 0
    object rb_1: TSplitter
      Left = 281
      Top = 24
      Width = 5
      Height = 484
      GradientType = gtHorizontal
      GripAlign = gaVertical
      FadeSpeed = fsMedium
      Colors.DefaultFrom = clBtnFace
      Colors.DefaultTo = clBtnFace
      Colors.OverFrom = clWhite
      Colors.OverTo = 12489846
      ShowGrip = True
      DrawAll = True
    end
    object pa_3: TPanel
      Left = 286
      Top = 24
      Width = 571
      Height = 484
      Align = alClient
      BevelOuter = bvNone
      Constraints.MinWidth = 10
      TabOrder = 0
      object pa_5: TPanel
        Left = 0
        Top = 0
        Width = 571
        Height = 32
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 0
        object nv_saisie: TExtDBNavigator
          Left = 0
          Top = 0
          Width = 571
          Height = 32
          VisibleButtons = [nbEInsert, nbEDelete, nbEPost, nbECancel, nbESearch]
          Align = alClient
          Color = clBtnFace
          ColorDown = 16776176
          ColorHot = clMoneyGreen
          Flat = True
          GlyphSize = gsLarge
          Hints.Strings = (
            'Premier enregistrement'
            'Enregistrement pr'#233'c'#233'dent'
            'Enregistrement suivant'
            'Dernier enregistrement'
            'Ins'#233'rer enregistrement'
            'Supprimer l'#39'enregistrement'
            'Modifier l'#39'enregistrement'
            'Valider modifications'
            'Annuler les modifications'
            'Rafra'#238'chir les donn'#233'es'
            'Rechercher un enregistrement')
          Orientation = noHorizontal
          ParentShowHint = False
          ShowHint = True
          TabOrder = 0
        end
      end
      object pa_6: TPanel
        Left = 0
        Top = 32
        Width = 571
        Height = 458
        Align = alTop
        BevelOuter = bvNone
        Ctl3D = True
        ParentCtl3D = False
        TabOrder = 1
        object lb_nom: TFWLabel
          Tag = 1004
          Left = 41
          Top = 41
          Width = 44
          Height = 16
          Alignment = taRightJustify
          Caption = 'lb_nom'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object lb_code: TFWLabel
          Tag = 1001
          Left = 36
          Top = 16
          Width = 49
          Height = 16
          Alignment = taRightJustify
          BiDiMode = bdLeftToRight
          Caption = 'lb_code'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentBiDiMode = False
          ParentFont = False
        end
        object lb_adresse: TFWLabel
          Tag = 1006
          Left = 17
          Top = 64
          Width = 68
          Height = 16
          Alignment = taRightJustify
          Caption = 'lb_adresse'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object lb_codepost: TFWLabel
          Tag = 1009
          Left = 10
          Top = 141
          Width = 75
          Height = 16
          Alignment = taRightJustify
          Caption = 'lb_codepost'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object lb_ville: TFWLabel
          Tag = 1010
          Left = 252
          Top = 141
          Width = 42
          Height = 16
          Alignment = taRightJustify
          Caption = 'lb_ville'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object lb_pays: TFWLabel
          Tag = 1002
          Left = 37
          Top = 166
          Width = 48
          Height = 16
          Alignment = taRightJustify
          Caption = 'lb_pays'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object lb_tel: TFWLabel
          Tag = 1011
          Left = 52
          Top = 191
          Width = 32
          Height = 16
          Alignment = taRightJustify
          Caption = 'lb_tel'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object lb_numposte: TFWLabel
          Tag = 1012
          Left = 313
          Top = 191
          Width = 52
          Height = 16
          Alignment = taRightJustify
          Caption = 'lb_poste'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object lb_mobile: TFWLabel
          Tag = 1013
          Left = 33
          Top = 216
          Width = 59
          Height = 16
          Alignment = taRightJustify
          Caption = 'lb_mobile'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object lb_fax: TFWLabel
          Tag = 1014
          Left = 50
          Top = 240
          Width = 35
          Height = 16
          Alignment = taRightJustify
          Caption = 'lb_fax'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object lb_email: TFWLabel
          Tag = 1015
          Left = 34
          Top = 265
          Width = 51
          Height = 16
          Alignment = taRightJustify
          Caption = 'lb_email'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object lb_siteweb: TFWLabel
          Tag = 1016
          Left = 21
          Top = 290
          Width = 64
          Height = 16
          Alignment = taRightJustify
          Caption = 'lb_siteweb'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object lb_coefrefac: TFWLabel
          Tag = 1017
          Left = 11
          Top = 315
          Width = 74
          Height = 16
          Alignment = taRightJustify
          Caption = 'lb_coefrefac'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object lb_coefport: TFWLabel
          Tag = 1018
          Left = 245
          Top = 315
          Width = 67
          Height = 16
          Alignment = taRightJustify
          Caption = 'lb_coefport'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object ed_nom: TFWDBEdit
          Tag = 4
          Left = 104
          Top = 37
          Width = 370
          Height = 24
          Color = 16776176
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
        end
        object ed_code: TFWDBEdit
          Tag = 1
          Left = 104
          Top = 12
          Width = 81
          Height = 24
          CharCase = ecUpperCase
          Color = 16776176
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
        end
        object ed_adress1: TFWDBEdit
          Tag = 6
          Left = 104
          Top = 62
          Width = 370
          Height = 24
          CharCase = ecUpperCase
          Color = clMoneyGreen
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 2
        end
        object ed_adress2: TFWDBEdit
          Tag = 7
          Left = 104
          Top = 87
          Width = 370
          Height = 24
          CharCase = ecUpperCase
          Color = clMoneyGreen
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 3
        end
        object ed_adress3: TFWDBEdit
          Tag = 8
          Left = 104
          Top = 112
          Width = 370
          Height = 24
          CharCase = ecUpperCase
          Color = clMoneyGreen
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 4
        end
        object ed_codepost: TFWDBEdit
          Tag = 9
          Left = 104
          Top = 137
          Width = 96
          Height = 24
          Color = clMoneyGreen
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 5
        end
        object bt_codpostal: TJvXpButton
          Left = 201
          Top = 137
          Width = 22
          Height = 22
          OnClick = bt_codpostalClick
          Caption = '...'
          TabOrder = 6
        end
        object ed_ville: TFWDBEdit
          Tag = 10
          Left = 313
          Top = 137
          Width = 248
          Height = 24
          CharCase = ecUpperCase
          Color = clMoneyGreen
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 7
        end
        object Cbx_pays: TDBLookupComboBox
          Tag = 2
          Left = 104
          Top = 162
          Width = 460
          Height = 24
          Color = clMoneyGreen
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 8
        end
        object ed_tel: TFWDBEdit
          Tag = 11
          Left = 104
          Top = 187
          Width = 190
          Height = 24
          Color = clMoneyGreen
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 9
        end
        object ed_numposte: TFWDBEdit
          Tag = 12
          Left = 384
          Top = 187
          Width = 70
          Height = 24
          Color = clMoneyGreen
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 10
        end
        object ed_mobile: TFWDBEdit
          Tag = 13
          Left = 104
          Top = 212
          Width = 190
          Height = 24
          Color = clMoneyGreen
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 11
        end
        object ed_fax: TFWDBEdit
          Tag = 14
          Left = 104
          Top = 236
          Width = 190
          Height = 24
          Color = clMoneyGreen
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 12
        end
        object ed_email: TFWDBEdit
          Tag = 15
          Left = 104
          Top = 261
          Width = 460
          Height = 24
          Color = clMoneyGreen
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 13
        end
        object ed_siteweb: TFWDBEdit
          Tag = 16
          Left = 104
          Top = 286
          Width = 460
          Height = 24
          Color = clMoneyGreen
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 14
        end
        object ed_coefrefac: TFWDBEdit
          Tag = 17
          Left = 104
          Top = 311
          Width = 58
          Height = 24
          Color = clMoneyGreen
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 15
        end
        object ed_coefport: TFWDBEdit
          Tag = 18
          Left = 331
          Top = 311
          Width = 58
          Height = 24
          Color = clMoneyGreen
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 16
        end
      end
    end
    object pa_2: TPanel
      Left = 1
      Top = 24
      Width = 280
      Height = 484
      Align = alLeft
      BevelOuter = bvNone
      Constraints.MinWidth = 10
      TabOrder = 1
      object pa_4: TPanel
        Left = 0
        Top = 0
        Width = 280
        Height = 32
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 0
        object nv_navigator: TExtDBNavigator
          Left = 0
          Top = 0
          Width = 280
          Height = 32
          VisibleButtons = [nbEFirst, nbEPrior, nbENext, nbELast]
          Align = alClient
          Color = clBtnFace
          ColorDown = 16776176
          ColorHot = clMoneyGreen
          Flat = True
          GlyphSize = gsLarge
          Hints.Strings = (
            'Premier enregistrement'
            'Enregistrement pr'#233'c'#233'dent'
            'Enregistrement suivant'
            'Dernier enregistrement'
            'Ins'#233'rer enregistrement'
            'Supprimer l'#39'enregistrement'
            'Modifier l'#39'enregistrement'
            'Valider modifications'
            'Annuler les modifications'
            'Rafra'#238'chir les donn'#233'es'
            'Rechercher un enregistrement')
          Orientation = noHorizontal
          ParentShowHint = False
          ShowHint = True
          TabOrder = 0
        end
      end
      object gd_fournisseur: TExtDBGrid
        Left = 0
        Top = 32
        Width = 280
        Height = 452
        Align = alClient
        BorderStyle = bsNone
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        ScrollBars = ssHorizontal
        Controls = <>
        EditColor = clWindow
        DefaultRowHeight = 17
        RowColor1 = clInfoBk
        RowColor2 = clWindow
        UseRowColors = True
        HighlightColor = clNavy
        ImageHighlightColor = clWindow
        HighlightFontColor = clWhite
        HotTrackColor = clNavy
        LockedCols = 0
        LockedFont.Charset = DEFAULT_CHARSET
        LockedFont.Color = clWindowText
        LockedFont.Height = -11
        LockedFont.Name = 'MS Sans Serif'
        LockedFont.Style = []
        LockedColor = clGray
        ExMenuOptions = [exAutoSize, exAutoWidth, exDisplayBoolean, exDisplayImages, exDisplayMemo, exDisplayDateTime, exShowTextEllipsis, exShowTitleEllipsis, exFullSizeMemo, exAllowRowSizing, exCellHints, exMultiLineTitles, exUseRowColors, exFixedColumns, exPrintGrid, exPrintDataSet, exExportGrid, exSelectAll, exUnSelectAll, exQueryByForm, exSortByForm, exMemoInplaceEditors, exCustomize, exSearchMode, exSaveLayout, exLoadLayout]
        MaskedColumnDrag = True
        ValueChecked = 1
        ValueUnChecked = 0
      end
    end
    object Panel3: TPanel
      Left = 1
      Top = 1
      Width = 856
      Height = 23
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 2
      object Panel11: TPanel
        Left = 0
        Top = 0
        Width = 361
        Height = 23
        Align = alLeft
        BevelOuter = bvNone
        TabOrder = 0
      end
      object bt_apercu: TFWPreview
        Left = 361
        Top = 0
        Height = 23
        Hint = 'Aper'#231'u  (Impression / exportation)'
        Align = alLeft
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        Visible = False
        Caption = 'Aper'#231'u'
        TabOrder = 4
        Glyph.Data = {
          36030000424D3603000000000000360000002800000010000000100000000100
          18000000000000030000C40E0000C40E00000000000000000000FF00FFFF00FF
          B58484B58484B58484B58484B58484B58484B58484B58484B58484B58484B584
          84B58484B58484FF00FFFF00FFFF00FF5477BAFFEFD6F7E7C6F7D6ADF7DEB5F7
          D6ADF7D6A5EFCE9CEFCE94EFCE94EFCE94F7D69CB58484FF00FFFF00FFFF00FF
          50B7EA3E84DEF7E7CEF7D6ADF7D6ADF7D6ADF7D6ADEFCE9CEFCE9CEFCE94EFCE
          94EFCE9CB58484FF00FFFF00FFFF00FF8F7FA250B7EA5477BAF7D6ADF7D6ADF7
          D6ADF7D6ADF7D6ADEFCE9CEFCE9CEFCE94EFCE9CB58484FF00FFFF00FFFF00FF
          C6ADA58F7FA250B7EA3E84DEA6AAAAC8AAAACA9A90D0A795C8AAAAEFCE9CEFCE
          9CEFCE94B58484FF00FFFF00FFFF00FFCEB5ADFFFFF78F7FA2BBCACDB89088D0
          A795FEFED7E6D5BADAB9A3D0A795EFCE9CEFCE9CB58484FF00FFFF00FFFF00FF
          D6B5ADFFFFFFFFF7EFDAB9A3D0A795FDF6C6FFFCF0FEFEF7FFFFFFDAB9A3D0A7
          95F7D6A5B58484FF00FFFF00FFFF00FFD6BDB5FFFFFFFFF7F7D0A795FBD8AFFD
          E7B8FFFCF0FFFFFBFFFFFBE6D5BACA9A90F7D6ADB58484FF00FFFF00FFFF00FF
          D6BDB5FFFFFFFFFFFFD0A795E6D5BAFDF0E2FDF6C6FDF6C6FDF6C6FBD8AFCA9A
          90F7DEB5B58484FF00FFFF00FFFF00FFDEBDB5FFFFFFFFFFFFD1BDBADAB9A3FF
          FFFFFBD8AFFDE7B8FDF6C6D0A795C8AAAAF7D6B5B58484FF00FFFF00FFFF00FF
          DEC6B5FFFFFFFFFFFFFFFFFFD0A795D0A795FDE7B8FBD8AFD0A795CA9A90FED6
          C9C6BDADB58484FF00FFFF00FFFF00FFE7C6B5FFFFFFFFFFFFFFFFFFFFFFFFD1
          BDBACA9A90D0A795D1BDBAB48176B48176B58C84B58484FF00FFFF00FFFF00FF
          E7C6B5FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7E7CECEBD8C73EFB5
          73EFA54AC6846BFF00FFFF00FFFF00FFEFCEBDFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFE7D6CEC6947BFFC673CE9473FF00FFFF00FFFF00FFFF00FF
          E7C6B5FFF7F7FFF7EFFFF7EFFFF7EFFFF7EFFFF7EFFFF7EFE7CECEC6947BCE9C
          84FF00FFFF00FFFF00FFFF00FFFF00FFE7C6B5EFCEB5EFCEB5EFCEB5EFCEB5E7
          C6B5E7C6B5EFCEB5D6BDB5BD847BFF00FFFF00FFFF00FFFF00FF}
      end
      object Panel4: TPanel
        Left = 434
        Top = 0
        Width = 13
        Height = 23
        Align = alLeft
        BevelOuter = bvNone
        TabOrder = 1
      end
      object bt_imprimer: TFWPrint
        Left = 447
        Top = 0
        Width = 80
        Height = 23
        Hint = 'Impression des r'#233'sultats de la s'#233'lection'
        Align = alLeft
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        Visible = False
        Caption = 'Imprimer'
        TabOrder = 5
        Glyph.Data = {
          F6000000424DF600000000000000760000002800000010000000100000000100
          0400000000008000000000000000000000001000000000000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FFFFFF000FFF
          FFFFFFFF0087700FFFFFFF00887007700FFFF08877877007700FF77788877770
          070F778888877777700F7F8888F7777777707F88FF88877777707FFF88998887
          77707F88AA8887708770F77F88877FF0800FFFF77F7FFFFF0FFFFFFFF77FFFFF
          F0FFFFFFFFF7FFFFFF00FFFFFFFF7FFF77FFFFFFFFFFF777FFFF}
      end
      object Panel1: TPanel
        Left = 527
        Top = 0
        Width = 13
        Height = 23
        Align = alLeft
        BevelOuter = bvNone
        TabOrder = 2
      end
      object Panel2: TPanel
        Left = 540
        Top = 0
        Width = 13
        Height = 23
        Align = alLeft
        BevelOuter = bvNone
        TabOrder = 3
      end
      object bt_fermer: TFWClose
        Left = 776
        Top = 0
        Width = 80
        Height = 23
        Hint = 'Quitter la fonction'
        Align = alRight
        ParentShowHint = False
        ShowHint = True
        OnClick = bt_fermerClick
        Caption = 'Fermer'
        TabOrder = 6
        TabStop = False
        Glyph.Data = {
          36050000424D3605000000000000360400002800000010000000100000000100
          080000000000000100000000000000000000000100000000000000000000B2BF
          F400768DEC006781EA005B76E8005470E7004F6CE6004A69E6004B69E5004665
          E5003F60E3003B5DE3003154E2002347D8008A9BDE00778EEC009DAEF1008CA0
          EF007990EC007089EB006A83E900657EE900627CE9005D78E8005673E7004E6C
          E6004162E4002F52DB001939BA006B85EA008DA1EF008097ED006F88EB0097A8
          F000EEF0FC00E9EDFC00899DEE003A5CE3003053DC001E3EBC005E79E8007A91
          EC00A6B5F200B1BDF4007086EA006B83E900B0BDF40095A8F0003053E1002342
          BD00536FE7006C85EA0097A9F1008093ED004C67E5004261E4003A5BE3003054
          E2006C86EB00728AEC002D51DC002342BE00637DE800EFF1FD00B7C2F500516C
          E6004865E4002C52E200264EE200B0BFF500E0E6FB002A50DC002141BF004564
          E5005A75E8008195ED00506CE6004867E5002C55E4002450E4006483EC00254E
          DE001D3FBF003F5FE400506DE6004868E5002C58E6002352E6006587EE001F4C
          DF00183CC0003558E2004B68E500EBEFFC00BBC6F5004E6DE600496AE6002D5C
          E8002456E800B6C7F800DBE3FB001848E0001238C2002C51E1008B9EEE008398
          EE004669E6004066E7003763E8002C5DE9007294F1006B8DF0000F43E1000B33
          C1002248DF00385AE3004363E400A2B2F200BBC8F600728FEE006F8FEF00BACA
          F80098B1F6000E48E900083EE100052EC1001941DE002C50E1003759E3004464
          E5007E94ED00E2E8FB00DCE4FB007192F100134BE9000A43E8000439E000022B
          BE001138D4001F44D9002A4DDA002F51DA002E51DB002C51DB002951DC00244F
          DF001C4BE0001547E0000D42E000053AE0000132D7000026B5008596DC000F30
          B5001636B8001A39B8001A39B7001839BB001739B9001337BD000D35C0000A32
          C000072FBE00022CC0000026B6007F90D1000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000000000000000000000000000000000000FFFFFF0035FFFFFFFFFF
          FFFFFFFFFFFFFFFFFF35FF98999A9B9C9D9E9FA0A1A2A3A4A5FFFF8A8B8C8D8E
          8F9091929394959697FFFF7E7F80818283FFFF848586878889FFFF72737475FF
          76777879FF7A7B7C7DFFFF673768FF696A6B6C6D6EFF6F7071FFFF5B5C5D5E5F
          60FFFF616263646566FFFF5332FF4B5455FFFF565758FF595AFFFF494AFF4B4C
          4DFFFF4E4F50FF5152FFFF063E3F404142FFFF434445464748FFFF323334FF35
          363738393AFF3B3C3DFFFF2829132AFF2B2C2D2EFF2F301B31FFFF1D1E1F2021
          22FFFF23241A252627FFFF0F101112131415161718191A1B1CFFFF0102030405
          060708090A0B0C0D0EFF35FFFFFFFFFFFFFFFFFFFFFFFFFFFF35}
        Layout = blGlyphRight
      end
    end
  end
  object SvgFormInfoIni: TOnFormInfoIni
    SauvePosObjects = True
    SauveEditObjets = []
    SauvePosForm = True
    Left = 97
    Top = 137
  end
end
