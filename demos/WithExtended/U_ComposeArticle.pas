unit U_ComposeArticle;

{$IFDEF FPC}
  {$MODE Delphi}
{$ENDIF}

interface

uses                  
{$IFNDEF FPC}
  JvExStdCtrls, RbSplitter, JvMemo, Mask,
{$ELSE}
  MaskEdit,
{$ENDIF}
  LCLType, Messages, Graphics, Controls, Classes, ExtCtrls,  Dialogs, DB, IBQuery,IBTable,IBUpdateSQL,
  U_OnFormInfoIni, StdCtrls, VirtualTrees, VirtualDBTreeEx, DBCtrls,
  ComCtrls,  JvXPButtons, Grids, DBGrids, u_framework_dbcomponents, u_extdbgrid,
  U_ExtDBNavigator, fonctions_variant, U_FormAdapt,
  SysUtils, Forms, u_framework_components, u_buttons_appli;

const CST_ARDE_Parent = 'ARDE_Parent' ;
      CST_ARDE_Table  = 'ARDE_Table' ;
      CST_ARDE_Table_clep = 'ARDE_Table_clep' ;
      CST_ARDE_Table_parent = 'ARDE_Table_parent' ;
      CST_ARDE_Clep = 'ARDE_Clep' ;
      CST_ARDE_Selection = 'ARDE_Selection' ;
      CST_ARDE_Libelle  = 'ARDE_Libelle' ;
      CST_ARDE_Prix      = 'ARDE_Prix' ;
      CST_ARDE_Prixfutur      = 'ARDE_Prixfutur' ;
      CST_TABLE_COMPOSANT  = 'STRUCTURE_COMPOSANT' ;
      CST_TABLE_STRUCTURE  = 'STRUCTURE_LIEE' ;
      CST_TABLE_ARTICLE    = 'ARTICLE' ;

type
  TF_ComposeArticle = class(TF_FormAdapt)
    pa_1: TPanel;
    SvgFormInfoIni: TOnFormInfoIni;
    pa_3: TPanel;
    vt_Compositions: TCheckVirtualDBTreeEx;
    spl_1: TSplitter;
    Panel1: TPanel;
    vt_Composant: TVirtualDBTreeEx;
    RbSplitter1: TSplitter;
    gbx_prix: TGroupBox;
    lb_pxactu: TFWLabel;
    lb_pxfutur: TFWLabel;
    ed_pxactu: TFWDBEdit;
    ed_pxfutur: TFWDBEdit;
    Panel3: TPanel;
    Panel2: TPanel;
    pa_CocheStru: TPanel;
    bt_Valide: TFWOK;
    Panel4: TPanel;
    bt_fermer: TFWClose;
    Panel5: TPanel;
    Panel6: TPanel;
    Label1: TFWLabel;
    mem_LibelleArt: TFWMemo;
    procedure F_FormDicoCreate(Sender: TObject);
    procedure vt_CompositionsChecked ( const Sender: TBaseVirtualTree;
     const Node: PVirtualNode);
    procedure vt_CompositionsRulerChecks(Sender: TBaseVirtualTree;
      Node: PVirtualNode);
    procedure F_FormDicoDestroy(Sender: TObject);
    procedure bt_ValideClick(Sender: TObject);
    procedure bt_fermerClick(Sender: TObject);
    procedure vt_CompositionsBeforeCellPaint(Sender: TBaseVirtualTree;
      TargetCanvas: TCanvas; Node: PVirtualNode; Column: TColumnIndex;
      CellRect: TRect);
    procedure F_FormDicoShow(Sender: TObject);


  private
    lt_ClesCompose : tt_TableauVariant ;
    lt_ClesVerifie : tt_TableauVariant ;
    gb_ValideDevis ,
    gb_BrancheASelectionner,
    gb_ManqueComposants,
    lb_charge    : Boolean ;
    { Déclarations privées }
    procedure vt_CompositionCheck ( const Sender : TBaseVirtualTree ;
                                    const Node   : PVirtualNode      );
    procedure vt_CompositionDevis ( const Sender : TBaseVirtualTree ;
                                    const Node   : PVirtualNode     ;
                                    // Branche ou composant
                                    const as_Branche, as_Composant : String      ;
                                    // Mode composant ou branche
                                        ab_Composant : Boolean ;
                                    // Branche trouvée
                                    var Trouve : Boolean ) ;
    procedure vt_CompositionVerifie ( const Sender : TBaseVirtualTree ;
                                      const Node   : PVirtualNode      );
    procedure p_ChargeDonnees(const Sender: TBaseVirtualTree;
      const Node: PVirtualNode);
    procedure vt_CompositionUnCheckAll(const Sender: TBaseVirtualTree;
      const Node: PVirtualNode);
    protected
  public
     // Si un composant doit être sélectionné alors on renseigne ce booléen
    gb_SelectionMixtePresente,
    gb_MauvaiseComposition,
    gb_MauvaiseStructure,
    gb_Simule : Boolean ;
    { Déclarations publiques }
    procedure p_ArbreOpen;
  end;

