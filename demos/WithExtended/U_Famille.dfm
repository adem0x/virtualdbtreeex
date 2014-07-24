object F_Famille: TF_Famille
  Left = 39
  Top = 64
  Width = 903
  Height = 630
  Caption = 'Famille client'
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
  Grid = gd_famille
  Key = 'FAMI_Clep'
  Table = 'FAMILLE'
      Datasource = M_Donn.ds_famille
    end>
  MCVersion = '1.4.1.0'
  PixelsPerInch = 96
  TextHeight = 13
  object pa_1: TPanel
    Left = 0
    Top = 23
    Width = 895
    Height = 573
    Align = alClient
    BevelOuter = bvLowered
    TabOrder = 0
    object spl_1: TSplitter
      Left = 344
      Top = 1
      Width = 5
      Height = 571
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
    object pa_2: TPanel
      Left = 1
      Top = 1
      Width = 343
      Height = 571
      Align = alLeft
      BevelOuter = bvNone
      Constraints.MinWidth = 10
      TabOrder = 0
      object pa_4: TPanel
        Left = 0
        Top = 0
        Width = 343
        Height = 32
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 0
        object nv_navigator: TExtDBNavigator
          Left = 0
          Top = 0
          Width = 343
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
      object gd_famille: TExtDBGrid
        Left = 0
        Top = 32
        Width = 343
        Height = 539
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
    object Panel5: TPanel
      Left = 349
      Top = 1
      Width = 545
      Height = 571
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 1
      object pa_3: TPanel
        Left = 0
        Top = 0
        Width = 545
        Height = 128
        Align = alTop
        BevelOuter = bvNone
        Constraints.MinWidth = 10
        TabOrder = 0
        object lb_libelfami: TFWLabel
          Tag = 1002
          Left = 9
          Top = 73
          Width = 68
          Height = 16
          Alignment = taRightJustify
          Caption = 'lb_libelfami'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object lb_codefami: TFWLabel
          Tag = 1001
          Left = 3
          Top = 48
          Width = 74
          Height = 16
          Alignment = taRightJustify
          BiDiMode = bdLeftToRight
          Caption = 'lb_codefami'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentBiDiMode = False
          ParentFont = False
        end
        object lb_diffusion_general: TFWLabel
          Tag = 1003
          Left = 26
          Top = 97
          Width = 55
          Height = 16
          Alignment = taRightJustify
          BiDiMode = bdLeftToRight
          Caption = 'lb_valide'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentBiDiMode = False
          ParentFont = False
        end
        object pa_5: TPanel
          Left = 0
          Top = 0
          Width = 545
          Height = 32
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 2
          object nv_saisie: TExtDBNavigator
            Left = 0
            Top = 0
            Width = 545
            Height = 32
            VisibleButtons = [nbEInsert, nbEDelete, nbEPost, nbECancel, nbESearch]
            Align = alTop
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
        object dbed_codefami: TFWDBEdit
          Tag = 1
          Left = 96
          Top = 44
          Width = 34
          Height = 24
          Color = 16776176
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          MaxLength = 3
          ParentFont = False
          TabOrder = 0
        end
        object dbed_libelfami: TFWDBEdit
          Tag = 2
          Left = 96
          Top = 69
          Width = 280
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
        object chx_valide: TDBCheckBox
          Tag = 3
          Left = 96
          Top = 96
          Width = 16
          Height = 17
          TabOrder = 3
          ValueChecked = '1'
          ValueUnchecked = '0'
        end
      end
      object Panel6: TPanel
        Left = 0
        Top = 128
        Width = 545
        Height = 443
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 1
      end
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 0
    Width = 895
    Height = 23
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 1
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
    object dbtn_fermer: TFWClose
      Left = 822
      Top = 0
      Height = 23
      Align = alRight
      OnClick = dbtn_fermerClick
      Caption = 'Fermer'
      TabOrder = 6
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        1800000000000003000000000000000000000000000000000000FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFF8596DC0F30B51636B81A39B81A39B71839BB17
        39B91337BD0D35C00A32C0072FBE022CC00026B67F90D1FFFFFFFFFFFF1138D4
        1F44D92A4DDA2F51DA2E51DB2C51DB2951DC244FDF1C4BE01547E00D42E0053A
        E00132D70026B5FFFFFFFFFFFF1941DE2C50E13759E34464E57E94EDE2E8FBFF
        FFFFFFFFFFDCE4FB7192F1134BE90A43E80439E0022BBEFFFFFFFFFFFF2248DF
        385AE34363E4A2B2F2FFFFFFBBC8F6728FEE6F8FEFBACAF8FFFFFF98B1F60E48
        E9083EE1052EC1FFFFFFFFFFFF2C51E14261E48B9EEEFFFFFF8398EE4669E640
        66E73763E82C5DE97294F1FFFFFF6B8DF00F43E10B33C1FFFFFFFFFFFF3558E2
        4B68E5EBEFFCBBC6F54E6DE6496AE6FFFFFFFFFFFF2D5CE82456E8B6C7F8DBE3
        FB1848E01238C2FFFFFFFFFFFF3F5FE4536FE7FFFFFF8195ED506DE64868E5FF
        FFFFFFFFFF2C58E62352E66587EEFFFFFF1F4CDF183CC0FFFFFFFFFFFF4564E5
        5A75E8FFFFFF8195ED506CE64867E5FFFFFFFFFFFF2C55E42450E46483ECFFFF
        FF254EDE1D3FBFFFFFFFFFFFFF4F6CE6637DE8EFF1FDB7C2F5516CE64865E4FF
        FFFFFFFFFF2C52E2264EE2B0BFF5E0E6FB2A50DC2141BFFFFFFFFFFFFF536FE7
        6C85EA97A9F1FFFFFF8093ED4C67E54261E43A5BE33054E26C86EBFFFFFF728A
        EC2D51DC2342BEFFFFFFFFFFFF5E79E87A91EC7089EBA6B5F2FFFFFFB1BDF470
        86EA6B83E9B0BDF4FFFFFF95A8F03053E12F52DB2342BDFFFFFFFFFFFF6B85EA
        8DA1EF8097ED6F88EB97A8F0EEF0FCFFFFFFFFFFFFE9EDFC899DEE4162E43A5C
        E33053DC1E3EBCFFFFFFFFFFFF778EEC9DAEF18CA0EF7990EC7089EB6A83E965
        7EE9627CE95D78E85673E74E6CE64162E42F52DB1939BAFFFFFFFFFFFFB2BFF4
        768DEC6781EA5B76E85470E74F6CE64A69E64B69E54665E53F60E33B5DE33154
        E22347D88A9BDEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
      Layout = blGlyphRight
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
