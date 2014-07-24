///////////////////////////////////////////////////////////////////////
// Nom Unite: U_Famillevente
// Description : Gestion des familles de vente
// Créé par Microcelt le 11/08
// Modifié le 11/08
///////////////////////////////////////////////////////////////////////
unit U_Structure;

{$IFDEF FPC}
  {$MODE Delphi}
{$ENDIF}

interface

uses
{$IFNDEF FPC}
  JvComponent, JvExControls, dxCheckCtrls, JvDBLookup, JvXpButton, AdvListV, RbSplitter, RXSplit, Mask,
{$ELSE}
  MaskEdit,
{$ENDIF}
  LCLType, Messages, Graphics, Controls, Classes, ExtCtrls,  Dialogs, DB, IBQuery,IBTable,IBUpdateSQL,
  U_ExtDBNavigator, Buttons, Forms, DBCtrls, Grids,
  DBGrids, u_framework_dbcomponents, ComCtrls, StdCtrls, SysUtils,  TypInfo,  Variants,
  StrUtils, ToolEdit, U_FormAdapt, U_OnFormInfoIni,  JvXpButtons,
  U_ExtDBGrid,U_ConstMessage, U_DmCompose,
  U_GroupView, ImgList,fonctions_string, U_DmDonn, VirtualTrees,
  VirtualDBTreeEx, u_framework_components, u_buttons_appli,
  JvXPCheckCtrls;

const
  CST_STRU_Type = 'STRU_Type' ;
  CST_STRU_Clep = 'STRU_Clep' ;
  CST_STRU_Selectionne = 'STRU_Selectionne' ;
  CST_BRANCHE_MAX_CLE = 19 ;

type
  TF_Structure = class(TF_FormAdapt)
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
    pc_ComposeStru: TPageControl;
    ts_Structure: TTabSheet;
    Panel10: TPanel;
    Panel12: TPanel;
    Panel13: TPanel;
    Panel1: TPanel;
    Panel5: TPanel;
    bt_abandbranche: TFWCancel;
    bt_enrbranche: TFWOK;
    Panel6: TPanel;
    lsv_BrancheIn: TDBGroupView;
    Panel2: TPanel;
    bt_in_item: TFWInSelect;
    bt_out_item: TFWOutSelect;
    RbSplitter1: TSplitter;
    lsv_BrancheOut: TDBGroupView;
    im_images: TImageList;
    ts_Composant: TTabSheet;
    Panel9: TPanel;
    Panel14: TPanel;
    Panel15: TPanel;
    Panel16: TPanel;
    bt_AbandonComp: TFWCancel;
    bt_EnrComp: TFWOK;
    Panel11: TPanel;
    bt_Compos: TJvXpButton;
    lsv_CompoOut: TDBGroupView;
    Panel7: TPanel;
    lsv_CompoIn: TDBGroupView;
    Panel8: TPanel;
    bt_in_comp: TFWInSelect;
    bt_out_comp: TFWOutSelect;
    RbSplitter2: TSplitter;
    ts_Comporte: TTabSheet;
    Panel17: TPanel;
    lsv_ComporteIn: TDBGroupView;
    Panel18: TPanel;
    bt_inComp: TFWInSelect;
    bt_OutComp: TFWOutSelect;
    lsv_ComporteOut: TDBGroupView;
    Panel19: TPanel;
    Panel20: TPanel;
    Panel21: TPanel;
    Panel22: TPanel;
    bt_AbandComporte: TFWCancel;
    bt_EnrComporte: TFWOK;
    Panel23: TPanel;
    bt_ComporteAct: TJvXpButton;
    cbx_Type: TFWDBLookupCombo;
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
    bt_AbanSelection: TJvXpButton;
    bt_EnrSelection: TFWOK;
    Panel30: TPanel;
    bt_ComporteSel: TJvXpButton;
    cbx_Selection: TFWDBLookupCombo;
    Label1: TFWLabel;
    DBEdit1: TFWDBEdit;
    Label2: TFWLabel;
    ts_Racine: TTabSheet;
    Panel31: TPanel;
    lsv_ArticleIn: TDBGroupView;
    Panel32: TPanel;
    bt_InArticle: TFWInSelect;
    bt_OutArticle: TFWOutSelect;
    lsv_ArticleOut: TDBGroupView;
    Panel33: TPanel;
    Panel34: TPanel;
    Panel35: TPanel;
    Panel36: TPanel;
    Panel37: TPanel;
    bt_AbandArticle: TFWCancel;
    bt_EnrArticle: TFWOK;
    bt_Article: TJvXpButton;
    bt_Simule: TJvXpButton;
    Panel38: TPanel;
    ts_Represente: TTabSheet;
    vt_Composition: TCheckVirtualDBTreeEx;
    pa_CocheStru: TPanel;
    ch_Structure: TJvXpCheckBox;
    ts_LienBra: TTabSheet;
    Panel39: TPanel;
    lsv_LieBrIn: TDBGroupView;
    Panel40: TPanel;
    bt_inLieBr: TFWInSelect;
    bt_OutLieBr: TFWOutSelect;
    lsv_LieBrOut: TDBGroupView;
    Panel41: TPanel;
    Panel42: TPanel;
    Panel43: TPanel;
    Panel44: TPanel;
    Panel45: TPanel;
    bt_AbandLieBr: TFWCancel;
    bt_EnrLieBr: TFWOK;
    Label3: TFWLabel;
    ed_FiltreArticles: TEdit;
    ed_FiltreComp: TEdit;
    Label5: TFWLabel;
    ed_FiltreAction: TEdit;
    Label6: TFWLabel;
    ed_FiltreSelect: TEdit;
    Label7: TFWLabel;
    ed_FiltreLieBr: TEdit;
    Label8: TFWLabel;
    ed_FiltreBr: TEdit;
    Label9: TFWLabel;
    RbSplitter3: TSplitter;
    RbSplitter4: TSplitter;
    RbSplitter5: TSplitter;
    RbSplitter6: TSplitter;
    procedure bt_TypeProClick(Sender: TObject);
    procedure F_FormDicoDataDBSourcescroll(DataSet: TDataSet);
    procedure bt_ArticleClick(Sender: TObject);
    procedure bt_ComposClick(Sender: TObject);
    procedure bt_ComporteActClick(Sender: TObject);
    procedure bt_ComporteSelClick(Sender: TObject);
    procedure F_FormDicoCreate(Sender: TObject);
    procedure F_FormDicoDestroy(Sender: TObject);
    procedure bt_SimuleClick(Sender: TObject);
    procedure pc_ComposeStruChanging(Sender: TObject;
      var AllowChange: Boolean);
    procedure vt_CompositionExpanded(Sender: TBaseVirtualTree;
      Node: PVirtualNode);
    procedure ch_StructureClick(Sender: TObject);
    procedure lsv_ArticleInDBOnRecorded(DataSet: TDataSet);
    procedure lsv_LieBrInDBOnRecorded(DataSet: TDataSet);
    procedure lsv_BrancheInDBOnRecorded(DataSet: TDataSet);
    procedure lsv_CompoInDBOnRecorded(DataSet: TDataSet);
    procedure vt_CompositionDblClick(Sender: TObject);
    procedure ed_FiltreArticlesKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ed_FiltreCompKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ed_FiltreActionKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ed_FiltreSelectKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ed_FiltreLieBrKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ed_FiltreBrKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure lsv_ArticleInBeforeDataScroll(const Sender: TObject;
      const Dataset: TDataSet; var LoadList: Boolean);
    procedure lsv_ArticleOutBeforeDataScroll(const Sender: TObject;
      const Dataset: TDataSet; var LoadList: Boolean);
    procedure lsv_LieBrInBeforeDataScroll(const Sender: TObject;
      const Dataset: TDataSet; var LoadList: Boolean);
    procedure lsv_LieBrOutBeforeDataScroll(const Sender: TObject;
      const Dataset: TDataSet; var LoadList: Boolean);
    procedure lsv_BrancheInBeforeDataScroll(const Sender: TObject;
      const Dataset: TDataSet; var LoadList: Boolean);
    procedure lsv_BrancheOutBeforeDataScroll(const Sender: TObject;
      const Dataset: TDataSet; var LoadList: Boolean);
    procedure lsv_CompoInBeforeDataScroll(const Sender: TObject;
      const Dataset: TDataSet; var LoadList: Boolean);
    procedure lsv_CompoOutBeforeDataScroll(const Sender: TObject;
      const Dataset: TDataSet; var LoadList: Boolean);
    procedure F_FormDicoShow(Sender: TObject);
    procedure cbx_SelectionGetImage(Sender: TObject; IsEmpty: Boolean;
      var Graphic: TGraphic; var TextMargin: Integer);
    procedure F_FormDicoOnEraseFilter(const Dataset: TDataSet;
      const as_Champ: String);
    procedure F_FormDicoDataSearching(const Dataset: TDataSet;
      const as_Champ: String);

  private
    ls_Article : String ;
    gt_ListeBitmap : array of TBitmap ;
    procedure p_DevalideOngletsBranche;
    procedure p_CreeQueryStructure(const ab_AjouteFiltre: Boolean);
    function fb_ChargeListe(const Sender: Tobject): Boolean;
    procedure p_LibereBitmaps;
        { Déclarations privées }

  public
    { Déclarations publiques }
    procedure p_ApresInsere;
    procedure p_ApresScroll ;
    procedure p_BrSelectApresOpen;
  end;

