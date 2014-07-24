///////////////////////////////////////////////////////////////////////
// Nom Unite: U_Famille
// Description : Gestion des Familles des clients
// Cr?? par Microcelt le 01/11/2004
// Modifi? le 17/12/2004
///////////////////////////////////////////////////////////////////////
unit U_Famille;

{$IFDEF FPC}
  {$MODE Delphi}
{$ENDIF}

interface

uses
{$IFNDEF FPC}
  AdvListV, RbSplitter, UltimDBGrid, RXSplit, Mask,
{$ELSE}
  MaskEdit,
{$ENDIF}
  LCLType, Messages, Graphics, Controls, Classes, ExtCtrls,  Dialogs, DB, IBQuery,IBTable,IBUpdateSQL,
  U_ExtDBNavigator, Buttons, Forms, DBCtrls, Grids,
  DBGrids, u_framework_dbcomponents, ComCtrls, StdCtrls, SysUtils,  TypInfo,
  Variants, StrUtils, ToolEdit, U_FormAdapt, U_OnFormInfoIni,
  JvXPButtons,U_Dmdonn,U_FormMainIni, U_ExtDBGrid,U_ConstMessage,
  U_GroupView, u_framework_components,
  u_buttons_appli;

type
  TF_Famille = class(TF_FormAdapt)
    nv_navigator: TExtDBNavigator;
    pa_1: TPanel;
    pa_2: TPanel;
    pa_4: TPanel;
    SvgFormInfoIni: TOnFormInfoIni;
    spl_1: TSplitter;
    gd_famille: TExtDBGrid;
    Panel3: TPanel;
    Panel11: TPanel;
    bt_apercu: TFWPreview;
    Panel4: TPanel;
    bt_imprimer: TFWPrint;
    Panel1: TPanel;
    Panel2: TPanel;
    dbtn_fermer: TFWClose;
    Panel5: TPanel;
    pa_3: TPanel;
    lb_libelfami: TFWLabel;
    lb_codefami: TFWLabel;
    lb_diffusion_general: TFWLabel;
    pa_5: TPanel;
    nv_saisie: TExtDBNavigator;
    dbed_codefami: TFWDBEdit;
    dbed_libelfami: TFWDBEdit;
    chx_valide: TDBCheckBox;
    Panel6: TPanel;
    procedure F_FormDicoCreate(Sender: TObject);

  private
    { D?clarations priv?es }

  public
    { D?clarations publiques }
  end;

var
  F_Famille: TF_Famille;

implementation

uses fonctions_forms;

{$IFNDEF FPC}
  {$R *.dfm}
{$ELSE}
  {$R *.lfm}
{$ENDIF}

///////////////////////////////////////////////////////////////////////
// Procedure : F_FormDicoCreate
// Description : ? la cr?ation de la fiche, initialisation de variable
///////////////////////////////////////////////////////////////////////
procedure TF_Famille.F_FormDicoCreate(Sender: TObject);
begin
  F_Famille := Self;
end;

end.

