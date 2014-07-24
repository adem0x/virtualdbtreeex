unit U_DmArticle;

{$IFDEF FPC}
  {$MODE Delphi}
{$ENDIF}

interface

uses
  SysUtils,StrUtils, Classes, DB, IBQuery,IBTable,IBUpdateSQL, Forms,Dialogs,controls,fonctions_string, U_FormAdapt, U_ConstMessage ;
type
  TM_Article = class(TDataModule)
    ds_article: TDataSource;
    zq_artcoul: TIBQuery;
    ds_ARCO: TDataSource;
    ds_GamTProIn: TDataSource;
    zq_GamTProIn: TIBQuery;
    ds_GamTProOut: TDataSource;
    zq_GamTProOut: TIBQuery;
    zq_Gamme: TIBQuery;
    ds_Gamme: TDataSource;
    ds_TyPGamIn: TDataSource;
    zq_TyPGamIn: TIBQuery;
    zq_TypProduit: TIBQuery;
    ds_TypProduit: TDataSource;
    ds_TyPGamOut: TDataSource;
    zq_TyPGamOut: TIBQuery;
    ds_TyPCaraIn: TDataSource;
    zq_TyPCaraIn: TIBQuery;
    ds_TyPCaraOut: TDataSource;
    zq_TyPCaraOut: TIBQuery;
    ds_CaraTPIn: TDataSource;
    zq_CaraTPIn: TIBQuery;
    zq_Carac: TIBQuery;
    ds_Carac: TDataSource;
    ds_CaraTPOut: TDataSource;
    zq_CaraTPOut: TIBQuery;
    ds_SelCarac: TDataSource;
    zq_SelCarac: TIBQuery;
    zq_SelTypPro: TIBQuery;
    ds_SelTypPro: TDataSource;
    zq_SelGamme: TIBQuery;
    ds_SelGamme: TDataSource;
    ds_Sel1Carac: TDataSource;
    zq_Sel1Carac: TIBQuery;
    zq_Sel1TypPro: TIBQuery;
    ds_Sel1TypPro: TDataSource;
    ds_SelCarac2: TDataSource;
    zq_SelCarac2: TIBQuery;
    zq_SelTypPro2: TIBQuery;
    ds_SelTypPro2: TDataSource;
    zq_GammeE: TIBQuery;
    ds_GammeE: TDataSource;
    ds_Sel1Carac2: TDataSource;
    zq_Sel1Carac2: TIBQuery;
    zq_Sel1TypPro2: TIBQuery;
    ds_Sel1TypPro2: TDataSource;
    ds_ArFini: TDataSource;
    zq_CocoCoul: TIBQuery;
    ds_CocoCoul: TDataSource;
    zq_TyfiInFini: TIBQuery;
    ds_TyfiInFini: TDataSource;
    zq_TyfiOutFini: TIBQuery;
    ds_TyfiOutFini: TDataSource;
    zq_FiniInTyFi: TIBQuery;
    ds_FiniInTyFi: TDataSource;
    zq_FiniOutTyFi: TIBQuery;
    ds_FiniOutTyFi: TDataSource;
    ds_FiltreProduit: TDataSource;
    zq_FiltreProduit: TIBQuery;
    zq_Article1: TIBQuery;
    zq_prod_acces: TIBQuery;
    ds_prod_acces: TDataSource;
    ds_prodNonDeclasse: TDataSource;
    zq_prodDeclasse: TIBQuery;
    zq_prodNonDeclasse: TIBQuery;
    ds_ArbreArt: TDataSource;
    zq_ArbreArt: TIBQuery;
    zq_code_copieart: TIBQuery;
    zq_copieart: TIBQuery;
    zq_ArFini: TIBQuery;
    zq_Article2: TIBQuery;
    zq_Article3: TIBQuery;
    zq_Article4: TIBQuery;
    zq_Article5: TIBQuery;
    zq_Article6: TIBQuery;
    ds_ProdDeclasse: TDataSource;
    procedure zq_articleAfterScroll(DataSet: TDataSet);
    procedure zq_articleNewRecord(DataSet: TDataSet);
    procedure zq_SelGammeAfterScroll(DataSet: TDataSet);
    procedure zq_SelTypProAfterScroll(DataSet: TDataSet);
    procedure zq_SelTypProAfterOpen(DataSet: TDataSet);
    procedure zq_SelGammeAfterOpen(DataSet: TDataSet);
    procedure zq_articleAfterOpen(DataSet: TDataSet);
    procedure zq_AffectePostError(DataSet: TDataSet; E: EDatabaseError;
      var Action: TDataAction);
    procedure zq_FinitionAfterOpen(DataSet: TDataSet);
    procedure zq_articleAfterEdit(DataSet: TDataSet);
    procedure zq_GammeEAfterOpen(DataSet: TDataSet);
    procedure zq_GammeEAfterScroll(DataSet: TDataSet);
    procedure zq_SelTypPro2AfterOpen(DataSet: TDataSet);
    procedure zq_SelTypPro2AfterScroll(DataSet: TDataSet);
    procedure zq_Sel1TypPro2AfterOpen(DataSet: TDataSet);
    procedure zq_Sel1TypPro2AfterScroll(DataSet: TDataSet);
    procedure zq_artcoulNewRecord(DataSet: TDataSet);
    procedure zq_Article1NewRecord(DataSet: TDataSet);
    procedure zq_Article1AfterInsert(DataSet: TDataSet);
    procedure zq_prodDeclasseFilterRecord(DataSet: TDataSet;
      var Accept: Boolean);
    procedure zq_Article1AfterPost(DataSet: TDataSet);
    procedure zq_ArbreArtAfterOpen(DataSet: TDataSet);
    procedure zq_artcoulAfterCancel(DataSet: TDataSet);
    procedure zq_ArFiniNewRecord(DataSet: TDataSet);
  end;

