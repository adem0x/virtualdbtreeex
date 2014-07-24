///////////////////////////////////////////////////////////////////////
// Nom Unite: U_Categorie
// Description : Gestion des Catégorie
// Créé par Microcelt le 01/11/2004
// Modifié le 17/12/2004
///////////////////////////////////////////////////////////////////////
unit U_Categorie;

{$IFDEF FPC}
  {$MODE Delphi}
{$ENDIF}

interface

uses
{$IFNDEF FPC}
  RbSplitter, UltimDBGrid, RXSplit, Mask,
{$ELSE}
  MaskEdit,
{$ENDIF}
  LCLType, Messages, Graphics, Controls, Classes, ExtCtrls,  Dialogs, DB, IBQuery,IBTable,IBUpdateSQL,
  U_ExtDBNavigator, Buttons, Forms, DBCtrls, Grids,
  DBGrids, u_framework_dbcomponents, ComCtrls, StdCtrls, SysUtils,  TypInfo,
  Variants, StrUtils, ToolEdit, U_FormAdapt, U_OnFormInfoIni,
  JvXpButtons,U_Dmdonn, U_ExtDBGrid,U_Constmessage,
  u_framework_components, u_buttons_appli;

type
  TF_Categ = class(TF_FormAdapt)
    nv_navigator: TExtDBNavigator;
    nv_saisie: TExtDBNavigator;
    pa_1: TPanel;
    pa_2: TPanel;
    pa_3: TPanel;
    pa_4: TPanel;
    pa_5: TPanel;
    SvgFormInfoIni: TOnFormInfoIni;
    spl_1: TSplitter;
    lb_codecateg: TFWLabel;
    lb_libelcateg: TFWLabel;
    ed_libelcateg: TFWDBEdit;
    ed_codecateg: TFWDBEdit;
    chbx_valide: TDBCheckBox;
    gd_categ: TExtDBGrid;
    Panel1: TPanel;
    Panel11: TPanel;
    bt_apercu: TFWPreview;
    Panel2: TPanel;
    bt_imprimer: TFWPrint;
    Panel5: TPanel;
    Panel6: TPanel;
    bt_fermer: TFWClose;
    procedure F_FormDicoCreate(Sender: TObject);

  private
    { Déclarations privées }

  public
    { Déclarations publiques }
  end;

var
  F_Categ: TF_Categ;

implementation

uses fonctions_forms;

{$IFNDEF FPC}
  {$R *.dfm}
{$ELSE}
  {$R *.lfm}
{$ENDIF}


///////////////////////////////////////////////////////////////////////
// Procedure : F_FormDicoCreate
// Description : à la création de la fiche, initialisation de variable
///////////////////////////////////////////////////////////////////////
procedure TF_Categ.F_FormDicoCreate(Sender: TObject);
begin
  F_Categ := Self;

end;

end.

