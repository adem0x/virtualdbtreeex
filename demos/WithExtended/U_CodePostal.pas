///////////////////////////////////////////////////////////////////////
// Nom Unite: U_Codepostal
// Description : Gestion des Codes postaux
// Créé par Microcelt le 01/11/2004
// Modifié le 17/12/2004
///////////////////////////////////////////////////////////////////////
unit U_CodePostal;

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
  u_buttons_appli,u_framework_components,
  DBGrids, u_framework_dbcomponents, ComCtrls, StdCtrls, SysUtils, TypInfo,
  Variants, StrUtils, ToolEdit, U_FormAdapt, U_OnFormInfoIni, JvXPButtons, fonctions_string,U_DmDonn, U_ExtDBGrid,U_ConstMessage;

type

  { TF_CodePostal }

  TF_CodePostal = class(TF_FormAdapt)
    nv_navigator: TExtDBNavigator;
    nv_saisie: TExtDBNavigator;
    pa_1: TPanel;
    pa_2: TPanel;
    pa_3: TPanel;
    pa_4: TPanel;
    pa_5: TPanel;
    SvgFormInfoIni: TOnFormInfoIni;
    ed_burdist: TFWDBEdit;
    ed_coordgeo: TFWDBEdit;
    ed_insee: TFWDBEdit;
    ed_ville: TFWDBEdit;
    lb_ville: TFWLabel;
    lb_insee: TFWLabel;
    lb_coordgeo: TFWLabel;
    lb_burdist: TFWLabel;
    lb_code: TFWLabel;
    ed_code: TFWDBEdit;
    lb_ordre: TFWLabel;
    ed_ordre: TFWDBEdit;
    spl_1: TSplitter;
    gd_codepostal: TExtDBGrid;
    Panel1: TPanel;
    Panel11: TPanel;
    bt_apercu: TFWPreview;
    Panel2: TPanel;
    bt_imprimer: TFWPrint;
    Panel5: TPanel;
    Panel6: TPanel;
    bt_fermer: TFWClose;
    procedure bt_fermerClick(Sender: TObject);
    procedure F_FormDicoActivate(Sender: TObject);
    procedure gd_codepostalDblClick(Sender: TObject);
    procedure F_FormDicoShow(Sender: TObject);
    procedure F_FormDicoCreate(Sender: TObject);
    procedure F_FormDicoDestroy(Sender: TObject);
    procedure pa_3Click(Sender: TObject);

  private
    { Déclarations privées }
    function LireCode: string;
    function LireVille: string;
    function LireCodeInsee: string;    
    procedure EcrireCode(as_Code: string);
    procedure EcrireVille(as_Ville: string);
    procedure EcrireCodeInsee(as_Code: string);
  public
    { Déclarations publiques }
    gb_valide : boolean;
    property CodeALire: string read LireCode write EcrireCode;
    property VilleALire: string read LireVille write EcrireVille;
    property CodeinseeALire: string read LireCodeInsee write EcrireCodeInsee;
  end;

var
  F_CodePostal: TF_CodePostal;

implementation

uses U_Client;

{$IFNDEF FPC}
  {$R *.dfm}
{$ELSE}
  {$R *.lfm}
{$ENDIF}

var gs_CodePostal, gs_ville, gs_codeinsee: string;

///////////////////////////////////////////////////////////////////////
// Procedure : EcrireCode
// Description : Ecriture du code postal dans la variable local
// Arguments : as_Code, code postal
///////////////////////////////////////////////////////////////////////
procedure TF_CodePostal.EcrireCode(as_Code: string);
begin
  gs_CodePostal := as_Code;
end;

///////////////////////////////////////////////////////////////////////
// Fonction : LireCode
// Description : Lecture du code postal dans la variable local
// Retour : string, le code postal
///////////////////////////////////////////////////////////////////////
function TF_CodePostal.LireCode: string;
begin
  Result := gs_CodePostal;
end;

///////////////////////////////////////////////////////////////////////
// Procedure : EcrireCodeInsee
// Description : Ecriture du code insee dans la variable local
// Arguments : as_Code, code insee
///////////////////////////////////////////////////////////////////////
procedure TF_CodePostal.EcrireCodeInsee(as_Code: string);
begin
  gs_Codeinsee := as_Code;
end;

///////////////////////////////////////////////////////////////////////
// Fonction : LireCodeInsee
// Description : Lecture du code insee dans la variable local
// Retour : string, le code insee
///////////////////////////////////////////////////////////////////////
function TF_CodePostal.LireCodeInsee: string;
begin
  Result := gs_Codeinsee;
end;

///////////////////////////////////////////////////////////////////////
// Procedure : EcrireVille
// Description : Ecriture de la ville dans la variable local
// Arguments : as_Code, ville
///////////////////////////////////////////////////////////////////////
procedure TF_CodePostal.EcrireVille(as_Ville: string);
begin
  gs_Ville := as_Ville;
end;

///////////////////////////////////////////////////////////////////////
// Fonction : LireVille
// Description : Lecture de la ville dans la variable local
// Retour : string, la ville
///////////////////////////////////////////////////////////////////////
function TF_CodePostal.LireVille: string;
begin
  Result := gs_Ville;
end;

///////////////////////////////////////////////////////////////////////
// Procedure : gd_codepostalDblClick
// Description : Double clique sur la grille met à jour les variables
///////////////////////////////////////////////////////////////////////
procedure TF_CodePostal.gd_codepostalDblClick(Sender: TObject);
begin
  if Self.FormStyle = fsNormal then
    begin
      gb_valide     := True;
      gs_CodePostal := ed_code.Text;
      gs_Ville      := ed_ville.Text;
      gs_codeinsee  := ed_insee.Text;
      Self.Close;
    end;
end;

///////////////////////////////////////////////////////////////////////
// Procedure : bt_fermerClick
// Description : Fermeture de la fiche sur le click du bouton fermer
///////////////////////////////////////////////////////////////////////
procedure TF_CodePostal.bt_fermerClick(Sender: TObject);
begin
  Close;
end;

///////////////////////////////////////////////////////////////////////
// Procedure : F_FormDicoActivate
// Description : à l'activation de la fiche, repositionnement sur la dernière ville
///////////////////////////////////////////////////////////////////////
procedure TF_CodePostal.F_FormDicoActivate(Sender: TObject);
begin

end;

procedure TF_CodePostal.F_FormDicoShow(Sender: TObject);
begin
  // Positionnement direct sur la ligne si le code et la ville sont renseignés
  if not fb_stringVide(gs_Ville) then
    M_Donn.zq_cp.Locate('COPO_Clep;COPO_Ville', VarArrayOf([gs_CodePostal, gs_Ville]), [loPartialKey])
  else  // Positionnement sur le 1er de la liste si seul le code est renseigné
    M_Donn.zq_cp.Locate('COPO_Clep', gs_CodePostal, [loPartialKey])


end;

procedure TF_CodePostal.F_FormDicoCreate(Sender: TObject);
begin
  F_CodePostal := self;
end;

procedure TF_CodePostal.F_FormDicoDestroy(Sender: TObject);
begin
  F_CodePostal := nil ;
end;

procedure TF_CodePostal.pa_3Click(Sender: TObject);
begin

end;

end.

