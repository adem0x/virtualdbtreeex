unit U_Client;

{$IFDEF FPC}
  {$MODE Delphi}
{$ENDIF}

interface

uses
{$IFNDEF FPC}
  AdvListV, RbSplitter, UltimDBGrid, RXSplit, JvXpButton, JvDateTimePicker,
  JvDBDateTimePicker, JvDBLookup, JvExComCtrls, JvExControls, JvComponent, Mask,
{$ELSE}
  MaskEdit,
{$ENDIF}
  LCLType, Messages, Graphics, Controls, Classes, ExtCtrls,  Dialogs, DB, IBQuery,IBTable,IBUpdateSQL,
  U_ExtDBNavigator, Buttons, Forms, DBCtrls, Grids, u_buttons_appli,
  DBGrids, u_framework_dbcomponents, ComCtrls, StdCtrls, SysUtils,
  TypInfo, Variants, StrUtils, ToolEdit, U_FormAdapt, 
  U_FormMainIni, JvXPButtons,
  U_ExtDBGrid,U_ConstMessage,fonctions_string,
  U_OnFormInfoIni, u_framework_components,
  U_GroupView, ImgList;

const CST_INTE__CLIE = 'INTE__CLIE' ;
      CST_INTE_Clep  = 'INTE_Clep' ;
      CST_INTE_Fonction = 'INTE_Fonction' ;
      CST_AFFE_Clep  = 'AFFE_Clep' ;
      CST_AFFE_Libelle = 'AFFE_Libelle' ;
      CST_CLIE_Clep  = 'CLIE_Clep' ;
      CST_CLIE__REPR  = 'CLIE__REPR' ;
      CST_CLIE__FAMI  = 'CLIE__FAMI' ;
