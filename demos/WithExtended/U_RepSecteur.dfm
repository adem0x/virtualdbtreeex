inherited F_RepSecteur: TF_RepSecteur
  Left = 111
  Height = 457
  Top = 218
  Width = 863
  Caption = 'Secteurs des représentants'
  ClientHeight = 457
  ClientWidth = 863
  Color = clBtnFace
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  OnActivate = F_FormDicoActivate
  OnCloseQuery = F_FormDicoCloseQuery
  OnCreate = F_FormDicoCreate
  OnDestroy = F_FormDicoDestroy
  Position = poMainFormCenter
  object pa_1: TPanel[0]
    Left = 0
    Height = 457
    Top = 0
    Width = 863
    Align = alClient
    BevelOuter = bvLowered
    ClientHeight = 457
    ClientWidth = 863
    TabOrder = 0
    object spl_1: TSplitter
      Left = 241
      Height = 430
      Top = 26
      Width = 5
    end
    object pa_3: TPanel
      Left = 246
      Height = 430
      Top = 26
      Width = 616
      Align = alClient
      BevelOuter = bvNone
      ClientHeight = 430
      ClientWidth = 616
      Constraints.MinWidth = 10
      TabOrder = 0
      object pa_5: TPanel
        Left = 0
        Height = 32
        Top = 0
        Width = 616
        Align = alTop
        BevelOuter = bvNone
        ClientHeight = 32
        ClientWidth = 616
        TabOrder = 1
        object nv_saisie: TExtDBNavigator
          Left = 0
          Height = 32
          Top = 0
          Width = 616
          Flat = True
          DeleteQuestion = 'Confirmez-vous l''effacement de l''enregistrement ?'
          Align = alClient
          ParentShowHint = False
          ShowHint = True
          TabOrder = 0
          Orientation = noHorizontal
          VisibleButtons = [nbEInsert, nbEDelete, nbEPost, nbECancel]
          GlyphSize = gsLarge
          Hints.Strings = (
            'Premier enregistrement'
            'Enregistrement précédent'
            'Enregistrement suivant'
            'Dernier enregistrement'
            'Insérer enregistrement'
            'Supprimer l''enregistrement'
            'Modifier l''enregistrement'
            'Valider modifications'
            'Annuler les modifications'
            'Rafraîchir les données'
            'Rechercher un enregistrement'
          )
        end
      end
      object pa_6: TPanel
        Left = 0
        Height = 145
        Top = 32
        Width = 616
        Align = alTop
        BevelOuter = bvNone
        ClientHeight = 145
        ClientWidth = 616
        TabOrder = 0
        object lb_rep: TFWLabel
          Tag = 1001
          Left = 118
          Height = 16
          Top = 33
          Width = 38
          AutoSize = False
          Caption = 'lb_rep'
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          ParentColor = False
          ParentFont = False
          ColorFocus = clMaroon
        end
        object lb_dep: TFWLabel
          Tag = 1003
          Left = 114
          Height = 16
          Top = 60
          Width = 42
          AutoSize = False
          Caption = 'lb_dep'
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          ParentColor = False
          ParentFont = False
          ColorFocus = clMaroon
        end
        object lb_ville: TFWLabel
          Tag = 1004
          Left = 114
          Height = 16
          Top = 86
          Width = 42
          AutoSize = False
          Caption = 'lb_ville'
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          ParentColor = False
          ParentFont = False
          ColorFocus = clMaroon
        end
        object cbx_rep: TDBLookupComboBox
          Tag = 1
          Left = 176
          Height = 29
          Top = 29
          Width = 245
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          ListFieldIndex = 0
          LookupCache = False
          ParentFont = False
          TabOrder = 1
        end
        object db_secteur: TFWDBEdit
          Tag = 2
          Left = 176
          Height = 24
          Top = 107
          Width = 42
          CharCase = ecNormal
          Color = clMoneyGreen
          MaxLength = 0
          TabOrder = 0
          Visible = False
        end
        object cbx_dep: TComboBox
          Tag = 3
          Left = 176
          Height = 29
          Top = 56
          Width = 42
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          ItemHeight = 0
          OnClick = cbx_depClick
          OnKeyPress = cbx_depKeyPress
          ParentFont = False
          TabOrder = 3
        end
        object cbx_ville: TComboBox
          Tag = 4
          Left = 176
          Height = 29
          Top = 81
          Width = 412
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          ItemHeight = 0
          OnClick = cbx_villeClick
          OnKeyPress = cbx_villeKeyPress
          ParentFont = False
          TabOrder = 4
        end
        object bt_rep: TJvXPButton
          Left = 424
          Height = 22
          Hint = 'Accèder aux codes postaux'
          Top = 30
          Width = 22
          Caption = '...'
          TabOrder = 2
          ParentShowHint = False
          ShowHint = True
          OnClick = bt_repClick
        end
      end
      object pc_secteur: TPageControl
        Left = 0
        Height = 253
        Top = 177
        Width = 616
        ActivePage = ts_secteur
        Align = alClient
        TabIndex = 0
        TabOrder = 2
        object ts_secteur: TTabSheet
          Caption = 'Liste des  communes non affectées :'
          ClientHeight = 222
          ClientWidth = 612
          object Panel1: TPanel
            Left = 0
            Height = 222
            Top = 0
            Width = 612
            Align = alClient
            BevelOuter = bvNone
            Caption = 'Panel1'
            ClientHeight = 222
            ClientWidth = 612
            TabOrder = 0
            object DBAdvNavigator1: TExtDBNavigator
              Left = 0
              Height = 32
              Top = 0
              Width = 612
              Flat = True
              DataSource = M_Donn.ds_villeAlone
              DeleteQuestion = 'Confirmez-vous l''effacement de l''enregistrement ?'
              Align = alTop
              ParentShowHint = False
              ShowHint = True
              TabOrder = 0
              Orientation = noHorizontal
              VisibleButtons = [nbEFirst, nbEPrior, nbENext, nbELast]
              GlyphSize = gsLarge
              Hints.Strings = (
                'Premier enregistrement'
                'Enregistrement précédent'
                'Enregistrement suivant'
                'Dernier enregistrement'
                'Insérer enregistrement'
                'Supprimer l''enregistrement'
                'Modifier l''enregistrement'
                'Valider modifications'
                'Annuler les modifications'
                'Rafraîchir les données'
                'Rechercher un enregistrement'
              )
            end
            object gd_secteur: TExtDBGrid
              Left = 0
              Height = 190
              Top = 32
              Width = 612
              TitleButtons = True
              AutoSort = False
              Columns = <              
                item
                  Title.Alignment = taCenter
                  Title.Caption = 'Racine CodeInsee'
                  Title.Orientation = toHorizontal
                  FieldName = 'dep'
                  Filter.DropDownRows = 0
                  Filter.ItemIndex = -1
                  FieldTag = 0
                end              
                item
                  Title.Alignment = taCenter
                  Title.Caption = 'Code insee'
                  Title.Orientation = toHorizontal
                  FieldName = 'COPO_Codinsee'
                  Filter.DropDownRows = 0
                  Filter.ItemIndex = -1
                  FieldTag = 0
                end              
                item
                  Title.Alignment = taCenter
                  Title.Caption = 'Commune'
                  Title.Orientation = toHorizontal
                  Width = 459
                  FieldName = 'COPO_Ville'
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
              DataSource = M_Donn.ds_villeAlone
              Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
              ParentColor = False
              Scrollbars = ssHorizontal
              TabOrder = 1
              TitleFont.Color = clWindowText
              TitleFont.Height = -11
              TitleFont.Name = 'MS Sans Serif'
            end
          end
        end
      end
    end
    object pa_2: TPanel
      Left = 1
      Height = 430
      Top = 26
      Width = 240
      Align = alLeft
      BevelOuter = bvNone
      ClientHeight = 430
      ClientWidth = 240
      Constraints.MinWidth = 10
      TabOrder = 1
      object pa_4: TPanel
        Left = 0
        Height = 32
        Top = 0
        Width = 240
        Align = alTop
        BevelOuter = bvNone
        ClientHeight = 32
        ClientWidth = 240
        TabOrder = 0
        object nv_navigator: TExtDBNavigator
          Left = 0
          Height = 32
          Top = 0
          Width = 240
          Flat = True
          DeleteQuestion = 'Confirmez-vous l''effacement de l''enregistrement ?'
          Align = alClient
          ParentShowHint = False
          ShowHint = True
          TabOrder = 0
          Orientation = noHorizontal
          VisibleButtons = [nbEFirst, nbEPrior, nbENext, nbELast]
          GlyphSize = gsLarge
          Hints.Strings = (
            'Premier enregistrement'
            'Enregistrement précédent'
            'Enregistrement suivant'
            'Dernier enregistrement'
            'Insérer enregistrement'
            'Supprimer l''enregistrement'
            'Modifier l''enregistrement'
            'Valider modifications'
            'Annuler les modifications'
            'Rafraîchir les données'
            'Rechercher un enregistrement'
          )
        end
      end
      object gd_RepSecteur: TExtDBGrid
        Left = 0
        Height = 398
        Top = 32
        Width = 240
        TitleButtons = True
        AutoSort = False
        Columns = <>
        OptionsRx = []
        Align = alClient
        BorderStyle = bsNone
        Color = clWindow
        FocusColor = clRed
        SelectedColor = clHighlight
        GridLineStyle = psSolid
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
        ParentColor = False
        Scrollbars = ssVertical
        TabOrder = 1
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        OnTitleClick = gd_RepSecteurTitleClick
      end
    end
    object Panel2: TPanel
      Left = 1
      Height = 25
      Top = 1
      Width = 861
      Align = alTop
      BevelOuter = bvNone
      ClientHeight = 25
      ClientWidth = 861
      TabOrder = 2
      object Panel11: TPanel
        Left = 0
        Height = 25
        Top = 0
        Width = 361
        Align = alLeft
        BevelOuter = bvNone
        TabOrder = 0
      end
      object bt_apercu: TFWPreview
        Left = 361
        Height = 25
        Hint = 'Aperçu  (Impression / exportation)'
        Top = 0
        Caption = 'Aperçu'
        TabOrder = 4
        Align = alLeft
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        ParentFont = False
        Visible = False
      end
      object Panel4: TPanel
        Left = 434
        Height = 25
        Top = 0
        Width = 13
        Align = alLeft
        BevelOuter = bvNone
        TabOrder = 1
      end
      object bt_imprimer: TFWPrint
        Left = 447
        Height = 25
        Hint = 'Impression des résultats de la sélection'
        Top = 0
        Width = 80
        Caption = 'Imprimer'
        TabOrder = 5
        Align = alLeft
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        ParentFont = False
        Visible = False
      end
      object Panel7: TPanel
        Left = 527
        Height = 25
        Top = 0
        Width = 13
        Align = alLeft
        BevelOuter = bvNone
        TabOrder = 2
      end
      object Panel8: TPanel
        Left = 540
        Height = 25
        Top = 0
        Width = 13
        Align = alLeft
        BevelOuter = bvNone
        TabOrder = 3
      end
      object bt_fermer: TFWClose
        Left = 781
        Height = 25
        Top = 0
        Caption = 'Fermer'
        TabOrder = 6
        Layout = blGlyphRight
        Align = alRight
        OnClick = bt_fermerClick
      end
    end
  end
  object SvgFormInfoIni: TOnFormInfoIni[1]
    SauvePosObjects = True
    SauveEditObjets = [feTGrid]
    SauvePosForm = True
    left = 97
    top = 137
  end
end
