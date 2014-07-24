object F_Comm: TF_Comm
  Left = 313
  Top = 254
  Width = 375
  Height = 279
  BorderIcons = []
  Caption = 'Communication MMO - VITRE'
  Color = clWhite
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 367
    Height = 245
    Align = alClient
    Color = clWhite
    TabOrder = 0
    object ch_Negocie: TCheckBox
      Left = 72
      Top = 40
      Width = 217
      Height = 17
      Caption = 'N'#233'gociation en cours'
      Checked = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      State = cbChecked
      TabOrder = 0
    end
    object ch_Envoie: TCheckBox
      Left = 72
      Top = 72
      Width = 217
      Height = 17
      Caption = 'Envoi des donn'#233'es'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      Visible = False
    end
    object ch_Recoit: TCheckBox
      Left = 72
      Top = 104
      Width = 217
      Height = 17
      Caption = 'R'#233'ception des donn'#233'es'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      Visible = False
    end
    object ch_Fin: TCheckBox
      Left = 72
      Top = 136
      Width = 217
      Height = 17
      Caption = 'Fin de communication'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 3
      Visible = False
    end
  end
  object Timer1: TTimer
    OnTimer = Timer1Timer
    Left = 264
    Top = 40
  end
end
