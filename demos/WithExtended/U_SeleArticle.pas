///////////////////////////////////////////////////////////////////////
// Nom Unite: U_SeleArticle
// Description : Gestion des articles
// Cr?? par Microcelt
// Modifi? le 09/05/05 : ajout de l'onglet "Composition" pour avoir une vision
//     de la omposition de l'article quand celui-ci a la case "A composer" est coch?e
// 26/05/05 : - En tant qu'assistante, la creation d'articles speciaux est possible
//     et suppression d'article impossible et uniquement la modif des speciaux
//    - boutons tout deplacement de l'onglet 'Declassement des articles" non visible
//    - ajout du bouton Copie
// Ne pas renseigner les ?v?nements AfterScroll non dico ? cause du mode asynchrone
///////////////////////////////////////////////////////////////////////
unit U_SeleArticle;

{$IFDEF FPC}
  {$MODE Delphi}
{$ENDIF}

interface

uses
{$IFNDEF FPC}
  RXSplit, UltimDBGrid, RbSplitter, JvEdit, JvRadioButton, AdvListV, JvExStdCtrls, Mask,
{$ELSE}
  MaskEdit,
{$ENDIF}
  LCLType, Messages, Graphics, Controls, Classes, ExtCtrls,
  Dialogs, DB, IBQuery,IBTable,IBUpdateSQL,
  U_ExtDBNavigator, Buttons, Forms, DBCtrls, Grids,
  DBGrids, u_framework_dbcomponents, ComCtrls, StdCtrls, SysUtils,
  TypInfo, Variants, StrUtils, ToolEdit, U_OnFormInfoIni,
  JvXPButtons,U_FormMainIni,u_framework_components,
  u_buttons_appli, U_FormAdapt,
  U_ExtDBGrid,U_ConstMessage, VirtualTrees, ImgList, VirtualDBTreeEx,
  U_GroupView, fonctions_dbcomponents;

const
  CST_ARTI_Compose = 'ARTI_Compose' ;

  CST_ARFI_Choixfinit = 'ARFI_Choixfinit' ;
  CST_ARFI__TYFI      = 'ARFI__TYFI' ;
  CST_ARFI__FINI      = 'ARFI__FINI' ;
  CST_ARTI_Date        = 'ARTI_Datecrea';
  CST_ARTI_Clep        = 'ARTI_Clep';


