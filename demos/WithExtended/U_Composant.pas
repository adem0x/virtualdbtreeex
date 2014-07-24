///////////////////////////////////////////////////////////////////////
// Nom Unite: U_Composant
// Description : Fiche de gestion des composants
// Créé par Microcelt
// Modifié le
// 27/04/2005 : gestion de l'acces ou non aux boutons finition ou type finition
//     on ne doit pas pouvoir changer la finition qd la fiche est en lecture seule
//    + prb d'affichage des libelles en tant que controleur
// 20/07/2005 : ajout du bouton copie d'un composant
///////////////////////////////////////////////////////////////////////

unit U_Composant;

{$IFDEF FPC}
  {$MODE Delphi}
{$ENDIF}

interface

uses
{$IFNDEF FPC}
  AdvListV, RbSplitter, UltimDBGrid, RXSplit, Mask,
{$ELSE}
  MaskEdit,
{$ENDIF}
  LCLType, Messages, Graphics, Controls, Classes, ExtCtrls,  Dialogs, DB, IBQuery,IBTable,IBUpdateSQL,
  U_ExtDBNavigator, Buttons, Forms, DBCtrls, Grids,
  u_buttons_appli,u_framework_components,
  DBGrids, u_framework_dbcomponents, ComCtrls, StdCtrls, SysUtils,  TypInfo,
  Variants, StrUtils, ToolEdit, U_FormAdapt, U_OnFormInfoIni,
  JvXpButtons, U_ExtDBGrid,U_ConstMessage, U_GroupView, ImgList;

const CST_COFI_Choixfinit = 'COFI_Choixfinit' ;
      CST_COFI__TYFI      = 'COFI__TYFI' ;
      CST_COFI__FINI      = 'COFI__FINI' ;
      CST_COMP_Special    = 'COMP_Indicspecial';
type
  TF_Composant = class(TF_FormAdapt)
    nv_navigator: TExtDBNavigator;
    nv_saisie: TExtDBNavigator;
    lb_code: TFWLabel;
    lb_comm: TFWLabel;
    ed_code: TFWDBEdit;
    ed_codecom: TFWDBEdit;
    pa_1: TPanel;
    pa_2: TPanel;
    pa_3: TPanel;
    pa_4: TPanel;
    pa_5: TPanel;
    pa_Datasource: TPanel;
    SvgFormInfoIni: TOnFormInfoIni;
    spl_1: TSplitter;
    lb_lib: TFWLabel;
    gd_composant: TExtDBGrid;
    me_lib: TDBMemo;
    chbx_special: TDBCheckBox;
    lb_datecrea: TFWLabel;
    lb_datecreation: TDBText;
    DBLookupComboBox1: TDBLookupComboBox;
    Label1: TFWLabel;
    lb_pxactu: TFWLabel;
    ed_pxactuel: TFWDBEdit;
    lb_pxfutur: TFWLabel;
    ed_pxfutur: TFWDBEdit;
    ed_coefcubage: TFWDBEdit;
    lb_coef: TFWLabel;
    ed_cubage: TFWDBEdit;
    lb_cubage: TFWLabel;
    lb_poids: TFWLabel;
    ed_poids: TFWDBEdit;
    lb_special: TFWLabel;
    pc_art: TPageControl;
    ts_finition: TTabSheet;
    RbSplitter1: TSplitter;
    Panel3: TPanel;
    Panel4: TPanel;
    nv_navfinition: TExtDBNavigator;
    gd_CompCoul: TExtDBGrid;
    pa_ElFinition: TPanel;
    lb_Coul: TFWLabel;
    lb_coullib: TFWLabel;
    Label9: TFWLabel;
    nv_saisifini: TExtDBNavigator;
    bt_couleur: TButton;
    ed_coul: TFWDBEdit;
    ed_coullib: TFWDBEdit;
    rg_TypeCoul: TDBRadioGroup;
    RbSplitter2: TSplitter;
    ed_Libcom: TFWDBEdit;
    Label2: TFWLabel;
    cbx_TypeFinition: TDBLookupComboBox;
    lb_TypeFinition: TFWLabel;
    ed_LibCoul: TFWDBEdit;
    lb_LibCoul: TFWLabel;
    bt_TypFini: TButton;
    DBMemo1: TDBMemo;
    Label3: TFWLabel;
    cbx_declasse: TDBCheckBox;
    lb_declasse: TFWLabel;
    Panel1: TPanel;
    Panel11: TPanel;
    bt_apercu: TFWPreview;
    Panel2: TPanel;
    bt_imprimer: TFWPrint;
    Panel5: TPanel;
    Panel6: TPanel;
    dbtn_fermer: TFWClose;
    im_images: TImageList;
    bt_copiecomp: TFWCopy;
    procedure F_FormDicoCreate(Sender: TObject);
    procedure F_FormDicoClose(Sender: TObject; var Action: TCloseAction);
    procedure F_FormDicoDestroy(Sender: TObject);
    procedure rg_TypeCoulChange(Sender: TObject);
    procedure F_FormDicoDataSourceGridScroll(DataSet: TDataSet);
    procedure F_FormDicoShow(Sender: TObject);
    procedure lsv_CompoInDBOnRecorded(DataSet: TDataSet);
    procedure pc_artChanging(Sender: TObject; var AllowChange: Boolean);
    procedure bt_copiecompClick(Sender: TObject);
    procedure F_FormDicoDataDBSourcescroll(DataSet: TDataSet);

  private
    { Déclarations privées }
    ls_LabelFinition : WideString ;
    procedure p_copiecomp(as_newcode : string);

  public
    gb_Appelle   ,
    gb_Valide    : Boolean ;
    { Déclarations publiques }
  end;