var
  F_ComposeArticle: TF_ComposeArticle;

implementation
uses fonctions_string, U_DmDonn, U_DmCompose, U_ConstMessage,
   math , U_DmArticle,
  fonctions_dbcomponents, fonctions_erreurs, fonctions_db,
  Variants;
CONSt U_CST_COULEUR = 'M-3';

{$IFNDEF FPC}
  {$R *.dfm}
{$ELSE}
  {$R *.lfm}
{$ENDIF}

/////////////////////////////////////////////////////////////////////////////
// Evènement   : F_FormDicoCreate
// Description : Fin de la création de la fiche
// Sender      : la fiche
/////////////////////////////////////////////////////////////////////////////
procedure TF_ComposeArticle.F_FormDicoCreate(Sender: TObject);
begin
  F_ComposeArticle := Self;
  gb_Simule := False ;
  gb_ValideDevis := False ;

end;

/////////////////////////////////////////////////////////////////////////////
// Evènement   : F_FormDicoDestroy
// Description : désaffectations à la fermeture
// Sender      : la fiche
/////////////////////////////////////////////////////////////////////////////
procedure TF_ComposeArticle.F_FormDicoDestroy(Sender: TObject);
begin
  F_ComposeArticle := nil ;

end;

/////////////////////////////////////////////////////////////////////////////
// Evènement   : F_FormDicoShow
// Description : Présentations de la fiche à l'ouverture
// Sender      : la fiche
/////////////////////////////////////////////////////////////////////////////
procedure TF_ComposeArticle.F_FormDicoShow(Sender: TObject);
begin
  // Réinitialisation
 gb_ValideDevis := False ;
  p_ArbreOpen ;
  if gb_Simule Then
    Begin
      bt_Valide.Hint := U_CST_9031 ;
    End ;
end;


/////////////////////////////////////////////////////////////////////////////
// Procédure   : p_ArbreOpen
// Description : Evènement AfterOpen du DBSources[0].Datasource de vt_Compositions
/////////////////////////////////////////////////////////////////////////////
procedure TF_ComposeArticle.p_ArbreOpen ;

begin
  if vt_Compositions.GetFirst <> nil Then
    Begin
      vt_CompositionsRulerChecks ( vt_Compositions, vt_Compositions.GetFirst );
      vt_Compositions.FullExpand ( vt_Compositions.GetFirst );
    End ;
end;

/////////////////////////////////////////////////////////////////////////////
// Procédure   : vt_CompositionCheck
// Description : Scrute vt_Compositions pour mettre à jour les données virtuelles
// Sender      : le VirtualTree
// Node        : le noeud en cours
/////////////////////////////////////////////////////////////////////////////
procedure TF_ComposeArticle.vt_CompositionCheck ( const Sender : TBaseVirtualTree ;
                                                  const Node   : PVirtualNode      );
Begin
  vt_CompositionsChecked(Sender,
  Node);
  if assigned ( Node.FirstChild ) Then
    vt_CompositionCheck(Sender,
    Node.FirstChild);
  if assigned ( Node.NextSibling ) Then
    vt_CompositionCheck(Sender,
    Node.NextSibling);
End ;

/////////////////////////////////////////////////////////////////////////////
// Procédure   : vt_CompositionDevis
// Description : Scrute vt_Compositions pour le mettre à jour en fonction des composants
// Sender      : le VirtualTree
// Node        : le noeud en cours
// as_Branche  : La branche ou le composant
// ab_Composant: Mode composant
// Trouve      : Composant trouvé ou pas
/////////////////////////////////////////////////////////////////////////////
procedure TF_ComposeArticle.vt_CompositionDevis ( const Sender : TBaseVirtualTree ;
                                                  const Node   : PVirtualNode     ;
                                                  const as_Branche, as_Composant : String ;
                                                      ab_Composant : Boolean ;
                                                  var   Trouve : Boolean ) ;