var
  F_Structure: TF_Structure;

implementation

uses  fonctions_db,
      fonctions_forms,
      fonctions_erreurs,
      u_composant,
      u_selearticle,
      U_Comportement,
      U_TypeProduit,
      U_ComposeArticle, U_DmArticle;
{$IFNDEF FPC}
  {$R *.dfm}
{$ELSE}
  {$R *.lfm}
{$ENDIF}
///////////////////////////////////////////////////////////////////////
// Evènement   : bt_TypeProClick
// Description : Aller sur la fiche Type de produit
// Sender      : Le bouton
///////////////////////////////////////////////////////////////////////
procedure TF_Structure.bt_TypeProClick(Sender: TObject);
begin
  fp_CreateUniqueChild( TF_TypeProduit, fsMDIChild );
end;

///////////////////////////////////////////////////////////////////////
// Procédure   : p_CreeQueryStructure
// Description : Appelé pour filtrer ou tout montrer sur zq_Structure
// Filtre ou non les branches en fonction de la branche sélectionnée
// Paramètre   : ab_AjouteFiltre : Filtrer ou non le dataset zq_Structure
///////////////////////////////////////////////////////////////////////
procedure TF_Structure.p_CreeQueryStructure ( const ab_AjouteFiltre : Boolean );
var lvar_Enregistre : Variant ;
begin
  try
    M_DmCompose.zq_Structure.Close ;
    M_DmCompose.zq_Structure.SQL.BeginUpdate ;
    M_DmCompose.zq_Structure.SQL.Clear ;
    M_DmCompose.zq_Structure.SQL.Add ( 'SELECT * FROM STRUCTURE' );
    if ab_AjouteFiltre
    and ( ls_Article <> '' ) Then
      Begin
        M_DmCompose.zq_Structure.SQL.Add ( 'WHERE STRU_Clep IN ( SELECT ARDE_Table_clep FROM  fn_mc_arbre_article_compose ( ''' + fs_stringDbQuote ( ls_Article ) + ''', 0) WHERE ARDE_Table = ''STRUCTURE_LIEE'' OR ARDE_Table = ''ARTICLE_STRUCTURE'')' );
        M_DmCompose.zq_Structure.SQL.Add ( 'OR STRU_Type IS NULL' );
        M_DmCompose.zq_Structure.SQL.Add ( 'OR ( STRU_Type = 2 AND ( STRU_Clep NOT IN ( select STLI__Enfant from STRUCTURE_LIEE ) OR STRU_Clep NOT IN ( select STLI__Parent from STRUCTURE_LIEE )))' );
        M_DmCompose.zq_Structure.SQL.Add ( 'OR ( STRU_Type = 1 AND STRU_Clep NOT IN ( select ARST__STRU   from ARTICLE_STRUCTURE ))' );
        M_DmCompose.zq_Structure.SQL.Add ( 'OR ( STRU_Type = 3 AND STRU_Clep NOT IN ( select SCOM__STRU   from STRUCTURE_COMPOSANT ))' );
      End ;
//    M_DmCompose.zq_Structure.Open ;
    M_DmCompose.zq_Structure.SQL.EndUpdate ;
  Except
    on e: exception do
      f_GereException ( e, M_DmCompose.zq_Structure );
  End ;

End ;

///////////////////////////////////////////////////////////////////////
// Procédure   : p_ApresInsere
// Description : Appelé après l'insertion sur le Dataset zq_Structure
///////////////////////////////////////////////////////////////////////
procedure TF_Structure.p_ApresInsere;
begin
  p_DevalideOngletsBranche;
End ;
///////////////////////////////////////////////////////////////////////
// Procédure   : p_DevalideOngletsBranche
// Description : Cache tous les onglets s'affichant en fonction du type de la branche
///////////////////////////////////////////////////////////////////////
procedure TF_Structure.p_DevalideOngletsBranche;
begin
  ts_Composant.TabVisible := False ;
  ts_Racine   .TabVisible := False ;
  ts_Structure.TabVisible := False ;
  ts_LienBra  .TabVisible := False ;
  if ( pc_ComposeStru.ActivePage = ts_Racine    )
  or ( pc_ComposeStru.ActivePage = ts_Composant ) Then
    if ts_Comporte.TabVisible Then
      pc_ComposeStru.ActivePage := ts_Comporte
    Else
      pc_ComposeStru.ActivePage := ts_Represente ;
End ;

///////////////////////////////////////////////////////////////////////
// Evènement   : F_FormDicoDataDBSourcescroll
// Description : Montre les bons onglets
// DataSet     : Le Dataset du gd_famillevente.Datasource principal
///////////////////////////////////////////////////////////////////////
procedure TF_Structure.F_FormDicoDataDBSourcescroll(DataSet: TDataSet);
begin
  try
    M_DmCompose.zq_RetrouvArt.Close ;
    M_DmCompose.zq_RetrouvArt.Params.FindParam ( 'STRU_Clep' ).Value := gd_famillevente.Datasource.DataSet.FieldValues [ CST_STRU_Clep ];
    M_DmCompose.zq_RetrouvArt.Open ;
  Except
    on e: Exception do
      f_GereException ( e, M_DmCompose.zq_ArbreArtC );
  End ;

  if not M_DmCompose.zq_RetrouvArt.IsEmpty Then
    try
      ls_Article := M_DmCompose.zq_RetrouvArt.Fields [ 0 ].Value ;
      M_DmCompose.zq_ArbreArtC.Close ;
      M_DmCompose.zq_ArbreArtC.Params.FindParam ( 'ArticleC' ).Value := ls_Article ;
      M_DmCompose.zq_ArbreArtC.Open ;
      vt_Composition.Expanded [ vt_Composition.GetFirst ] := True ;
      bt_Simule.Enabled := True ;
    Except
      on e: Exception do
        f_GereException ( e, M_DmCompose.zq_ArbreArtC );
    End
  Else
    Begin
      bt_Simule.Enabled := False ;
      M_DmCompose.zq_ArbreArtC.Close ;
      ls_Article := '' ;
    End ;
  try
//    ch_Structure.Enabled := M_DmCompose.zq_ArbreArtC.Active and not M_DmCompose.zq_ArbreArtC.IsEmpty ;
    if not ch_Structure.Enabled
    and ch_Structure.Checked
    and ( gd_famillevente.Datasource.DataSet.State <> dsInsert ) Then
      Begin
        p_CreeQueryStructure ( False );
        ch_Structure.Checked := False ;
      End ;

  Except
    bt_Simule.Enabled := False ;
    if not ch_Structure.Checked Then
      ch_Structure.Enabled := False ;
  End ;
  if Dataset.FieldByName ( CST_STRU_Selectionne ).IsNull
  or (( Dataset.FieldByName ( CST_STRU_Selectionne ).AsInteger >= 9 ) and ( Dataset.FieldByName ( CST_STRU_Selectionne ).AsInteger <= 10 ))
  or  (( Dataset.FieldByName ( CST_STRU_Selectionne ).AsInteger >= 20 ) and ( Dataset.FieldByName ( CST_STRU_Selectionne ).AsInteger <= 21 )) Then
    Begin
      if ( pc_ComposeStru.ActivePage = ts_Comporte  ) Then
//      or ( pc_ComposeStru.ActivePage = ts_Selection ) Then
        pc_ComposeStru.ActivePage := ts_Represente ;
      ts_Comporte .TabVisible := False ;
//      ts_Selection.TabVisible := False ;
    End
  Else
    Begin
      ts_Comporte .TabVisible := True ;
      ts_Selection.TabVisible := True ;
    End ;

  If Dataset.FieldByName ( CST_STRU_Type ).IsNull Then
    Begin
      p_DevalideOngletsBranche;
      Exit ;
    End ;
end;

///////////////////////////////////////////////////////////////////////
// FONCTION    : fb_ChargeListe
// Description : Autorisation de chargement des listes en fonction de la visibilité des onglets
// Sender      : Une liste à vérifier
// Sortie      : Autorisation de chargement
///////////////////////////////////////////////////////////////////////
function TF_Structure.fb_ChargeListe ( const Sender : Tobject ): Boolean ;
var li_TypeStru : Integer ;
Begin
  Result := True ;
  // récupération du type de branche
  li_TypeStru := gd_famillevente.Datasource.Dataset.FieldByName ( CST_STRU_Type ).AsInteger ;
  case li_TypeStru of
    1 : Begin
          // branche racine
          if ( Sender = lsv_LieBrIn )
          or ( Sender = lsv_LieBrOut )
          or ( Sender = lsv_CompoIn )
          or ( Sender = lsv_CompoOut ) Then
            Result := False ;
          ts_Structure.TabVisible := True ;
          ts_Racine.TabVisible := True ;
          if ( pc_ComposeStru.ActivePage = ts_Composant )Then
            pc_ComposeStru.ActivePage := ts_Structure ;
          if ( pc_ComposeStru.ActivePage = ts_LienBra   ) Then
            pc_ComposeStru.ActivePage := ts_Racine ;
        End ;
    2 : Begin
          // branche intermédiaire
          if ( Sender = lsv_ArticleIn )
          or ( Sender = lsv_ArticleOut )
          or ( Sender = lsv_CompoIn )
          or ( Sender = lsv_CompoOut ) Then
            Result := False ;
          ts_Structure.TabVisible := True ;
          ts_LienBra  .TabVisible := True ;
          if ( pc_ComposeStru.ActivePage = ts_Racine ) Then
            pc_ComposeStru.ActivePage := ts_LienBra ;
          if ( pc_ComposeStru.ActivePage = ts_Composant )Then
            pc_ComposeStru.ActivePage := ts_Structure ;
        End ;
    3 : Begin
          // branche composant
          if ( Sender = lsv_ArticleIn )
          or ( Sender = lsv_ArticleOut )
          or ( Sender = lsv_BrancheIn )
          or ( Sender = lsv_BrancheOut ) Then
            Result := False ;
          ts_LienBra  .TabVisible := True ;
          ts_Composant.TabVisible := True ;
          if ( pc_ComposeStru.ActivePage = ts_Racine ) Then
            pc_ComposeStru.ActivePage := ts_LienBra ;
          if ( pc_ComposeStru.ActivePage = ts_Structure ) Then
            pc_ComposeStru.ActivePage := ts_Composant ;
        End ;
  End ;
end;


///////////////////////////////////////////////////////////////////////
// Evènement   : bt_ArticleClick
// Description : Aller sur la fiche article
// Sender      : Le bouton
///////////////////////////////////////////////////////////////////////
procedure TF_Structure.bt_ArticleClick(Sender: TObject);
begin
  fp_CreateUniqueChild ( TF_SeleArticle, fsMDIChild );
  if ( ls_Article <> '' )
  and M_Article.ds_article.DataSet.Active Then
    M_Article.ds_article.DataSet.Locate ( 'ARTI_Clep', ls_Article, [] );

end;

///////////////////////////////////////////////////////////////////////
// Evènement   : bt_ComposClick
// Description : Aller sur la fiche composant
// Sender      : Le bouton
///////////////////////////////////////////////////////////////////////
procedure TF_Structure.bt_ComposClick(Sender: TObject);
begin
  fp_CreateUniqueChild ( TF_composant, fsMDIChild );
  if ( lsv_CompoIn.Items.Count > 0 )
  and M_DmCompose.zq_composant.Active Then
    if assigned ( lsv_CompoIn.Selected ) Then
      M_DmCompose.zq_composant.Locate ( 'COMP_Clep', lsv_CompoIn.Selected.Caption, [] )
    Else
      M_DmCompose.zq_composant.Locate ( 'COMP_Clep', lsv_CompoIn.Items [ 0 ].Caption, [] );

end;

///////////////////////////////////////////////////////////////////////
// Evènement   : bt_ComporteActClick
// Description : Aller sur la fiche comportement
// Sender      : Le bouton
///////////////////////////////////////////////////////////////////////
procedure TF_Structure.bt_ComporteActClick(Sender: TObject);
begin
  fp_CreateUniqueChild ( TF_comportement, fsMDIChild );
  if ( lsv_ComporteIn.Items.Count > 0 )
  and M_DmCompose.zq_Comportem.Active Then
    if assigned ( lsv_ComporteIn.Selected ) Then
      M_DmCompose.zq_Comportem.Locate ( CST_CPTM_Clep, lsv_ComporteIn.Selected.Caption, [] )
    Else
      M_DmCompose.zq_Comportem.Locate ( CST_CPTM_Clep, lsv_ComporteIn.Items [ 0 ].Caption, [] );
  if assigned ( F_Comportement )
  and ( F_Comportement.Visible )
  and F_Comportement.ts_Comporte.TabVisible Then
    F_Comportement.pc_ComposeStru.ActivePage := F_Comportement.ts_Comporte ;

end;

///////////////////////////////////////////////////////////////////////
// Evènement   : bt_ComporteSelClick
// Description : Aller sur la fiche comportement
// Sender      : Le bouton
///////////////////////////////////////////////////////////////////////
procedure TF_Structure.bt_ComporteSelClick(Sender: TObject);
begin
  fp_CreateUniqueChild ( TF_comportement, fsMDIChild );
  if ( lsv_SelectionIn.Items.Count > 0 )
  and M_DmCompose.zq_Comportem.Active Then
    if assigned ( lsv_SelectionIn.Selected ) Then
      M_DmCompose.zq_Comportem.Locate ( CST_CPTM_Clep, lsv_SelectionIn.Selected.Caption, [] )
    Else
      M_DmCompose.zq_Comportem.Locate ( CST_CPTM_Clep, lsv_SelectionIn.Items [ 0 ].Caption, [] );
  if assigned ( F_Comportement )
  and ( F_Comportement.Visible )
  and F_Comportement.ts_Selection.TabVisible Then
    F_Comportement.pc_ComposeStru.ActivePage := F_Comportement.ts_Selection ;
end;

///////////////////////////////////////////////////////////////////////
// Evènement   : F_FormDicoCreate
// Description : Initialisation des variables
// Sender      : La fiche
///////////////////////////////////////////////////////////////////////
procedure TF_Structure.F_FormDicoCreate(Sender: TObject);
begin
  F_Structure := Self ;
  ls_Article  := '' ;
  ts_Composant.TabVisible := False ;
  ts_LienBra  .TabVisible := False ;
  ts_Racine   .TabVisible := False ;
  ts_Structure.TabVisible := False ;
  lsv_ArticleOut  .Datasource.DataSet.Filtered := False ;
  lsv_LieBrOut    .Datasource.DataSet.Filtered := False ;
  lsv_BrancheOut  .Datasource.DataSet.Filtered := False ;
  lsv_CompoOut    .Datasource.DataSet.Filtered := False ;
  lsv_ComporteOut .Datasource.DataSet.Filtered := False ;
  lsv_SelectionOut.Datasource.DataSet.Filtered := False ;


end;

///////////////////////////////////////////////////////////////////////
// Evènement   : F_FormDicoDestroy
// Description : Destruction de la fiche
// Sender      : La fiche
///////////////////////////////////////////////////////////////////////
procedure TF_Structure.F_FormDicoDestroy(Sender: TObject);
begin
  ts_Composant.TabVisible := True ;
  ts_Racine   .TabVisible := True ;
  ts_LienBra  .TabVisible := True ;
  ts_Structure.TabVisible := True ;
  p_LibereBitmaps;
  F_Structure := nil ;
end;

///////////////////////////////////////////////////////////////////////
// Evènement   : bt_SimuleClick
// Description : Simulation de la structure de l'article et de son comportement
// Sender      : Le bouton
///////////////////////////////////////////////////////////////////////
procedure TF_Structure.bt_SimuleClick(Sender: TObject);
begin
  if assigned ( F_ComposeArticle ) Then
    F_ComposeArticle.Free ;
  fp_CreateUniqueChild ( TF_ComposeArticle, fsMDIChild );
  if Assigned ( F_ComposeArticle ) Then
    Begin
      F_ComposeArticle.gb_Simule := True ;
      M_DmCompose.zq_ArbreArt.Close ;
      M_DmCompose.zq_ArbreArt.Params.FindParam ( 'ArticleC' ).Value := ls_Article ;
      M_DmCompose.zq_ArbreArt.Open ;
    End ;
  F_ComposeArticle.ShowModal ;

end;

///////////////////////////////////////////////////////////////////////
// Evènement   : pc_ComposeStruChanging
// Description : Validation sur changement d'onglet
// Sender      : La fiche
// AllowChange : Annulation du changement d'onglet
///////////////////////////////////////////////////////////////////////
procedure TF_Structure.pc_ComposeStruChanging(Sender: TObject;
  var AllowChange: Boolean);
begin
  if  ( pc_ComposeStru.ActivePage = ts_Structure )
  and ( bt_enrbranche.Enabled ) Then
    try
      bt_enrbranche  .OnClick ( bt_enrbranche   );
    Except
      on e: Exception do
        Begin
          f_GereException ( e, gd_famillevente.Datasource.DataSet );
          AllowChange := False ;
        End ;
    End;
  if  ( pc_ComposeStru.ActivePage = ts_LienBra )
  and ( bt_EnrLieBr.Enabled ) Then
    try
       bt_EnrLieBr  .OnClick ( bt_EnrLieBr   );
    Except
      on e: Exception do
        Begin
          f_GereException ( e, gd_famillevente.Datasource.DataSet );
          AllowChange := False ;
        End ;
    End;
  if  ( pc_ComposeStru.ActivePage = ts_Composant )
  and ( bt_EnrComp.Enabled ) Then
    try
       bt_EnrComp    .OnClick ( bt_EnrComp     );
    Except
      on e: Exception do
        Begin
          f_GereException ( e, gd_famillevente.Datasource.DataSet );
          AllowChange := False ;
        End ;
    End;
  if  ( pc_ComposeStru.ActivePage = ts_Comporte )
  and ( bt_EnrComporte.Enabled ) Then
    try
       bt_EnrComporte  .OnClick ( bt_EnrComporte   );
    Except
      on e: Exception do
        Begin
          f_GereException ( e, gd_famillevente.Datasource.DataSet );
          AllowChange := False ;
        End ;
    End;
  if  ( pc_ComposeStru.ActivePage = ts_Racine )
  and ( bt_EnrArticle.Enabled ) Then
    try
       bt_EnrArticle  .OnClick ( bt_EnrSelection  );
    Except
      on e: Exception do
        Begin
          f_GereException ( e, gd_famillevente.Datasource.DataSet );
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
          f_GereException ( e, gd_famillevente.Datasource.DataSet );
          AllowChange := False ;
        End ;
    End;
End ;

///////////////////////////////////////////////////////////////////////
// Evènement   : vt_CompositionExpanded
// Description : Ouverture des noeuds enfants d'un noeud
// Sender      : Le composant virtualtree
// Node        : Le noeud ouvert
///////////////////////////////////////////////////////////////////////

procedure TF_Structure.vt_CompositionExpanded(Sender: TBaseVirtualTree;
  Node: PVirtualNode);
var
  ldbn_DBData: PDBNodeData;
  lnod_Enfant : PVirtualNode ;
  ls_Type : String ;

begin
  if assigned ( Node.FirstChild ) Then
    Begin
      lnod_Enfant := Node.FirstChild ;
      while assigned ( lnod_Enfant ) do
        Begin
          if assigned ( lnod_Enfant.FirstChild ) Then
            Begin
              ldbn_DBData := vt_Composition.GetDBNodeData ( lnod_Enfant.FirstChild );
              ls_Type := ldbn_DBData.DBData [ VarArrayHighBound ( ldbn_DBData.DBData, 1 )];
              if ls_Type <> 'STRUCTURE_COMPOSANT'  Then
                vt_Composition.Expanded [ lnod_Enfant ] := True ;
            End ;
          lnod_Enfant := lnod_Enfant.NextSibling ;
        End ;
    End ;
end;

///////////////////////////////////////////////////////////////////////
// Procédure   : ch_StructureClick
// Description : Filtre ou non les branches en fonction de la branche sélectionnée
// Sender      : La checkbox
///////////////////////////////////////////////////////////////////////
procedure TF_Structure.ch_StructureClick(Sender: TObject);
begin
  p_CreeQueryStructure ( ch_Structure.Checked );
end;

///////////////////////////////////////////////////////////////////////
// Evènement   : lsv_ArticleInDBOnRecorded
// Description : Rafraîchissement après la validation
// DataSet     : le dataset du groupement
///////////////////////////////////////////////////////////////////////
procedure TF_Structure.lsv_ArticleInDBOnRecorded(DataSet: TDataSet);
begin
   F_FormDicoDataDBSourcescroll ( gd_famillevente.Datasource.DataSet );
end;

///////////////////////////////////////////////////////////////////////
// Evènement   : lsv_LieBrInDBOnRecorded
// Description : Rafraîchissement après la validation
// DataSet     : le dataset du groupement
///////////////////////////////////////////////////////////////////////
procedure TF_Structure.lsv_LieBrInDBOnRecorded(DataSet: TDataSet);
begin
   F_FormDicoDataDBSourcescroll ( gd_famillevente.Datasource.DataSet );

end;

///////////////////////////////////////////////////////////////////////
// Evènement   : lsv_BrancheInDBOnRecorded
// Description : Rafraîchissement après la validation
// DataSet     : le dataset du groupement
///////////////////////////////////////////////////////////////////////
procedure TF_Structure.lsv_BrancheInDBOnRecorded(DataSet: TDataSet);
begin
   F_FormDicoDataDBSourcescroll ( gd_famillevente.Datasource.DataSet );

end;

///////////////////////////////////////////////////////////////////////
// Evènement   : lsv_CompoInDBOnRecorded
// Description : Rafraîchissement après la validation
// DataSet     : le dataset du groupement
///////////////////////////////////////////////////////////////////////
procedure TF_Structure.lsv_CompoInDBOnRecorded(DataSet: TDataSet);
begin
   F_FormDicoDataDBSourcescroll ( gd_famillevente.Datasource.DataSet );

end;

///////////////////////////////////////////////////////////////////////
// Evènement   : vt_CompositionDblClick
// Description : Sur double click on change de branche
// Sender      : la description
///////////////////////////////////////////////////////////////////////
procedure TF_Structure.vt_CompositionDblClick(Sender: TObject);
begin
  if  (    ( M_DmCompose.ds_ArbreArtC.DataSet.FieldByName ( 'ARDE_Table' ).AsString = 'STRUCTURE_LIEE' )
        or ( M_DmCompose.ds_ArbreArtC.DataSet.FieldByName ( 'ARDE_Table' ).AsString = 'ARTICLE_STRUCTURE' ))
  and ( gd_famillevente.Datasource.DataSet.State = dsBrowse ) Then
    gd_famillevente.Datasource.DataSet.Locate ( 'STRU_Clep', M_DmCompose.ds_ArbreArtC.DataSet.FieldByName ( 'ARDE_Table_clep' ).Value, [] );
end;

///////////////////////////////////////////////////////////////////////
// Evènement   : ed_FiltreArticlesKeyUp
// Description : Filtrage ou pas des articles
// Sender      : Le Edit
// Key         : la touche
// Shift       : L'état shift
///////////////////////////////////////////////////////////////////////
procedure TF_Structure.ed_FiltreArticlesKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if ed_FiltreArticles.Text = '' Then
    lsv_ArticleOut.Datasource.DataSet.Filtered := False
  Else
    Begin
//      lsv_ArticleOut.Datasource.DataSet.Filter := lsv_ArticleOut.gd_famillevente.KeyUnit + ' LIKE ''' + fs_stringDbQuoteFilter ( ed_FiltreArticles.Text ) + '%''' ;
      lsv_ArticleOut.Datasource.DataSet.Filtered := True ;
    End ;
  lsv_ArticleOut.Refresh ;

end;

///////////////////////////////////////////////////////////////////////
// Evènement   : ed_FiltreCompKeyUp
// Description : Filtrage ou pas des COMPOSANTS
// Sender      : Le Edit
// Key         : la touche
// Shift       : L'état shift
///////////////////////////////////////////////////////////////////////
procedure TF_Structure.ed_FiltreCompKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if ed_FiltreComp.Text = '' Then
    lsv_CompoOut.Datasource.DataSet.Filtered := False
  Else
    Begin
//      lsv_CompoOut.Datasource.DataSet.Filter := lsv_CompoOut.gd_famillevente.KeyUnit + ' LIKE ''' + fs_stringDbQuoteFilter ( ed_FiltreComp.Text ) + '%''' ;
      lsv_CompoOut.Datasource.DataSet.Filtered := True ;
    End ;
  lsv_CompoOut.Refresh ;

end;

///////////////////////////////////////////////////////////////////////
// Evènement   : ed_FiltreActionKeyUp
// Description : Filtrage ou pas des Comportements d'action
// Sender      : Le Edit
// Key         : la touche
// Shift       : L'état shift
///////////////////////////////////////////////////////////////////////
procedure TF_Structure.ed_FiltreActionKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if ed_FiltreAction.Text = '' Then
    lsv_ComporteOut.Datasource.DataSet.Filtered := False
  Else
    Begin
//      lsv_ComporteOut.Datasource.DataSet.Filter := lsv_ComporteOut.gd_famillevente.KeyUnit + ' LIKE ''' + fs_stringDbQuoteFilter ( ed_FiltreAction.Text ) + '%''' ;
      lsv_ComporteOut.Datasource.DataSet.Filtered := True ;
    End ;
  lsv_ComporteOut.Refresh ;

end;

///////////////////////////////////////////////////////////////////////
// Evènement   : ed_FiltreSelectKeyUp
// Description : Filtrage ou pas des Comportements de sélection
// Sender      : Le Edit
// Key         : la touche
// Shift       : L'état shift
///////////////////////////////////////////////////////////////////////
procedure TF_Structure.ed_FiltreSelectKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if ed_FiltreSelect.Text = '' Then
    lsv_SelectionOut.Datasource.DataSet.Filtered := False
  Else
    Begin
//      lsv_SelectionOut.Datasource.DataSet.Filter := lsv_SelectionOut.gd_famillevente.KeyUnit + ' LIKE ''' + fs_stringDbQuoteFilter ( ed_FiltreSelect.Text ) + '%''' ;
      lsv_SelectionOut.Datasource.DataSet.Filtered := True ;
    End ;
  lsv_SelectionOut.Refresh ;

end;

///////////////////////////////////////////////////////////////////////
// Evènement   : ed_FiltreLieBrKeyUp
// Description : Liaisons avec les branches parentes
// Sender      : Le Edit
// Key         : la touche
// Shift       : L'état shift
///////////////////////////////////////////////////////////////////////
procedure TF_Structure.ed_FiltreLieBrKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if ed_FiltreLieBr.Text = '' Then
    lsv_LieBrOut.Datasource.DataSet.Filtered := False
  Else
    Begin
//      lsv_LieBrOut.Datasource.DataSet.Filter := lsv_LieBrOut.gd_famillevente.KeyUnit + ' LIKE ''' + fs_stringDbQuoteFilter ( ed_FiltreLieBr.Text ) + '%''' ;
      lsv_LieBrOut.Datasource.DataSet.Filtered := True ;
    End ;
  lsv_LieBrOut.Refresh ;

end;

///////////////////////////////////////////////////////////////////////
// Evènement   : ed_FiltreBrKeyUp
// Description : Liaisons avec les branches enfant
// Sender      : Le Edit
// Key         : la touche
// Shift       : L'état shift
///////////////////////////////////////////////////////////////////////
procedure TF_Structure.ed_FiltreBrKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if ed_FiltreBr.Text = '' Then
    lsv_BrancheOut.Datasource.DataSet.Filtered := False
  Else
    Begin
//      lsv_BrancheOut.Datasource.DataSet.Filter := lsv_BrancheOut.gd_famillevente.KeyUnit + ' LIKE ''' + fs_stringDbQuoteFilter ( ed_FiltreBr.Text ) + '%''' ;
      lsv_BrancheOut.Datasource.DataSet.Filtered := True ;
    End ;
  lsv_BrancheOut.Refresh ;

end;

///////////////////////////////////////////////////////////////////////
// Evènement   : lsv_ArticleInBeforeDataScroll
// Description : Vérification du chargement de la liste ou pas avant le scroll
// Sender      : La liste des articles inclus
// Dataset     : le dataset scrollé
// LoadList    : Validation du chargement ou annulation
///////////////////////////////////////////////////////////////////////
procedure TF_Structure.lsv_ArticleInBeforeDataScroll(const Sender: TObject;
  const Dataset: TDataSet; var LoadList: Boolean);
begin
  Loadlist := fb_ChargeListe ( Sender );
end;

///////////////////////////////////////////////////////////////////////
// Evènement   : lsv_ArticleOutBeforeDataScroll
// Description : Vérification du chargement de la liste ou pas avant le scroll
// Sender      : La liste des articles exclus
// Dataset     : le dataset scrollé
// LoadList    : Validation du chargement ou annulation
///////////////////////////////////////////////////////////////////////
procedure TF_Structure.lsv_ArticleOutBeforeDataScroll(const Sender: TObject;
  const Dataset: TDataSet; var LoadList: Boolean);
begin
  Loadlist := fb_ChargeListe ( Sender );

end;

///////////////////////////////////////////////////////////////////////
// Evènement   : lsv_LieBrInBeforeDataScroll
// Description : Vérification du chargement de la liste ou pas avant le scroll
// Sender      : La liste des branches parentes incluses
// Dataset     : le dataset scrollé
// LoadList    : Validation du chargement ou annulation
///////////////////////////////////////////////////////////////////////
procedure TF_Structure.lsv_LieBrInBeforeDataScroll(const Sender: TObject;
  const Dataset: TDataSet; var LoadList: Boolean);
begin
  Loadlist := fb_ChargeListe ( Sender );

end;

///////////////////////////////////////////////////////////////////////
// Evènement   : lsv_LieBrOutBeforeDataScroll
// Description : Vérification du chargement de la liste ou pas avant le scroll
// Sender      : La liste des branches parentes exclues
// Dataset     : le dataset scrollé
// LoadList    : Validation du chargement ou annulation
///////////////////////////////////////////////////////////////////////
procedure TF_Structure.lsv_LieBrOutBeforeDataScroll(const Sender: TObject;
  const Dataset: TDataSet; var LoadList: Boolean);
begin
  Loadlist := fb_ChargeListe ( Sender );

end;

///////////////////////////////////////////////////////////////////////
// Evènement   : lsv_BrancheInBeforeDataScroll
// Description : Vérification du chargement de la liste ou pas avant le scroll
// Sender      : La liste des branches enfants incluses
// Dataset     : le dataset scrollé
// LoadList    : Validation du chargement ou annulation
///////////////////////////////////////////////////////////////////////
procedure TF_Structure.lsv_BrancheInBeforeDataScroll(const Sender: TObject;
  const Dataset: TDataSet; var LoadList: Boolean);
begin
  Loadlist := fb_ChargeListe ( Sender );

end;

///////////////////////////////////////////////////////////////////////
// Evènement   : lsv_BrancheOutBeforeDataScroll
// Description : Vérification du chargement de la liste ou pas avant le scroll
// Sender      : La liste des branches enfants exclues
// Dataset     : le dataset scrollé
// LoadList    : Validation du chargement ou annulation
///////////////////////////////////////////////////////////////////////
procedure TF_Structure.lsv_BrancheOutBeforeDataScroll(const Sender: TObject;
  const Dataset: TDataSet; var LoadList: Boolean);
begin
  Loadlist := fb_ChargeListe ( Sender );

end;

///////////////////////////////////////////////////////////////////////
// Evènement   : lsv_CompoInBeforeDataScroll
// Description : Vérification du chargement de la liste ou pas avant le scroll
// Sender      : La liste des composants inclus
// Dataset     : le dataset scrollé
// LoadList    : Validation du chargement ou annulation
///////////////////////////////////////////////////////////////////////
procedure TF_Structure.lsv_CompoInBeforeDataScroll(const Sender: TObject;
  const Dataset: TDataSet; var LoadList: Boolean);
begin
  Loadlist := fb_ChargeListe ( Sender );

end;

///////////////////////////////////////////////////////////////////////
// Evènement   : lsv_CompoOutBeforeDataScroll
// Description : Vérification du chargement de la liste ou pas avant le scroll
// Sender      : La liste des composants exclus
// Dataset     : le dataset scrollé
// LoadList    : Validation du chargement ou annulation
///////////////////////////////////////////////////////////////////////
procedure TF_Structure.lsv_CompoOutBeforeDataScroll(const Sender: TObject;
  const Dataset: TDataSet; var LoadList: Boolean);
begin
  Loadlist := fb_ChargeListe ( Sender );

end;

////////////////////////////////////////////////////////////////////////////////
// Evènement : F_FormDicoShow
// Description : Ouverture des dataset
// Sender : La fiche
////////////////////////////////////////////////////////////////////////////////
procedure TF_Structure.F_FormDicoShow(Sender: TObject);
begin
  M_DmCompose.zq_BrSelect.Open ;
  M_DmCompose.zq_BrType  .Open ;
  fb_ChargeListe ( Self );
end;

procedure TF_Structure.p_LibereBitmaps;
var li_Code  : Integer ;
begin
  for li_Code := 0 to high ( gt_ListeBitmap ) Do
    if assigned ( gt_ListeBitmap [ li_Code ] ) Then
      Begin
        {$IFNDEF FPC}
        gt_ListeBitmap [ li_Code ].Dormant ;
        {$ENDIF}
        gt_ListeBitmap [ li_Code ].FreeImage ;
        gt_ListeBitmap [ li_Code ].Free ;
        gt_ListeBitmap [ li_Code ] := nil ;
      End ;
End ;

////////////////////////////////////////////////////////////////////////////////
// Procédure : p_BrSelectApresOpen
// Description : Sur Ouverture du dataset de la liste de la combo à images affectation des images
////////////////////////////////////////////////////////////////////////////////
procedure TF_Structure.p_BrSelectApresOpen;
var li_Code  : Integer ;
begin
  if not M_DmCompose.zq_BrSelect.Active Then
    Exit ;
  p_LibereBitmaps;
  // Il faut définir le nombre de bitmaps à affecter à la liste
  SetLength ( gt_ListeBitmap, CST_BRANCHE_MAX_CLE + 1 );
  // Initialisation
  for li_Code := 0 to high ( gt_ListeBitmap ) Do
    gt_ListeBitmap [ li_Code ] := nil ;
  // Si rien on quitte
  if M_DmCompose.zq_BrSelect.IsEmpty Then
    Exit ;
  M_DmCompose.zq_BrSelect.First ;
  while not M_DmCompose.zq_BrSelect.eof do
    Begin
      li_Code := M_DmCompose.zq_BrSelect.FieldByName ( 'CHAR_Clep' ).AsInteger ;
      if li_Code > high ( gt_ListeBitmap ) Then
        Exit ;
      gt_ListeBitmap [ li_Code ] := TBitmap.Create ;

      // Affectattion en fonction de la position de l'enregistrement
      case li_Code of
        0,7,11,18 : im_images.GetBitmap (5, gt_ListeBitmap [ li_Code ] );
        1,8,12,19 : im_images.GetBitmap (7, gt_ListeBitmap [ li_Code ] );
        2,13 : im_images.GetBitmap (6, gt_ListeBitmap [ li_Code ] );
        3,14 : im_images.GetBitmap (3, gt_ListeBitmap [ li_Code ] );
        4,15 : im_images.GetBitmap (4, gt_ListeBitmap [ li_Code ] );
        5,6,16,17 : im_images.GetBitmap (2, gt_ListeBitmap [ li_Code ] );
      End ;
      // Essais sur la transparence
      gt_ListeBitmap [ li_Code ].TransparentMode := tmAuto ;
      gt_ListeBitmap [ li_Code ].TransparentColor := clDefault ;
      gt_ListeBitmap [ li_Code ].Transparent := True ;
      M_DmCompose.zq_BrSelect.Next ;
  End ;
end;

////////////////////////////////////////////////////////////////////////////////
// Evènement : cbx_SelectionGetImage
// Description : Affecte la bonne image à la combo
// Sender : La combo box
// Isempty : Combo vide
// Graphic : Image à affecter
// TextMargin : Marge du texte en fonction de l'image
////////////////////////////////////////////////////////////////////////////////
procedure TF_Structure.cbx_SelectionGetImage(Sender: TObject;
  IsEmpty: Boolean; var Graphic: TGraphic; var TextMargin: Integer);
//var lbmp_Bitmap TBitmap ;
var li_Code  : Integer ;
begin
  if not M_DmCompose.zq_BrSelect.Active
  or M_DmCompose.zq_BrSelect.IsEmpty Then
    Exit ;
  li_Code := M_DmCompose.zq_BrSelect.FieldByName ( 'CHAR_Clep' ).AsInteger ;
  if li_Code <= high ( gt_ListeBitmap ) Then
    Graphic := gt_ListeBitmap [ li_Code ];
  TextMargin := 18 ;
end;

////////////////////////////////////////////////////////////////////////////////
// Procédure : p_ApresScroll
// Description : enlève les onglets des branches en fonction du type de branche
////////////////////////////////////////////////////////////////////////////////
procedure TF_Structure.p_ApresScroll;
begin
  // récupération du type de branche
  case gd_famillevente.Datasource.Dataset.FieldByName ( CST_STRU_Type ).AsInteger of
    1 : Begin
        //  branche racine
          ts_Composant.TabVisible := False ;
          ts_LienBra  .TabVisible := False ;
        End ;
    2 : Begin
        //  branche intermédiaire
          ts_Composant.TabVisible := False ;
          ts_Racine   .TabVisible := False ;
        End ;
    3 : Begin
        //  branche composant
          ts_Racine   .TabVisible := False ;
          ts_Structure.TabVisible := False ;
        End ;
  End ;

end;

procedure TF_Structure.F_FormDicoOnEraseFilter(const Dataset: TDataSet;
  const as_Champ: String);
begin
  ts_Represente.Enabled := True ;

end;

procedure TF_Structure.F_FormDicoDataSearching(const Dataset: TDataSet;
  const as_Champ: String);
begin
  ts_Represente.Enabled := False ;

end;

end.

