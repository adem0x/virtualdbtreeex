///////////////////////////////////////////////////////////////////////
// Nom Unite: U_Famillevente
// Description : Gestion des familles de vente
// Créé par Microcelt le 11/08
// Modifié le 11/08
///////////////////////////////////////////////////////////////////////
unit U_Comportement;

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
  DBGrids, u_framework_dbcomponents, ComCtrls, StdCtrls, SysUtils,  TypInfo,  Variants,
  StrUtils, ToolEdit, U_FormAdapt, U_OnFormInfoIni,  JvXpButtons,
  U_ExtDBGrid,U_ConstMessage, U_DmCompose,
  U_GroupView, ImgList,fonctions_string, U_DmDonn,
  u_framework_components, u_buttons_appli;

const
  CST_STRU_Type = 'STRU_Type' ;
  CST_CPTM_Clep = 'CPTM_Clep' ;

type
  TF_Comportement = class(TF_FormAdapt)
    nv_navigator: TExtDBNavigator;
    nv_saisie: TExtDBNavigator;
    lb_code: TFWLabel;
    ed_code: TFWDBEdit;
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
    pc_ComposeStru: TPageControl;
    im_images: TImageList;
    ts_Comporte: TTabSheet;
    Panel17: TPanel;
    lsv_ComporteIn: TDBGroupView;
    Panel18: TPanel;
    bt_inComp: TFWInSelect;
    bt_OutComp: TFWOutSelect;
    lsv_ComporteOut: TDBGroupView;
    pa_Boutons: TPanel;
    Panel20: TPanel;
    Panel21: TPanel;
    Panel22: TPanel;
    bt_AbandComporte: TFWCancel;
    bt_EnrComporte: TFWOK;
    Panel23: TPanel;
    bt_Structure: TJvXpButton;
    DBLookupComboBox4: TDBLookupComboBox;
    Label4: TFWLabel;
    ts_Selection: TTabSheet;
    Panel24: TPanel;
    lsv_SelectionIn: TDBGroupView;
    Panel25: TPanel;
    bt_InSelection: TFWInSelect;
    bt_OutSelection: TFWOutSelect;
    lsv_SelectionOut: TDBGroupView;
    Panel26: TPanel;
    Panel27: TPanel;
    Panel28: TPanel;
    Panel29: TPanel;
    bt_AbanSelection: TFWCancel;
    bt_EnrSelection: TFWOK;
    Panel30: TPanel;
    bt_StructureSel: TJvXpButton;
    ed_FiltreStrA: TEdit;
    Label3: TFWLabel;
    ed_FiltreStrS: TEdit;
    Label1: TFWLabel;
    RbSplitter3: TSplitter;
    RbSplitter1: TSplitter;
    procedure F_FormDicoDataOnSave(Sender: TObject);
    procedure F_FormDicoDataOnCancel(Sender: TObject);
    procedure pc_ComposeStruChanging(Sender: TObject;
      var AllowChange: Boolean);
    procedure bt_StructureClick(Sender: TObject);
    procedure bt_StructureSelClick(Sender: TObject);
    procedure F_FormDicoCreate(Sender: TObject);
    procedure F_FormDicoDestroy(Sender: TObject);
    procedure ed_FiltreStrAKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ed_FiltreStrSKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);

  private
    { Déclarations privées }

  public
    { Déclarations publiques }
  end;

var
  F_Comportement: TF_Comportement;

implementation

uses U_Structure, fonctions_forms, fonctions_db ,
     U_DmArticle, fonctions_erreurs;
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
procedure TF_Comportement.F_FormDicoDataOnSave(Sender: TObject);
begin
  if M_Article.zq_Gamme.State in [dsInsert,dsEdit] then
  begin
      pc_ComposeStru.Enabled := FALSE;
  end;
  if bt_AbandComporte.Enabled then
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
procedure TF_Comportement.F_FormDicoDataOnCancel(Sender: TObject);
begin
  // on remet accessible les objets
  pc_ComposeStru.Enabled := TRUE;

  gd_famillevente.Enabled := TRUE;
  nv_navigator.Enabled := TRUE;
  nv_saisie.Enabled := TRUE;
  pa_6.Enabled := TRUE;
end;

//////////////////////////////////////////////////////////////////////////////
// Evènement   : pc_ComposeStruChanging
// Description : Validation des onglets au changement d'onglet
//////////////////////////////////////////////////////////////////////////////
procedure TF_Comportement.pc_ComposeStruChanging(Sender: TObject;
  var AllowChange: Boolean);
