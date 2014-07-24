unit U_DmCompose;

{$IFDEF FPC}
  {$MODE Delphi}
{$ENDIF}

interface

uses
  SysUtils, Classes, DB, IBQuery,IBTable,IBUpdateSQL;

type
  TM_DmCompose = class(TDataModule)
    zq_Structure: TIBQuery;
    ds_Structure: TDataSource;
    zq_BranInBran: TIBQuery;
    ds_BranInBran: TDataSource;
    zq_BranOutBr: TIBQuery;
    ds_BranOutBr: TDataSource;
    zq_ComInBran: TIBQuery;
    ds_ComInBran: TDataSource;
    zq_ComOutBran: TIBQuery;
    ds_ComOutBra: TDataSource;
    zq_CompInBra: TIBQuery;
    ds_CompInBra: TDataSource;
    zq_CompOutBra: TIBQuery;
    ds_CompOutBra: TDataSource;
    zq_ComsInBra: TIBQuery;
    ds_ComsInBra: TDataSource;
    zq_ComsOutBra: TIBQuery;
    ds_ComsOutBra: TDataSource;
    ds_Comportem: TDataSource;
    zq_Comportem: TIBQuery;
    zq_ArtInBran: TIBQuery;
    ds_ArtInBran: TDataSource;
    zq_ArtOutBran: TIBQuery;
    ds_ArtOutBran: TDataSource;
    zq_RetrouvArt: TIBQuery;
    ds_RetrouvArt: TDataSource;
    zq_BranInComp: TIBQuery;
    ds_BranInComp: TDataSource;
    zq_BranOutComp: TIBQuery;
    ds_BranOutCom: TDataSource;
    zq_BranInSel: TIBQuery;
    ds_BranInSel: TDataSource;
    zq_BranOutSel: TIBQuery;
    ds_BranOutSel: TDataSource;
    zq_ArbreArtC: TIBQuery;
    ds_ArbreArtC: TDataSource;
    zq_BrLieBrIn: TIBQuery;
    ds_BrLieBrIn: TDataSource;
    zq_BrLieBrOut: TIBQuery;
    ds_BrLieBrOut: TDataSource;
    zq_BranInArt: TIBQuery;
    ds_BranInArt: TDataSource;
    zq_BranOutArt: TIBQuery;
    ds_BranOutArt: TDataSource;
    zq_ArticleC: TIBQuery;
    ds_ArticleC: TDataSource;
    zq_ArbreArt: TIBQuery;
    ds_ArbreArt: TDataSource;
    zq_Temp: TIBQuery;
    ds_Temp: TDataSource;
    ds_Compose: TDataSource;
    zq_Compose: TIBQuery;
    zq_Comporte: TIBQuery;
    ds_Comporte: TDataSource;
    zq_SelectStru: TIBQuery;
    ds_SelectStru: TDataSource;
    zq_ArbrDevi: TIBQuery;
    ds_BrType: TDataSource;
    zq_BrType: TIBQuery;
    ds_BrSelect: TDataSource;
    zq_BrSelect: TIBQuery;
    zq_Comclasse: TIBQuery;
    ds_Comclasse: TDataSource;
    zq_ComDeclas: TIBQuery;
    ds_ComDeclas: TDataSource;
    zq_CompCoul: TIBQuery;
    ds_CompCoul: TDataSource;
    zq_composant: TIBQuery;
    ds_Composant: TDataSource;
    ds_CoFini: TDataSource;
    zq_code_copiecomp: TIBQuery;
    zq_copiecomp: TIBQuery;
    zq_CoFini: TIBQuery;
    procedure zq_StructureAfterInsert(DataSet: TDataSet);
    procedure zq_ComportemDeleteError(DataSet: TDataSet;
      E: EDatabaseError; var Action: TDataAction);
    procedure zq_StructureDeleteError(DataSet: TDataSet;
      E: EDatabaseError; var Action: TDataAction);
    procedure zq_StructureBeforePost(DataSet: TDataSet);
    procedure zq_TempAfterOpen(DataSet: TDataSet);
    procedure zq_ComporteBeforeOpen(DataSet: TDataSet);
    procedure zq_SelectStruBeforeOpen(DataSet: TDataSet);
    procedure zq_ArbreArtAfterOpen(DataSet: TDataSet);
    procedure zq_ComposeAfterOpen(DataSet: TDataSet);
    procedure zq_StructureAfterPost(DataSet: TDataSet);
    procedure zq_CompCoulNewRecord(DataSet: TDataSet);
    procedure zq_composantAfterOpen(DataSet: TDataSet);
    procedure zq_composantAfterScroll(DataSet: TDataSet);
    procedure zq_composantNewRecord(DataSet: TDataSet);
    procedure zq_BranOutBrFilterRecord(DataSet: TDataSet;
      var Accept: Boolean);
    procedure zq_ComOutBranFilterRecord(DataSet: TDataSet;
      var Accept: Boolean);
    procedure zq_CompOutBraFilterRecord(DataSet: TDataSet;
      var Accept: Boolean);
    procedure zq_ComsOutBraFilterRecord(DataSet: TDataSet;
      var Accept: Boolean);
    procedure zq_ArtOutBranFilterRecord(DataSet: TDataSet;
      var Accept: Boolean);
    procedure zq_BranOutCompFilterRecord(DataSet: TDataSet;
      var Accept: Boolean);
    procedure zq_BranOutSelFilterRecord(DataSet: TDataSet;
      var Accept: Boolean);
    procedure zq_BrLieBrOutFilterRecord(DataSet: TDataSet;
      var Accept: Boolean);
    procedure zq_BranOutArtFilterRecord(DataSet: TDataSet;
      var Accept: Boolean);
    procedure zq_composantAfterPost(DataSet: TDataSet);
    procedure zq_BrSelectAfterOpen(DataSet: TDataSet);
    procedure zq_StructureAfterScroll(DataSet: TDataSet);
    procedure zq_CompCoulAfterCancel(DataSet: TDataSet);
  private
    { Déclarations privées }
  public
    procedure p_FiltreCouleur ( const azq_QueryFiltre : TIBQuery ; const afie_Field : TField );
    { Déclarations publiques }
  end;