var
  F_Composant: TF_Composant;

implementation

{$IFNDEF FPC}
  {$R *.dfm}
{$ELSE}
  {$R *.lfm}
{$ENDIF}

uses fonctions_string,
     unite_messages  , U_DmCompose ,
     U_DmDonn, fonctions_db ,
     fonctions_erreurs,
     fonctions_dbcomponents;

procedure TF_Composant.F_FormDicoCreate(Sender: TObject);
begin
  gb_Appelle := False ;
  gb_Valide  := False ;
  F_Composant := Self;

  ls_LabelFinition := lb_Coul.Caption ;
end;

procedure TF_Composant.F_FormDicoClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if gb_Appelle Then
    Action := caHide ;
end;

procedure TF_Composant.F_FormDicoDestroy(Sender: TObject);
begin
  F_Composant := nil ;

end;

procedure TF_Composant.rg_TypeCoulChange(Sender: TObject);
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
      ed_coul.ReadOnly := True ;
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
            lb_Coul.Caption := ls_LabelFinition + ' par déf.' ;
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

procedure TF_Composant.F_FormDicoDataSourceGridScroll(DataSet: TDataSet);
begin
  if ( rg_TypeCoul.Datasource.DataSet.FieldByName ( CST_COFI_Choixfinit ).IsNull ) Then
    Begin
      bt_TypFini      .Visible := False ;
      bt_couleur.Visible := False ;
      ed_coul.ReadOnly := True ;
    End ;
  ed_Libcoul.Visible := ed_coul.Visible ;
  lb_LibCoul.Visible := lb_Coul.Visible ;
  M_DmCompose.p_FiltreCouleur ( M_DmCompose.zq_CoFini, rg_TypeCoul.Datasource.DataSet.FieldByName ( CST_COFI__FINI ));

end;


procedure TF_Composant.F_FormDicoShow(Sender: TObject);
begin
  if rg_TypeCoul.Value = '' Then
    rg_TypeCoulChange ( rg_TypeCoul );
  M_DmCompose.zq_Comclasse.Close ;
  M_DmCompose.zq_Comclasse.Open ;
  M_DmCompose.zq_ComDeclas.Close ;
  M_DmCompose.zq_ComDeclas.Open ;
end;

procedure TF_Composant.lsv_CompoInDBOnRecorded(DataSet: TDataSet);
begin
  fb_RefreshDataset ( M_DmCompose.zq_Composant );
end;

procedure TF_Composant.pc_artChanging(Sender: TObject;
  var AllowChange: Boolean);