var
  ldn_Data: PDBVTData;
  ldbn_DBData: PDBNodeData;
  ls_Branche : String ;
  li_Count : Integer ;

Begin
  ldn_Data := vt_Compositions.GetNodeData ( Node );
  ldbn_DBData := vt_Compositions.GetDBNodeData ( Node );
  // L'interface de sélection ne possède pas les branches avec les codes composants
  // -> LEs branches sans enfants sont les branches à sélectionner
  if  ( vt_Compositions.GetFirstChild ( Node ) = nil )
  // Vérification supplémentaire
  and ( ldbn_DBData.DBData [ VarArrayHighBound ( ldbn_DBData.DBData, 1 )] = CST_TABLE_STRUCTURE ) Then
    Begin
      ls_Branche  := '' ;
      // On récupère la branche pour la recherche par branches
      if not ab_Composant Then
        // Mode Branches
        Begin
            ls_Branche  := ldbn_DBData.DBData [ VarArrayHighBound ( ldbn_DBData.DBData, 1 ) - 1 ] ;
        End ;
      // Sélection de la bonne branche
      If ( not ab_Composant and ( ls_Branche   = as_Branche   ) { Sécurité } and ( as_Branche   <> '' ))
      or (     ab_Composant and ( M_DmCompose.zq_ArbrDevi.Locate ( CST_ARDE_Parent + ';' + CST_ARDE_Table_Clep, VarArrayOf ( [ldn_Data.ID, as_Composant ] ), [] )) { Sécurité } and ( as_Composant <> '' )) Then
        Begin
          if Trouve Then
            gb_MauvaiseComposition := True ;
          if  not ab_Composant
          // On n'est pas sur le bon composant
          and not M_DmCompose.zq_ArbrDevi.Locate ( CST_ARDE_Parent + ';' + CST_ARDE_Table_Clep, VarArrayOf ( [ ldn_Data.ID, as_Composant ] ), [] ) Then
            Begin
              // La structure est mauvaise
              // -> Nouvelle vérification demandée pour ce composant
              gb_MauvaiseStructure := True ;
              fi_AddListe ( lt_ClesVerifie, as_Composant );
            End
          else
            if not ( Node.CheckState in [csCheckedNormal,csCheckedPressed]) Then
              Begin
                li_Count := fi_CountArrayVariant ( lt_ClesCompose );
                vt_Compositions.DoCheckClick ( Node, csCheckedNormal );
                if li_Count >= fi_CountArrayVariant ( lt_ClesCompose ) Then
                // La structure a changé :
                // des composants ont été enlevés pendant la sélection
                  gb_ManqueComposants := True ;
              End ;
          Trouve := True ;
        End  ;
    End ;
  // A mettre plus tard quand on aurau une sélection en fonction des branches des composants de la ligne
//  if Result Then
//    Exit ;
      // La sélection n'est pas essentielle : pas de gestion d'erreurs
  if assigned ( Node.FirstChild ) Then
    vt_CompositionDevis(Sender,
    Node.FirstChild, as_Branche, as_Composant, ab_Composant, Trouve );
  if assigned ( Node.NextSibling ) Then
    vt_CompositionDevis(Sender,
    Node.NextSibling, as_Branche, as_Composant, ab_Composant, Trouve );
End ;
/////////////////////////////////////////////////////////////////////////////
// Procédure   : vt_CompositionUnCheckAll
// Description : Scrute vt_Compositions pour le vider de ses composants
// Sender      : le VirtualTree
// Node        : le noeud en cours
/////////////////////////////////////////////////////////////////////////////
procedure TF_ComposeArticle.vt_CompositionUnCheckAll ( const Sender : TBaseVirtualTree ;
                                                       const Node   : PVirtualNode     );
var
  ldn_Data: PDBVTData;
  lvar_Cle : Variant ;

  ldbn_DBData: PDBNodeData;