type
  TF_SeleArticle = class(TF_FormAdapt)
    nv_navigator: TExtDBNavigator;
    pa_1: TPanel;
    pa_2: TPanel;
    pa_4: TPanel;
    SvgFormInfoIni: TOnFormInfoIni;
    Rb_1: TSplitter;
    gd_article: TExtDBGrid;
    pa_3: TPanel;
    pc_art: TPageControl;
    ts_libelle: TTabSheet;
    tb_chiffre: TTabSheet;
    lb_cubage: TFWLabel;
    lb_poids: TFWLabel;
    ed_cubage: TFWDBEdit;
    ed_coefpoids: TFWDBEdit;
    gbx_prix: TGroupBox;
    lb_pxactu: TFWLabel;
    lb_pxfutur: TFWLabel;
    ed_pxactu: TFWDBEdit;
    ed_pxfutur: TFWDBEdit;
    ts_finition: TTabSheet;
    RbSplitter1: TSplitter;
    Panel3: TPanel;
    Panel4: TPanel;
    nv_navfinition: TExtDBNavigator;
    gd_artcoul: TExtDBGrid;
    ts_Criteres: TTabSheet;
    Panel1: TPanel;
    Panel2: TPanel;
    Panel13: TPanel;
    Panel11: TPanel;
    nv_sele: TExtDBNavigator;
    pa_Saisie: TPanel;
    lb_codearti: TFWLabel;
    lb_codecommarti: TFWLabel;
    lb_datecrea: TFWLabel;
    ed_codearti: TFWDBEdit;
    ed_codecommarti: TFWDBEdit;
    RbSplitter2: TSplitter;
    JvEdit1: TFWEdit;
    JvEdit2: TFWEdit;
    Panel6: TPanel;
    mo_Desdev: TDBMemo;
    lb_Desdev: TFWLabel;
    im_Liste1: TImageList;
    ts_Selection: TTabSheet;
    Panel7: TPanel;
    Panel8: TPanel;
    Panel9: TPanel;
    Panel10: TPanel;
    ed_Total: TFWEdit;
    JvEdit4: TFWEdit;
    DBText1: TDBText;
    chx_acomposer: TDBCheckBox;
    Label14: TFWLabel;
    ts_Compose: TTabSheet;
    Panel12: TPanel;
    lsv_Composein: TDBGroupView;
    Panel14: TPanel;
    bt_in_item: TFWInSelect;
    bt_in_total: TFWInAll;
    bt_out_item: TFWOutSelect;
    bt_out_total: TFWOutAll;
    lsv_BrOut: TDBGroupView;
    Panel15: TPanel;
    Panel16: TPanel;
    Panel17: TPanel;
    Panel18: TPanel;
    Panel19: TPanel;
    bt_abandonner: TFWCancel;
    bt_enregistrer: TFWOK;
    bt_TypePro: TJvXpButton;
    Label18: TFWLabel;
    lb_four: TFWLabel;
    cbx_four: TDBLookupComboBox;
    DBLookupComboBox2: TDBLookupComboBox;
    Label17: TFWLabel;
    Label15: TFWLabel;
    DBLookupComboBox4: TDBLookupComboBox;
    DBLookupComboBox3: TDBLookupComboBox;
    lb_acomposer: TFWLabel;
    ed_Poids: TFWDBEdit;
    Label20: TFWLabel;
    ed_FiltreBranches: TEdit;
    Label6: TFWLabel;
    rg_TypeProduit: TRadioGroup;
    rg_Gamme: TRadioGroup;
    Label3: TFWLabel;
    Label10: TFWLabel;
    rg_Caracteristique: TRadioGroup;
    Label13: TFWLabel;
    cbx_Caracteristique: TDBLookupComboBox;
    cbx_TypeProduit: TDBLookupComboBox;
    cbx_Gamme: TDBLookupComboBox;
    ed_Mot1Design: TEdit;
    Label2: TFWLabel;
    ed_Mot2Design: TEdit;
    Label4: TFWLabel;
    rg_EtOuMots1et2: TRadioGroup;
    rg_EtOuMots2et3: TRadioGroup;
    ed_Mot3Design: TEdit;
    Label5: TFWLabel;
    ed_AbsentDesign: TEdit;
    Label9: TFWLabel;
    im_images: TImageList;
    RbSplitter3: TSplitter;
    pa_ElFinition: TPanel;
    lb_Coul: TFWLabel;
    lb_coullib: TFWLabel;
    Label1: TFWLabel;
    lb_TypeFinition: TFWLabel;
    nv_saisifini: TExtDBNavigator;
    bt_couleur: TButton;
    ed_coul: TFWDBEdit;
    ed_coullib: TFWDBEdit;
    rg_TypeCoul: TDBRadioGroup;
    cbx_TypeFinition: TDBLookupComboBox;
    ed_LibCoul: TFWDBEdit;
    lb_LibCoul: TFWLabel;
    bt_TypFini: TButton;
    mo_libcom: TDBMemo;
    lb_des: TFWLabel;
    lb_declasse: TFWLabel;
    chx_declasse: TDBCheckBox;
    pa_5: TPanel;
    nv_saisie: TExtDBNavigator;
    Panel5: TPanel;
    Panel20: TPanel;
    bt_apercu: TFWPreview;
    Panel21: TPanel;
    bt_imprimer: TFWPrint;
    Panel22: TPanel;
    Panel23: TPanel;
    bt_fermer: TFWClose;
    ts_declassement: TTabSheet;
    Panel24: TPanel;
    Panel33: TPanel;
    Label7: TFWLabel;
    Panel34: TPanel;
    Panel35: TPanel;
    Panel36: TPanel;
    Panel37: TPanel;
    bt_AbandArticle: TFWCancel;
    bt_EnrArticle: TFWOK;
    ed_FiltreArticles: TEdit;
    RbSplitter4: TSplitter;
    Panel31: TPanel;
    lsv_ArticleIn: TDBGroupView;
    Panel32: TPanel;
    bt_InArticle: TFWInSelect;
    bt_OutArticle: TFWOutSelect;
    lsv_ArticleOut: TDBGroupView;
    bt_inTotDeclasse: TFWInAll;
    bt_outTotDeclasse: TFWOutAll;
    lb_special: TFWLabel;
    chx_special: TDBCheckBox;
    ts_composition: TTabSheet;
    vt_Composition: TCheckVirtualDBTreeEx;
    bt_copieart: TFWCopy;
    procedure F_FormDicoCreate(Sender: TObject);
    procedure bt_fermerClick(Sender: TObject);

    procedure pc_artChange(Sender: TObject);
    procedure pc_artChanging(Sender: TObject; var AllowChange: Boolean);
    procedure gd_articleDblClick(Sender: TObject);
    procedure nv_seleBtnSearch(Sender: TObject);
    procedure F_FormDicoClose(Sender: TObject; var Action: TCloseAction);
    procedure ComboBox1Click(Sender: TObject);
    procedure ed_codeartiClick(Sender: TObject);
    procedure F_FormDicoDestroy(Sender: TObject);
    procedure rg_GammeClick(Sender: TObject);
    procedure rg_TypeProduitClick(Sender: TObject);
    procedure rg_CaracteristiqueClick(Sender: TObject);
    procedure cbx_TypeProduitClick(Sender: TObject);
    procedure cbx_CaracteristiqueClick(Sender: TObject);
    procedure cbx_GammeClick(Sender: TObject);
    procedure rg_EtOuMots1et2Click(Sender: TObject);
    procedure rg_EtOuMots2et3Click(Sender: TObject);
    procedure ed_Mot1DesignEnter(Sender: TObject);
    procedure ed_Mot2DesignEnter(Sender: TObject);
    procedure ed_Mot3DesignEnter(Sender: TObject);
    procedure ed_Mot1DesignExit(Sender: TObject);
    procedure ed_Mot2DesignExit(Sender: TObject);
    procedure ed_Mot3DesignExit(Sender: TObject);
    procedure F_FormDicoDataDBSourcescroll(DataSet: TDataSet);
    procedure F_FormDicoShow(Sender: TObject);
    procedure bt_TypeProClick(Sender: TObject);
    procedure rg_TypeCoulChange(Sender: TObject);
    procedure ed_FiltreBranchesKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure F_FormDicoDataSourceGridScroll(DataSet: TDataSet);
    procedure ed_FiltreArticlesKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure lsv_ArticleInDBOnRecorded(DataSet: TDataSet);
    procedure vt_CompositionBeforeCellPaint(Sender: TBaseVirtualTree;
      TargetCanvas: TCanvas; Node: PVirtualNode; Column: TColumnIndex;
      CellRect: TRect);
    procedure bt_copieartClick(Sender: TObject);
    procedure F_FormDicoOnEraseFilter(const Dataset: TDataSet;
      const as_Champ: String);
    procedure F_FormDicoDataSearching(const Dataset: TDataSet;
      const as_Champ: String);
    procedure F_FormDicoDataOnSort(Dataset: TDataSet; as_Champ,
      as_TypeTri: String);
  private
    { D?clarations priv?es }
    gts_activepage: TTabSheet;
    ls_LabelFinition : WideString ;
    procedure p_Copiearticle(as_newcode : string);
    procedure p_EffaceOrderBy(const adat_MainQuery: TIBQuery);

  public
    { D?clarations publiques }
    procedure p_ApresEdit ;
    procedure p_initInsert;
    procedure p_refreshDeclassement;
//    procedure p_initDBSources[1].Datasource;
  end;

var
  F_SeleArticle: TF_SeleArticle;
  gb_ArticleappeleParDevis : boolean = False ;

implementation
uses U_Structure, fonctions_string,
     U_DmCompose, unite_messages,
     fonctions_forms,
     fonctions_erreurs,fonctions_db,
     U_ComposeArticle,
     U_DmArticle, U_DmDonn;

{$IFNDEF FPC}
  {$R *.dfm}
{$ELSE}
  {$R *.lfm}
{$ENDIF}
procedure TF_SeleArticle.F_FormDicoCreate(Sender: TObject);
begin
  F_SeleArticle := Self;
  {
  p_AffecteEvenementsDatasetPrincipal ( M_Article.zq_Article1 );
  p_AffecteEvenementsDatasetPrincipal ( M_Article.zq_Article2 );
  p_AffecteEvenementsDatasetPrincipal ( M_Article.zq_Article3 );
  p_AffecteEvenementsDatasetPrincipal ( M_Article.zq_Article4 );
  p_AffecteEvenementsDatasetPrincipal ( M_Article.zq_Article5 );
  p_AffecteEvenementsDatasetPrincipal ( M_Article.zq_Article6 );}

  // pour avoir le 1er onglet activ?