var
  M_DmCompose: TM_DmCompose;

implementation

uses U_Structure, Dialogs, U_ConstMessage , U_ComposeArticle, U_Composant,
     fonctions_db, fonctions_dbcomponents, U_Comportement, U_SeleArticle;

{$IFNDEF FPC}
  {$R *.dfm}
{$ELSE}
  {$R *.lfm}
{$ENDIF}

procedure TM_DmCompose.zq_StructureAfterInsert(DataSet: TDataSet);
begin
  if assigned ( F_Structure )
  and F_Structure.Visible Then
    F_Structure.p_ApresInsere ;
end;

procedure TM_DmCompose.zq_ComportemDeleteError(DataSet: TDataSet;
  E: EDatabaseError; var Action: TDataAction);
begin
  MessageDlg ( U_CST_9000, mtWarning, [mbOk], 0 );
end;

procedure TM_DmCompose.zq_StructureDeleteError(DataSet: TDataSet;
  E: EDatabaseError; var Action: TDataAction);
begin
  MessageDlg ( U_CST_9000, mtWarning, [mbOk], 0 );

end;

procedure TM_DmCompose.zq_StructureBeforePost(DataSet: TDataSet);
begin
  Exit ;
  zq_ArbrDevi.Close ;
  ds_BranInBran .DataSet.Close ;
  ds_BranOutBr  .DataSet.Close ;
  ds_BranInComp .DataSet.Close ;
  ds_BranOutCom .DataSet.Close ;
  ds_BranInSel  .DataSet.Close ;
  ds_BranOutSel .DataSet.Close ;
  ds_BranInArt  .DataSet.Close ;
  ds_BranOutArt .DataSet.Close ;
{  if assigned ( F_Structure )
  and F_Structure.Visible Then
    F_Structure.p_AvantPost ;}
end;

procedure TM_DmCompose.zq_TempAfterOpen(DataSet: TDataSet);
begin
  if assigned ( DataSet.FindField ( 'ARDE_Prix' )) Then
    TNumericField ( DataSet.FindField ( 'ARDE_Prix' )).DisplayFormat := U_CST_format_money_1 ;
  if assigned ( DataSet.FindField ( 'ARDE_Prixfutur' )) Then
    TNumericField ( DataSet.FindField ( 'ARDE_Prixfutur' )).DisplayFormat := U_CST_format_money_1 ;

end;

procedure TM_DmCompose.zq_ComporteBeforeOpen(DataSet: TDataSet);
begin
  if zq_ArbreArt.Active
  and ( zq_ArbreArt.FieldByName ( 'ARDE_Table' ).AsString = 'STRUCTURE_LIEE' ) Then
    Begin
      zq_Comporte.Params.FindParam ( 'groupe' ).Value := zq_ArbreArt.FieldValues [ 'ARDE_Table_Clep' ];
    End
  Else
    zq_Comporte.Params.FindParam ( 'groupe' ).Value := '' ;

end;