type
  TF_Client = class(TF_FormAdapt)
    nv_navigator: TExtDBNavigator;
    lb_code: TFWLabel;
    ed_code: TFWDBEdit;
    pa_1: TPanel;
    pa_2: TPanel;
    pa_3: TPanel;
    pa_4: TPanel;
    pa_5: TPanel;
    pa_6: TPanel;
    pc_Gestion: TPageControl;
    ts_general1: TTabSheet;
    lb_prenom: TFWLabel;
    ed_prenom: TFWDBEdit;
    ts_general2: TTabSheet;
    chx_cliepro: TDBCheckBox;
    lb_cliepro: TFWLabel;
    mo_note: TDBMemo;
    nv_saisie: TExtDBNavigator;
    Rb_1: TSplitter;
    lb_datecrea: TFWLabel;
    gd_client: TExtDBGrid;
    lb_datecreation: TDBText;
    ts_commandes: TTabSheet;
    ts_devis: TTabSheet;
    Panel3: TPanel;
    Panel4: TPanel;
    nv_navfinition: TExtDBNavigator;
    gd_artcoul: TExtDBGrid;
    Panel1: TPanel;
    Panel2: TPanel;
    U_ExtDBNavigator1: TExtDBNavigator;
    ExRxDBGrid1: TExtDBGrid;
    RbSplitter1: TSplitter;
    RbSplitter2: TSplitter;
    Panel5: TPanel;
    Panel6: TPanel;
    SvgFormInfoIni: TOnFormInfoIni;
    Label4: TFWLabel;
    ed_RectifiDevis: TFWDBEdit;
    lb_datearriv: TFWLabel;
    lb_aval: TFWLabel;
    ed_avalDevis: TFWDBEdit;
    Label5: TFWLabel;
    ed_JaloDevis: TFWDBEdit;
    ed_CodeDevis: TFWDBEdit;
    ed_EnreDevis: TFWDBEdit;
    Label6: TFWLabel;
    Label7: TFWLabel;
    ed_CodeCommande: TFWDBEdit;
    Label8: TFWLabel;
    ed_EnreCommande: TFWDBEdit;
    ed_RectifiCommande: TFWDBEdit;
    Label9: TFWLabel;
    Label10: TFWLabel;
    ed_DevisCommande: TFWDBEdit;
    Label11: TFWLabel;
    ed_dateCommande: TFWDBEdit;
    lb_Rappeler: TFWLabel;
    JvDBDateTimePicker1: TFWDBDateEdit;
    DBMemo1: TDBMemo;
    ts_Affectation: TTabSheet;
    ts_Interlocuteur: TTabSheet;
    Panel7: TPanel;
    Panel8: TPanel;
    nv_NavAffecte: TExtDBNavigator;
    gd_Affecte: TExtDBGrid;
    RbSplitter3: TSplitter;
    pa_Affecte: TPanel;
    Label13: TFWLabel;
    Panel10: TPanel;
    Panel11: TPanel;
    nv_navInter: TExtDBNavigator;
    gd_Interlo: TExtDBGrid;
    RbSplitter4: TSplitter;
    Panel12: TPanel;
    Label15: TFWLabel;
    ed_NomInter: TFWDBEdit;
    Label16: TFWLabel;
    ed_TeleInter: TFWDBEdit;
    Label17: TFWLabel;
    ed_PortabInter: TFWDBEdit;
    Label18: TFWLabel;
    ed_MailInter: TFWDBEdit;
    Label19: TFWLabel;
    ed_FonctionInter: TFWDBEdit;
    Label20: TFWLabel;
    nv_SaisiAffecte: TExtDBNavigator;
    nv_SaisiInter: TExtDBNavigator;
    Label21: TFWLabel;
    Label12: TFWLabel;
    ed_Nom: TFWDBEdit;
    lb_nom: TFWLabel;
    Label22: TFWLabel;
    cbx_Inter: TFWDBLookupCombo;
    cbx_CiviliteInter: TFWDBLookupCombo;
    ed_FaxInter: TFWDBEdit;
    Label23: TFWLabel;
    ed_NomZone: TFWDBEdit;
    Panel9: TPanel;
    Panel20: TPanel;
    bt_apercu: TFWPreview;
    Panel21: TPanel;
    bt_imprimer: TFWPrint;
    Panel22: TPanel;
    Panel23: TPanel;
    bt_fermer: TFWClose;
    lb_famille: TFWLabel;
    lb_codpos: TFWLabel;
    lb_ville: TFWLabel;
    lb_pays: TFWLabel;
    Label1: TFWLabel;
    lb_fax: TFWLabel;
    lb_mobile: TFWLabel;
    lb_email: TFWLabel;
    lb_site: TFWLabel;
    Label24: TFWLabel;
    lb_Siret: TFWLabel;
    cbx_fami: TFWDBLookupCombo;
    ed_adr1: TFWDBEdit;
    ed_adr2: TFWDBEdit;
    ed_adr3: TFWDBEdit;
    ed_codpos: TFWDBEdit;
    ed_ville: TFWDBEdit;
    cbx_pays: TFWDBLookupCombo;
    ed_tel: TFWDBEdit;
    ed_fax: TFWDBEdit;
    ed_mobile: TFWDBEdit;
    ed_email: TFWDBEdit;
    ed_site: TFWDBEdit;
    ed_Siret: TFWDBEdit;
    RbSplitter5: TSplitter;
    bt_Devis: TJvXpButton;
    bt_Commande: TJvXpButton;
    bt_Date: TJvXpButton;
    bt_civilite: TJvXpButton;
    bt_codpostal: TJvXpButton;
    im_images: TImageList;
    gd_filtreville: TExtDBGrid;
    lb_codeinsee: TFWLabel;
    ed_codeinsee: TFWDBEdit;
    ts_diffusion: TTabSheet;
    Panel13: TPanel;
    Panel14: TPanel;
    Panel15: TPanel;
    Panel16: TPanel;
    bt_abandonner: TFWCancel;
    bt_enregistrer: TFWOK;
    Panel17: TPanel;
    Panel18: TPanel;
    lsv_diffcliin: TDBGroupView;
    Panel19: TPanel;
    bt_in_item: TFWInSelect;
    bt_in_total: TFWInAll;
    bt_out_item: TFWOutSelect;
    bt_out_total: TFWOutAll;
    lsv_diffcliout: TDBGroupView;
    RbSplitter6: TSplitter;
    lb_repr: TFWLabel;
    cbx_repr: TFWDBLookupCombo;
    procedure Bt_FermerClick(Sender: TObject);
    procedure F_FormDicoCreate(Sender: TObject);
    procedure F_FormDicoActivate(Sender: TObject);
    procedure gd_clientDblClick(Sender: TObject);
    procedure F_FormDicoDestroy(Sender: TObject);
    procedure pc_GestionChanging(Sender: TObject;
      var AllowChange: Boolean);
    procedure pc_GestionChange(Sender: TObject);
    procedure F_FormDicoDataOnSave(Sender: TObject);
    procedure F_FormDicoDataOnCancel(Sender: TObject);
    procedure bt_apercuClick(Sender: TObject);
    procedure bt_imprimerClick(Sender: TObject);
    procedure F_FormDicoDataDBSourcescroll(DataSet: TDataSet);
    procedure F_FormDicoClose(Sender: TObject; var Action: TCloseAction);
    procedure gd_InterloDblClick(Sender: TObject);
    procedure ed_FonctionInterKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure gd_AffecteDblClick(Sender: TObject);
    procedure ed_NomZoneKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);

    procedure ed_CodeCommandeChange(Sender: TObject);
    procedure ed_DevisCommandeChange(Sender: TObject);
    procedure ed_CodeDevisChange(Sender: TObject);
    procedure F_FormDicoDataOnLocate(DataSet: TDataSet);
    procedure gd_filtrevilleDblClick(Sender: TObject);
    procedure p_AjouteBoutonsInserEdition ( const anv_Navigateur : TExtDBNavigator );
    procedure gd_clientGetCellProps(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor);
    procedure gd_filtrevilleKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);

  private
    { Déclarations privées }
    ts_Changing : TTabSheet ;
    // Inutile
    //function  LireCode     : string;
   //  procedure EcrireCodeclient(as_Code: string);
    procedure EcrireCodeAffe(as_Code: string);

    function LireCodeAffe: string;

  public
    { Déclarations publiques }
    gb_imprimer ,
    gb_DefocusCodePostaux,
    gb_AppelleInter,
    lb_PeutModifier  ,
    gb_AppelleAffecte,
    gb_DesactiveLocate,
    gb_valide : boolean;