//  DBSources[0].Datasource.Dataset.Open ;
  ls_LabelFinition := lb_Coul.Caption ;

//  ct_art.ActivePageIndex := 0;

  gts_activepage := pc_art.ActivePage;
  lsv_ArticleOut.Datasource.DataSet.Filtered := False ;
  lsv_ArticleIn .Datasource.DataSet.Filtered := False ;

////////////////////////////////////////////////////////////////////////////////
 ///////////////////////////////////////////////////////////////////////////////
end;

procedure TF_SeleArticle.bt_fermerClick(Sender: TObject);
begin
  close;
  M_Article.ds_article.DataSet.Filtered := False;
  M_Article.ds_article.DataSet.Filter := '';
end;

procedure TF_SeleArticle.pc_artChange(Sender: TObject);
//var li_Choix : Integer ;
begin
  // Impossible de changer d'onglet quand on est en modif
  if ( pc_art.ActivePage = ts_Selection )
  or ( pc_art.ActivePage = ts_Criteres )
  or ( pc_art.ActivePage = ts_finition )
  or ( pc_art.ActivePage = ts_Compose  ) Then
    try
      if gd_article.Datasource.DataSet.State in [ dsInsert, dsEdit ] Then
        gd_article.Datasource.DataSet.Post ;
    Except
      on e: Exception do
        Begin
          pc_art.ActivePage := gts_activepage ;
          f_GereException( e, gd_article.Datasource.DataSet );
        End ;
    End; 
end;

procedure TF_SeleArticle.pc_artChanging(Sender: TObject;
  var AllowChange: Boolean);
//var li_Choix : Integer ;
begin
  gts_activepage := (Sender as TPageControl).ActivePage;
  if ( gts_activepage = ts_Compose )
  and bt_enregistrer.Enabled Then
    try
      bt_enregistrer.OnClick ( bt_enregistrer  );
    Except
      on e: Exception do
        Begin
          f_GereException ( e, gd_article.Datasource.DataSet );
          AllowChange := False ;
        End ;
    End;
  if  ( gts_activepage = ts_finition )
  and ( gd_artcoul.Datasource.DataSet.State in [ dsInsert, dsEdit ] ) Then
    try
      gd_artcoul.Datasource.DataSet.Post;
    Except
      on e: Exception do
        Begin
          f_GereException ( e, gd_article.Datasource.DataSet );
          AllowChange := False ;
        End ;
    End;
end;

procedure TF_SeleArticle.gd_articleDblClick(Sender: TObject);
begin
  if gd_article.Datasource.DataSet.FieldByName ( 'ARTI_Compose' ).AsBoolean Then
    Begin
      M_DmCompose.zq_BranInArt.Close ;
      M_DmCompose.zq_BranInArt.Params.FindParam ( 'groupe' ).Value := gd_article.Datasource.DataSet.FieldByName ( 'ARTI_Clep' ).Value ;
      M_DmCompose.zq_BranInArt.Open ;
    End ;

  if Self.FormStyle = fsNormal then
    if gd_article.Datasource.DataSet.FieldByName ( 'ARTI_Compose' ).AsBoolean
    and not M_DmCompose.zq_BranInArt.IsEmpty Then
      Begin
        if assigned ( F_ComposeArticle )
        and F_ComposeArticle.Visible Then
          F_ComposeArticle.Close ;
        fp_CreateUniqueChild ( TF_ComposeArticle, fsMDIChild );
        if assigned ( F_ComposeArticle ) Then
          Begin
            M_DmCompose.zq_ArbreArt.Close ;
            M_DmCompose.zq_ArbreArt.Params.FindParam ( 'ArticleC' ).Value := M_Article.ds_article.DataSet.FieldByName ( 'ARTI_Clep' ).Value ;
            M_DmCompose.zq_ArbreArt.Open ;
            F_ComposeArticle.gb_Simule := False ;
            F_ComposeArticle.ShowModal ;
            Self.Close;
          End ;
      End
    Else
      begin
       //  gb_valide     := True;
       //  gs_CodePostal := ed_code.Text;
       //  gs_Ville      := ed_ville.Text;
        Self.Close;
        //Self.Visible := False;
        //F_Devis.Show;
      end;  

end;

procedure TF_SeleArticle.nv_seleBtnSearch(Sender: TObject);
var lvar_CleArticle : Variant ;
    filtre : string;
begin
  if gd_article.Datasource.DataSet.State in [ dsInsert, dsEdit ] Then
    Exit ;
  try
    if gd_article.Datasource.Dataset.IsEmpty Then
      lvar_CleArticle := Null 
    Else
      lvar_CleArticle := gd_article.Datasource.Dataset.FieldByName ( CST_ARTI_Clep ).Value ;
   Except
    on e: Exception do
      f_GereException ( e, M_Article.ds_article.DataSet );
  End ;
