///////////////////////////////////////////////////////////////////////
// Nom Unite: U_Famillevente
// Description : Gestion des familles de vente
// Créé par Microcelt le 11/08
// Modifié le 11/08
///////////////////////////////////////////////////////////////////////
unit U_Gamme;

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
  U_GroupView, ImgList,fonctions_string, U_DmArticle, Menus ;

type
  TF_Gamme = class(TF_FormAdapt)
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
    ts_ssfam: TTabSheet;
    Panel10: TPanel;
    Panel12: TPanel;
    Panel13: TPanel;
    Panel1: TPanel;
    Panel5: TPanel;
    bt_abandonner: TFWCancel;
    bt_enregistrer: TFWOK;
    Panel6: TPanel;
    lsv_TypesIn: TDBGroupView;
    Panel2: TPanel;
    bt_in_item: TFWInSelect;
    bt_in_total: TFWInAll;
    bt_out_item: TFWOutSelect;
    bt_out_total: TFWOutAll;
    RbSplitter1: TSplitter;
    lsv_TypesOut: TDBGroupView;
    im_images: TImageList;
    bt_TypePro: TJvXpButton;
    TabSheet1: TTabSheet;
    Panel7: TPanel;
    Panel8: TPanel;
    Panel9: TPanel;
    Panel11: TPanel;
    Panel14: TPanel;
    bt_Desaffecte: TJvXpButton;
    bt_EnrArt: TFWOK;
    bt_retour: TJvXpButton;
    ds_gammarti: TDataSource;
    zq_gammarti: TIBQuery;
    Panel17: TPanel;
    Panel15: TPanel;
    lv_artin: TDBGroupView;
    Panel16: TPanel;
    bt_in_art: TFWInSelect;
    bt_in_totart: TFWInSelect;
    bt_out_art: TFWOutSelect;
    bt_out_totart: TFWOutSelect;
    lv_ArtOut: TDBGroupView;
    RbSplitter2: TSplitter;
    zq_maj: TIBQuery;
    bt_AbanArt: TFWCAncel;
    zq_desaffecte: TIBQuery;
    procedure F_FormDicoDataOnSave(Sender: TObject);
    procedure F_FormDicoDataOnCancel(Sender: TObject);
    procedure bt_TypeProClick(Sender: TObject);
    procedure F_FormDicoShow(Sender: TObject);
    procedure lv_artinDBOnRecorded(DataSet: TDataSet);
    procedure lv_artinClick(Sender: TObject);
    procedure lv_ArtOutClick(Sender: TObject);
    procedure bt_out_artClick(Sender: TObject);
    procedure bt_out_totartClick(Sender: TObject);
    procedure bt_DesaffecteClick(Sender: TObject);

  private
    { Déclarations privées }

  public
    { Déclarations publiques }
  end;

var
  F_Gamme: TF_Gamme;

implementation

uses fonctions_forms,U_TypeProduit;
{$IFNDEF FPC}
  {$R *.dfm}
{$ELSE}
  {$R *.lfm}
{$ENDIF}


///////////////////////////////////////////////////////////////////////
// Procedure : F_FormDicoDataOnSave
// Description : Donne l'acces aux objets selon que l'adoquery est
//               en mode insertion ou modification
///////////////////////////////////////////////////////////////////////
procedure TF_Gamme.F_FormDicoDataOnSave(Sender: TObject);
begin
  if gd_famillevente.Datasource.DataSet.State in [dsInsert,dsEdit] then
  begin
      pc_Groupes.Enabled := FALSE;
  end;
  if bt_abandonner.Enabled then
    begin
      gd_famillevente.Enabled := FALSE;
      nv_navigator.Enabled := FALSE;
      nv_saisie.Enabled := FALSE;
      pa_6.Enabled := FALSE;
    end;
end;

///////////////////////////////////////////////////////////////////////
// Procedure :  F_FormDicoDataOnCancel
// Description : code executé au moment de l'annulation de modif ou d'insert
///////////////////////////////////////////////////////////////////////
procedure TF_Gamme.F_FormDicoDataOnCancel(Sender: TObject);
begin
  // on remet accessible les objets
  pc_Groupes.Enabled := TRUE;

  gd_famillevente.Enabled := TRUE;
  nv_navigator.Enabled := TRUE;
  nv_saisie.Enabled := TRUE;
  pa_6.Enabled := TRUE;
end;

procedure TF_Gamme.bt_TypeProClick(Sender: TObject);
begin
  fp_CreateUniqueChild ( TF_TypeProduit, fsMDIChild );
  if ( lsv_TypesIn.Items.Count > 0 )
  and M_Article.zq_TypProduit.Active Then
    If assigned ( lsv_TypesIn.Selected ) Then
      M_Article.zq_TypProduit.Locate ( 'TYPR_Clep', lsv_TypesIn.Selected.Caption, [] )
    Else
      M_Article.zq_TypProduit.Locate ( 'TYPR_Clep', lsv_TypesIn.Items [0].Caption, [] )
end;

procedure TF_Gamme.F_FormDicoShow(Sender: TObject);
begin
//M_Donn.ds_Gamme.DataSet.Open;
//M_Donn.ds_article.DataSet.Open;
end;

procedure TF_Gamme.lv_artinDBOnRecorded(DataSet: TDataSet);
begin
zq_maj.ExecSQL;
end;


procedure TF_Gamme.lv_artinClick(Sender: TObject);
begin
lv_artout.Selected := nil;
bt_Desaffecte.Enabled := (lv_artin.SelCount > 0);
end;

procedure TF_Gamme.lv_ArtOutClick(Sender: TObject);
begin
lv_artin.Selected := nil;
bt_Desaffecte.Enabled := False;
end;

procedure TF_Gamme.bt_out_artClick(Sender: TObject);
begin
bt_Desaffecte.Enabled := False;
end;

procedure TF_Gamme.bt_out_totartClick(Sender: TObject);
begin
bt_Desaffecte.Enabled := False;
end;

procedure TF_Gamme.bt_DesaffecteClick(Sender: TObject);
var
i : integer;
startitem : TlistItem;
codeart : string;
begin
startitem := lv_artin.Selected;
For i:= 0 to lv_artin.SelCount - 1 do
 with lv_artin do
  begin
  codeart := startitem.Caption;
  zq_desaffecte.Active := False;
  zq_desaffecte.Params.ParamByName('codeart').Value := trim(codeart);
  zq_desaffecte.ExecSQL;
  SelectNext( lv_artin, True, False );
  startitem:= Selected;
  end;
end;


end.