//    li_TagVille : integer;
//    li_Tagcodpos : integer;
    procedure p_ApresInsert ;
    /// propriétés Inutiles
    property CodeAffeALire: string read LireCodeAffe write EcrireCodeAffe;
  end;

var
  gs_codeclient : String ;
  gb_appelClientDuDevis : Boolean = False ;
  F_Client: TF_Client;

implementation

uses U_CodePostal, U_DmDonn,
     fonctions_forms,
     fonctions_erreurs,
     u_extcomponent;
{$IFNDEF FPC}
  {$R *.dfm}
{$ELSE}
  {$R *.lfm}
{$ENDIF}
var   gs_CodeAffe ,gs_codeInte, gs_adresse1,gs_adresse2,gs_adresse3,
      gs_cp,gs_ville,gs_tel,gs_raison : string;

///////////////////////////////////////////////////////////////////////
// Evènement : bt_FermerClick
// Description : Sur click bouton fermer on ferme
// Arguments : Sender : TObject
///////////////////////////////////////////////////////////////////////
procedure TF_Client.bt_FermerClick(Sender: TObject);
begin
  Close;
end;

///////////////////////////////////////////////////////////////////////
// Evènement : F_FormDicoCreate
// Description : Initialisation de la fiche
// Arguments : Sender : TObject
///////////////////////////////////////////////////////////////////////
procedure TF_Client.F_FormDicoCreate(Sender: TObject);
begin
  nv_navigator.VisibleButtons := nv_navigator.VisibleButtons - [  ( nbERefresh )];
  lb_PeutModifier := true;
  gb_AppelleInter := False ;
  gb_AppelleAffecte := False ;
  gb_DesactiveLocate := False ;
  gb_imprimer := False ;

  F_Client := self;
//  M_Donn.zq_RechDevi.Active := True;
  M_Donn.ds_Civilite.Dataset.open ;

  // Pour la recherche
//  li_TagVille     := 11 ;
//  li_Tagcodpos    := 10 ;

end;