// total
  If not (( ed_Mot1Design.Text = '' ) and ( ed_Mot2Design.Text = '' ) and ( ed_Mot3Design.Text = '' ))
  or (( rg_Gamme.ItemIndex > 0 ) or ( rg_TypeProduit.ItemIndex > 0 ) or ( rg_Caracteristique.ItemIndex > 0 )) then
    begin

    M_Article.ds_article.DataSet.Filtered := False;
    M_Article.ds_article.DataSet.Filter := '';
    end
  Else
    Begin                                                    {
      if ( M_Article.ds_article.DataSet as TCUstomADODAtaset ).CursorLocation = clUseClient  Then
        Begin
          M_Article.ds_article.DataSet.Filtered := False;
          M_Article.ds_article.DataSet.Filter := '';
        End
      Else                                                    }
        Begin
          M_Article.ds_article.DataSet.Open ;
        End ;
      JvEdit1 .Text := IntToStr(M_Article.ds_article.DataSet.RecordCount);
      ed_Total.Text := IntToStr(M_Article.ds_article.DataSet.RecordCount);
      try
        if lvar_CleArticle <> Null Then
          gd_article.Datasource.Dataset.Locate ( CST_ARTI_Clep, lvar_CleArticle, [] );
      Except
      End ;
      exit;
    End ;

  // selection
  filtre := '';
  If (ed_Mot1Design.Text = '') and (ed_Mot2Design.Text = '') and (ed_Mot3Design.Text = '') and (ed_AbsentDesign.Text = '')
  and ( rg_Gamme.ItemIndex = 0 )and ( rg_TypeProduit.ItemIndex = 0 )and ( rg_Caracteristique.ItemIndex = 0 ) then
    exit;


  If ed_Mot1Design.Text <> '' then
    begin
      filtre := 'ARTI_Libcom LIKE ' + '''%' + ed_Mot1Design.Text +'%''';
    end;

  if  ( rg_Gamme.ItemIndex = 1 )
  and ( cbx_Gamme.KeyValue <> Null ) Then
    Begin
      if filtre <> '' Then
        filtre := filtre + ' AND ' ;
      filtre := filtre + 'ARTI__GAMM = ' + '''' + cbx_Gamme.KeyValue +'''';
    End ;

  if  ( rg_TypeProduit.ItemIndex = 1 )
  and ( cbx_TypeProduit.KeyValue <> Null ) Then
    Begin
      if filtre <> '' Then
        filtre := filtre + ' AND ' ;
      filtre := filtre + 'ARTI__TYPR = ' + '''' + cbx_TypeProduit.KeyValue +'''';
    End ;

  if  ( rg_Caracteristique.ItemIndex = 1 )
  and ( cbx_Caracteristique.KeyValue <> Null ) Then
    Begin
      if filtre <> '' Then
        filtre := filtre + ' AND ' ;
      filtre := filtre + 'ARTI__CARA = ' + '''' + cbx_Caracteristique.KeyValue +'''';
    End ;

  If  ( ed_Mot2Design.Text <> '' ) then
    begin
    If (rg_EtOuMots1et2.ItemIndex <> -1) then
      begin
      If rg_EtOuMots1et2.ItemIndex = 0 then
        If filtre <> '' then
          filtre := filtre + ' and ARTI_Libcom LIKE ' + '''%' + ed_Mot2Design.Text +'%'''
          else
          filtre := 'ARTI_Libcom LIKE ' + '''%' + ed_Mot2Design.Text +'%''';

      If rg_EtOuMots1et2.ItemIndex = 1 then
        If filtre <> '' then
          filtre := filtre + ' or ARTI_Libcom LIKE ' + '''%' + ed_Mot2Design.Text +'%'''
          else
          filtre := 'ARTI_Libcom LIKE ' + '''%' + ed_Mot2Design.Text +'%''';
      end;
    end;


  If  (ed_Mot3Design.Text <> '' ) then
    begin
    If (rg_EtOuMots2et3.ItemIndex <> -1)  then
      begin
      If (rg_EtOuMots1et2.ItemIndex <> -1) then rg_EtOuMots2et3.ItemIndex := rg_EtOuMots1et2.ItemIndex;
      If rg_EtOuMots2et3.ItemIndex = 0 then
        If filtre <> '' then
          filtre := filtre + ' and ARTI_Libcom LIKE ' + '''%' + ed_Mot3Design.Text +'%'''
          else
          filtre := 'ARTI_Libcom LIKE ' + '''%' + ed_Mot3Design.Text +'%''';

      If rg_EtOuMots2et3.ItemIndex = 1 then
        If filtre <> '' then
          filtre := filtre + ' or ARTI_Libcom LIKE ' + '''%' + ed_Mot3Design.Text +'%'''
          else
          filtre := 'ARTI_Libcom LIKE ' + '''%' + ed_Mot3Design.Text +'%''';
      end;
    end;

  If  ( ed_AbsentDesign.Text <> '' ) then
    begin
        If filtre <> '' then
          filtre := filtre + ' and not ARTI_Libcom  LIKE ' + '''%' + ed_AbsentDesign.Text +'%'''
          else
          filtre := 'not (ARTI_Libcom LIKE ' + '''%' + ed_AbsentDesign.Text +'%'')';
    end;


  If filtre <> '' then                                     {
    if ( M_Article.ds_article.DataSet as TCUstomADODAtaset ).CursorLocation = clUseClient Then
      Begin
        M_Article.ds_article.DataSet.Filter := filtre;
        M_Article.ds_article.DataSet.Filtered := True;
      End
    Else                                                    }
      Begin
        try
          if ( pos ( 'WHERE', UpperCase ( ( M_Article.ds_article.DataSet as TIBQuery ).SQL.Text )) > 0 ) Then
            ( M_Article.ds_article.DataSet as TIBQuery ).SQL.Add ( 'AND ' + filtre )
          Else
            ( M_Article.ds_article.DataSet as TIBQuery ).SQL.Add ( 'WHERE ' + filtre );
          M_Article.ds_article.DataSet.Open ;
        Except
          on e: Exception do
            f_GereException ( e, M_Article.ds_article.DataSet );
        End ;
      End ;

  JvEdit1 .Text := IntToStr(M_Article.ds_article.DataSet.RecordCount);
  ed_Total.Text := IntToStr(M_Article.ds_article.DataSet.RecordCount);
  try
    if lvar_CleArticle <> Null Then
      gd_article.Datasource.Dataset.Locate ( CST_ARTI_Clep, lvar_CleArticle, [] );
  Except
  End ;

end;

procedure TF_SeleArticle.F_FormDicoClose(Sender: TObject;
  var Action: TCloseAction);
begin
  {
  if ( M_Article.ds_article.DataSet as TCUstomADODAtaset ).CursorLocation = clUseServer Then
    Begin
      p_EffaceSelection ( M_Article.ds_article.DataSet as TIBQuery );
      M_Article.ds_article.DataSet.Open ;
    End ;}
  gb_ArticleappeleParDevis := false;
  M_Article.ds_article.DataSet.Filtered := False;
  M_Article.ds_article.DataSet.Filter   := '' ;
  ed_Mot1Design  .Text := '' ;
  ed_Mot2Design  .Text := '' ;
  ed_Mot3Design  .Text := '' ;
  ed_AbsentDesign.Text := '' ;
  rg_Gamme          .ItemIndex := 0 ;
  rg_TypeProduit    .ItemIndex := 0 ;
  rg_Caracteristique.ItemIndex := 0 ;
  Action := caHide ;
end;

procedure TF_SeleArticle.ComboBox1Click(Sender: TObject);
begin
gd_article.Enabled := False;

end;

procedure TF_SeleArticle.ed_codeartiClick(Sender: TObject);
begin
gd_article.Enabled := True;
end;

procedure TF_SeleArticle.F_FormDicoDestroy(Sender: TObject);
begin
  gb_ArticleappeleParDevis := false;
  F_SeleArticle := Nil ;
end;
//////////////////////////////////////////////////////////////////////////////
// Ev?nement : rg_GammeClick
// Description : Action de filtrage ou d'annulation de filtrage par gammes
// Param?tres  : Sender : Le contr?le de l'?v?nement
//////////////////////////////////////////////////////////////////////////////
procedure TF_SeleArticle.rg_GammeClick(Sender: TObject);
var lvar_OldValue : Variant ;
begin
  if Visible Then
    Begin
      lvar_OldValue := cbx_TypeProduit.KeyValue ;
      case rg_Gamme.ItemIndex of
        0 : Begin
              if cbx_TypeProduit.ListSource <> M_Article.ds_SelTypPro Then
              Begin
                if assigned ( cbx_TypeProduit.ListSource ) then
                  cbx_TypeProduit.ListSource.DataSet.Close ;
                cbx_TypeProduit.ListSource := M_Article.ds_SelTypPro ;
                cbx_TypeProduit.ListSource.DataSet.Open ;
                cbx_Gamme.Enabled := False ;
                rg_TypeProduit.ItemIndex := 0 ;
                rg_TypeProduitClick ( Sender );
              End ;
            End ;
        1 : Begin
              if cbx_TypeProduit.ListSource <> M_Article.ds_Sel1TypPro Then
              Begin
                if assigned ( cbx_TypeProduit.ListSource ) then
                  cbx_TypeProduit.ListSource.DataSet.Close ;
                cbx_TypeProduit.ListSource := M_Article.ds_Sel1TypPro ;
                cbx_TypeProduit.ListSource.DataSet.Open ;
                cbx_Gamme.ListSource.DataSet.Open ;
                cbx_Gamme.Enabled := True ;
                M_Article.zq_SelGamme.Open ;
                if rg_Gamme.Focused
                and ( cbx_Gamme.KeyValue = Null )
                and not cbx_Gamme.ListSource.DataSet.IsEmpty Then
                  Begin
                    cbx_Gamme.KeyValue := cbx_Gamme.ListSource.DataSet.FieldByName ( cbx_Gamme.KeyField ).Value;
                    cbx_Gamme.ListFieldIndex := 0 ;
                  End ;
              End ;
            End ;
       End ;
      if not VarIsClear ( lvar_OldValue ) Then
         try
           cbx_TypeProduit.KeyValue := lvar_OldValue ;
         Except
         End ;
    End ;
  nv_seleBtnSearch ( Sender );
end;

//////////////////////////////////////////////////////////////////////////////
// Ev?nement : rg_TypeProduitClick
// Description : Action de filtrage ou d'annulation de filtrage par Types de produits
// Param?tres  : Sender : Le contr?le de l'?v?nement
//////////////////////////////////////////////////////////////////////////////
procedure TF_SeleArticle.rg_TypeProduitClick(Sender: TObject);
var lvar_OldValue : Variant ;
begin
  if Visible Then
    Begin
      lvar_OldValue := cbx_Caracteristique.KeyValue ;
      case rg_TypeProduit.ItemIndex of
        0 : Begin
              if cbx_Caracteristique.ListSource <> M_Article.ds_SelCarac Then
              Begin
                if assigned ( cbx_Caracteristique.ListSource ) then
                  cbx_Caracteristique.ListSource.DataSet.Close ;
                cbx_Caracteristique.ListSource := M_Article.ds_SelCarac ;
                cbx_Caracteristique.ListSource.DataSet.Open ;
                cbx_TypeProduit.Enabled := False ;
                rg_Caracteristique.ItemIndex := 0 ;
                rg_CaracteristiqueClick ( Sender );
              End ;
            End ;
        1 : Begin
              if cbx_Caracteristique.ListSource <> M_Article.ds_Sel1Carac Then
              Begin
                if assigned ( cbx_Caracteristique.ListSource ) then
                  cbx_Caracteristique.ListSource.DataSet.Close ;
                cbx_Caracteristique.ListSource := M_Article.ds_Sel1Carac ;
                cbx_Caracteristique.ListSource.DataSet.Open ;
                cbx_TypeProduit.ListSource.DataSet.Open ;
                cbx_TypeProduit.Enabled := True ;
                if rg_TypeProduit.Focused
                and ( cbx_TypeProduit.KeyValue = Null )
                and not cbx_TypeProduit.ListSource.DataSet.IsEmpty Then
                  cbx_TypeProduit.KeyValue := cbx_TypeProduit.ListSource.DataSet.FieldValues [ cbx_TypeProduit.KeyField ];
              End ;
            End ;
        End ;
      if not VarIsClear ( lvar_OldValue ) Then
         try
           cbx_Caracteristique.KeyValue := lvar_OldValue ;
         Except
         End ;
    End ;
  nv_seleBtnSearch ( Sender );
end;

//////////////////////////////////////////////////////////////////////////////
// Ev?nement : rg_CaracteristiqueClick
// Description : Action de filtrage ou d'annulation de filtrage par Caract?ristiques de produits
// Param?tres  : Sender : Le contr?le de l'?v?nement
//////////////////////////////////////////////////////////////////////////////
procedure TF_SeleArticle.rg_CaracteristiqueClick(Sender: TObject);
begin
  if Visible Then
    Begin
      if Visible Then
        case rg_Caracteristique.ItemIndex of
        0 : Begin
              cbx_Caracteristique.Enabled := False ;
            End ;
        1 : Begin
              cbx_Caracteristique.Enabled := True ;
              cbx_Caracteristique.ListSource.DataSet.Open ;
              if rg_Caracteristique.Focused
              and ( cbx_Caracteristique.KeyValue = Null )
              and not cbx_Caracteristique.ListSource.DataSet.IsEmpty Then
                cbx_Caracteristique.KeyValue := cbx_Caracteristique.ListSource.DataSet.FieldValues [ cbx_Caracteristique.KeyField ];
            End ;
        End ;
    End ;
  nv_seleBtnSearch ( Sender );
end;

//////////////////////////////////////////////////////////////////////////////
// Ev?nement : cbx_TypeProduitClick
// Description : Nouveau filtrage filtrage par Type de produits
// Param?tres  : Sender : Le contr?le de l'?v?nement
//////////////////////////////////////////////////////////////////////////////
procedure TF_SeleArticle.cbx_TypeProduitClick(Sender: TObject);
begin
  nv_seleBtnSearch ( Sender );

end;

//////////////////////////////////////////////////////////////////////////////
// Ev?nement : cbx_CaracteristiqueClick
// Description : Nouveau filtrage filtrage par Caract?ristique de produits
// Param?tres  : Sender : Le contr?le de l'?v?nement
//////////////////////////////////////////////////////////////////////////////
procedure TF_SeleArticle.cbx_CaracteristiqueClick(Sender: TObject);
begin
  nv_seleBtnSearch ( Sender );

end;

//////////////////////////////////////////////////////////////////////////////
// Ev?nement : cbx_GammeClick
// Description : Nouveau filtrage filtrage par Gamme de produits
// Param?tres  : Sender : Le contr?le de l'?v?nement
//////////////////////////////////////////////////////////////////////////////
procedure TF_SeleArticle.cbx_GammeClick(Sender: TObject);
begin
  nv_seleBtnSearch ( Sender );

end;

procedure TF_SeleArticle.rg_EtOuMots1et2Click(Sender: TObject);
begin
  nv_seleBtnSearch ( Sender );
end;

procedure TF_SeleArticle.rg_EtOuMots2et3Click(Sender: TObject);
begin
  nv_seleBtnSearch ( Sender );

end;

procedure TF_SeleArticle.ed_Mot1DesignEnter(Sender: TObject);
begin
  ed_Mot1Design.SelectAll ;
end;

procedure TF_SeleArticle.ed_Mot2DesignEnter(Sender: TObject);
begin
  ed_Mot2Design.SelectAll ;

end;

procedure TF_SeleArticle.ed_Mot3DesignEnter(Sender: TObject);
begin
  ed_Mot3Design.SelectAll ;

end;

procedure TF_SeleArticle.ed_Mot1DesignExit(Sender: TObject);
begin
  nv_seleBtnSearch ( Sender );

end;

procedure TF_SeleArticle.ed_Mot2DesignExit(Sender: TObject);
begin
  nv_seleBtnSearch ( Sender );

end;

procedure TF_SeleArticle.ed_Mot3DesignExit(Sender: TObject);
begin
  nv_seleBtnSearch ( Sender );

end;

procedure TF_SeleArticle.F_FormDicoDataDBSourcescroll(DataSet: TDataSet);
begin
  // La form dico s'occupe de g?rer le gd_article.Datasource 2 via gd_article.DatasourceGridLookupField
//  p_initgd_artcoul.Datasource;
  // affichage de l'onglet "Composition" en fonction du profil
  ts_Composition.TabVisible := gd_article.Datasource.DataSet.FieldByName ( CST_ARTI_Compose ).AsBoolean;
//  ts_Compose.TabVisible := (( gi_niveau_priv = U_CST_ASSISTANT ) or ( gi_niveau_priv >= U_CST_CONTROLEGESTION )) and gd_article.Datasource.DataSet.Active and gd_article.Datasource.DataSet.FieldByName ( CST_ARTI_Compose ).AsBoolean ;
  if gd_article.Datasource.DataSet.FieldByName ( 'ARTI_Compose' ).AsBoolean then
    begin
      M_Article.zq_ArbreArt.Close ;
      M_Article.zq_ArbreArt.Params.ParamByName('ArticleC').Value := gd_article.Datasource.DataSet.FieldByName('ARTI_Clep').Value ;
      M_Article.zq_ArbreArt.Open ;

      // d?ploiement de l'arbre
      if vt_Composition.GetFirst <> nil Then
          vt_Composition.FullExpand ( vt_Composition.GetFirst );
    end;
end;

procedure TF_SeleArticle.F_FormDicoShow(Sender: TObject);
begin
  // reaffectation car pas de controfocus sur la form
  // a cause du forcage de la recherche
  JvEdit1.Text := 'Tous';
  ed_Total.Text := 'Tous';
  M_Article.zq_SelGamme.Open ;
  M_Article.zq_GammeE.Open ;
  if fsmodal in FFormState then
    pc_art.ActivePageIndex := 6;

  if rg_TypeCoul.Value = '' Then
    rg_TypeCoulChange ( rg_TypeCoul );

end;

procedure TF_SeleArticle.bt_TypeProClick(Sender: TObject);
begin
  {// ne bouton na pas d'utilit?
  ffor_ExecuteFonction ( U_CST_TYPEPRODUIT, True );
  if ( lsv_Composein.Items.Count > 0 )
  and M_DmCompose.zq_Structure.Active Then
    if assigned ( lsv_Composein.Selected ) Then
      M_DmCompose.zq_Structure.Locate ( CST_STRU_Clep, lsv_Composein.Selected.Caption, [] )
    Else
      M_DmCompose.zq_Structure.Locate ( CST_STRU_Clep, lsv_Composein.Items [ 0 ].Caption, [] );
  }
end;

procedure TF_SeleArticle.rg_TypeCoulChange(Sender: TObject);
begin
  if ( rg_TypeCoul.Value = '' ) Then
    Begin
      ed_coul.Visible := False ;
      lb_Coul.Visible := False ;
      ed_Libcoul.Visible := False ;
      lb_LibCoul.Visible := False ;
      lb_TypeFinition .Visible := False ;
      cbx_TypeFinition.Visible := False ;
      bt_TypFini.Visible := False ;
      bt_couleur.Visible := False ;
      ed_coul.ReadOnly:=True;
      Exit ;
    End ;
  // type de finition
  try
    case StrToInt ( rg_TypeCoul.Value ) of
      1 : Begin
            cbx_TypeFinition.Visible := True ;
            lb_TypeFinition .Visible := True ;
            ed_coul.Visible := False ;
            lb_Coul.Visible := False ;
          End ;
          // fixe
      2 : Begin
            lb_Coul.Caption := ls_LabelFinition ;
            cbx_TypeFinition.Visible := False ;
            lb_TypeFinition .Visible := False ;
            ed_Coul.Visible := True ;
            lb_Coul.Visible := True ;
          End ;
      3 : Begin
            cbx_TypeFinition.Visible := False ;
            lb_TypeFinition .Visible := False ;
            ed_coul.Visible := False ;
            lb_Coul.Visible := False ;
          End ;
      4 : Begin
            cbx_TypeFinition.Visible := False ;
            lb_TypeFinition .Visible := False ;
            ed_coul.Visible := False ;
            lb_Coul.Visible := False ;
          End ;
      5 : Begin
            lb_Coul.Caption := ls_LabelFinition + ' par d?f.' ;
            cbx_TypeFinition.Visible := False ;
            lb_TypeFinition .Visible := False ;
            ed_Coul.Visible := True ;
            lb_Coul.Visible := True ;
          End ;
    End ;
  ed_Libcoul.Visible := ed_coul.Visible ;
  lb_LibCoul.Visible := lb_Coul.Visible ;
  Except
    on e: Exception do
      f_GereException ( e, rg_TypeCoul.DataSource.DataSet );
  End ;
end;

procedure TF_SeleArticle.ed_FiltreBranchesKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if ed_FiltreBranches.Text = '' Then
    lsv_BrOut.Datasource.DataSet.Filtered := False
  Else
    Begin
      lsv_BrOut.Datasource.DataSet.Filter := lsv_BrOut.DataKeyUnit + ' LIKE ''' + ed_FiltreBranches.Text + '%''' ;
      lsv_BrOut.Datasource.DataSet.Filtered := True ;
    End ;
  lsv_BrOut.Refresh ;