var
  M_Article: TM_Article;

implementation

uses U_Client, U_Composant,
     U_SeleArticle, U_ComposeArticle, Variants , fonctions_dbcomponents,
  U_CodePostal, U_RepSecteur , U_Representant ,U_Modalite, U_Prodrepr,
  U_DmCompose, U_DmDonn;

{$IFNDEF FPC}
  {$R *.dfm}
{$ELSE}
  {$R *.lfm}
{$ENDIF}
procedure TM_Article.zq_articleAfterScroll(DataSet: TDataSet);
begin
 { with  zq_artfinition do
  begin
      Active := false;
      Params.ParamByName('art').Value := ds_article.DataSet.FieldByName('ARTI_Clep').asString;
      Open;
  end; }
{  if assigned ( F_SeleArticle )
  and F_SeleArticle.Visible Then
    F_SeleArticle.lb_datecreation.Caption := FormatDateTime('d/mm/yyyy',M_Article.zq_Article.FieldByName('ARTI_Datecrea').AsDateTime);}

  TDateField(M_Article.ds_article.DataSet.FieldByName('ARTI_Datecrea')).DisplayFormat := U_CST_format_date_2;    
end;


procedure TM_Article.zq_articleNewRecord(DataSet: TDataSet);
begin
  DataSet.FieldByName('ARTI_Datecrea').AsDateTime := now;
  DataSet.FieldByName('ARTI_Compose').AsBoolean  := False;
end;

procedure TM_Article.zq_SelGammeAfterScroll(DataSet: TDataSet);
begin
  zq_Sel1TypPro.Close ;
  zq_Sel1TypPro.Params.FindParam ( 'groupe' ).Value := DATaset.FieldByName ( 'GAMM_Clep' ).Value;
  zq_Sel1TypPro.Open ;
end;

procedure TM_Article.zq_SelTypProAfterScroll(DataSet: TDataSet);
begin
  zq_Sel1Carac.Close ;
  zq_Sel1Carac.Params.FindParam ( 'groupe' ).Value := DATaset.FieldByName ( 'TYPR_Clep' ).Value;
  zq_Sel1Carac.Open ;

end;

procedure TM_Article.zq_SelTypProAfterOpen(DataSet: TDataSet);
begin
  zq_SelTypProAfterScroll ( Dataset );
end;

procedure TM_Article.zq_SelGammeAfterOpen(DataSet: TDataSet);
begin
  zq_SelGammeAfterScroll ( Dataset );
end;


procedure TM_Article.zq_articleAfterOpen(DataSet: TDataSet);
begin
  TDateTimeField (DataSet.FieldByName( 'ARTI_Datecrea' )).DisplayFormat := U_CST_format_date_2 ;
  TNumericField  (DataSet.FieldByName( 'ARTI_Pxactu'   )).DisplayFormat := U_CST_format_money_1 ;
  TNumericField  (DataSet.FieldByName( 'ARTI_Pxfutur'  )).DisplayFormat := U_CST_format_money_1 ;
  TNumericField  (DataSet.FieldByName( 'ARTI_Cubage'   )).DisplayFormat := U_CST_format_money_1 ;
  TNumericField  (DataSet.FieldByName( 'ARTI_Coefcub'  )).DisplayFormat := U_CST_format_money_1 ;
  TNumericField  (DataSet.FieldByName( 'ARTI_Poids'    )).DisplayFormat := U_CST_format_money_1 ;
end;

procedure TM_Article.zq_AffectePostError(DataSet: TDataSet;
  E: EDatabaseError; var Action: TDataAction);
begin
  MessageDlg ( 'La zone ''Nom de la zone'' ne peut pas ?tre vide.' + #13 + #13
                           + 'Effectuer une saisie ou annuler.', mtWarning, [mbOk], 0)
end;

procedure TM_Article.zq_FinitionAfterOpen(DataSet: TDataSet);
begin
  TNumericField ( Dataset.FieldByName ( 'FINI_Txcharge' )).DisplayFormat := U_CST_format_money_1 ;
end;

