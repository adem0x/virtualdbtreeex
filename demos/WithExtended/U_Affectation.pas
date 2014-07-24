////////////////////////////////////
// Nom Unite: U_Interloc
// Date de creation : 18/08/2004
// Description : gestion des differents types de vente
//**************************************************************************
// Historique des modifications
// Quand? : Quoi?
// Qui?
/////////////////////////
unit U_Affectation;

{$IFDEF FPC}
  {$MODE Delphi}
{$ENDIF}

interface

uses
  LCLType, Messages, Graphics, Controls, Classes, ExtCtrls,  Dialogs, DB, IBQuery,IBTable,IBUpdateSQL,
  U_ExtDBNavigator, Buttons, Forms, MaskEdit, DBCtrls, Grids,
  DBGrids, u_framework_dbcomponents, ComCtrls, StdCtrls, SysUtils,  TypInfo,  Variants,
  StrUtils, ToolEdit, U_FormAdapt, U_OnFormInfoIni,  JvXPButtons,
  U_ExtDBGrid,U_DmDonn,U_Constmessage, U_GroupView,
  fonctions_string,
  u_framework_components, u_buttons_appli;


const   CST_AFFE_Clep  = 'AFFE_Clep' ;
        CST_AFFE__CLIE = 'AFFE__CLIE';

type
  TF_Affectation = class(TF_FormAdapt)
    pa_1: TPanel;
    pa_3: TPanel;
    pa_5: TPanel;
    SvgFormInfoIni: TOnFormInfoIni;
    bt_fermer: TFWClose;
    Panel1: TPanel;
    RbSplitter4: TSplitter;
    Panel12: TPanel;
    Label15: TFWLabel;
    ed_Affecte: TFWDBEdit;
    nv_SaisiInter: TExtDBNavigator;
    Panel10: TPanel;
    Panel11: TPanel;
    nv_navInter: TExtDBNavigator;
    gd_Affecte: TExtDBGrid;
    lb_NomClient: TFWLabel;
    Label1: TFWLabel;
    procedure F_FormDicoCreate(Sender: TObject);
    procedure gd_AffecteDblClick(Sender: TObject);
    procedure F_FormDicoDestroy(Sender: TObject);
    procedure F_FormDicoClose(Sender: TObject; var Action: TCloseAction);
  public
    gb_Valide  ,
    gb_Appelle : Boolean ;
    { Déclarations publiques }

  end;

var
  F_Affectation: TF_Affectation;

implementation

{$IFNDEF FPC}
  {$R *.dfm}
{$ELSE}
  {$R *.lfm}
{$ENDIF}

uses fonctions_forms;

/////////////////////////////////////////////////////////////////////////////
// Procédure : F_FormDicoCreate(Sender: TObject)
// Description : Creation de la fiche
/////////////////////////////////////////////////////////////////////////////
procedure TF_Affectation.F_FormDicoCreate(Sender: TObject);
begin
  F_Affectation := Self;
end;


/////////////////////////////////////////////////////////////////////////////
// Procédure : gd_InterloDblClick(Sender: TObject)
// Description : Selection d'un interlocuteur pour la fiche Devis
/////////////////////////////////////////////////////////////////////////////
procedure TF_Affectation.gd_AffecteDblClick(Sender: TObject);
begin
  gb_Valide := True ;
  Close;
end;

procedure TF_Affectation.F_FormDicoDestroy(Sender: TObject);
begin
  F_Affectation :=  nil ;
end;

procedure TF_Affectation.F_FormDicoClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caHide ;
end;


end.