procedure TM_DmCompose.zq_SelectStruBeforeOpen(DataSet: TDataSet);
begin
  if zq_ArbreArt.Active
  and ( zq_ArbreArt.FieldByName ( 'ARDE_Table' ).AsString = 'STRUCTURE_LIEE' ) Then
    Begin
      zq_SelectStru.Params.FindParam ( 'groupe' ).Value := zq_ArbreArt.FieldValues [ 'ARDE_Table_Clep' ];
    End
  Else
    zq_SelectStru.Params.FindParam ( 'groupe' ).Value := '' ;

end;

procedure TM_DmCompose.zq_ArbreArtAfterOpen(DataSet: TDataSet);
begin
  if assigned ( DataSet.FindField ( 'ARDE_Prix' )) Then
    TNumericField ( DataSet.FieldByName ( 'ARDE_Prix' )).DisplayFormat := U_CST_format_money_1 ;
  if assigned ( F_ComposeArticle )
  and F_ComposeArticle.Visible Then
    F_ComposeArticle.p_ArbreOpen;

end;

procedure TM_DmCompose.zq_ComposeAfterOpen(DataSet: TDataSet);
begin
  if assigned ( DataSet.FindField ( 'ARDE_Prix' )) Then
    TNumericField ( DataSet.FindField ( 'ARDE_Prix' )).DisplayFormat := U_CST_format_money_1 ;
  if assigned ( DataSet.FindField ( 'ARDE_Prixfutur' )) Then
    TNumericField ( DataSet.FindField ( 'ARDE_Prixfutur' )).DisplayFormat := U_CST_format_money_1 ;

end;

procedure TM_DmCompose.zq_StructureAfterPost(DataSet: TDataSet);
begin
//  zq_Structure.UpdateBatch ( arAll );
  Exit ;
  zq_ArbrDevi.Open ;
  ds_BranInBran .DataSet.Open  ;
  ds_BranOutBr  .DataSet.Open  ;
  ds_BranInComp .DataSet.Open  ;
  ds_BranOutCom .DataSet.Open  ;
  ds_BranInSel  .DataSet.Open  ;
  ds_BranOutSel .DataSet.Open  ;
  ds_BranInArt  .DataSet.Open  ;
  ds_BranOutArt .DataSet.Open  ;

end;


procedure TM_DmCompose.zq_CompCoulNewRecord(DataSet: TDataSet);
begin
  Dataset.FieldByName ( CST_COFI_Choixfinit ).Value := 4 ;

end;

procedure TM_DmCompose.zq_composantAfterOpen(DataSet: TDataSet);
begin
  TNumericField (zq_composant.FieldByName('COMP_Prixactuel')).DisplayFormat := U_CST_format_money_1 ;
  TNumericField (zq_composant.FieldByName('COMP_Prixfutur')).DisplayFormat := U_CST_format_money_1 ;
  TNumericField (zq_composant.FieldByName('COMP_Cubage')).DisplayFormat := U_CST_format_money_1 ;
  TNumericField (zq_composant.FieldByName('COMP_Coefcubage')).DisplayFormat := U_CST_format_money_1 ;
  TNumericField (zq_composant.FieldByName('COMP_Poids')).DisplayFormat := U_CST_format_money_1 ;

end;

procedure TM_DmCompose.zq_composantAfterScroll(DataSet: TDataSet);
begin
//  F_Composant.Lb_datecreation.Caption := FormatDateTime(U_CST_format_date_2,M_Donn.ds_Composant.DataSet.FieldByName('COMP_Datecreation').AsDateTime);

end;

procedure TM_DmCompose.zq_composantNewRecord(DataSet: TDataSet);
begin
  zq_composant.FieldByName('COMP_Indicspecial').Value := False;
  zq_composant.FieldByName('COMP_Datecreation').Value := Date;
  zq_composant.FieldByName('COMP_Declasse'    ).Value := False ;

end;

procedure TM_DmCompose.zq_BranOutBrFilterRecord(DataSet: TDataSet;
  var Accept: Boolean);
begin
  if assigned ( F_Structure )
  and F_Structure.Visible Then
    with F_Structure do
      Accept := fb_DatasetFilterLikeRecord ( Dataset.FieldByName ( lsv_BrancheOut.DataKeyUnit ).AsString, ed_FiltreBr.Text, True );

end;

procedure TM_DmCompose.zq_ComOutBranFilterRecord(DataSet: TDataSet;
  var Accept: Boolean);
begin
  if assigned ( F_Structure )
  and F_Structure.Visible Then
    with F_Structure do
      Accept := fb_DatasetFilterLikeRecord ( Dataset.FieldByName ( lsv_CompoOut.DataKeyUnit ).AsString, ed_FiltreComp.Text, True );

end;

procedure TM_DmCompose.zq_CompOutBraFilterRecord(DataSet: TDataSet;
  var Accept: Boolean);
