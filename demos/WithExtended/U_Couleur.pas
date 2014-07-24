///////////////////////////////////////////////////////////////////////
// Nom Unite: U_Couleur
// Description : Gestion des Couleurs
// Créé par Microcelt le 01/11/2004
// Modifié le 17/12/2004
///////////////////////////////////////////////////////////////////////
unit U_Couleur;

interface

uses
  LCLType, Messages, Graphics, Controls, Classes, ExtCtrls,  Dialogs, DB, ZDataset,
  U_ExtDBNavigator, Buttons, TB97, TB97Tlbr, RXSplit, Forms, Mask, DBCtrls, Grids,
  DBGrids, u_framework_dbcomponents, UltimDBGrid, ComCtrls, StdCtrls, SysUtils,
  TypInfo, Variants, StrUtils, ToolEdit, U_FormAdapt, U_DmDonn,
  U_OnFormInfoIni,  JvXpButtons, RbSplitter, U_ExtDBGrid,U_ConstMessage,
  fonctions_string, U_ExtNumEdits, AdvListV, U_GroupView;

type
  TF_Finition = class(TF_FormAdapt)
    nv_navigator: TExtDBNavigator;
    nv_saisie: TExtDBNavigator;
    pa_1: TPanel;
    pa_2: TPanel;
    pa_3: TPanel;
    pa_4: TPanel;
    pa_5: TPanel;
    SvgCouleur: TOnFormInfoIni;
    bt_fermer: TFWClose;
    gd_Datasource: TExtDBGrid;
    RbSplitter1: TSplitter;
    pa_6: TPanel;
    ed_Taux: TExtDBNumEdit;
    lb_taux: TFWLabel;
    ed_libcoul: TFWDBEdit;
    lb_libcoul: TFWLabel;
    ed_codecoul: TFWDBEdit;
    lb_codecoul: TFWLabel;
    pc_Groupes: TPageControl;
    ts_GroupeFinition: TTabSheet;
    RbSplitter2: TSplitter;
    Panel10: TPanel;
    Panel12: TPanel;
    Panel13: TPanel;
    Panel2: TPanel;
    Panel5: TPanel;
    bt_abandonner: TFWCancel;
    bt_enregistrer: TFWOK;
    bt_TypeFinition: TJvXpButton;
    Panel6: TPanel;
    lv_GroupeIn: TDBGroupView;
    Panel3: TPanel;
    bt_in_item: TFWInSelect;
    bt_in_total: TFWInAll;
    bt_out_item: TFWOutSelect;
    bt_out_total: TFWOutAll;
    lv_GroupeOut: TDBGroupView;
    RbSplitter3: TSplitter;
    procedure bt_fermerClick(Sender: TObject);
    procedure F_FormDicoCloseQuery(Sender: TObject;
      var CanClose: Boolean);
    procedure F_FormDicoCreate(Sender: TObject);
    procedure gd_DatasourceDblClick(Sender: TObject);
    procedure F_FormDicoActivate(Sender: TObject);
    procedure F_FormDicoDestroy(Sender: TObject);
    procedure bt_TypeFinitionClick(Sender: TObject);
    procedure F_FormDicoDataOnSave(Sender: TObject);
    procedure F_FormDicoDataOnCancel(Sender: TObject);


  private
    { Déclarations privées }
    function LireCode: string;
    function LireLib : string;
    procedure EcrireCode(as_Code: string);
    procedure EcrireLib(as_Lib: string);
  public
    { Déclarations publiques }
    gb_ValideCoul : boolean;
    property CodeALire: string read LireCode write EcrireCode;
    property LibALire : string read LireLib  write EcrireLib;
    procedure p_FormatNumerique   ( const aobj_GrilleEdit : TObject ; const as_ChampGrille : String ; var ab_Negatif : Boolean ; var aby_ChiffresAvantVirgule,  aby_ChiffresApresVirgule : Byte ); override ;
  end;

var
  F_Finition: TF_Finition;

implementation

{$R *.dfm}
uses U_FenetrePrincipale, fonctions_Objets_Data ;

var gs_Code, gs_Lib: string;

///////////////////////////////////////////////////////////////////////
// Procedure : EcrireCode
// Description : Ecriture du code couleur dans la variable local
// Arguments : as_Code, code couleur
///////////////////////////////////////////////////////////////////////
procedure TF_Finition.EcrireCode(as_Code: string);
begin
  gs_Code := as_Code;
end;

///////////////////////////////////////////////////////////////////////
// Fonction : LireCode
// Description : Lecture du code couleur dans la variable local
// Retour : string, le code couleur
///////////////////////////////////////////////////////////////////////
function TF_Finition.LireCode: string;
begin
  Result := gs_Code;
end;

///////////////////////////////////////////////////////////////////////
// Procedure : EcrireLib
// Description : Ecriture du libellé de la couleur dans la variable local
// Arguments : as_Code, libellé couleur
///////////////////////////////////////////////////////////////////////
procedure TF_Finition.EcrireLib(as_Lib: string);
begin
  gs_Lib := as_Lib;
end;

///////////////////////////////////////////////////////////////////////
// Fonction : LireLib
// Description : Lecture du libellé de la couleur dans la variable local
// Retour : string, le libellé couleur
///////////////////////////////////////////////////////////////////////
function TF_Finition.LireLib: string;
begin
  Result := gs_Lib;
end;