end;

procedure TF_SeleArticle.p_ApresEdit;
begin
  pc_art.ActivePage := ts_libelle ;
end;

procedure TF_SeleArticle.F_FormDicoDataSourceGridScroll(
  DataSet: TDataSet);
begin
  if ( gd_artcoul.Datasource.DataSet.FieldByName ( CST_ARFI_Choixfinit ).IsNull ) Then
    Begin
      bt_TypFini      .Visible := False ;
      bt_couleur.Visible := False ;
      ed_coul.ReadOnly:=True;
    End ;
  ed_Libcoul.Visible := ed_coul.Visible ;
  lb_LibCoul.Visible := lb_Coul.Visible ;
   M_DmCompose.p_FiltreCouleur ( M_Article.zq_ArFini, gd_artcoul.Datasource.DataSet.FieldByName ( CST_ARFI__FINI ));
end;

procedure TF_SeleArticle.ed_FiltreArticlesKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if ed_FiltreArticles.Text = '' Then
    Begin
      lsv_ArticleOut.Datasource.DataSet.Filtered := False ;
      lsv_ArticleIn .Datasource.DataSet.Filtered := False ;
      lsv_ArticleIn .DataAllFiltered := False ;
      lsv_ArticleOut.DataAllFiltered := False ;
    End
  Else
    Begin
