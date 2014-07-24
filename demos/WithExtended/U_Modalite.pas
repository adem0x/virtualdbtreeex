//////////////////////////////////////////////////////////////////////
// Nom Unite: U_Modalite
// Date de creation : 25/08/2004
// Description : gestion des modalites commerciales
//*******************************************************************
// Historique des modifications
// Quand? : Quoi?
// Qui?
//////////////////////////////////////////////////////////////////////
unit U_Modalite;

{$IFDEF FPC}
  {$MODE Delphi}
{$ENDIF}

interface

uses
{$IFNDEF FPC}
  u_extdbgrid, RbSplitter, UltimDBGrid, RXSplit, Mask,
{$ELSE}
  MaskEdit,
{$ENDIF}
  LCLType, Messages, Graphics, Controls, Classes, ExtCtrls,  Dialogs, DB, IBQuery,IBTable,IBUpdateSQL,
  U_ExtDBNavigator, Buttons,  Forms, DBCtrls, Grids,
  DBGrids, u_framework_dbcomponents, ComCtrls, StdCtrls, SysUtils,  TypInfo,
  Variants, StrUtils, ToolEdit, U_FormAdapt, U_OnFormInfoIni,
  u_framework_components,u_buttons_appli, u_extdbgrid,
  JvXpButtons,U_Dmdonn,U_ConstMessage;

type
  TF_Modalite = class(TF_FormAdapt)
    nv_typModalite: TExtDBNavigator;
    nv_saisieModalite: TExtDBNavigator;
    lb_code: TFWLabel;
    ed_code: TFWDBEdit;
    ed_design: TFWDBEdit;
    pa_1: TPanel;
    pa_2: TPanel;
    pa_3: TPanel;
    pa_4: TPanel;
    pa_5: TPanel;
    pa_6: TPanel;
    SvgFormInfoIni: TOnFormInfoIni;
    spl_1: TSplitter;
    mo_lib: TDBMemo;
    lb_design: TFWLabel;
    lb_lib: TFWLabel;
    gd_typModalite: TExtDBGrid;
    ch_Defaut: TDBCheckBox;
    lb_Defaut: TFWLabel;
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    nv_navModalite: TExtDBNavigator;
    gd_modalite: TExtDBGrid;
    Panel4: TPanel;
    Panel11: TPanel;
    bt_apercu: TFWPreview;
    Panel5: TPanel;
    bt_imprimer: TFWPrint;
    Panel7: TPanel;
    Panel8: TPanel;
    dbtn_fermer: TFWClose;
    RbSplitter5: TSplitter;
    procedure F_FormDicoCreate(Sender: TObject);

  public
    { D?clarations publiques }
  end;

var
  F_Modalite: TF_Modalite;

implementation

{$IFNDEF FPC}
  {$R *.dfm}
{$ELSE}
  {$R *.lfm}
{$ENDIF}

procedure TF_Modalite.F_FormDicoCreate(Sender: TObject);
begin
  F_Modalite := Self;
end;

end.

