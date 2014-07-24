object F_ListeCoul: TF_ListeCoul
  Left = 295
  Top = 164
  Width = 467
  Height = 480
  Caption = 'Fen'#234'tre de s'#233'lection d'#39'une couleur'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object ExRxDBGrid1: TExtDBGrid
    Left = 0
    Top = 0
    Width = 459
    Height = 446
    Align = alClient
    BorderStyle = bsNone
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    ScrollBars = ssVertical
    Controls = <>
    EditColor = clWindow
    DefaultRowHeight = 17
    RowColor1 = clInfoBk
    RowColor2 = clWindow
    UseRowColors = True
    HighlightColor = clInactiveCaption
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
    Columns = <
      item
        Expanded = False
        FieldName = 'COUL_Clep'
        Title.Caption = 'Code'
        Width = 73
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'COUL_Lib'
        Title.Caption = 'Libell'#233
        Width = 354
        Visible = True
      end>
  end
end
