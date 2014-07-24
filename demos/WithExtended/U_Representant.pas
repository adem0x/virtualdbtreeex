////////////////////////////////////
// Nom Unite: U_Representant
// Date de creation : 23/08/2004
// Description : Gestion des representants physiques
//**************************************************************************
// Historique des modifications
// Modifi? le 22/03/05 par L.Brec
//    -> Gestion des affectations clients
/////////////////////////
unit U_Representant;

{$IFDEF FPC}
  {$MODE Delphi}
{$ENDIF}

interface

uses
{$IFNDEF FPC}
  JvComponent, JvExControls, JvDBLookup, AdvListV, RbSplitter, RXSplit, Mask,
{$ELSE}
  MaskEdit,
{$ENDIF}
  LCLType, Messages, Graphics, Controls, Classes, ExtCtrls,  Dialogs, DB, IBQuery,IBTable,IBUpdateSQL,
  U_ExtDBNavigator, Buttons, Forms, DBCtrls, Grids,
  DBGrids, u_framework_dbcomponents, ComCtrls, StdCtrls, SysUtils,  TypInfo,  Variants,
  StrUtils, ToolEdit, U_FormAdapt, U_OnFormInfoIni,  JvXPButtons,
  u_framework_components, u_buttons_appli,
  U_ExtDBGrid,U_Constmessage, U_GroupView, ImgList,fonctions_variant;

type
  TF_Repr = class(TF_FormAdapt)
    nv_navigator: TExtDBNavigator;
    nv_saisie: TExtDBNavigator;
    lb_code: TFWLabel;
    lb_nom: TFWLabel;
    ed_code: TFWDBEdit;
    ed_nom: TFWDBEdit;
    pa_1: TPanel;
    pa_2: TPanel;
    pa_3: TPanel;
    pa_4: TPanel;
    pa_5: TPanel;
    pa_6: TPanel;
    SvgFormInfoIni: TOnFormInfoIni;
    spl_1: TSplitter;
    gd_repr: TExtDBGrid;
    lb_prenom: TFWLabel;
    ed_prenom: TFWDBEdit;
    lb_civilite: TFWLabel;
    pc_Infos: TPageControl;
    ts_generale: TTabSheet;
    lb_assist: TFWLabel;
    cbx_assist: TDBLookupComboBox;
    ed_adresse1: TFWDBEdit;
    lb_adresse: TFWLabel;
    ed_adresse2: TFWDBEdit;
    ed_adresse3: TFWDBEdit;
    lb_codepost: TFWLabel;
    ed_codepostal: TFWDBEdit;
    bt_cp: TJvXpButton;
    lb_ville: TFWLabel;
    ed_ville: TFWDBEdit;
    cbx_pays: TDBLookupComboBox;
    lb_pays: TFWLabel;
    lb_tel: TFWLabel;
    ed_tel: TFWDBEdit;
    lb_poste: TFWLabel;
    ed_poste: TFWDBEdit;
    lb_mobile: TFWLabel;
    ed_mobile: TFWDBEdit;
    ed_fax: TFWDBEdit;
    lb_fax: TFWLabel;
    lb_email: TFWLabel;
    ed_email: TFWDBEdit;
    ed_web: TFWDBEdit;
    lb_web: TFWLabel;
    ts_generale2: TTabSheet;
    lb_taux: TFWLabel;
    ed_taux: TFWDBEdit;
    ed_credit: TFWDBEdit;
    lb_credit: TFWLabel;
    lb_objca: TFWLabel;
    ed_objca: TFWDBEdit;
    mo_note: TDBMemo;
    lb_note: TFWLabel;
    ts_Client: TTabSheet;
    Panel13: TPanel;
    lv_client_in: TDBGroupView;
    Panel14: TPanel;
    bt_in_item: TFWInSelect;
    bt_in_total: TFWInAll;
    bt_out_item: TFWOutSelect;
    bt_out_total: TFWOutAll;
    lv_client_out: TDBGroupView;
    Panel15: TPanel;
    Panel16: TPanel;
    Panel17: TPanel;
    Panel18: TPanel;
    Panel19: TPanel;
    bt_abandonner: TFWCancel;
    bt_enregistrer: TFWOK;
    cbx_civilite: TFWDBLookupCombo;
    bt_civilite: TJvXpButton;
    Panel3: TPanel;
    Panel11: TPanel;
    bt_apercu: TFWPreview;
    Panel4: TPanel;
    bt_imprimer: TFWPrint;
    Panel1: TPanel;
    Panel2: TPanel;
    bt_fermer: TFWClose;
    im_images: TImageList;
    RbSplitter3: TSplitter;
    ts_TypeDevis: TTabSheet;
    Panel6: TPanel;
    lv_TyDeIn: TDBGroupView;
    Panel5: TPanel;
    bt_TyDeIn: TJvXpButton;
    bt_TyDeTotIn: TJvXpButton;
    bt_TyDeOut: TJvXpButton;
    bt_TyDeTotOut: TJvXpButton;
    lv_TyDeOut: TDBGroupView;
    Panel10: TPanel;
    Panel12: TPanel;
    Panel7: TPanel;
    Panel8: TPanel;
    Panel9: TPanel;
    bt_AbanTyDe: TFWCancel;
    bt_EnrTyDe: TFWOK;
    RbSplitter1: TSplitter;
    TabSheet1: TTabSheet;
    Panel20: TPanel;
    Panel21: TPanel;
    nv_secteur: TExtDBNavigator;
    gd_secteur: TExtDBGrid;
    RbSplitter6: TSplitter;
    bt_retour: TJvXpButton;
    Panel22: TPanel;
    procedure F_FormDicoCreate(Sender: TObject);
    procedure F_FormDicoDataOnSave(Sender: TObject);
    procedure F_FormDicoDataOnCancel(Sender: TObject);
    procedure pc_InfosChange(Sender: TObject);
    procedure pc_InfosChanging(Sender: TObject; var AllowChange: Boolean);
    procedure gd_reprDblClick(Sender: TObject);
    procedure F_FormDicoActivate(Sender: TObject);
    procedure bt_enregistrerClick(Sender: TObject);

  private
    { D?clarations priv?es }
    ts_Changing : TTabSheet ;

  public
    { D?clarations publiques }
    procedure p_initSecteur;
  end;

