////////////////////////////////////
// Nom Unite: U_TVA
// Description : gestion des taux de T.V.A.
// Cr?? par Microcelt le 18/08/2004
// Modifi? le 17/12/2004
/////////////////////////
unit U_TVA;

{$IFDEF FPC}
  {$MODE Delphi}
{$ENDIF}

interface

uses
{$IFNDEF FPC}
  RbSplitter, RXSplit, Mask,
{$ELSE}
  MaskEdit,
{$ENDIF}
  LCLType, Messages, Graphics, Controls, Classes, ExtCtrls,  Dialogs, DB, IBQuery,IBTable,IBUpdateSQL,
  U_ExtDBNavigator, Buttons, Forms, DBCtrls, Grids,
  DBGrids, u_framework_dbcomponents, ComCtrls, StdCtrls, SysUtils,  TypInfo,  Variants,
  StrUtils, ToolEdit, U_FormAdapt, U_OnFormInfoIni,  JvXpButtons,
  u_framework_components, u_buttons_appli,
  U_ExtDBGrid,U_DmDonn,U_ConstMessage;

type
  TF_TVA = class(TF_FormAdapt)
    nv_navigator: TExtDBNavigator;
    nv_saisie: TExtDBNavigator;
    lb_code: TFWLabel;
    lb_taux: TFWLabel;
    ed_code: TFWDBEdit;
    ed_taux: TFWDBEdit;
    pa_1: TPanel;
    pa_2: TPanel;
    pa_3: TPanel;
    pa_4: TPanel;
    pa_5: TPanel;
    pa_6: TPanel;
    SvgFormInfoIni: TOnFormInfoIni;
    spl_1: TSplitter;
    gd_tva: TExtDBGrid;
    Panel2: TPanel;
    Panel11: TPanel;
    bt_apercu: TFWPreview;
    Panel4: TPanel;
    bt_imprimer: TFWPrint;
    Panel7: TPanel;
    Panel8: TPanel;
    bt_fermer: TFWClose;
  end;

var
  F_TVA: TF_TVA;

implementation

uses fonctions_forms;

{$IFNDEF FPC}
  {$R *.dfm}
{$ELSE}
  {$R *.lfm}
{$ENDIF}

end.

