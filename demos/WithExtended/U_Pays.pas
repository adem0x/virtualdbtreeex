///////////////////////////////////////////////////////////////////////
// Nom Unite: U_Pays
// Description : Gestion des Pays
// Cr?? par Microcelt le 01/11/2004
// Modifi? le 17/12/2004
///////////////////////////////////////////////////////////////////////
unit U_Pays;

{$IFDEF FPC}
  {$MODE Delphi}
{$ENDIF}

interface

uses
{$IFNDEF FPC}
  JvDBLookup, JvComponent, JvExControls, AdvListV, RbSplitter, RXSplit, Mask,
{$ELSE}
  MaskEdit,
{$ENDIF}
  LCLType, Messages, Graphics, Controls, Classes, ExtCtrls,  Dialogs, DB, IBQuery,IBTable,IBUpdateSQL,
  U_ExtDBNavigator, Buttons, Forms, DBCtrls, Grids,
  DBGrids, u_framework_dbcomponents, u_framework_components,
  ComCtrls, StdCtrls, SysUtils,  TypInfo,  Variants,
  StrUtils, ToolEdit, U_FormAdapt, U_OnFormInfoIni,  JvXpButtons,
  U_ExtDBGrid,U_ConstMessage,
  u_buttons_appli,
  U_GroupView, ImgList,fonctions_string, U_DmDonn;

type
  TF_Pays = class(TF_FormAdapt)
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
    gd_Pays: TExtDBGrid;
    ct_ssfam: TPageControl;
    im_images: TImageList;
    ts_Client: TTabSheet;
    gd_Client: TExtDBGrid;
    nv_Client: TExtDBNavigator;
    cbx_TVA: TFWDBLookupCombo;
    lb_tva: TFWLabel;
    ed_numtel: TFWDBEdit;
    lb_numtel: TFWLabel;
    procedure bt_TypeProClick(Sender: TObject);
    procedure F_FormDicoActivate(Sender: TObject);
    procedure F_FormDicoDataOnSort(Dataset: TDataSet; as_Champ,
      as_TypeTri: String);

  private
    { D?clarations priv?es }

  public
    { D?clarations publiques }
  end;

var
  F_Pays: TF_Pays;

implementation

uses U_TypeProduit,
     fonctions_erreurs,
     fonctions_forms;
{$IFNDEF FPC}
  {$R *.dfm}
{$ELSE}
  {$R *.lfm}
{$ENDIF}


///////////////////////////////////////////////////////////////////////
// Procedure :  F_FormDicoDataOnCancel
// Description : code execut? au moment de l'annulation de modif ou d'insert
///////////////////////////////////////////////////////////////////////
procedure TF_Pays.bt_TypeProClick(Sender: TObject);
begin
  fp_CreateUniqueChild ( TF_TypeProduit, fsMDIChild );
end;

procedure TF_Pays.F_FormDicoActivate(Sender: TObject);
begin
  TNumericField ( cbx_TVA.LookupSource.DataSet.FieldByName ( 'TTVA_Taux'  )).DisplayFormat := U_CST_format_money_1 ;

end;

procedure TF_Pays.F_FormDicoDataOnSort(Dataset: TDataSet; as_Champ,
  as_TypeTri: String);
var lbkm_Enregistrement : TBookmarkStr ;
begin
  if Dataset = M_Donn.zq_Pays Then
    Begin
      if not M_Donn.zq_Pays.IsEmpty Then
        lbkm_Enregistrement := M_Donn.zq_Pays.Bookmark ;
      try
        M_Donn.zq_Pays.Close ;
        M_Donn.zq_Pays.SQL.Delete ( M_Donn.zq_Pays.SQL.Count - 1 );
        M_Donn.zq_Pays.SQL.Add    ( 'ORDER BY ' + as_Champ + ' ' + as_TypeTri );
        M_Donn.zq_Pays.Open ;
      Except
        on e: Exception do f_GereException( e, M_Donn.zq_Pays );
      End ;
      try
        M_Donn.zq_Pays.Bookmark := lbkm_Enregistrement ;
      Except
      End ;
    End ;
end;

end.