///////////////////////////////////////////////////////////////////////
// Evènement : F_FormDicoActivate
// Description : Localisations inutiles
// Arguments : Sender : TObject
///////////////////////////////////////////////////////////////////////
procedure TF_Client.F_FormDicoActivate(Sender: TObject);
begin
 if Showing then
  Begin
    // Positionnement direct sur la ligne si le code client est renseigné
   if not fb_stringVide(gs_codeclient) then
     Begin
       M_Donn.zq_client.Locate(CST_CLIE_Clep, gs_codeclient, [loPartialKey]);
       gs_codeclient := '' ;
     End ;
  End ;
  if not fb_stringVide(gs_codeInte) then
    M_Donn.zq_ClieInter.Locate('INTE_Clep', gs_codeInte, [loPartialKey]);
  if not fb_stringVide(gs_CodeAffe) then
    M_Donn.zq_ClieAffecte.Locate('AFFE_Clep', gs_CodeAffe, [loPartialKey]);
end;

///////////////////////////////////////////////////////////////////////
// Affectation de propriété : LireCodeAffe
// Description : Propriété inutile
///////////////////////////////////////////////////////////////////////
procedure TF_Client.EcrireCodeAffe(as_Code: string);
begin
  gs_CodeAffe := as_Code;
end;

///////////////////////////////////////////////////////////////////////
// Evènement : gd_clientDblClick
// Description : Sur double click grille client validation du client en mode modal
// Arguments : Sender : TObject
///////////////////////////////////////////////////////////////////////
procedure TF_Client.gd_clientDblClick(Sender: TObject);
begin
  if gb_AppelleInter
  or gb_AppelleAffecte then
    Exit ;
  if Self.FormStyle = fsNormal then
    begin
      gb_valide     := true;
      gs_codeclient := ed_code.Text;
      gs_raison     := ed_nom.text;
      gs_adresse1   := ed_adr1.Text;
      gs_adresse2   := ed_adr2.Text;
      gs_adresse3   := ed_adr3.Text;
      gs_cp         := ed_codpos.Text;
      gs_Ville      := ed_ville.Text;
      gs_tel        := ed_tel.Text;
      Close;
    end;
end;


///////////////////////////////////////////////////////////////////////
// Lecture de propriété : LireCodeAffe
// Description : Propriété inutile
///////////////////////////////////////////////////////////////////////
function TF_Client.LireCodeAffe: string;
begin
  result := gs_codeAffe;
end;

///////////////////////////////////////////////////////////////////////
// Evènement : F_FormDicoDestroy
// Description : Destruction des variables objets et mise à nil des pointeurs globaux
// Arguments : Sender : TObject
///////////////////////////////////////////////////////////////////////
procedure TF_Client.F_FormDicoDestroy(Sender: TObject);
begin
  F_Client := nil ;
end;

///////////////////////////////////////////////////////////////////////
// Evènement : pc_GestionChanging
// Description : Validations sur changement d'onglet
// Arguments : Sender : TObject
//             AllowChange : Changement validé de l'onglet
///////////////////////////////////////////////////////////////////////
procedure TF_Client.pc_GestionChanging(Sender: TObject;
  var AllowChange: Boolean);
var li_Choix : Integer ;
begin
  ts_Changing := pc_Gestion.ActivePage ;
  if ts_Changing = ts_Affectation Then
    Begin
      if ( nv_SaisiAffecte.DataSource.DataSet.State in [dsinsert,dsEdit] ) Then
        Begin
          try
            if nv_SaisiAffecte.DataSource.DataSet.State in [ dsInsert, dsEdit ] Then
              nv_SaisiAffecte.DataSource.DataSet.Post ;
          Except
            on e: Exception do
              Begin
                f_GereException( e, nv_SaisiAffecte.DataSource.DataSet );
                AllowChange := False ;
              End ;
          End ;
        End;
    End
  else
    if ts_Changing = ts_Interlocuteur Then
        try
          if nv_SaisiInter.DataSource.DataSet.State in [ dsInsert, dsEdit ] Then
            nv_SaisiInter.DataSource.DataSet.Post ;
        Except
          on e: Exception do
            Begin
              f_GereException( e, nv_SaisiInter.DataSource.DataSet );
              AllowChange := False ;
            End ;
        end
      else
            if (ts_Changing = ts_diffusion) and ( bt_enregistrer.Enabled ) Then
            Begin
              try
                Begin
                  li_Choix := MessageDlg ( U_CST_9602, mtConfirmation, [mbYes,mbNo,mbCancel], 0 );
                  case li_Choix of
                    mrYes : bt_enregistrer.OnClick ( bt_enregistrer );
                    mrNo  : bt_abandonner .OnClick ( bt_abandonner  );
                    mrCancel : AllowChange := False ;
                  End;
                End;
            Except
              on e: Exception do
              Begin
                f_GereException( e, lsv_diffcliin.Datasource.DataSet );
                AllowChange := False ;
              End ;
            End ;

      End;