procedure TM_Article.zq_articleAfterEdit(DataSet: TDataSet);
begin
  if assigned ( F_SeleArticle )
  and F_SeleArticle.Visible Then
    F_SeleArticle.p_ApresEdit ;

end;

procedure TM_Article.zq_GammeEAfterOpen(DataSet: TDataSet);
begin
  zq_GammeEAfterScroll ( Dataset );

end;

procedure TM_Article.zq_GammeEAfterScroll(DataSet: TDataSet);
begin
  zq_Sel1TypPro2.Close ;
  zq_Sel1TypPro2.Params.FindParam ( 'groupe' ).Value := DATaset.FieldByName ( 'GAMM_Clep' ).Value;
  zq_Sel1TypPro2.Open ;

end;

procedure TM_Article.zq_SelTypPro2AfterOpen(DataSet: TDataSet);
begin
  zq_SelTypPro2AfterScroll ( Dataset );

end;

procedure TM_Article.zq_SelTypPro2AfterScroll(DataSet: TDataSet);
begin
  zq_Sel1Carac2.Close ;
  zq_Sel1Carac2.Params.FindParam ( 'groupe' ).Value := DATaset.FieldByName ( 'TYPR_Clep' ).Value;
  zq_Sel1Carac2.Open ;

end;

procedure TM_Article.zq_Sel1TypPro2AfterOpen(DataSet: TDataSet);
begin
  zq_SelTypPro2AfterScroll ( Dataset );

end;

procedure TM_Article.zq_Sel1TypPro2AfterScroll(DataSet: TDataSet);
begin
  zq_Sel1Carac2.Close ;
  zq_Sel1Carac2.Params.FindParam ( 'groupe' ).Value := DATaset.FieldByName ( 'TYPR_Clep' ).Value;
  zq_Sel1Carac2.Open ;

end;

procedure TM_Article.zq_artcoulNewRecord(DataSet: TDataSet);
begin
  Dataset.FieldByName ( CST_ARFI_Choixfinit ).Value := 4 ;

end;

//*****************************
// Proc?dure: zq_paysAfterPost
// Mise ? jour affichage des clients associ?s au pays
//**************************
procedure TM_Article.zq_Article1NewRecord(DataSet: TDataSet);
begin
  Dataset.FieldByName ( CST_ARTI_Date ).Value := FormatDateTime(U_CST_format_date_2,Now) ;
end;



procedure TM_Article.zq_Article1AfterInsert(DataSet: TDataSet);
begin
  DataSet.FieldByName ( 'ARTI_Declasse' ).Value := 0;
  DataSet.FieldByName ( 'ARTI_Compose'  ).Value := 0;

end;

procedure TM_Article.zq_prodDeclasseFilterRecord(DataSet: TDataSet;
  var Accept: Boolean);
begin
  if assigned ( F_SeleArticle )
  and F_SeleArticle.Visible Then
    with F_SeleArticle do
      Accept := fb_DatasetFilterLikeRecord ( Dataset.FieldByName ( lsv_ArticleOut.DataKeyUnit ).AsString, ed_FiltreArticles.Text, True );

end;

procedure TM_Article.zq_Article1AfterPost(DataSet: TDataSet);
begin
  if ( ds_article.DataSet <> zq_Article1 ) Then
    zq_Article1.Close ;
  if ( ds_article.DataSet <> zq_Article2 ) Then
    zq_Article2.Close ;
  if ( ds_article.DataSet <> zq_Article3 ) Then
    zq_Article3.Close ;
  if ( ds_article.DataSet <> zq_Article4 ) Then
    zq_Article4.Close ;
  if ( ds_article.DataSet <> zq_Article5 ) Then
    zq_Article5.Close ;
  if ( ds_article.DataSet <> zq_Article6 ) Then
    zq_Article6.Close ;
  if assigned ( F_SeleArticle )
  and F_SeleArticle.Visible Then
    with F_SeleArticle do
      Begin
        p_refreshDeclassement;
      End ;
end;

procedure TM_Article.zq_ArbreArtAfterOpen(DataSet: TDataSet);
begin
  TNumericField(zq_ArbreArt.FieldByName('ARDE_Prix')).DisplayFormat := U_CST_format_money_1 ;
end;

///////////////////////////////////////////////////////////////////////
// Procedure : zq_ArticleBeforeEdit
// Description : controle du profil, car une assitante ne peut modifier
//    que les articles speciaux (donc pas de creation ni suppr ni modif
//    de l'article ou de ses finitions)
///////////////////////////////////////////////////////////////////////
procedure TM_Article.zq_artcoulAfterCancel(DataSet: TDataSet);
begin
   M_DmCompose.p_FiltreCouleur ( zq_ArFini, DataSet.FieldByName ( CST_ARFI__FINI ));

end;


procedure TM_Article.zq_ArFiniNewRecord(DataSet: TDataSet);
begin
  Dataset.FieldByName ( CST_ARFI_Choixfinit ).Value := 4 ;

end;

end.