//      lsv_ArticleOut.Datasource.DataSet.Filter := lsv_ArticleOut.DataKeyUnit + ' LIKE ''' + fs_stringDbQuoteFilter ( ed_FiltreArticles.Text) + '%''' ;
      lsv_ArticleOut.Datasource.DataSet.Filtered := True ;
//      lsv_ArticleIn .Datasource.DataSet.Filter := lsv_ArticleOut.Datasource.DataSet.Filter ;
      lsv_ArticleIn .Datasource.DataSet.Filtered := True ;
      lsv_ArticleIn .DataAllFilter := lsv_ArticleOut.DataKeyUnit + ' LIKE ''' + fs_stringDbQuoteLikeSQLServer ( ed_FiltreArticles.Text) + '%'''  ;
      lsv_ArticleOut.DataAllFilter := lsv_ArticleIn .DataAllFilter ;
      lsv_ArticleIn .DataAllFiltered := True ;
      lsv_ArticleOut.DataAllFiltered := True ;
    End ;
  lsv_ArticleOut.Refresh ;
  lsv_ArticleIn .Refresh ;

end;


procedure TF_SeleArticle.p_initInsert;
begin
  gd_article.Datasource.DataSet.FieldByName('ARTI_Declasse').Value := 0;
  gd_article.Datasource.DataSet.FieldByName('ARTI_Compose').Value := 0;