end;

///////////////////////////////////////////////////////////////////////
// Evènement : F_FormDicoDataOnSave
// Description : Accès à une partie des données à l'édition des données
// Arguments : Sender : TObject
///////////////////////////////////////////////////////////////////////
procedure TF_Client.pc_GestionChange(Sender: TObject);
//var li_Choix : Integer ;
begin
  if gd_client.Datasource.DataSet.state in [ dsInsert,dsEdit ] Then
    Begin
      if ( pc_Gestion.ActivePage = ts_Affectation   )
      or ( pc_Gestion.ActivePage = ts_Interlocuteur )
      or ( pc_Gestion.ActivePage = ts_diffusion  )    Then
        Begin
          try
            if gd_client.Datasource.DataSet.State in [ dsInsert, dsEdit ] Then
              gd_client.Datasource.DataSet.Post ;
          Except
            on e: Exception do
              Begin
                pc_Gestion.ActivePage := ts_Changing ;
                f_GereException( e, gd_client.Datasource.DataSet );
              End ;

          End ;
        End;


    End ;

end;

///////////////////////////////////////////////////////////////////////
// Evènement : F_FormDicoDataOnSave
// Description : Accès à une partie des données à l'édition des données
// Arguments : Sender : TObject
///////////////////////////////////////////////////////////////////////
procedure TF_Client.F_FormDicoDataOnSave(Sender: TObject);
begin
  if gd_client.Datasource.DataSet.State in [dsInsert,dsEdit] then
  begin
    ts_Affectation  .Enabled := FALSE;
    ts_Interlocuteur.Enabled := FALSE;
  end
  else
    begin
      gd_client.Enabled := FALSE;
      nv_navigator.Enabled := FALSE;
      nv_saisie.Enabled := FALSE;
      pa_6.Enabled := FALSE;
    end;

end;

///////////////////////////////////////////////////////////////////////
// Evènement : F_FormDicoDataOnCancel
// Description : Accès à toutes les données après le cancel ou après le post
// Arguments : Sender : TObject
///////////////////////////////////////////////////////////////////////
procedure TF_Client.F_FormDicoDataOnCancel(Sender: TObject);
begin
  ts_Affectation  .Enabled := True ;
  ts_Interlocuteur.Enabled := True ;
  gd_client.Enabled := True ;
  nv_navigator.Enabled := True ;
  nv_saisie.Enabled := True ;
  pa_6.Enabled := True ;

end;

///////////////////////////////////////////////////////////////////////
// Evènement : bt_apercuClick
// Description : Sur aperçu ouverture crystal reports
// Arguments : Sender : TObject
///////////////////////////////////////////////////////////////////////
procedure TF_Client.bt_apercuClick(Sender: TObject);
var ts_param, ts_param_valeur : TStringList;
Begin
  try

    ts_param := TStringList.create();
    ts_param_valeur  := TStringList.create();
    ts_param.Add('num_client');
    ts_param_valeur.Add ( ed_code.Text );

  finally
  end;


end;

///////////////////////////////////////////////////////////////////////
// Evènement : bt_imprimerClick
// Description : Sur impression mode aperçu prêt à imprimer
// Arguments : Sender : TObject
///////////////////////////////////////////////////////////////////////
procedure TF_Client.bt_imprimerClick(Sender: TObject);
begin
  gb_imprimer := True ;
  bt_apercuClick(Sender);
end;

