///////////////////////////////////////////////////////////////////////
// Nom Unite: U_Famillevente
// Description : Gestion des familles de vente
// Créé par Microcelt le 11/08
// Modifié le 11/08
///////////////////////////////////////////////////////////////////////
unit U_Caracteristique;

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

const CST_CARA_Clep = 'CARA_Clep' ; 

type
  TF_Caracteristique = class(TF_FormAdapt)
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
    lv_CaracIn: TDBGroupView;
    Panel2: TPanel;
    bt_in_item: TFWInSelect;
    bt_in_total: TFWInAll;
    bt_out_item: TFWOutSelect;
    bt_out_total: TFWOutAll;
    RbSplitter1: TSplitter;
    lv_transfert: TDBGroupView;
    im_images: TImageList;
    bt_TypePro: TJvXpButton;
    TabSheet1: TTabSheet;
    Panel7: TPanel;
    Panel18: TPanel;
    Panel19: TPanel;
    Panel20: TPanel;
    Panel21: TPanel;
    bt_AbanArt: TJvXpButton;
    bt_EnrArt: TFWOK;
    bt_retour: TJvXpButton;
    Panel22: TPanel;
    RbSplitter3: TSplitter;
    Panel23: TPanel;
    lv_artin: TDBGroupView;
    Panel24: TPanel;
    bt_in_art: TFWInSelect;
    bt_in_totart: TFWInSelect;
    bt_out_art: TFWOutSelect;
    bt_out_totart: TFWOutSelect;
    lv_ArtOut: TDBGroupView;
    ds_caraarti: TDataSource;
    zq_caraarti: TIBQuery;
    zq_maj: TIBQuery;
    procedure bt_TypeProClick(Sender: TObject);
    procedure lv_artinDBOnRecorded(DataSet: TDataSet);

  private
    { Déclarations privées }

  public
    { Déclarations publiques }
  end;

var
  F_Caracteristique: TF_Caracteristique;

implementation

uses U_DmArticle,
     U_TypeProduit,
     fonctions_forms;
{$IFNDEF FPC}
  {$R *.dfm}
{$ELSE}
  {$R *.lfm}
{$ENDIF}


procedure TF_Caracteristique.bt_TypeProClick(Sender: TObject);
begin
  fp_CreateUniqueChild ( TF_TypeProduit, fsMDIChild );
  if ( lv_CaracIn.Items.Count > 0 )
  and M_Article.zq_TypProduit.Active Then
    If assigned ( lv_CaracIn.Selected ) Then
      M_Article.zq_TypProduit.Locate ( 'TYPR_Clep', lv_CaracIn.Selected.Caption, [] )
    Else
      M_Article.zq_TypProduit.Locate ( 'TYPR_Clep', lv_CaracIn.Items [0].Caption, [] )
end;

procedure TF_Caracteristique.lv_artinDBOnRecorded(DataSet: TDataSet);
begin
  zq_maj.ExecSQL;
end;

end.

