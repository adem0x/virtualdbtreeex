object F_ComposeArticle: TF_ComposeArticle
  Left = 100
  Top = 159
  Width = 880
  Height = 587
  HelpContext = 8000
  Caption = 'Fiche produit compos'#233
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnClose = F_FormDicoClose
  OnCreate = F_FormDicoCreate
  OnDestroy = F_FormDicoDestroy
  OnShow = F_FormDicoShow
  DBSources = <
    Item
  Key = 'ARDE_Clep'
  Table = 'COMPOSE'
      Datasource = M_DmCompose.ds_ArbreArt
    end>
  MCVersion = '1.6.6.2'
  PixelsPerInch = 96
  TextHeight = 13
  object pa_1: TPanel
    Left = 0
    Top = 0
    Width = 872
    Height = 553
    Align = alClient
    BevelOuter = bvLowered
    TabOrder = 0
    object pa_3: TPanel
      Left = 1
      Top = 1
      Width = 870
      Height = 551
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 0
      object spl_1: TSplitter
        Left = 393
        Top = 23
        Width = 5
        Height = 528
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
      object vt_Compositions: TCheckVirtualDBTreeEx
        Left = 0
        Top = 23
        Width = 393
        Height = 528
        Align = alLeft
        Constraints.MinWidth = 10
        DBOptions = [dboAllowChecking, dboAllowRules, dboSpecialDBChecks, dboAlwaysRule, dboAlwaysStructured, dboCheckDBStructure, dboParentStructure, dboReadOnly, dboShowChecks, dboTrackActive, dboViewAll, dboWriteLevel, dboWriteSecondary]
        DataSource = M_DmCompose.ds_ArbreArt
        Header.AutoSizeIndex = 0
        Header.Font.Charset = DEFAULT_CHARSET
        Header.Font.Color = clWindowText
        Header.Font.Height = -11
        Header.Font.Name = 'MS Sans Serif'
        Header.Font.Style = []
        Header.Options = [hoColumnResize, hoDrag, hoVisible]
        Header.Style = hsXPStyle
        KeyFieldName = 'ARDE_Clep'
        OnBeforeCellPaint = vt_CompositionsBeforeCellPaint
        OnChecked = vt_CompositionsChecked
        ParentFieldName = 'ARDE_Parent'
        TabOrder = 0
        TreeOptions.MiscOptions = [toAcceptOLEDrop, toCheckSupport, toFullRepaintOnResize, toGridExtensions, toInitOnSave, toToggleOnDblClick, toWheelPanning]
        TreeOptions.PaintOptions = [toShowButtons, toShowDropmark, toShowHorzGridLines, toShowRoot, toShowTreeLines, toShowVertGridLines, toThemeAware, toUseBlendedImages]
        ViewFieldName = 'ARDE_Libelle'
        DBDataFieldNames = 'ARDE_Prix;ARDE__COMP;ARDE_Libcom;ARDE_Table_clep;ARDE_Table'
        RulerConditionField = 'CPTM_Clep'
        RulerSelectionField = 'CPTM_Clep'
        RulerActionField = 'CPTM_Selection'
        RulerChecks = vt_CompositionsRulerChecks
        DatasourceRules = M_DmCompose.ds_Comporte
        DatasourceRuleSelect = M_DmCompose.ds_SelectStru
        CheckFieldName = 'ARDE_Selection'
        Columns = <
          item
            Position = 0
            Width = 250
            WideText = 'Composer le produit'
          end
          item
            Alignment = taRightJustify
            Position = 1
            Width = 62
            WideText = 'Prix U.'
          end
          item
            Position = 2
            Width = 70
            WideText = 'Composant'
          end>
        WideDefaultText = ''
      end
      object Panel1: TPanel
        Left = 398
        Top = 23
        Width = 472
        Height = 528
        Align = alClient
        Constraints.MinWidth = 10
        TabOrder = 1
        object RbSplitter1: TSplitter
          Left = 1
          Top = 193
          Width = 470
          Height = 5
          Cursor = crVSplit
          Align = alTop
          GradientType = gtHorizontal
          GripAlign = gaHorizontal
          FadeSpeed = fsMedium
          Colors.DefaultFrom = clBtnFace
          Colors.DefaultTo = clBtnFace
          Colors.OverFrom = clWhite
          Colors.OverTo = 12489846
          ShowGrip = True
          DrawAll = True
        end
        object vt_Composant: TVirtualDBTreeEx
          Left = 1
          Top = 198
          Width = 470
          Height = 279
          Align = alClient
          DBOptions = [dboListView, dboParentStructure, dboReadOnly, dboTrackActive, dboViewAll]
          DataSource = M_DmCompose.ds_Compose
          Header.AutoSizeIndex = 0
          Header.Font.Charset = DEFAULT_CHARSET
          Header.Font.Color = clWindowText
          Header.Font.Height = -11
          Header.Font.Name = 'MS Sans Serif'
          Header.Font.Style = []
          Header.Options = [hoColumnResize, hoDblClickResize, hoDrag, hoVisible]
          Header.Style = hsXPStyle
          HintAnimation = hatNone
          HintMode = hmTooltip
          KeyFieldName = 'ARDE_Clep'
          LineMode = lmBands
          NodeAlignment = naFromTop
          NodeLines = 5
          TabOrder = 0
          TreeOptions.AutoOptions = [toAutoDropExpand, toAutoScroll, toAutoScrollOnExpand, toAutoSpanColumns, toAutoTristateTracking, toAutoDeleteMovedNodes]
          TreeOptions.MiscOptions = [toAcceptOLEDrop, toFullRepaintOnResize, toGridExtensions, toInitOnSave, toToggleOnDblClick, toWheelPanning, toVariableNodeHeight]
          TreeOptions.PaintOptions = [toHideFocusRect, toHideSelection, toShowButtons, toShowDropmark, toShowHorzGridLines, toShowTreeLines, toShowVertGridLines, toThemeAware, toUseBlendedImages, toAlwaysHideSelection]
          ViewFieldName = 'ARDE_Table_clep'
          DBDataFieldNames = 'ARDE_Libelle;ARDE_Prix;ARDE_Libcom'
          RulerConditionField = 'ARDE_Comporte_Selection'
          RulerActionField = 'ARDE_Comporte'
          Columns = <
            item
              Position = 0
              Width = 70
              WideText = 'Code'
            end
            item
              Position = 1
              Width = 326
              WideText = 'Composants'
            end
            item
              Alignment = taRightJustify
              Position = 2
              Width = 70
              WideText = 'Prix U.'
            end>
        end
        object gbx_prix: TGroupBox
          Left = 1
          Top = 477
          Width = 470
          Height = 50
          Align = alBottom
          Caption = 'Prix de Vente'
          TabOrder = 1
          object lb_pxactu: TFWLabel
            Left = 51
            Top = 22
            Width = 46
            Height = 16
            Alignment = taRightJustify
            Caption = 'Prix tarif'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object lb_pxfutur: TFWLabel
            Left = 219
            Top = 21
            Width = 49
            Height = 16
            Alignment = taRightJustify
            Caption = 'Prix futur'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            Visible = False
          end
          object ed_pxactu: TFWDBEdit
            Tag = 501
            Left = 112
            Top = 18
            Width = 60
            Height = 24
            Color = clMoneyGreen
            DataField = 'ARDE_Prix'
            DataSource = M_DmCompose.ds_Temp
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 0
          end
          object ed_pxfutur: TFWDBEdit
            Tag = 502
            Left = 288
            Top = 17
            Width = 60
            Height = 24
            Color = clMoneyGreen
            DataField = 'ARDE_Prixfutur'
            DataSource = M_DmCompose.ds_Temp
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 1
            Visible = False
          end
        end
        object Panel5: TPanel
          Left = 1
          Top = 1
          Width = 470
          Height = 192
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 2
          object Panel6: TPanel
            Left = 0
            Top = 0
            Width = 470
            Height = 25
            Align = alTop
            BevelOuter = bvNone
            TabOrder = 0
            object Label1: TFWLabel
              Tag = 501
              Left = 5
              Top = 5
              Width = 215
              Height = 16
              Caption = 'Libell'#233' complet de l'#39'article compos'#233
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
            end
          end
          object mem_LibelleArt: TJvMemo
            Tag = 501
            Left = 0
            Top = 25
            Width = 470
            Height = 167
            AutoSize = False
            ClipboardCommands = [caCopy]
            MaxLines = 0
            HideCaret = False
            Align = alClient
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 1
          end
        end
      end
      object Panel3: TPanel
        Left = 0
        Top = 0
        Width = 870
        Height = 23
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 2
        object Panel2: TPanel
          Left = 0
          Top = 0
          Width = 13
          Height = 23
          Align = alLeft
          BevelOuter = bvNone
          TabOrder = 0
        end
        object pa_CocheStru: TPanel
          Left = 639
          Top = 0
          Width = 231
          Height = 23
          Align = alRight
          BevelOuter = bvNone
          TabOrder = 1
          object bt_Valide: TFWOK
            Left = 58
            Top = 0
            Width = 80
            Height = 23
            Hint = 'Valider les composants'
            Align = alRight
            ParentShowHint = False
            ShowHint = True
            OnClick = bt_ValideClick
            Caption = 'Valider'
            TabOrder = 0
            TabStop = False
            Glyph.Data = {
              EA030000424DEA03000000000000EA0200002800000010000000100000000100
              08000000000000010000120B0000120B0000AD000000AD000000247BEB004696
              F3004A98F4002F87F000116CE600075FDC002D82EB0091C5FB00CCE6FF00D9ED
              FF00DCEDFE00C4E0FE0086BFFC00348BF4000A65E1004997F300C7E3FF00F7FB
              FF00FFFFFF00E0EFFE005CA5F8000E6BE7000552C200237BEB00BFDEFF00F3F8
              FF00D7EAFF0074B6FF0053A3FE005EA9FF00A3CFFE005DA6F7000860DE00024F
              C000EDF6FF0098CAFF001F81FF001379FF00167AFF001276FB000A6EF80054A0
              F800F0F8FF00F2F8FE003089F400146FE7009ACAFC00D8EBFF001B7EFF001E81
              FF001A7BFC001173F700368EF7002983F40063A9F60081BAF8000258D800033E
              9600207AEB00A5CFFE0075B6FF001278FF001A7DFE00187AFB001979F40082BB
              FA000E6CEE000E6CEB00EFF6FE00CEE5FE000763E20003419E001B76ED00A4CF
              FC0050A0FF002586FE00358FFA000E70F600096AF20089BFFA006AABF600025F
              EA000159E500C7E1FA00EBF6FF000C68E6000141A1000F6BE6008BC1FC0056A4
              FC0097C7FC00F8FBFF004B9AF6002882F200D9EAFC001975EB00005AE500015A
              E200D9E9FB00DEEFFF000560E20002409C00085FDA0056A1FA009ECBFB002D88
              F400D4E9FC00FCFEFE00D7E9FC008ABDF6000058E200004FE0002A7BE7009FCB
              FA000050D4000455C900207DF000E1EFFE00358CF3000F6EEE00C7E0FB002F83
              EA00004ADE000559E100BAD8F8003E8FF2000043B700075DD700529EF700FEFE
              FF00F0F7FE005CA3F3001E78EB00A1C9F7000D65E3002D7AE900BAD7F8009CC9
              F8000355DE0002398B000762E10055A0F700F3F8FE00E9F3FC00C6DEFA00D9E9
              FC0099C5F800055DE7000040A3000650BA000357D3002781F20078B4F700CAE2
              FC00E9F4FF00DCEDFF009CC7FA003F8FF2000155DD000140A40004367D000147
              B2000051D000035CE0000763E300004ED3000042B700023A8F00033B8A00033D
              9000013D9500023B9100033A89001212121212A8A9AAABACAC12121212121212
              1296A1A2A3A4A3A5A6A7A7121212121295969798999A9B9C9D9E9FA01212127F
              8C8D8E128F909112129293948B12127F80818283848586878812898A8B127374
              751276777812797A7B7C127D7E3966671268696A6B6C6D6E6F70127172395758
              12595A5B5C5D5E5F6061626364654849124A4B4C4D4E4F505152535455563A3B
              123C3D3E3F3340414243444546472D2E122F2430313233343536123738391217
              2212232425262728292A2B2C211212171819121A1B1C1D1E12121F2021121212
              0F10111212121212131415161212121212060708090A0B0C0D0E0E1212121212
              1212120001020304051212121212}
            Layout = blGlyphRight
          end
          object Panel4: TPanel
            Left = 138
            Top = 0
            Width = 13
            Height = 23
            Align = alRight
            BevelOuter = bvNone
            TabOrder = 1
          end
          object bt_fermer: TFWClose
            Left = 151
            Top = 0
            Width = 80
            Height = 23
            Hint = 'Quitter la fonction'
            Align = alRight
            ParentShowHint = False
            ShowHint = True
            OnClick = bt_fermerClick
            Caption = 'Fermer'
            TabOrder = 2
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
    end
  end
  object SvgFormInfoIni: TOnFormInfoIni
    SauvePosObjects = True
    SauveEditObjets = [feTVirtualTrees]
    SauvePosForm = True
    Left = 97
    Top = 137
  end
end
