///////////////////////////////////////////////////////////////////////
// Nom Unite: U_Fournisseur
// Description : Gestion des Fournisseurs
// Cr?? par Microcelt le 01/11/2004
// Modifi? le 17/12/2004
///////////////////////////////////////////////////////////////////////
unit U_Fournisseur;

{$IFDEF FPC}
  {$MODE Delphi}
{$ENDIF}

interface

uses
{$IFNDEF FPC}
  JvDBLookup, RbSplitter, UltimDBGrid, RXSplit, Mask,
{$ELSE}
  MaskEdit,
{$ENDIF}
  LCLType, Messages, Graphics, Controls, Classes, ExtCtrls,  Dialogs, DB, IBQuery,IBTable,IBUpdateSQL,
  U_ExtDBNavigator, Buttons, Forms, DBCtrls, Grids,
  DBGrids, u_framework_dbcomponents, ComCtrls, StdCtrls, SysUtils,
  TypInfo, Variants, StrUtils, ToolEdit, U_FormAdapt, U_OnFormInfoIni,
  U_ExtDBGrid,U_ConstMessage,
  JvXPButtons, u_framework_components, u_buttons_appli;

const CST_FOUR__FIPR = 'FOUR__FIPR' ; 
type
  TF_Fournisseur = class(TF_FormAdapt)
    nv_navigator: TExtDBNavigator;
    nv_saisie: TExtDBNavigator;
    pa_1: TPanel;
    pa_2: TPanel;
    pa_3: TPanel;
    pa_4: TPanel;
    pa_5: TPanel;
    SvgFormInfoIni: TOnFormInfoIni;
    rb_1: TSplitter;
    gd_fournisseur: TExtDBGrid;
    pa_6: TPanel;
    lb_nom: TFWLabel;
    lb_code: TFWLabel;
    lb_adresse: TFWLabel;
    lb_codepost: TFWLabel;
    lb_ville: TFWLabel;
    lb_pays: TFWLabel;
    lb_tel: TFWLabel;
    lb_numposte: TFWLabel;
    lb_mobile: TFWLabel;
    lb_fax: TFWLabel;
    lb_email: TFWLabel;
    lb_siteweb: TFWLabel;
    lb_coefrefac: TFWLabel;
    lb_coefport: TFWLabel;
    ed_nom: TFWDBEdit;
    ed_code: TFWDBEdit;
    ed_adress1: TFWDBEdit;
    ed_adress2: TFWDBEdit;
    ed_adress3: TFWDBEdit;
    ed_codepost: TFWDBEdit;
    bt_codpostal: TJvXpButton;
    ed_ville: TFWDBEdit;
    Cbx_pays: TDBLookupComboBox;
    ed_tel: TFWDBEdit;
    ed_numposte: TFWDBEdit;
    ed_mobile: TFWDBEdit;
    ed_fax: TFWDBEdit;
    ed_email: TFWDBEdit;
    ed_siteweb: TFWDBEdit;
    ed_coefrefac: TFWDBEdit;
    ed_coefport: TFWDBEdit;
    Panel3: TPanel;
    Panel11: TPanel;
    bt_apercu: TFWPreview;
    Panel4: TPanel;
    bt_imprimer: TFWPrint;
    Panel1: TPanel;
    Panel2: TPanel;
    bt_fermer: TFWClose;
    procedure bt_fermerClick(Sender: TObject);
    procedure bt_codpostalClick(Sender: TObject);
    procedure F_FormDicoCreate(Sender: TObject);
  end;

var
  F_Fournisseur: TF_Fournisseur;

implementation
uses U_CodePostal, U_DmDonn,
     fonctions_forms,
     fonctions_erreurs;

{$IFNDEF FPC}
  {$R *.dfm}
{$ELSE}
  {$R *.lfm}
{$ENDIF}

///////////////////////////////////////////////////////////////////////
// Procedure : bt_fermerClick
// Description : Fermeture de la fiche sur le click du bouton fermer
///////////////////////////////////////////////////////////////////////
procedure TF_Fournisseur.bt_fermerClick(Sender: TObject);
begin
  Close;
end;

///////////////////////////////////////////////////////////////////////
// Procedure : bt_codpostalClick
// Description : Appel ? la fiche code postal
///////////////////////////////////////////////////////////////////////
procedure TF_Fournisseur.bt_codpostalClick(Sender: TObject);
begin
  // On ferme la fen?tre si elle est ouverte
  p_CloseForm('F_CodePostal');
  Application.ProcessMessages;

  // On affecte le code postal et la ville ? la fiche des code postaux
  F_CodePostal.CodeALire  := M_Donn.ds_four.DataSet.FieldByName('FOUR_Codepostal').AsString;
  F_CodePostal.VilleALire := M_Donn.ds_four.DataSet.FieldByName('FOUR_Ville').AsString;

  // Appel de la fiche Code Postal
  fp_CreateUniqueChild ( TF_CodePostal, fsMDIChild );

  F_CodePostal.gb_Valide := False;
  F_CodePostal.ShowModal;

  // Si on a double-cliqu? sur un enregistrement de la grille,
  // on r?percute les changements
  if F_CodePostal.gb_Valide then
    begin
      if  not (M_Donn.ds_four.state in [dsEdit]) then
        M_Donn.ds_four.Edit;
        M_Donn.ds_four.DataSet.FieldByName('FOUR_Codepostal').AsString := F_CodePostal.CodeALire;
         M_Donn.ds_four.DataSet.FieldByName('FOUR_Ville').AsString := F_CodePostal.VilleALire;
    end;

  // pour etre positionn? sur le 1er enregistrement si l'on appelle
  // la fenetre des codes postaux a partir du menu
  F_CodePostal.CodeALire  := '';
  F_CodePostal.VilleALire := '';
end;


///////////////////////////////////////////////////////////////////////
// Procedure : F_FormDicoCreate
// Description : ? la cr?ation de la fiche, initialisation de variable
///////////////////////////////////////////////////////////////////////
procedure TF_Fournisseur.F_FormDicoCreate(Sender: TObject);
begin
  F_Fournisseur := Self;

end;

end.

