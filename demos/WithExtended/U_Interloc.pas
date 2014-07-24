////////////////////////////////////
// Nom Unite: U_Interloc
// Date de creation : 18/08/2004
// Description : gestion des differents types de vente
//**************************************************************************
// Historique des modifications
// Quand? : Quoi?
// Qui?
/////////////////////////
unit U_Interloc;

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
  fonctions_string, u_buttons_appli,
  u_framework_components;


const   CST_INTE_Clep  = 'INTE_Clep' ;
        CST_INTE__CLIE = 'INTE__CLIE'; 

type
  TF_Interloc = class(TF_FormAdapt)
    pa_1: TPanel;
    pa_3: TPanel;
    pa_5: TPanel;
    SvgFormInfoIni: TOnFormInfoIni;
    bt_fermer: TFWClose;
    Panel1: TPanel;
    RbSplitter4: TSplitter;
    Panel12: TPanel;
    Label15: TFWLabel;
    Label16: TFWLabel;
    Label17: TFWLabel;
    Label18: TFWLabel;
    Label19: TFWLabel;
    Label20: TFWLabel;
    Label23: TFWLabel;
    ed_NomInter: TFWDBEdit;
    ed_TeleInter: TFWDBEdit;
    ed_PortabInter: TFWDBEdit;
    ed_MailInter: TFWDBEdit;
    ed_FonctionInter: TFWDBEdit;
    nv_SaisiInter: TExtDBNavigator;
    cbx_CiviliteInter: TFWDBLookupCombo;
    ed_FaxInter: TFWDBEdit;
    Panel10: TPanel;
    Panel11: TPanel;
    nv_navInter: TExtDBNavigator;
    gd_Interlo: TExtDBGrid;
    Label1: TFWLabel;
    Label2: TFWLabel;
    procedure F_FormDicoCreate(Sender: TObject);
    procedure F_FormDicoActivate(Sender: TObject);
    procedure F_FormDicoDestroy(Sender: TObject);
  end;

var
  F_Interloc: TF_Interloc;

implementation

{$IFNDEF FPC}
  {$R *.dfm}
{$ELSE}
  {$R *.lfm}
{$ENDIF}

uses fonctions_forms;



/////////////////////////////////////////////////////////////////////////////
// Proc?dure : F_FormDicoCreate(Sender: TObject)
// Description : Creation de la fiche
/////////////////////////////////////////////////////////////////////////////
procedure TF_Interloc.F_FormDicoCreate(Sender: TObject);
begin
  F_Interloc := Self;
//  p_ChampsVersListe ( gstl_Interloc,CST_INTE__CLIE + ';' + CST_INTE_Clep, ';' );
end;


/////////////////////////////////////////////////////////////////////////////
// Proc?dure : F_FormDicoActivate(Sender: TObject)
// Description : Initialisations SQL
/////////////////////////////////////////////////////////////////////////////
procedure TF_Interloc.F_FormDicoActivate(Sender: TObject);
begin
  //ouverture de la requ?te en fonction du client
  M_Donn.zq_Civilite.Close;
  M_Donn.zq_Civilite.Open;
end;


procedure TF_Interloc.F_FormDicoDestroy(Sender: TObject);
begin
//  gstl_Interloc.Free ;
  F_Interloc := nil ;

end;


end.