var
  F_Repr: TF_Repr;

implementation

uses U_DmDonn, U_RepSecteur ,
     U_CodePostal,
     fonctions_erreurs,
     fonctions_forms;

{$IFNDEF FPC}
  {$R *.dfm}
{$ELSE}
  {$R *.lfm}
{$ENDIF}

procedure TF_Repr.F_FormDicoCreate(Sender: TObject);
begin
   F_Repr := self;
end;

procedure TF_Repr.F_FormDicoDataOnSave(Sender: TObject);
begin
  if gd_repr.Datasource.DataSet.State in [dsInsert,dsEdit] then
  begin
      ts_Client   .Enabled := FALSE;
      ts_TypeDevis.Enabled := FALSE;
  end;
  if bt_abandonner.Enabled
  or bt_AbanTyDe  .Enabled then
    begin
      gd_repr.Enabled := FALSE;
      nv_navigator.Enabled := FALSE;
      nv_saisie.Enabled := FALSE;
      pa_6.Enabled := FALSE;
    end;

end;

procedure TF_Repr.F_FormDicoDataOnCancel(Sender: TObject);
begin
  ts_Client   .Enabled := True;
  ts_TypeDevis.Enabled := True;
  gd_repr     .Enabled := True;
  nv_navigator.Enabled := True;
  nv_saisie   .Enabled := True;
  pa_6        .Enabled := True;

end;

procedure TF_Repr.pc_InfosChange(Sender: TObject);
//var li_Choix : Integer ;
begin
  if gd_repr.Datasource.DataSet.state in [ dsInsert,dsEdit ] Then
    Begin
      if ( pc_Infos.ActivePage = ts_Client   )
      or ( pc_Infos.ActivePage = ts_TypeDevis   ) Then
        Begin
          try
            if gd_repr.Datasource.DataSet.State in [ dsInsert, dsEdit ] Then
              gd_repr.Datasource.DataSet.Post ;
          Except
            on e: Exception do
              Begin
                pc_Infos.ActivePage := ts_Changing ;
                f_GereException( e, gd_repr.Datasource.DataSet );
              End ;

          End ;
{          li_Choix := MessageDlg ( U_CST_9602, mtConfirmation, [mbYes,mbNo,mbCancel], 0 );
          case li_Choix of
            mrYes : try
                      if gd_repr.Datasource.DataSet.State in [ dsInsert, dsEdit ] Then
                        gd_repr.Datasource.DataSet.Post ;
                    Except
                      on e: Exception do
                        Begin
                          pc_Infos.ActivePage := ts_Changing ;
                          f_GereException( e, gd_repr.Datasource.DataSet );
                        End ;

                    End ;
            mrNo  : try
                      if gd_repr.Datasource.DataSet.State in [ dsInsert, dsEdit ] Then
                        gd_repr.Datasource.DataSet.Cancel ;
                    Except
                      on e: Exception do
                        Begin
                          f_GereException( e, gd_repr.Datasource.DataSet );
                        End ;

                    End ;
            mrCancel : pc_Infos.ActivePage := ts_Changing ;
          End;}
        End;


    End ;