end;

procedure TF_SeleArticle.lsv_ArticleInDBOnRecorded(DataSet: TDataSet);
begin
  //Rafraichit le champ Declasse
  fb_RefreshDataset(DataSet);
end;

procedure TF_SeleArticle.p_refreshDeclassement;
begin
  if M_Article.zq_prodDeclasse.Active Then
    Begin
      M_Article.zq_prodDeclasse.Refresh;
      lsv_ArticleIn.Refresh ;
    End ;
  if M_Article.zq_prodNonDeclasse.Active Then
    Begin
      M_Article.zq_prodNonDeclasse.Refresh;
      lsv_ArticleOut.Refresh ;
    End ;
end;
/////////////////////////////////////////////////////////////////////////////
// Ev?nement   : vt_CompositionBeforeCellPaint
// Description : Pr?sentation des noeuds de la composition
//                avec gestion de couleurs
// **** POSE UN PROBLEME SUR LE RAFRAICHISSEMENT DU EXRXDBGRID DES ARTICLES***/
/////////////////////////////////////////////////////////////////////////////
procedure TF_SeleArticle.vt_CompositionBeforeCellPaint(
  Sender: TBaseVirtualTree; TargetCanvas: TCanvas; Node: PVirtualNode;
  Column: TColumnIndex; CellRect: TRect);
//var
  //ldbn_DBData: PDBNodeData;
begin
  // On est sur le deuxi?me niveau ?
  // r?cup?ration des donn?es du noeud
  //ldbn_DBData := ( Sender as tBaseVirtualDbTreeEx ).GetDBNodeData( Node );

  {// **** PROBLEME DE RAFRAICHISSEMENT DU EXRXDBGRID ***/
   If //( ldbn_DBData.Cancheck ) and
    ( Node.CheckType <> ctNone ) then
     // On peut s?lectionner le noeud
      begin
    vt_Composition.Font.Color := clBlue ;
    vt_Composition.Font.Style := [fsBold]
    end
  else
     // On ne peut s?lectionner le noeud
    begin
    vt_Composition.Font.Color := clbLACK ;
    vt_Composition.Font.Style := []
    end;

  // Multi-s?lection ? valider ( les branches du dessous vont faire la s?lection et sont ? valider )
  If  ( Node.CheckType =  ctTristateCheckBox )
  and  ( Node.CheckState in [csMixedNormal, csMixedPressed]) then
      begin
      vt_Composition.NodeHeight [Node]:= 20;
      vt_Composition.Font.Size := 10;
      vt_Composition.Font.Color := clgreen ;
      vt_Composition.Font.Style := [fsBold]

      end else
      //  la font est ? r?initialiser sinon
        vt_Composition.Font.Size := 8;

  // Peinture en fonction du pinceau
  TargetCanvas.FillRect ( CellRect );
 }