///////////////////////////////////////////////////////////////////////
// Evènement : F_FormDicoDataDBSourcescroll
// Description : Sur scroll mises à jour correcte des données
// Arguments : Sender : TObject
///////////////////////////////////////////////////////////////////////
procedure TF_Client.F_FormDicoDataDBSourcescroll(DataSet: TDataSet);
var li_i : Integer ;
begin

  try
    if  (not gd_client.Datasource.DataSet.isEmpty )
    and (not gd_client.Datasource.DataSet.fieldbyname ( CST_CLIE__FAMI ).isNull) then
      begin
        cbx_fami.LookupSource.DataSet.Filter := 'FAMI_Valide=1 OR FAMI_Clep=' + gd_client.Datasource.DataSet.fieldbyname ( CST_CLIE__FAMI ).AsString ;
      end
    else
        cbx_fami.LookupSource.DataSet.Filter := 'FAMI_Valide=1' ;

    cbx_fami.LookupSource.DataSet.Filtered := True ;

    if gd_client.Datasource.DataSet.IsEmpty Then
      Begin
        if M_Donn.zq_ClieInter.Params.FindParam ( 'Client' ).Value <> Null Then
          Begin
            M_Donn.zq_ClieInter.Close ;
            M_Donn.zq_ClieInter.Params.FindParam ( 'Client' ).Value := Null ;
            M_Donn.zq_ClieInter.Open ;
          End ;
      End
    Else
      Begin
        M_Donn.zq_ClieInter.Close ;
        M_Donn.zq_ClieInter.Params.FindParam ( 'Client' ).Value := gd_client.Datasource.DataSet.FieldByName (  CST_CLIE_Clep ).Value ;
        M_Donn.zq_ClieInter.Open ;
      End ;

    if gd_client.Datasource.DataSet.IsEmpty Then
      Begin
        if M_Donn.zq_CliDevis.Params.FindParam ( 'Client' ).Value <> Null Then
          Begin
            M_Donn.zq_CliDevis.Close ;
            M_Donn.zq_CliDevis.Params.FindParam ( 'Client' ).Value := Null ;
            M_Donn.zq_CliDevis.Open ;
          End ;
      End
    Else
      Begin
        M_Donn.zq_CliDevis.Close ;
        M_Donn.zq_CliDevis.Params.FindParam ( 'Client' ).Value := gd_client.Datasource.DataSet.FieldByName (  CST_CLIE_Clep ).Value ;
        M_Donn.zq_CliDevis.Open ;
      End ;
    M_Donn.zq_CliCmde.Close ;
    if gd_client.Datasource.DataSet.IsEmpty Then
      Begin
        M_Donn.zq_CliCmde.Params.FindParam ( 'Client' ).Value := Null
      End
    Else
      Begin
        M_Donn.zq_CliCmde.Params.FindParam ( 'Client' ).Value := gd_client.Datasource.DataSet.FieldByName (  CST_CLIE_Clep ).Value ;
      End ;
    M_Donn.zq_CliCmde.Open ;
  Except
    on e: Exception do
      f_GereException ( e, gd_client.Datasource.DataSet );
  End ;
end;

///////////////////////////////////////////////////////////////////////
// Evènement : F_FormDicoClose
// Description : Sur fermeture on ne fait que cacher la fiche
// Arguments : Sender : TObject
///////////////////////////////////////////////////////////////////////
procedure TF_Client.F_FormDicoClose(Sender: TObject;
  var Action: TCloseAction);
begin
  // Préparation pour la recherche à le prochaine ouverture de fiche

  gd_client.Datasource.DataSet.Filter := '';
  Action := caHide ;
end;

///////////////////////////////////////////////////////////////////////
// Evènement : gd_InterloDblClick
// Description : Sur double click et appel mode interlocuteur validation de l'affectation
// Arguments : Sender : TObject
///////////////////////////////////////////////////////////////////////
procedure TF_Client.gd_InterloDblClick(Sender: TObject);
begin
  if not gb_AppelleInter then
    Exit ;
  if Self.FormStyle = fsNormal then
     begin
      gb_valide     := true;
      gs_codeInte   := M_Donn.ds_ClieInter.DataSet.FieldByName ( CST_INTE_Clep ).AsString ;
      Close;
    end;

end;

