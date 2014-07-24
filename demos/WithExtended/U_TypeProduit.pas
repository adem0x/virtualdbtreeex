///////////////////////////////////////////////////////////////////////
// Nom Unite: U_Famillevente
// Description : Gestion des familles de vente
// Créé par Microcelt le 11/08
// Modifié le 11/08
///////////////////////////////////////////////////////////////////////
unit U_TypeProduit;

{$IFDEF FPC}
  {$MODE Delphi}
{$ENDIF}

interface

uses
{$IFNDEF FPC}
  AdvListV, RbSplitter, RXSplit, Mask,
{$ELSE}
  MaskEdit,
{$ENDIF}
  LCLType, Messages, Graphics, Controls, Classes, ExtCtrls,  Dialogs, DB, IBQuery,IBTable,IBUpdateSQL,
  U_ExtDBNavigator, Buttons, Forms, DBCtrls, Grids,
  DBGrids, u_framework_dbcomponents, u_framework_components,
  ComCtrls, StdCtrls, SysUtils,  TypInfo,  Variants,
  StrUtils, ToolEdit, U_FormAdapt, U_OnFormInfoIni,  JvXPButtons,
  U_ExtDBGrid,U_ConstMessage, u_buttons_appli,
  U_GroupView, ImgList,fonctions_string, U_DmDonn ;

type

  { TF_TypeProduit }

  TF_TypeProduit = class(TF_FormAdapt)
    nv_navigator: TExtDBNavigator;
    nv_saisie: TExtDBNavigator;
    lb_code: TFWLabel;
    lb_libelle: TFWLabel;
    ed_code: TFWDBEdit;
    ed_libelle: TFWDBEdit;
    pa_1: TPanel;
    pa_2: TPanel;
    pa_3: TPanel;
    pa_4: TPanel;
    pa_5: TPanel;
    pa_6: TPanel;
    SvgFormInfoIni: TOnFormInfoIni;
    spl_1: TSplitter;
    Panel3: TPanel;
    bt_fermer: TFWClose;
    Panel4: TPanel;
    gd_famillevente: TExtDBGrid;
    pc_Groupes: TPageControl;
    ts_Gamme: TTabSheet;
    Panel10: TPanel;
    Panel13: TPanel;
    Panel1: TPanel;
    Panel5: TPanel;
    bt_abandonner: TFWCancel;
    bt_enregistrer: TFWOK;
    Panel6: TPanel;
    lsv_GammIn: TDBGroupView;
    Panel2: TPanel;
    bt_in_item: TFWInSelect;
    bt_in_total: TFWInAll;
    bt_out_item: TFWOutSelect;
    bt_out_total: TFWOutAll;
    RbSplitter1: TSplitter;
    lsv_GammOut: TDBGroupView;
    im_images: TImageList;
    ts_Caracteristique: TTabSheet;
    Panel7: TPanel;
    lsv_CaracIn: TDBGroupView;
    Panel8: TPanel;
    bt_in_carac: TFWInSelect;
    bt_in_total_carac: TFWInAll;
    bt_out_carac: TFWOutSelect;
    bt_out_total_carac: TFWOutAll;
    Panel9: TPanel;
    Panel14: TPanel;
    Panel15: TPanel;
    Panel16: TPanel;
    bt_AbandonCarac: TFWCancel;
    bt_EnrCarac: TFWOK;
    lsv_CaracOut: TDBGroupView;
    RbSplitter2: TSplitter;
    Panel17: TPanel;
    Panel11: TPanel;
    bt_Gamme: TJvXpButton;
    bt_Carac: TJvXpButton;
    TabSheet1: TTabSheet;
    Panel12: TPanel;
    Panel18: TPanel;
    Panel19: TPanel;
    Panel20: TPanel;
    Panel21: TPanel;
    bt_AbanArt: TFWCancel;
    bt_EnrArt: TFWOK;
    bt_retour: TJvXpButton;
    Panel22: TPanel;
    RbSplitter3: TSplitter;
    Panel23: TPanel;
    lv_artin: TDBGroupView;
    Panel24: TPanel;
    bt_in_art: TFWInSelect;
    bt_in_totart: TFWInAll;
    bt_out_art: TFWOutSelect;
    bt_out_totart: TFWOutAll;
    lv_ArtOut: TDBGroupView;
    ds_typearti: TDataSource;
    zq_typearti: TIBQuery;
    zq_maj: TIBQuery;
    procedure bt_GammeClick(Sender: TObject);
    procedure bt_CaracClick(Sender: TObject);
    procedure pc_GroupesChange(Sender: TObject);
    procedure pc_GroupesChanging(Sender: TObject; var AllowChange: Boolean);
    procedure lv_artinDBOnRecorded(DataSet: TDataSet);

  private
    { Déclarations privées }

  public
    { Déclarations publiques }
  end;