end;

procedure TF_Repr.pc_InfosChanging(Sender: TObject;
  var AllowChange: Boolean);
//var li_Choix : Integer ;
begin
  ts_Changing := pc_Infos.ActivePage ;
  if  ( ts_Changing = ts_Client )
  and ( bt_enregistrer.Enabled ) Then
    try
      if bt_enregistrer.Enabled Then
        bt_enregistrer.OnClick ( bt_enregistrer );
    Except
      on e: Exception do
        Begin
          f_GereException( e, gd_repr.Datasource.DataSet );
          AllowChange := False ;
        End ;
    End ;

  if  ( ts_Changing = ts_TypeDevis )
  and ( bt_EnrTyDe.Enabled ) Then
    try
      if bt_EnrTyDe.Enabled Then
        bt_EnrTyDe.OnClick ( bt_EnrTyDe );
    Except
      on e: Exception do
        Begin
          f_GereException( e, gd_repr.Datasource.DataSet );
          AllowChange := False ;
        End ;
    End ;

end;

procedure TF_Repr.gd_reprDblClick(Sender: TObject);
begin
  if Self.FormStyle = fsNormal then
    begin
      if assigned(F_RepSecteur) then
        begin
          F_RepSecteur.ls_RepALire :=  M_Donn.zq_repr.fieldbyname('REPR_Clep').Value;
          Self.Close;
        end;
    end;
end;



procedure TF_Repr.p_initSecteur;
begin
  if not M_Donn.zq_repr.fieldbyname('REPR_Clep').isNull then
    begin
       M_Donn.zq_secteur.Close;
       M_Donn.zq_secteur.Params.ParamByName('rep').Value := M_Donn.zq_repr.fieldbyname('REPR_Clep').AsString;
       M_Donn.zq_secteur.open;
    end;
end;

procedure TF_Repr.F_FormDicoActivate(Sender: TObject);
begin
  p_initSecteur;
end;

/////////////////////////////////////////////////////////////////////////
// Nom: bt_enregistrerClick
// But: Mettre les enregistrements ? jour selon r?affectation
/////////////////////////////////////////////////////////////////////////
procedure TF_Repr.bt_enregistrerClick(Sender: TObject);
var
  ls_SQL:String;
begin
// on r?cup?re la liste des codes clients r?affect?s
// si au moins un code, on r??crit les requ?tes SQL
// OBLIGATOIRE PAR RAPPORT A LA LISTE DES CODES
if fb_BuildWhereBasket ( lv_client_in, ls_SQL,True,False) then
  try
    // champ Diffgen ? 1
    M_Donn.zq_client_diffgen.close;
    M_Donn.zq_client_diffgen.SQL.Clear;
    M_Donn.zq_client_diffgen.SQL.Add('UPDATE CLIENT SET CLIE_Diffgen = 1');
    M_Donn.zq_client_diffgen.SQL.Add ( ls_SQL );
    M_Donn.zq_client_diffgen.ExecSQL;
    // on modifie le repr?sentant des devis et des commandes
    M_Donn.zq_devis_repr.close;
    M_Donn.zq_devis_repr.SQL.Clear;
    M_Donn.zq_devis_repr.SQL.Add('UPDATE DEVIS SET DEVI__REPR = '''+M_Donn.zq_repr.fieldByName('REPR_Clep').AsString+'''');
    M_Donn.zq_devis_repr.SQL.Add('FROM CLIENT');
    M_Donn.zq_devis_repr.SQL.Add(ls_SQL);
    M_Donn.zq_devis_repr.SQL.Add('AND DEVI__CLIE1 = CLIE_Clep ');
    M_Donn.zq_devis_repr.ExecSQL;
    M_Donn.zq_commande_repr.close;
    M_Donn.zq_commande_repr.SQL.Clear;
    M_Donn.zq_commande_repr.SQL.Add('UPDATE COMMANDE SET COMM__REPR = '''+M_Donn.zq_repr.fieldByName('REPR_Clep').AsString+'''');
    M_Donn.zq_commande_repr.SQL.Add('FROM CLIENT');
    M_Donn.zq_commande_repr.SQL.Add(ls_SQL);
    M_Donn.zq_commande_repr.SQL.Add('AND Client_fac = CLIE_Clep ');
    M_Donn.zq_commande_repr.ExecSQL;
  finally
  end;

end;

end.