Begin
  ldbn_DBData := ( Sender as tBaseVirtualDbTreeEx ).GetDBNodeData( Node );

  If  ( ldbn_DBData.Cancheck ) Then
  // On décoche les branches cochables
    Begin
      Node.CheckState := csUnCheckedNormal ;
      ldn_Data    := Sender.GetNodeData   ( Node );
      lvar_Cle := ldn_Data.ID ;
      fb_EffaceListe ( lt_ClesCompose, lvar_Cle );
    End ;
  //  Branches suivantes
  if assigned ( Node.FirstChild ) Then
    vt_CompositionUncheckAll(Sender,
    Node.FirstChild);
  if assigned ( Node.NextSibling ) Then
    vt_CompositionUnCheckAll(Sender,
    Node.NextSibling);
End ;
/////////////////////////////////////////////////////////////////////////////
// Procédure   : vt_CompositionVerifie
// Description : Scrute vt_Compositions pour vérifier si des noeuds à valider existent
//               Appelé à la validation
// Sender      : le VirtualTree
// Node        : le noeud en cours
/////////////////////////////////////////////////////////////////////////////
procedure TF_ComposeArticle.vt_CompositionVerifie ( const Sender : TBaseVirtualTree ;
                                                    const Node   : PVirtualNode      );
Begin
  // Noeud en mode checké à moitié = Manque un composant
  if  ( node.CheckType = ctTriStateCheckBox )
  and ( node.CheckState in [ csMixedNormal, csMixedPressed ] ) Then
    // Le message devra s'afficher
    gb_SelectionMixtePresente := True ;

  //  Branches suivantes
  if assigned ( Node.FirstChild )
  and not gb_SelectionMixtePresente Then
    vt_CompositionVerifie(Sender,
    Node.FirstChild);
  if assigned ( Node.NextSibling )
  and not gb_SelectionMixtePresente Then
    vt_CompositionVerifie(Sender,
    Node.NextSibling);
End ;

/////////////////////////////////////////////////////////////////////////////
// Procédure   : vt_CompositionChecked
// Description : Mise à jour pour le (un)check du noeud scruté
// Sender      : le VirtualTree
// Node        : le noeud en cours
/////////////////////////////////////////////////////////////////////////////
procedure TF_ComposeArticle.vt_CompositionsChecked ( const Sender: TBaseVirtualTree;
  const Node: PVirtualNode);
Var
  // Données du VirtualTreeView
  ldn_Data: PDBVTData;
  // Données du DBVirtualTreeViewEx
  ldbn_DBData: PDBNodeData;
  // Type de noeud
  ls_Type : String ;
  // clé de la pièce
  lvar_Cle : Variant ;
begin
  if not lb_charge and ( vt_Compositions.RuleApplied  or not Visible ) Then
    Exit ;
  // Récupération des données
  if assigned ( Node ) Then
    Begin
      ldn_Data    := Sender.GetNodeData   ( Node );
      ldbn_DBData := vt_Compositions.GetDBNodeData ( Node );
    End
  Else
    Begin
      Exit ;
    End ;
  // Type de noeud
  ls_Type  := ldbn_DBData.DBData [ VarArrayHighBound ( ldbn_DBData.DBData, 1 )] ;
  // clé de la pièce dans l'arbre
  lvar_Cle := ldn_Data.ID ;
  // Affectation des variable virtuelles
   if Node.CheckState in [csCheckedNormal,csCheckedPressed] Then
      Begin
        // ajoute le noeud checké
        fi_AddListe ( lt_ClesCompose, lvar_Cle );
      end
   else
        // enlève le noeud non checké
      fb_EffaceListe ( lt_ClesCompose, lvar_Cle );
  if not lb_charge Then
    p_ChargeDonnees( Sender, Node );
end;

/////////////////////////////////////////////////////////////////////////////
// Evènement   : vt_CompositionRulerChecks
// Description : Mises à jour sur le (un)check du noeud avec gestion de règles
//               Le composant VirtualDbTreeView possède déjà des propriétés de sélection
//               Pour modifier le comportement de la sélection aller dans les propriétés
// Sender      : le VirtualTree
// Node        : le noeud en cours
/////////////////////////////////////////////////////////////////////////////
procedure TF_ComposeArticle.vt_CompositionsRulerChecks(
  Sender: TBaseVirtualTree; Node: PVirtualNode);
begin
  mem_LibelleArt.Text := '' ;
  lb_charge := True ;
    vt_CompositionCheck ( vt_Compositions, vt_Compositions.GetFirst );
  lb_charge := False ;
  p_ChargeDonnees( Sender, Node );