begin
  if assigned ( F_Structure )
  and F_Structure.Visible Then
    with F_Structure do
      Accept := fb_DatasetFilterLikeRecord ( Dataset.FieldByName ( lsv_ComporteOut.DataKeyUnit ).AsString, ed_FiltreAction.Text, True );

end;

procedure TM_DmCompose.zq_ComsOutBraFilterRecord(DataSet: TDataSet;
  var Accept: Boolean);
begin
  if assigned ( F_Structure )
  and F_Structure.Visible Then
    with F_Structure do
      Accept := fb_DatasetFilterLikeRecord ( Dataset.FieldByName ( lsv_SelectionOut.DataKeyUnit ).AsString, ed_FiltreSelect.Text, True );

end;

procedure TM_DmCompose.zq_ArtOutBranFilterRecord(DataSet: TDataSet;
  var Accept: Boolean);
begin
  if assigned ( F_Structure )
  and F_Structure.Visible Then
    with F_Structure do
      Accept := fb_DatasetFilterLikeRecord ( Dataset.FieldByName ( lsv_ArticleOut.DataKeyUnit ).AsString, ed_FiltreArticles.Text, True );

end;

procedure TM_DmCompose.zq_BranOutCompFilterRecord(DataSet: TDataSet;
  var Accept: Boolean);
begin
  if assigned ( F_Comportement )
  and F_Comportement.Visible Then
    with F_Comportement do
      Accept := fb_DatasetFilterLikeRecord ( Dataset.FieldByName ( lsv_ComporteOut.DataKeyUnit ).AsString, ed_FiltreStrA.Text, True );

end;

procedure TM_DmCompose.zq_BranOutSelFilterRecord(DataSet: TDataSet;
  var Accept: Boolean);
begin
  if assigned ( F_Comportement )
  and F_Comportement.Visible Then
    with F_Comportement do
      Accept := fb_DatasetFilterLikeRecord ( Dataset.FieldByName ( lsv_SelectionOut.DataKeyUnit ).AsString, ed_FiltreStrS.Text, True );

end;

procedure TM_DmCompose.zq_BrLieBrOutFilterRecord(DataSet: TDataSet;
  var Accept: Boolean);
begin
  if assigned ( F_Structure )
  and F_Structure.Visible Then
    with F_Structure do
      Accept := fb_DatasetFilterLikeRecord ( Dataset.FieldByName ( lsv_LieBrOut.DataKeyUnit ).AsString, ed_FiltreLieBr.Text, True );

end;

procedure TM_DmCompose.zq_BranOutArtFilterRecord(DataSet: TDataSet;
  var Accept: Boolean);
begin
  if assigned ( F_SeleArticle )
  and F_SeleArticle.Visible Then
    with F_SeleArticle do
      Accept := fb_DatasetFilterLikeRecord ( Dataset.FieldByName ( lsv_BrOut.DataKeyUnit ).AsString, ed_FiltreBranches.Text, True );

end;

procedure TM_DmCompose.zq_composantAfterPost(DataSet: TDataSet);
begin
  try
    {$IFNDEF FPC}
    zq_composant.UpdateBatch ;
    {$ENDIF}
    zq_Comclasse.Close ;
    zq_Comclasse.Open  ;
    zq_ComDeclas.Close ;
    zq_ComDeclas.Open ;
  finally
  End ;

end;

procedure TM_DmCompose.zq_BrSelectAfterOpen(DataSet: TDataSet);
begin
  if assigned ( F_Structure )
  and F_Structure.Visible Then
    F_Structure.p_BrSelectApresOpen ;
end;

procedure TM_DmCompose.zq_StructureAfterScroll(DataSet: TDataSet);
begin
  if assigned ( F_Structure )
  and F_Structure.Visible Then
    F_Structure.p_ApresScroll ;
end;
////////////////////////////////////////////////////////////////////////
// Procédure : p_FiltreCouleur
// Description : Filtre un query grâce à son paramètre et le champ clé à chercher
// azq_QueryFiltre : LE QUERY à filtrer
// afie_Field        : Le champ filtre
/////////////////////////////////////////////////////////////////////////

procedure TM_DmCompose.p_FiltreCouleur ( const azq_QueryFiltre : TIBQuery ; const afie_Field: TField);
begin
  if afie_Field.Value <> azq_QueryFiltre.Params [0].Value Then
    Begin
      azq_QueryFiltre.Close ;
      azq_QueryFiltre.Params [0].Value := afie_Field.Value ;
      azq_QueryFiltre.Open ;
    End ;
end;

procedure TM_DmCompose.zq_CompCoulAfterCancel(DataSet: TDataSet);
begin
  p_FiltreCouleur ( zq_CoFini, Dataset.FieldByName ( CST_COFI__FINI ));

end;

end.