end;

procedure TF_SeleArticle.bt_copieartClick(Sender: TObject);
var
  newcode : string;
  lt_Arg : Array [ 0..1 ] of string ;
  code_copie,fin : string;

begin
  if not gd_article.Datasource.DataSet.Active Then
    Exit ;

  lt_Arg [ 0 ] := 'cet article' ;

  // les 9 premiers caracteres sont a conserver en l'etat
  // alors que sur les 3 derniers, il faut supprimer les espaces
  with gd_article do
    Begin
      fin := trim(copy(Datasource.DataSet.FieldByName('ARTI_Clep').AsString,10,length(code_copie)));
      code_copie := copy(Datasource.DataSet.FieldByName('ARTI_Clep').AsString,1,9) + fin;

    end;

  // le code a copier ne doit pas depasser 10 caractere car on en rajoute 2
  if ( length(code_copie) <= 10 ) then
  begin
    M_Article.zq_code_copieart.Close;
    M_Article.zq_code_copieart.Params.ParamByName('Clep1').Value := code_copie;
    M_Article.zq_code_copieart.Open;

    if M_Article.zq_code_copieart.IsEmpty then
      begin
        newcode := 'Z'+ code_copie +'0';
        p_Copiearticle(newcode);
      end
    else // il y a deja des copies
    begin
      try
       newcode :=  'Z'+ code_copie;
       newcode := newcode + inttostr((strtoint(M_Article.zq_code_copieart.Fields[0].Value)+1));
      except
        // dans le cas ou l'on trouve un article deja 'Z'+article a copier
        // avec pour dernier caractere autre chose qu'un chiffre
        lt_Arg [ 1 ] := '';
        MessageDlg ( fs_RemplaceMsg ( U_CST_9305, lt_Arg ), mtWarning, [mbOK], 0 );
        exit;
      end;

      // le code article est un varchar(12) max
      if  (length(newcode) <= 12)   then
        p_Copiearticle(newcode)
      else
      begin
        lt_Arg [ 1 ] := 'Le nouveau code sera trop long.';
        MessageDlg ( fs_RemplaceMsg ( U_CST_9305, lt_Arg ), mtWarning, [mbOK], 0 );
      end;
    end;
  end
  else
  begin
    lt_Arg [ 1 ] := 'L''article ? copier a un code d?passant 10 caract?res.';
    MessageDlg ( fs_RemplaceMsg ( U_CST_9305, lt_Arg ), mtWarning, [mbOK], 0 );
  end;
end;


procedure TF_SeleArticle.p_Copiearticle(as_newcode: string);
begin
  // copie
  M_Article.zq_copieart.Close;
  M_Article.zq_copieart.Params.ParamByName('Cle1').Value := gd_article.Datasource.DataSet.FieldByName('ARTI_Clep').AsString;
  M_Article.zq_copieart.Params.ParamByName('Cle2').Value := as_newcode;
  M_Article.zq_copieart.ExecSQL;

  //raffraichissement ces donn?es et positionnement sur l'enregistrement
  gd_article.Datasource.DataSet.Refresh;
  gd_article.Datasource.DataSet.Locate('ARTI_Clep',as_newcode,[]);

  MessageDlg ( U_CST_9033, mtWarning, [mbOK], 0 );
end;

procedure TF_SeleArticle.F_FormDicoOnEraseFilter(const Dataset: TDataSet;
  const as_Champ: String);
begin
  ts_composition.Enabled := True ;

end;

procedure TF_SeleArticle.F_FormDicoDataSearching(const Dataset: TDataSet;
  const as_Champ: String);
begin
  ts_composition.Enabled := False ;

end;

//////////////////////////////////////////////////////////////////////////////////////
// Ev?nement : F_FormDicoDataOnSort
// Description : Tri quand on clique sur une fl?che
// Param?tres : Dataset: Les donn?es ? trier
//  as_Champ, as_TypeTri : Le champ et l'ordre de tri
//////////////////////////////////////////////////////////////////////////////////////
procedure TF_SeleArticle.F_FormDicoDataOnSort(Dataset: TDataSet;
  as_Champ, as_TypeTri: String);
var lbkm_Bookmark : TBookmarkStr ;
begin
  if  ( Dataset = gd_article.Datasource.DataSet )
  and ( Dataset is TIBQuery ) Then
  // Tri avec curseur sur le serveur
//  and ( ( Dataset as TIBQuery ).CursorLocation = clUseServer ) Then
    Begin
      try
        lbkm_Bookmark := Dataset.Bookmark ;
      Except
      End ;
      try
        p_EffaceOrderBy ( Dataset as TIBQuery );
        ( Dataset as TIBQuery ).SQL.Add ( 'ORDER BY ' + as_Champ + ' ' + as_TypeTri );
        Dataset.Open ;
      Except
        on e: Exception do
          f_GereException ( e, Dataset );
      End ;
      try
        Dataset.Bookmark := lbkm_Bookmark ;
      Except
      End ;
   end;
end;

//////////////////////////////////////////////////////////////////////////////////////
// proc?dure : p_EffaceOrderBy
// Description : Enl?ve le tri
// Param?tres : adat_MainQuery : Les donn?es ? trier
//////////////////////////////////////////////////////////////////////////////////////
procedure TF_SeleArticle.p_EffaceOrderBy ( const adat_MainQuery : TIBQuery );
begin
  adat_MainQuery.Close ;
  if ( pos ( 'ORDER BY', adat_MainQuery.SQL [ adat_MainQuery.SQL.Count - 1 ] ) > 0) Then
    adat_MainQuery.SQL.Delete ( adat_MainQuery.SQL.Count - 1 );
end;

end.