End ;
/////////////////////////////////////////////////////////////////////////////
// Evènement   : p_ChargeDonnees
// Description : rafraîchissement des données
// Sender      : le VirtualTree
// Node        : le noeud en cours
/////////////////////////////////////////////////////////////////////////////
procedure TF_ComposeArticle.p_ChargeDonnees(
  const Sender: TBaseVirtualTree; const Node: PVirtualNode);
Var
  // Code SQL
  ls_TexteSQL ,
  ls_CodeSQL  : String ;

  // Première utilisation
//  lb_verifie      ,
  lb_PremiereFois : Boolean ;
  lnod_Tempo : PVirtualNode ;
  ldbn_DBData: PDBNodeData;
  lws_Tempo  : WideString ;
begin
  if lb_charge Then
    Exit ;
  try
    // Paramètres SQL mis à rien
    ls_CodeSQL := '' ;
    lb_PremiereFois := True ;
    // Début du script
//    fb_TableauVersSQL ( ls_TexteSQL, lt_ClesExclues, nil );
    M_DmCompose.zq_temp.Close ;
    M_DmCompose.zq_Temp.SQL.Clear ;
    M_DmCompose.zq_Temp.SQL.Add ( 'select SUM (ARDE_Prix) AS ARDE_Prix, SUM (ARDE_Prixfutur) AS ARDE_Prixfutur' );
    M_DmCompose.zq_Temp.SQL.Add ( 'from fn_mc_arbre_article_compose (''' + fs_stringDbQuote ( M_DmCompose.zq_ArbreArt.Params.FindParam ( 'ArticleC' ).Value ) + ''', 1 )' );
    M_DmCompose.zq_Temp.SQL.Add ( 'WHERE ARDE_Table = ''STRUCTURE_COMPOSANT''' );
    // Insertion des clés des arrhes si il y en a
    if fb_TableauVersSQL ( ls_TexteSQL, lt_ClesCompose, nil ) Then
   Begin
     // On ajoute pour la première fois
     if lb_PremiereFois Then
        M_DmCompose.zq_Temp.SQL.Add ( 'AND (' )
     Else
    // Sinon c'est un ou qu'il faut mettre
      M_DmCompose.zq_Temp.SQL.Add ( 'OR' );
     // plus de "et" à ajouter
     lb_PremiereFois := False ;
     // Insertion des clés
     M_DmCompose.zq_Temp.SQL.Add ( '( ' + CST_ARDE_Table + '=''' + CST_TABLE_COMPOSANT + ''' AND ' + CST_ARDE_Parent + ' IN (' + ls_TexteSQL + '))' );
   End
    Else
   Begin
     // Pas de clé alors aucun arrhes
     ls_CodeSQL := ls_CodeSQL + ' AND ( ' + CST_ARDE_Table + ' <> ''' + CST_TABLE_COMPOSANT + ''')' ;
   End ;
    // Pas de première fois veut dire qu'on a ouvert une parenthèse
    if not lb_PremiereFois Then
      M_DmCompose.zq_Temp.SQL.Add ( ')' );
{    If fb_TableauVersSQL ( ls_TexteSQL, lt_ClesExclues, nil ) Then
   Begin
     M_Donn.zq_Temp.SQL.Add ( ' AND ' + CST_ARDE_Parent + ' NOT IN (' + ls_TexteSQL + ') AND ' + CST_ARDE_Clep + ' NOT IN (' + ls_TexteSQL + ')' );
   End ;}
   // Insertion des pièces à exclure
    if ls_CodeSQL <> '' Then
      M_DmCompose.zq_Temp.SQL.Add ( ls_CodeSQL );

    // Ouverture du script
    M_DmCompose.zq_Temp.Open ;
    lb_PremiereFois := True ;
    ls_CodeSQL := '' ;
    // Début du script
//    fb_TableauVersSQL ( ls_TexteSQL, lt_ClesExclues, nil );
    M_DmCompose.zq_Compose.Close ;
    M_DmCompose.zq_Compose.SQL.Clear ;
    M_DmCompose.zq_Compose.SQL.Add ( 'select * ');
    // LEFT OUTER JOIN STRUCTURE_COMPOSANT ON ARDE_Table_clep = SCOM__COMP
    M_DmCompose.zq_Compose.SQL.Add ( 'from fn_mc_arbre_article_compose (''' + fs_stringDbQuote ( M_DmCompose.zq_ArbreArt.Params.FindParam ( 'ArticleC' ).Value ) + ''', 1 )' );
    M_DmCompose.zq_Compose.SQL.Add ( 'WHERE ARDE_Table = ''STRUCTURE_COMPOSANT''' );
    // Insertion des clés des arrhes si il y en a
  if fb_TableauVersSQL ( ls_TexteSQL, lt_ClesCompose, Null ) Then
   Begin
     // On ajoute pour la première fois : (
     if lb_PremiereFois Then
        M_DmCompose.zq_Compose.SQL.Add ( 'AND (' )
     Else
    // Sinon c'est un ou qu'il faut mettre
      M_DmCompose.zq_Compose.SQL.Add ( 'OR' );
     // plus de "et" à ajouter
     lb_PremiereFois := False ;
     // Insertion des clés
     M_DmCompose.zq_Compose.SQL.Add ( '( ' + CST_ARDE_Table + '=''' + CST_TABLE_COMPOSANT + ''' AND ' + CST_ARDE_Parent + ' IN (' + ls_TexteSQL + '))' );
   End
    Else
   Begin
     // Pas de clé alors aucun arrhes
     ls_CodeSQL := ls_CodeSQL + ' AND ( ' + CST_ARDE_Table + ' <> ''' + CST_TABLE_COMPOSANT + ''')' ;
   End ;
    // Pas de première fois veut dire qu'on a ouvert une parenthèse
    if not lb_PremiereFois Then
   M_DmCompose.zq_Compose.SQL.Add ( ')' );

{    If fb_TableauVersSQL ( ls_TexteSQL, lt_ClesExclues, nil ) Then
   Begin
     M_Donn.zq_Temp.SQL.Add ( ' AND ' + CST_ARDE_Parent + ' NOT IN (' + ls_TexteSQL + ') AND ' + CST_ARDE_Clep + ' NOT IN (' + ls_TexteSQL + ')' );
   End ;}
   // Insertion des pièces à exclure
    if ls_CodeSQL <> '' Then
       M_DmCompose.zq_Compose.SQL.Add ( ls_CodeSQL );
    // Ouverture du script
    M_DmCompose.zq_Compose.Open ;

    lnod_Tempo := vt_Compositions.GetFirst ;
    if lnod_Tempo <> nil Then
      Begin
        ldbn_DBData := vt_Compositions.GetDBNodeData( lnod_Tempo );
        mem_LibelleArt.Text := VarToStr ( ldbn_DBData.DBData [ 1 ]);
        lnod_Tempo := vt_Composant.GetFirst ;
        while lnod_Tempo <> nil do
          Begin
            ldbn_DBData := vt_Composant.GetDBNodeData( lnod_Tempo );
            lws_Tempo := VarToStr ( ldbn_DBData.DBData [ VarArrayHighBound ( ldbn_DBData.DBData, 1 )]);
            if lws_Tempo <> '' Then
              mem_LibelleArt.Text := mem_LibelleArt.Text + ' ' + lws_Tempo ;
            lnod_Tempo := vt_Composant.GetNextSibling ( lnod_Tempo );
          End ;
      End ;
   Except
      on  e: exception do
        f_GereException ( e, M_DmCompose.zq_Temp );
   End ;
  vt_Compositions.FullExpand(Node);
end;

/////////////////////////////////////////////////////////////////////////////
// Evènement   : bt_fermerClick
// Description : Fermture de la fiche
// Sender      : le bouton
/////////////////////////////////////////////////////////////////////////////
procedure TF_ComposeArticle.bt_fermerClick(Sender: TObject);
begin
  Close ;
end;

/////////////////////////////////////////////////////////////////////////////
// Evènement   : bt_ValideClick
// Description : Vérifications à la validation et affectation de l'article en mode réel
// Sender      : le bouton
/////////////////////////////////////////////////////////////////////////////
procedure TF_ComposeArticle.bt_ValideClick(Sender: TObject);
var lt_Arg : Array [ 0..1 ] of string ;
    lvar_Arti  : Variant ;
///    lvar_LIDE  : Variant ;
begin
  gb_SelectionMixtePresente := False ;
  // Vérification des noeuds à valider
  if ( vt_Compositions.GetFirst <> nil ) Then
    vt_CompositionVerifie ( vt_Compositions, vt_Compositions.GetFirst );
    // L'article composé n'est plus valide ?
  if gb_SelectionMixtePresente Then
    Begin
      lt_Arg [ 0 ] := 'L''article composé' ;
      lt_Arg [ 1 ] := 'composants' ;
      MessageDlg ( fs_RemplaceMsg ( U_CST_9028, lt_Arg ), mtWarning, [mbOK], 0 );
      Exit ;
    End ;
  // Ici l'article composé est valide
  if gb_Simule then
    // L'article composé est valide pour la simulation
    Begin
      Self.HelpContext := 9000 ;
      lt_Arg [ 0 ] := 'L''article composé' ;
      lt_Arg [ 1 ] := 'cette simulation' ;
      MessageDlg ( fs_RemplaceMsg ( U_CST_9029, lt_Arg ), mtInformation, [mbOK], 0 );
      Exit ;
    End ;
    // Il faut des composants
  if M_DmCompose.zq_Compose.Active
  and not M_DmCompose.zq_Compose.IsEmpty then
      try
        // L'article n'est peut-être pas sélectionné
        M_Article.ds_article.DataSet.Open ;
        M_Article.ds_article.DataSet.Locate ( 'ARTI_Clep' , M_DmCompose.zq_ArbreArt.Params.FindParam ( 'ArticleC' ).Value, [] );
        lvar_Arti  := M_Article.ds_article.DataSet.FieldByName ( 'ARTI_Clep' ).Value;
       // Fin de la validation
        Self.Close;
      Except
        on e: Exception do
          f_GereException ( e, M_Article.ds_article.DataSet );
      end;

end;


/////////////////////////////////////////////////////////////////////////////
// Evènement   : vt_CompositionBeforeCellPaint
// Description : Présentation des noeuds de la composition
// Sender      : le VirtualTree
// TargetCanvas : le canvas de travail
// Node        : le noeud en cours
// Column      : la colonne en cours
// CellRect    : le carré de sélection du canvas en cours
/////////////////////////////////////////////////////////////////////////////
procedure TF_ComposeArticle.vt_CompositionsBeforeCellPaint(
  Sender: TBaseVirtualTree; TargetCanvas: TCanvas; Node: PVirtualNode;
  Column: TColumnIndex; CellRect: TRect);
var
  ldbn_DBData: PDBNodeData;
begin
  // On est sur le deuxième niveau ?
      // récupération des données du noeud
  ldbn_DBData := ( Sender as tBaseVirtualDbTreeEx ).GetDBNodeData( Node );

    {
  if  (( Node.CheckState in [csCheckedNormal,csCheckedPressed ])
  and ( Node.CheckType <> ctNone ))
  or  ( Node.CheckType = ctButton) Then
    Begin
 //      TargetCanvas.Brush.Color := $00B0FFFF ;
//      vt_Compositions.Font.Style := [fsBold]

    End
  Else
    if ( Node.CheckType <> ctNone ) Then
      begin
//      TargetCanvas.Brush.Color := clWindow;
//      vt_Compositions.Font.Style := []
      end
    Else
      begin
//      TargetCanvas.Brush.Color := $00B0FFFF;
//      vt_Compositions.Font.Style := [fsBold]
      end;
     }
  If  ( ldbn_DBData.Cancheck )
  and ( Node.CheckType <> ctNone ) then
     // On peut sélectionner le noeud
    begin
      vt_Compositions.Font.Color := clBlue ;
      vt_Compositions.Font.Style := [fsBold]
    end
  else
     // On ne peut sélectionner le noeud
    begin
      vt_Compositions.Font.Color := clbLACK ;
      vt_Compositions.Font.Style := []
    end;

  // Multi-sélection à valider ( les branches du dessous vont faire la sélection et sont à valider )
  If  ( Node.CheckType =  ctTristateCheckBox )
  and  ( Node.CheckState in [csMixedNormal, csMixedPressed]) then
      begin
        vt_Compositions.NodeHeight [Node]:= 20;
        vt_Compositions.Font.Size := 10;
        // vert = en sélection
        vt_Compositions.Font.Color := clgreen ;
        vt_Compositions.Font.Style := [fsBold]

      end else
      //  la font est à réinitialiser sinon
        Begin
          vt_Compositions.Font.Size := 8;
          // vert = en sélection
          if  ( Node.CheckState in [csCheckedNormal, csCheckedPressed]) then
            vt_Compositions.Font.Color := clgreen ;
        End ;
  // Peinture en fonction du pinceau
  TargetCanvas.FillRect ( CellRect );

end;

end.