///////////////////////////////////////////////////////////////////////
// Evènement : ed_FonctionInterKeyUp
// Description : Sur touche relevée ajout du texte de l'interlocuteur déjà enregistré
// Arguments : Sender : TObject
//             Key    : la touche relevée
//             Shift  : Touches spéciales
///////////////////////////////////////////////////////////////////////
procedure TF_Client.ed_FonctionInterKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var li_Pos : Integer ;
begin
  if Key in [ VK_RETURN, VK_TAB, VK_DELETE, VK_BACK ] Then
    Exit ;
  M_Donn.zq_InteFonct.Open ;
  if M_Donn.zq_InteFonct.Locate ( CST_INTE_Fonction, ed_FonctionInter.Text, [loCaseInsensitive, loPartialKey] ) Then
    Begin
      li_pos := ed_FonctionInter.SelStart ;
      ed_FonctionInter.SelText   := Copy ( M_Donn.zq_InteFonct.FindField ( CST_INTE_Fonction ).AsString, ed_FonctionInter.SelStart + 1, length ( M_Donn.zq_InteFonct.FindField ( CST_INTE_Fonction ).AsString ) - length ( ed_FonctionInter.Text ));
      ed_FonctionInter.SelStart  := li_pos ;
      ed_FonctionInter.SelLength := length ( ed_FonctionInter.Text ) - li_pos ;
    End ;
end;

///////////////////////////////////////////////////////////////////////
// Evènement : gd_AffecteDblClick
// Description : Sur double click et appel mode affectation validation de l'affectation
// Arguments : Sender : TObject
///////////////////////////////////////////////////////////////////////
procedure TF_Client.gd_AffecteDblClick(Sender: TObject);
begin
  if not gb_AppelleAffecte then
    Exit ;
  if Self.FormStyle = fsNormal then
    begin
      gb_valide     := true;
      gs_CodeAffe   := M_Donn.ds_ClieAffecte.DataSet.FieldByName ( CST_AFFE_Clep ).AsString ;
      Close;
    end;

end;

///////////////////////////////////////////////////////////////////////
// Evènement : ed_NomZoneKeyUp
// Description : Sur touche relevée ajout du texte déjà enregistré
// Arguments : Sender : TObject
//             Key    : la touche relevée
//             Shift  : Touches spéciales
///////////////////////////////////////////////////////////////////////
procedure TF_Client.ed_NomZoneKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var li_Pos : Integer ;
begin
  if Key in [ VK_RETURN, VK_TAB, VK_DELETE, VK_BACK ] Then
    Exit ;
  M_Donn.zq_AffeZone.Open ;
  if M_Donn.zq_AffeZone.Locate ( CST_AFFE_Libelle, ed_NomZone.Text, [loCaseInsensitive, loPartialKey] ) Then
    Begin
      li_pos := ed_NomZone.SelStart ;
      ed_NomZone.SelText   := Copy ( M_Donn.zq_AffeZone.FindField ( CST_AFFE_Libelle ).AsString, ed_FonctionInter.SelStart + 1, length ( M_Donn.zq_AffeZone.FindField ( CST_AFFE_Libelle ).AsString ) - length ( ed_NomZone.Text ));
      ed_NomZone.SelStart  := li_pos ;
      ed_NomZone.SelLength := length ( ed_NomZone.Text ) - li_pos ;
    End ;

end;

///////////////////////////////////////////////////////////////////////
// Evènement : ed_CodeCommandeChange
// Description : Sur changement du code commande accès ou non aux commandes
// Arguments : Sender: TObject
///////////////////////////////////////////////////////////////////////
procedure TF_Client.ed_CodeCommandeChange(Sender: TObject);
begin
      bt_Commande.Enabled := (ed_CodeCommande.Text <> '0000') and (ed_CodeCommande.text  <> '') ;
end;

///////////////////////////////////////////////////////////////////////
// Evènement : ed_DevisCommandeChange
// Description : Sur changement du code devis dans commande modification ou non de la date
// Arguments : Sender: TObject
///////////////////////////////////////////////////////////////////////
procedure TF_Client.ed_DevisCommandeChange(Sender: TObject);
begin
      bt_Date.Enabled := (ed_DevisCommande.Text <> '00000') and (ed_DevisCommande.text  <> '') ;
end;

///////////////////////////////////////////////////////////////////////
// Evènement : ed_CodeDevisChange
// Description : Sur changement du code devis dans devis accès ou non aux devis
// Arguments : Sender: TObject
///////////////////////////////////////////////////////////////////////
procedure TF_Client.ed_CodeDevisChange(Sender: TObject);
begin
      bt_Devis.Enabled := (ed_CodeDevis.Text <> '0000') and (ed_CodeDevis.text  <> '') ;
