inherited F_Prodfiche: TF_Prodfiche
  Left = 361
  Height = 472
  Top = 221
  Width = 651
  Caption = 'Production des fichiers de données restaurant'
  ClientHeight = 472
  ClientWidth = 651
  Color = clBtnFace
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  OnActivate = F_FormDicoActivate
  OnClose = F_ProdficheClose
  OnCreate = F_ProdficheCreate
  OnShow = F_ProdficheShow
  Position = poDefault
  object Panel1: TPanel[0]
    Left = 0
    Height = 25
    Top = 0
    Width = 651
    Align = alTop
    BevelOuter = bvNone
    ClientHeight = 25
    ClientWidth = 651
    TabOrder = 0
    object bt_fermer: TFWClose
      Left = 571
      Height = 25
      Top = 0
      Caption = 'Fermer'
      TabOrder = 1
      Layout = blGlyphRight
      Align = alRight
      OnClick = bt_fermerClick
    end
    object bt_init: TFWInit
      Left = 342
      Height = 25
      Hint = 'Produire les BDD'
      Top = 0
      Width = 81
      Caption = 'Produire'
      TabOrder = 0
      Align = alRight
      ParentShowHint = False
      ShowHint = True
      OnClick = bt_initClick
    end
    object Panel2: TPanel
      Left = 423
      Height = 25
      Top = 0
      Width = 148
      Align = alRight
      BevelOuter = bvNone
      TabOrder = 2
    end
  end
  object pg_control: TPageControl[1]
    Left = 0
    Height = 447
    Top = 25
    Width = 651
    ActivePage = ts_param
    Align = alClient
    TabIndex = 0
    TabOrder = 1
    object ts_param: TTabSheet
      Caption = 'Production de données'
      ClientHeight = 416
      ClientWidth = 647
      object gd_representant: TExtDBGrid
        Left = 0
        Height = 351
        Top = 65
        Width = 647
        TitleButtons = True
        AutoSort = False
        Columns = <        
          item
            Title.Alignment = taCenter
            Title.Caption = 'Nom'
            Title.Orientation = toHorizontal
            Width = 579
            FieldName = 'REPR_Clep'
            Filter.DropDownRows = 0
            Filter.ItemIndex = -1
            FieldTag = 0
          end>
        OptionsRx = []
        Align = alClient
        BorderStyle = bsNone
        Color = clWindow
        FocusColor = clRed
        SelectedColor = clHighlight
        GridLineStyle = psSolid
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgMultiselect]
        ParentColor = False
        Scrollbars = ssHorizontal
        TabOrder = 0
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
      end
      object Panel3: TPanel
        Left = 0
        Height = 65
        Top = 0
        Width = 647
        Align = alTop
        BevelOuter = bvNone
        ClientHeight = 65
        ClientWidth = 647
        TabOrder = 1
        object lb_localisation: TFWLabel
          Tag = 1001
          Left = 16
          Height = 16
          Top = 23
          Width = 171
          AutoSize = False
          Caption = 'Localisation de la production'
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          ParentColor = False
          ParentFont = False
          ColorFocus = clMaroon
        end
        object ed_location: TEdit
          Tag = 1
          Left = 196
          Height = 27
          Top = 18
          Width = 405
          Color = 14155775
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          ParentFont = False
          ReadOnly = True
          TabOrder = 0
        end
      end
    end
  end
  object SvgFormInfoIni: TOnFormInfoIni[2]
    SauvePosObjects = True
    SauveEditObjets = [feTGrid]
    SauvePosForm = True
    left = 133
    top = 193
  end
end