var
  F_TypeProduit: TF_TypeProduit;

implementation

uses U_DmArticle,u_gamme,fonctions_forms;
{$IFNDEF FPC}
  {$R *.dfm}
{$ELSE}
  {$R *.lfm}
{$ENDIF}
procedure TF_TypeProduit.bt_GammeClick(Sender: TObject);
begin
  fp_CreateUniqueChild ( TF_Gamme, fsMDIChild );
  if ( lsv_GammIn.Items.Count > 0 )
  and M_Article.zq_Gamme.Active Then
    If assigned ( lsv_GammIn.Selected ) Then
      M_Article.zq_Gamme.Locate ( 'GAMM_Clep', lsv_GammIn.Selected.Caption, [] )
    Else
      M_Article.zq_Gamme.Locate ( 'GAMM_Clep', lsv_GammIn.Items [0].Caption, [] )

end;


procedure TF_TypeProduit.bt_CaracClick(Sender: TObject);
begin
  fp_CreateUniqueChild ( TF_TypeProduit, fsMDIChild );
  if ( lsv_CaracIn.Items.Count > 0 )
  and M_Article.zq_Carac.Active Then
    If assigned ( lsv_CaracIn.Selected ) Then
      M_Article.zq_Carac.Locate ( 'CARA_Clep', lsv_CaracIn.Selected.Caption, [] )
    Else
      M_Article.zq_Carac.Locate ( 'CARA_Clep', lsv_CaracIn.Items [0].Caption, [] )

end;

procedure TF_TypeProduit.pc_GroupesChange(Sender: TObject);
begin

end;

procedure TF_TypeProduit.pc_GroupesChanging(Sender: TObject;
  var AllowChange: Boolean);
var li_Choix : Integer ;
begin
  if  ( pc_Groupes.ActivePage = ts_Gamme )
  and ( bt_enregistrer.Enabled ) Then
    Begin
      li_Choix := MessageDlg ( U_CST_9602, mtConfirmation, [mbYes,mbNo,mbCancel], 0 );
      case li_Choix of
        mrYes : bt_enregistrer.OnClick ( bt_enregistrer );
        mrNo  : bt_abandonner .OnClick ( bt_abandonner  );
        mrCancel : AllowChange := False ;
      End;
    End;

  if  ( pc_Groupes.ActivePage = ts_Caracteristique )
  and ( bt_EnrCarac.Enabled ) Then
    Begin
      li_Choix := MessageDlg ( U_CST_9602, mtConfirmation, [mbYes,mbNo,mbCancel], 0 );
      case li_Choix of
        mrYes : bt_EnrCarac    .OnClick ( bt_EnrCarac     );
        mrNo  : bt_AbandonCarac.OnClick ( bt_AbandonCarac );
        mrCancel : AllowChange := False ;
      End;
    End;
end;

procedure TF_TypeProduit.lv_artinDBOnRecorded(DataSet: TDataSet);
begin
zq_maj.ExecSQL;
end;

end.