begin
  if  ( pc_ComposeStru.ActivePage = ts_Comporte )
  and ( bt_EnrComporte.Enabled ) Then
    try
      bt_EnrComporte  .OnClick ( bt_EnrComporte   );
    Except
      on e: Exception do
        Begin
          f_GereException ( e , lsv_ComporteIn.Datasource.Dataset );
          AllowChange := False ;
        End ;
    End;
  if  ( pc_ComposeStru.ActivePage = ts_Selection )
  and ( bt_EnrSelection.Enabled ) Then
    try
      bt_EnrSelection .OnClick ( bt_EnrSelection   );
    Except
      on e: Exception do
        Begin
          f_GereException ( e , lsv_ComporteIn.Datasource.Dataset );
          AllowChange := False ;
        End ;
    End;
end;

//////////////////////////////////////////////////////////////////////////////
// Evènement   : bt_StructureClick
// Description : Ouverture de la fiche structure et focalisation sur la branche
//////////////////////////////////////////////////////////////////////////////
procedure TF_Comportement.bt_StructureClick(Sender: TObject);
begin
  fp_CreateUniqueChild(TF_Structure,fsMDIChild);
  if ( lsv_ComporteIn.Items.Count > 0 )
  and M_DmCompose.zq_Structure.Active Then
    if assigned ( lsv_ComporteIn.Selected ) Then
      M_DmCompose.zq_Structure.Locate ( CST_STRU_Clep, lsv_ComporteIn.Selected.Caption, [] )
    Else
      M_DmCompose.zq_Structure.Locate ( CST_STRU_Clep, lsv_ComporteIn.Items [ 0 ].Caption, [] );
  if assigned ( F_Structure )
  and ( F_Structure.Visible )
  and F_Structure.ts_Comporte.TabVisible Then
    F_Structure.pc_ComposeStru.ActivePage := F_Structure.ts_Comporte ;
end;

//////////////////////////////////////////////////////////////////////////////
// Evènement   : bt_StructureSelClick
// Description : Ouverture de la fiche structure et focalisation sur la branche
//////////////////////////////////////////////////////////////////////////////
procedure TF_Comportement.bt_StructureSelClick(Sender: TObject);
begin
  fp_CreateUniqueChild(TF_Structure,fsMDIChild);
  if lsv_SelectionIn.Items.Count > 0 Then
    M_DmCompose.zq_Structure.Locate ( CST_STRU_Clep, lsv_SelectionIn.Items [ 0 ].Caption, [] );
  if assigned ( F_Structure )
  and ( F_Structure.Visible )
  and F_Structure.ts_Selection.TabVisible Then
    F_Structure.pc_ComposeStru.ActivePage := F_Structure.ts_Selection ;

end;

//////////////////////////////////////////////////////////////////////////////
// Evènement   : F_FormDicoCreate
// Description : Initialisation de la fiche
//////////////////////////////////////////////////////////////////////////////
procedure TF_Comportement.F_FormDicoCreate(Sender: TObject);
begin
  F_Comportement := Self ;
end;

//////////////////////////////////////////////////////////////////////////////
// Evènement   : F_FormDicoCreate
// Description : Désaffectation des variables et destruction des objets sans Owner
//////////////////////////////////////////////////////////////////////////////
procedure TF_Comportement.F_FormDicoDestroy(Sender: TObject);
begin
  F_Comportement := nil ;
end;

//////////////////////////////////////////////////////////////////////////////
// Evènement   : ed_FiltreStrAKeyUp
// Description : Filtrage ou pas des comportements d'action
//////////////////////////////////////////////////////////////////////////////
procedure TF_Comportement.ed_FiltreStrAKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if ed_FiltreStrA.Text = '' Then
    lsv_ComporteOut.Datasource.DataSet.Filtered := False
  Else
    Begin
//      lsv_ComporteOut.Datasource.DataSet.Filter := lsv_ComporteOut.DBSources[0].KeyUnit + ' LIKE ''' + fs_stringDbQuoteFilter ( ed_FiltreStrA.Text ) + '%''' ;
      lsv_ComporteOut.Datasource.DataSet.Filtered := True ;
    End ;
  lsv_ComporteOut.Refresh ;

end;

//////////////////////////////////////////////////////////////////////////////
// Evènement   : ed_FiltreStrSKeyUp
// Description : Filtrage ou pas des comportements de sélection
//////////////////////////////////////////////////////////////////////////////
procedure TF_Comportement.ed_FiltreStrSKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if ed_FiltreStrS.Text = '' Then
    lsv_SelectionOut.Datasource.DataSet.Filtered := False
  Else
    Begin
//      lsv_SelectionOut.Datasource.DataSet.Filter := lsv_SelectionOut.DBSources[0].KeyUnit + ' LIKE ''' + fs_stringDbQuoteFilter ( ed_FiltreStrS.Text ) + '%''' ;
      lsv_SelectionOut.Datasource.DataSet.Filtered := True ;
    End ;
  lsv_SelectionOut.Refresh ;

end;

end.