begin
  if pc_art.ActivePage = ts_finition Then
    try
      if rg_TypeCoul.Datasource.DataSet.State in [ dsInsert, dsEdit ] Then
        rg_TypeCoul.Datasource.DataSet.Post ;
    Except
      on e: Exception do
        Begin
          f_GereException( e, rg_TypeCoul.Datasource.DataSet );
          AllowChange := False ;
        End ;
    End ;

end;

///////////////////////////////////////////////////////////////////////
// Procedure : bt_copiecompClick
// Description : Copie d'un composant en composant Special
///////////////////////////////////////////////////////////////////////
procedure TF_Composant.bt_copiecompClick(Sender: TObject);
var newcode : string;
    lt_Arg : Array [ 0..1 ] of string ;
begin
  lt_Arg [ 0 ] := 'ce composant' ;

  // le code a copier ne doit pas depasser 10 caractere car on en rajoute 2
  if length(trim(M_DmCompose.zq_Composant.FieldByName('COMP_Clep').AsString)) <= 10 then
  begin
    M_DmCompose.zq_code_copiecomp.Close;
    M_DmCompose.zq_code_copiecomp.Params.ParamByName('Clep1').Value := M_DmCompose.zq_Composant.FieldByName('COMP_Clep').AsString;
    M_DmCompose.zq_code_copiecomp.Open;

    if M_DmCompose.zq_code_copiecomp.IsEmpty then
    begin
        newcode := 'Z'+  trim(M_DmCompose.zq_code_copiecomp.Params.ParamByName('Clep1').Value) +'0';
        p_Copiecomp(newcode);
    end
    else // il y a deja des copies
    begin
      try
       newcode :=  'Z'+ trim(M_DmCompose.zq_Composant.FieldByName('COMP_Clep').AsString);
       newcode := newcode + inttostr((strtoint(M_DmCompose.zq_code_copiecomp.Fields[0].Value)+1));
      except
        // dans le cas ou l'on trouve un composant deja 'Z'+composant a copier
        // avec pour dernier caractere autre chose qu'un chiffre
        lt_Arg [ 1 ] := '';
        MessageDlg ( fs_RemplaceMsg ( U_CST_9306, lt_Arg ), mtWarning, [mbOK], 0 );
        exit;
      end;

      // le nouvo code composant est un varchar(12) max. pour le cas ou
      // le code de depart est = 10 et que lon fait plus de 10 copies
      // trop de copies serait deja faite
      if  (length(newcode) <= 12)   then
        p_Copiecomp(newcode)
      else
      begin
        lt_Arg [ 1 ] := 'Le nouveau code sera trop long.';
        MessageDlg ( fs_RemplaceMsg ( U_CST_9306, lt_Arg ), mtWarning, [mbOK], 0 );
      end;
    end;
  end
  else
  begin
    lt_Arg [ 1 ] := 'Le composant à copier a un code dépassant 10 caractères.';
    MessageDlg ( fs_RemplaceMsg ( U_CST_9306, lt_Arg ), mtWarning, [mbOK], 0 );
  end;
end;

procedure TF_Composant.p_Copiecomp(as_newcode: string);
begin
  // copie
  M_DmCompose.zq_copiecomp.Close;
  M_DmCompose.zq_copiecomp.Params.ParamByName('Cle1').Value := M_DmCompose.zq_Composant.FieldByName('COMP_Clep').AsString;
  M_DmCompose.zq_copiecomp.Params.ParamByName('Cle2').Value := as_newcode;
  M_DmCompose.zq_copiecomp.ExecSQL;

  //raffraichissement ces données et positionnement sur l'enregistrement
  M_DmCompose.zq_Composant.Close;
  M_DmCompose.zq_Composant.Open;
  M_DmCompose.zq_Composant.Locate('COMP_Clep',as_newcode,[]);

  MessageDlg ( U_CST_9033, mtWarning, [mbOK], 0 );
end;

procedure TF_Composant.F_FormDicoDataDBSourcescroll(DataSet: TDataSet);
begin
  // rafraichissement des données couleurs - utile pour la copie de composant
  M_DmCompose.zq_CompCoul.Close;
  M_DmCompose.zq_CompCoul.Open;

  bt_copiecomp.Enabled := not (M_DmCompose.zq_Composant.FieldByName(CST_COMP_Special).AsBoolean);

end;

end.