end;

///////////////////////////////////////////////////////////////////////
// Procedure : F_FormDicoDataOnLocate
// Description : permet de positionner sur le premier enregitrement en fonction de la saisie
//     du code postal ou de la ville
// Arguments : DataSet: TDataSet
///////////////////////////////////////////////////////////////////////
procedure TF_Client.F_FormDicoDataOnLocate(DataSet: TDataSet);
begin

  if ( Dataset = M_Donn.ds_Ville.DataSet)
    or ( Dataset = M_Donn.ds_filtreville.DataSet)
    or ( Dataset = M_Donn.ds_filtrecp.DataSet)       Then
    Begin
        // mise à jour du code postal, ville et code insee sur la fiche client
        if not gb_DesactiveLocate Then
          Begin
            if not (M_Donn.zq_client.state in [dsInsert, dsEdit]) Then M_Donn.zq_client.Edit;
            M_Donn.zq_client.FieldByName('CLIE_Codepostal').Value := DataSet.FieldByName('COPO_Clep').AsString;
            M_Donn.zq_client.FieldByName('CLIE_Ville').Value := DataSet.FieldByName ('COPO_Ville').AsString;
            M_Donn.zq_client.FieldByName('CLIE_Codeinsee').Value := DataSet.FieldByName ('COPO_Codinsee').AsString;
          End ;



   end;



end;


///////////////////////////////////////////////////////////////////////
// Procedure : gd_filtrevilleDblClick
// Description : Double clique sur la grille contenant les villes
// Arguments : Sender: TObject
///////////////////////////////////////////////////////////////////////
procedure TF_Client.gd_filtrevilleDblClick(Sender: TObject);
begin
  gd_filtreville.Taborder := 15 ;
  gb_DesactiveLocate := False ;

  if gd_filtreville.DataSource = M_Donn.ds_filtreville Then F_FormDicoDataOnLocate(M_Donn.ds_filtreville.dataset);
  if gd_filtreville.DataSource = M_Donn.ds_filtrecp then  F_FormDicoDataOnLocate(M_Donn.ds_filtrecp.dataset);

  try
    gb_DefocusCodePostaux := True ;
    ed_codpos.Enabled := False ;
    ed_ville .Enabled := False ;
    ActiveControl := cbx_Pays ;
    gb_DefocusCodePostaux := False ;
    ed_codpos.Enabled := True ;
    ed_ville .Enabled := True ;
  finally
  End ;


end;

/////////////////////////////////////////////////////////////////////////////
// Procédure : p_AjouteBoutonsInserEdition
// Description : Affiche les boutons d'insertion/suppression et d'édition
/////////////////////////////////////////////////////////////////////////////
procedure TF_CLIENT.p_AjouteBoutonsInserEdition ( const anv_Navigateur : TExtDBNavigator );
Begin
  anv_Navigateur.VisibleButtons := anv_Navigateur.VisibleButtons + [  ( nbEPost ),  ( nbECancel ),  ( nbEInsert ),  ( nbEDelete ) ];
End ;

/////////////////////////////////////////////////////////////////////////////
// Procédure : p_ApresInsert
// Description : Filtrages et visualisation des données de gd_client.Datasource principal à l'insertion
/////////////////////////////////////////////////////////////////////////////
procedure TF_CLIENT.p_ApresInsert ;
Begin

  F_FormDicoDataDBSourcescroll ( M_Donn.zq_client  );
  pc_gestion.ActivePage := ts_general1 ;
End ;


procedure TF_Client.gd_clientGetCellProps(Sender: TObject; Field: TField;
  AFont: TFont; var Background: TColor);
begin
  if not gb_appelClientDuDevis then
    if Field.FieldName = 'CLIE_Ville' then
      gd_client.Columns.Items[3].Width := 0;
end;

procedure TF_Client.gd_filtrevilleKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key in [VK_ESCAPE] Then
    Begin
      cbx_pays.SetFocus;
    End
  Else
  if key in [VK_RETURN] Then
    Begin
      gd_filtrevilleDblClick ( gd_filtreville );
    End ;
end;

end.