///////////////////////////////////////////////////////////////////////
// Procedure : bt_fermerClick
// Description : Fermeture de la fiche sur le click du bouton fermer
///////////////////////////////////////////////////////////////////////
procedure TF_Finition.bt_fermerClick(Sender: TObject);
begin
  Close;
end;

///////////////////////////////////////////////////////////////////////
// Procedure : F_FormDicoCloseQuery
// Description : Fermeture de la fiche avec Contrôle de modification
//        des données de la fiche
///////////////////////////////////////////////////////////////////////
procedure TF_Finition.F_FormDicoCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  if gb_SauverModifications then
    case MessageDlg(U_CST_9602, mtConfirmation, mbYesNoCancel, 0) of
      mrCancel: CanClose := False;
      mrYes: try
               if (Datasource.DataSet.State in [dsInsert, dsEdit]) then
                 DBSources[0].Datasource.DataSet.Post;
             Except
              on e: Exception do
                Begin
                  Canclose := False ;
                  fcla_GereException ( e, DBSources[0].Datasource.DataSet );
                End ;
             end;
      mrNo: try
              if (Datasource.DataSet.State in [dsInsert, dsEdit]) then
                DBSources[0].Datasource.DataSet.Cancel;
             Except
              on e: Exception do
                Begin
                  fcla_GereException ( e, DBSources[0].Datasource.DataSet );
                End ;
             end;
    end;
end;

///////////////////////////////////////////////////////////////////////
// Procedure : F_FormDicoCreate
// Description : à la création de la fiche, initialisation de variable
///////////////////////////////////////////////////////////////////////
procedure TF_Finition.F_FormDicoCreate(Sender: TObject);
begin
  F_Finition := Self;
  if gi_niveau_priv < U_CST_SIEGE Then
    begin
      p_SetAllReadOnly ( nil );
      bt_typeFinition.Enabled := false;
      lv_GroupeIn.Enabled := false;
      lv_GroupeOut.Enabled := false;
      bt_in_item.Enabled:=false;
      bt_out_item.Enabled:=false;
      bt_out_total.Enabled:=false;
      bt_in_total.Enabled:=false;
    end;

end;

///////////////////////////////////////////////////////////////////////
// Procedure : gd_couleurDblClick
// Description : Double clique sur la grille met à jour les variables
///////////////////////////////////////////////////////////////////////
procedure TF_Finition.gd_DatasourceDblClick(Sender: TObject);
begin
  if Self.FormStyle = fsNormal then
    begin
      gb_validecoul := True;
      gs_Code       := ed_codecoul.Text;
      gs_Lib        := ed_Libcoul.Text;
      Self.Close;
    end;
end;

///////////////////////////////////////////////////////////////////////
// Procedure : F_FormDicoActivate
// Description : à l'activation de la fiche, repositionnement sur la dernière couleur
///////////////////////////////////////////////////////////////////////
procedure TF_Finition.F_FormDicoActivate(Sender: TObject);
begin
  // Positionnement direct sur la ligne si le code est renseigné
  if not fb_stringVide(gs_code) then
    M_Donn.zq_Finition.Locate('COUL_Clep', gs_Code, [loPartialKey]);
end;

///////////////////////////////////////////////////////////////////////
// Procedure : F_FormDicoDestroy
// Description : à la destruction de la fiche libération de variable
///////////////////////////////////////////////////////////////////////
procedure TF_Finition.F_FormDicoDestroy(Sender: TObject);
begin
  F_Finition := nil ;

end;
// A utiliser si on veut formater une zone d'édition et une grille
// aobj_GrilleEdit : le dbedit ou la grille concernés
// as_ChampGrille  : Le champ à utiliser pour une grille
// ab_Negatif               : Peut-on mettre le nombre en négatif : par défaut : Vrai
// aby_ChiffresAvantVirgule : Nombre de chiffres avant la virgule : par défaut : 38
// aby_ChiffresApresVirgule : Nombre de chiffres après la virgule : par défaut : 2

procedure TF_Finition.p_FormatNumerique(const aobj_GrilleEdit: TObject;
  const as_ChampGrille: String; var ab_Negatif: Boolean;
  var aby_ChiffresAvantVirgule, aby_ChiffresApresVirgule: Byte);
begin
  if aobj_GrilleEdit = ed_Taux Then
    Begin
      ab_Negatif := True ;
      aby_ChiffresAvantVirgule := 3 ;
    End ;
end;

procedure TF_Finition.bt_TypeFinitionClick(Sender: TObject);
begin
  // Appel de la fiche finitions
  ffor_ExecuteFonction ( 'M-27', True );

end;

procedure TF_Finition.F_FormDicoDataOnSave(Sender: TObject);
begin
  if DBSources[0].Datasource.DataSet.State in [dsInsert,dsEdit] then
    begin
      ts_GroupeFinition.Enabled := FALSE;
    end;

  if bt_abandonner.Enabled then
    begin
      gd_Datasource.Enabled := FALSE;
      nv_navigator.Enabled := FALSE;
      nv_saisie.Enabled := FALSE;
      pa_6.Enabled := FALSE;
    end;

end;

procedure TF_Finition.F_FormDicoDataOnCancel(Sender: TObject);
begin
  // on remet accessible les objets
  ts_GroupeFinition.Enabled := TRUE;

  gd_Datasource.Enabled := TRUE;
  nv_navigator.Enabled := TRUE;
  nv_saisie.Enabled := TRUE;
  pa_6.Enabled := TRUE;

end;

end.

