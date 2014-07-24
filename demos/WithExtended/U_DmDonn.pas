unit U_DmDonn;

{$IFDEF FPC}
  {$MODE Delphi}
{$ENDIF}

interface

uses
  SysUtils,StrUtils, Classes, DB, IBQuery,IBTable,IBUpdateSQL, Forms,Dialogs,controls,fonctions_string, U_FormAdapt, U_ConstMessage ;
type
  TM_Donn = class(TDataModule)
    ds_Finition: TDataSource;
    ds_client: TDataSource;
    ds_cp: TDataSource;
    zq_cp: TIBQuery;
    zq_four: TIBQuery;
    ds_four: TDataSource;
    zq_RechcliDevis: TIBQuery;
    zq_Rechfourcomp: TIBQuery;
    zq_Rechfourarti: TIBQuery;
    ds_jalon: TDataSource;
    zq_jalon: TIBQuery;
    ds_famille: TDataSource;
    zq_famille: TIBQuery;
    zq_Finition: TIBQuery;
    ds_categ: TDataSource;
    zq_categ: TIBQuery;
    zq_modalite: TIBQuery;
    ds_modalite: TDataSource;
    zq_maj_groupe: TIBQuery;
    zq_client: TIBQuery;
    ds_Composant: TDataSource;
    zq_composant: TIBQuery;
    ds_assist: TDataSource;
    zq_assist: TIBQuery;
    ds_maxnumcod: TDataSource;
    zq_maxnumcod: TIBQuery;
    ds_repr: TDataSource;
    zq_repr: TIBQuery;
    ds_tva: TDataSource;
    zq_tva: TIBQuery;
    ds_typedevis: TDataSource;
    zq_typedevis: TIBQuery;
    ds_motifclot: TDataSource;
    zq_motifclot: TIBQuery;
    ds_fave: TDataSource;
    zq_fave: TIBQuery;
    ds_sofv: TDataSource;
    zq_sofv: TIBQuery;
    ds_ssfv: TDataSource;
    zq_ssfv: TIBQuery;
    ds_sofv_ssfv: TDataSource;
    zq_sofv_ssfv: TIBQuery;
    ds_ssfv_pvr: TDataSource;
    zq_ssfv_pvr: TIBQuery;
    ds_fave_sofv: TDataSource;
    zq_fave_sofv: TIBQuery;
    ds_ClieAffecte: TDataSource;
    ds_ClieInter: TDataSource;
    zq_Civilite: TIBQuery;
    ds_Civilite: TDataSource;
    ds_pays: TDataSource;
    ds_PaysClient: TDataSource;
    zq_CliInRepr: TIBQuery;
    ds_CliInRepr: TDataSource;
    zq_CliOutRepr: TIBQuery;
    ds_CliOutRepr: TDataSource;
    ds_clidiffin: TDataSource;
    zq_clidiffin: TIBQuery;
    zq_clidiffout: TIBQuery;
    ds_clidiffout: TDataSource;
    zq_ClieAffecte: TIBQuery;
    ds_CliDevis: TDataSource;
    ds_CliCmde: TDataSource;
    zq_CliDevis: TIBQuery;
    zq_InteFonct: TIBQuery;
    zq_AffeZone: TIBQuery;
    zq_CliCmde: TIBQuery;
    ds_ville: TDataSource;
    zq_ville: TIBQuery;
    zq_prod_travail: TIBQuery;
    zq_prod_acces: TIBQuery;
    zq_location: TIBQuery;
    zq_prod_fichiers: TIBQuery;
    ds_prod_travail: TDataSource;
    ds_prod_acces: TDataSource;
    ds_RepSecteur: TDataSource;
    zq_RepSecteur: TIBQuery;
    zq_dep: TIBQuery;
    ds_dep: TDataSource;
    ds_villeInDep: TDataSource;
    zq_villeInDep: TIBQuery;
    ds_villeSearched: TDataSource;
    zq_villeSearched: TIBQuery;
    zq_depSearched: TIBQuery;
    ds_secteur: TDataSource;
    zq_secteur: TIBQuery;
    ds_villeAlone: TDataSource;
    zq_villeAlone: TIBQuery;
    ds_filtreville: TDataSource;
    zq_filtreville: TIBQuery;
    ds_filtrecp: TDataSource;
    zq_filtrecp: TIBQuery;
    zq_deleteVille: TIBQuery;
    zq_deleteDep: TIBQuery;
    ds_typModalite: TDataSource;
    zq_typModalite: TIBQuery;
    ds_modalit: TDataSource;
    zq_modalit: TIBQuery;
    zq_updModaliteDft: TIBQuery;
    zq_devis_repr: TIBQuery;
    zq_commande_repr: TIBQuery;
    ds_cheminbase: TDataSource;
    zq_cheminbase: TIBQuery;
    zq_client_diffgen: TIBQuery;
    zq_attache_base: TIBQuery;
    zq_attache_cmd: TIBQuery;
    zq_ini_access: TIBQuery;
    ds_FinitionDeclasse: TDataSource;
    zq_FinitionDeclasse: TIBQuery;
    zq_FinitionNonDeclasse: TIBQuery;
    ds_FinitionNonDeclasse: TDataSource;
    zq_dts: TIBQuery;
    zq_detache_cmd: TIBQuery;
    zq_detache_base: TIBQuery;
    zq_Pays: TIBQuery;
    zq_ClieInter: TIBQuery;
    zq_PaysClient: TIBQuery;
    zq_TypeFini: TIBQuery;
    ds_TypeFini: TDataSource;
    zq_affe_devi: TIBQuery;
    procedure zq_clientBeforeDelete(DataSet: TDataSet);
    procedure zq_fourBeforeDelete(DataSet: TDataSet);
    procedure zq_fourNewRecord(DataSet: TDataSet);
    procedure zq_clientNewRecord(DataSet: TDataSet);
    procedure zq_clientAfterScroll(DataSet: TDataSet);
    procedure zq_composantAfterScroll(DataSet: TDataSet);
    procedure zq_categNewRecord(DataSet: TDataSet);
    procedure zq_articleNewRecord(DataSet: TDataSet);
    procedure zq_faveDeleteError(DataSet: TDataSet; E: EDatabaseError;
      var Action: TDataAction);
    procedure zq_sofvDeleteError(DataSet: TDataSet; E: EDatabaseError;
      var Action: TDataAction);
    procedure zq_ssfvDeleteError(DataSet: TDataSet; E: EDatabaseError;
      var Action: TDataAction);
    procedure zq_sofv_ssfvDeleteError(DataSet: TDataSet;
      E: EDatabaseError; var Action: TDataAction);
    procedure zq_ClieInterAfterInsert(DataSet: TDataSet);
    procedure zq_AffectePostError(DataSet: TDataSet; E: EDatabaseError;
      var Action: TDataAction);
    procedure zq_ClieInterAfterPost(DataSet: TDataSet);
    procedure zq_clientAfterPost(DataSet: TDataSet);
    procedure zq_composantNewRecord(DataSet: TDataSet);
    procedure zq_FinitionAfterOpen(DataSet: TDataSet);
    procedure zq_fourAfterOpen(DataSet: TDataSet);
    procedure zq_tvaAfterOpen(DataSet: TDataSet);
    procedure zq_articleAfterEdit(DataSet: TDataSet);
    procedure zq_composantAfterOpen(DataSet: TDataSet);
    procedure zq_CompCoulNewRecord(DataSet: TDataSet);
    procedure zq_artcoulNewRecord(DataSet: TDataSet);
    procedure zq_Article1NewRecord(DataSet: TDataSet);
    procedure zq_RepSecteurAfterScroll(DataSet: TDataSet);
    procedure zq_RepSecteurBeforePost(DataSet: TDataSet);
    procedure zq_reprAfterScroll(DataSet: TDataSet);
    procedure zq_RepSecteurAfterPost(DataSet: TDataSet);
    procedure zq_RepSecteurAfterDelete(DataSet: TDataSet);
    procedure zq_RepSecteurAfterCancel(DataSet: TDataSet);
    procedure zq_modalitAfterPost(DataSet: TDataSet);
    procedure zq_familleNewRecord(DataSet: TDataSet);
    procedure zq_clientBeforePost(DataSet: TDataSet);
    procedure Modifiezq_Clie(DataSet: TDataSet);
    procedure zq_FinitionAfterInsert(DataSet: TDataSet);
    procedure zq_clientAfterOpen(DataSet: TDataSet);
    procedure zq_ClieAffecteBeforeDelete(DataSet: TDataSet);

  private
    { D?clarations priv?es }
  public
    { D?clarations publiques }
  end;

var
  M_Donn: TM_Donn;

implementation

uses U_Client, U_Composant,
     U_SeleArticle, U_ComposeArticle, Variants , fonctions_dbcomponents,
     U_CodePostal, U_RepSecteur , U_Representant ,U_Modalite, U_Prodrepr,
     U_DmCompose,
     u_extcomponent;

{$IFNDEF FPC}
  {$R *.dfm}
{$ELSE}
  {$R *.lfm}
{$ENDIF}

procedure TM_Donn.zq_clientBeforeDelete(DataSet: TDataSet);
begin
  zq_RechcliDevis.Active := FALSE;
  zq_RechcliDevis.Params.ParamByName('client1').Value := M_Donn.ds_client.DataSet.Fields[0].AsString;
  zq_RechcliDevis.Params.ParamByName('client2').Value := M_Donn.ds_client.DataSet.Fields[0].AsString;
  zq_RechcliDevis.Params.ParamByName('client3').Value := M_Donn.ds_client.DataSet.Fields[0].AsString;

  zq_RechcliDevis.Active := TRUE;
  If zq_RechcliDevis.Fields[0].Value <> 0 then
  begin
    MessageDlg ('Impossible de supprimer ce client,'+#13+
                'il est rattach? ? un devis.',mtWarning , [mbOk], 0);
    abort;
  end ;

end;

procedure TM_Donn.zq_fourBeforeDelete(DataSet: TDataSet);
var lb_supp:boolean;
begin
  lb_supp := FALSE;

  zq_Rechfourcomp.Active := FALSE;
  zq_Rechfourcomp.Params.ParamByName('four').Value := M_Donn.ds_four.DataSet.Fields[0].AsString;
  zq_Rechfourcomp.Active := TRUE;
  If zq_Rechfourcomp.Fields[0].Value <> 0 then
    lb_supp := TRUE;

  zq_Rechfourarti.Active := FALSE;
  zq_Rechfourarti.Params.ParamByName('four').Value := M_Donn.ds_four.DataSet.Fields[0].AsString;

  zq_Rechfourarti.Active := TRUE;
  If zq_Rechfourarti.Fields[0].Value <> 0 then
    lb_supp := TRUE;

  if lb_supp then
  begin
    MessageDlg ('Impossible de supprimer ce fournisseur,'+#13+
                'il est rattach? ? un composant ou un article.',mtWarning , [mbOk], 0);
    abort;
  end ;
end;

procedure TM_Donn.zq_fourNewRecord(DataSet: TDataSet);
begin
    // affectation des valeurs par defaut
    ds_four.DataSet.Fields[1].AsString := 'fr';
end;

procedure TM_Donn.zq_clientNewRecord(DataSet: TDataSet);
begin


    // affectation des valeurs par defaut
    zq_client.Fields.DataSet.fieldbyname('CLIE__FAMI').AsInteger := 0;
    zq_client.Fields.DataSet.fieldbyname('CLIE__PAYS').AsString := 'F';
    zq_client.Fields.DataSet.fieldbyname('CLIE_Type').AsBoolean := FALSE;
    zq_client.Fields.DataSet.fieldbyname('CLIE_Datecrea').AsDatetime := now;
//    zq_client.Fields.DataSet.fieldbyname('CLIE__REPR').AsString := gs_Resto;

    if assigned(F_Client )
    and (F_Client.visible)then
       F_Client.p_ApresInsert;

end;

procedure TM_Donn.zq_clientAfterScroll(DataSet: TDataSet);
begin
//  if assigned ( F_Client )
//  and F_Client.Visible Then
//    F_Client.Lb_datecreation.Caption := FormatDateTime('d/mm/yyyy',M_Donn.ds_client.DataSet.FieldByName('CLIE_Datecrea').AsDateTime);
end;

procedure TM_Donn.zq_composantAfterScroll(DataSet: TDataSet);
begin
//  F_Composant.Lb_date.Caption := FormatDateTime('d/mm/yyyy',M_Donn.ds_Composant.DataSet.FieldByName('COMP_Datecreation').AsDateTime);
  F_Composant.Lb_datecreation.Caption := FormatDateTime(U_CST_format_date_2,M_Donn.ds_Composant.DataSet.FieldByName('COMP_Datecreation').AsDateTime);

end;

procedure TM_Donn.zq_categNewRecord(DataSet: TDataSet);
begin
  zq_categ.FieldByName('CATE_Valide').asBoolean := TRUE;
end;

procedure TM_Donn.zq_articleNewRecord(DataSet: TDataSet);
begin
  DataSet.FieldByName('ARTI_Datecrea').AsDateTime := now;
  DataSet.FieldByName('ARTI_Compose').AsBoolean  := False;
end;

procedure TM_Donn.zq_faveDeleteError(DataSet: TDataSet;
  E: EDatabaseError; var Action: TDataAction);

var lTs_mes : array[0..3] of string;
begin
    lTs_mes[0] := 'Sous famille';
    lTs_mes[1] := 'cette Famille';
    lTs_mes[2] := 'Sous famille';
    lTs_mes[3] := 'cette Famille';

    MessageDlg(fs_RemplaceMsg(U_CST_9005,lTs_mes ), mtWarning, [mbOk], 0);
end;



procedure TM_Donn.zq_sofvDeleteError(DataSet: TDataSet;
  E: EDatabaseError; var Action: TDataAction);

  var lTs_mes : array[0..3] of string;
begin
     // En cas de retour d'erreur li? a un restaurant et une DR
    lTs_mes[0] := 'Sous-sous-famille';
    lTs_mes[1] := 'cette Sous-famille';
    lTs_mes[2] := 'Sous-sous-famille';
    lTs_mes[3] := 'cette Sous-famille';

    MessageDlg(fs_RemplaceMsg(U_CST_9005,lTs_mes ), mtWarning, [mbOk], 0);


end;

procedure TM_Donn.zq_ssfvDeleteError(DataSet: TDataSet;
  E: EDatabaseError; var Action: TDataAction);

  var lTs_mes : array[0..3] of string;
begin
     // En cas de retour d'erreur li? a un restaurant et une DR
    lTs_mes[0] := 'produits de vente de regroupement';
    lTs_mes[1] := 'cette sous sous famille';
    lTs_mes[2] := 'produits de vente de regroupement';
    lTs_mes[3] := 'cette sous sous famille';

    MessageDlg(fs_RemplaceMsg(U_CST_9005,lTs_mes ), mtWarning, [mbOk], 0);

end;

procedure TM_Donn.zq_sofv_ssfvDeleteError(DataSet: TDataSet;
  E: EDatabaseError; var Action: TDataAction);
begin
  MessageDlg(U_CST_9000, mtWarning, [mbOK], 0);

end;

procedure TM_Donn.zq_ClieInterAfterInsert(DataSet: TDataSet);
begin
  zq_ClieInter.FieldByName ( 'INTE__CLIE' ).Value := zq_client.FieldByName ( 'CLIE_Clep' ).Value ;
end;

procedure TM_Donn.zq_AffectePostError(DataSet: TDataSet;
  E: EDatabaseError; var Action: TDataAction);
begin
  MessageDlg ( 'La zone ''Nom de la zone'' ne peut pas ?tre vide.' + #13 + #13
                           + 'Effectuer une saisie ou annuler.', mtWarning, [mbOk], 0)
end;
procedure TM_Donn.zq_ClieInterAfterPost(DataSet: TDataSet);
begin
  zq_InteFonct.Close ;
  Modifiezq_Clie(DataSet);
{  if assigned(F_Client) and F_Client .Visible Then
    begin
      F_Client .cbx_Inter.LookupSource.DataSet.Close ;
      F_Client .cbx_Inter.LookupSource.DataSet.Open ;
  end;
}
end;

procedure TM_Donn.zq_clientAfterPost(DataSet: TDataSet);
begin
  {$IFNDEF FPC}
  zq_client.UpdateBatch ( arAll );
  {$ENDIF}
end;

procedure TM_Donn.zq_composantNewRecord(DataSet: TDataSet);
begin
  zq_composant.FieldByName('COMP_Indicspecial').asBoolean := False;
  zq_composant.FieldByName('COMP_Datecreation').AsVariant := Date;

end;

procedure TM_Donn.zq_FinitionAfterOpen(DataSet: TDataSet);
begin
  TNumericField ( Dataset.FieldByName ( 'FINI_Txcharge' )).DisplayFormat := U_CST_format_money_1 ;
end;

procedure TM_Donn.zq_fourAfterOpen(DataSet: TDataSet);
begin
  TNumericField ( Dataset.FieldByName ( 'FOUR_Coefrefac' )).DisplayFormat := U_CST_format_money_1 ;
  TNumericField ( Dataset.FieldByName ( 'FOUR_Coefport'  )).DisplayFormat := U_CST_format_money_1 ;

end;

procedure TM_Donn.zq_tvaAfterOpen(DataSet: TDataSet);
begin
  TNumericField ( Dataset.FieldByName ( 'TTVA_Taux'  )).DisplayFormat := U_CST_format_money_1 ;

end;

procedure TM_Donn.zq_articleAfterEdit(DataSet: TDataSet);
begin
  if assigned ( F_SeleArticle )
  and F_SeleArticle.Visible Then
    F_SeleArticle.p_ApresEdit ;

end;

procedure TM_Donn.zq_composantAfterOpen(DataSet: TDataSet);
begin
  TNumericField (M_Donn.zq_composant.FieldByName('COMP_Prixactuel')).DisplayFormat := U_CST_format_money_1 ;
  TNumericField (M_Donn.zq_composant.FieldByName('COMP_Prixfutur')).DisplayFormat := U_CST_format_money_1 ;
  TNumericField (M_Donn.zq_composant.FieldByName('COMP_Cubage')).DisplayFormat := U_CST_format_money_1 ;
  TNumericField (M_Donn.zq_composant.FieldByName('COMP_Coefcubage')).DisplayFormat := U_CST_format_money_1 ;

end;

procedure TM_Donn.zq_CompCoulNewRecord(DataSet: TDataSet);
begin
  Dataset.FieldByName ( CST_COFI_Choixfinit ).Value := 4 ;
end;

procedure TM_Donn.zq_artcoulNewRecord(DataSet: TDataSet);
begin
  Dataset.FieldByName ( CST_ARFI_Choixfinit ).Value := 4 ;

end;

//*****************************
// Proc?dure: zq_paysAfterPost
// Mise ? jour affichage des clients associ?s au pays
//**************************
procedure TM_Donn.zq_Article1NewRecord(DataSet: TDataSet);
begin
  Dataset.FieldByName ( CST_ARTI_Date ).Value := FormatDateTime(U_CST_format_date_2,Now) ;
end;



procedure TM_Donn.zq_RepSecteurAfterScroll(DataSet: TDataSet);
begin
  if assigned(F_RepSecteur)
  and (F_RepSecteur.visible) then
    begin
     with F_RepSecteur do
        begin
         if not gb_dontScrollSecteur then
          begin
            if (b_activateSecteur and (not (zq_RepSecteur.State in [dsInsert]))) then
              begin
                p_affichageCombo;
                gs_depSecteur := M_Donn.zq_RepSecteur.FieldByName('SECT_Codeinsee').AsString;
              end
            else
              begin
                cbx_dep.text := '';
                cbx_ville.text := '';
              end;
          end;
        end;
    end;
end;


procedure TM_Donn.zq_RepSecteurBeforePost(DataSet: TDataSet);
begin
  if assigned(F_RepSecteur)
  and (F_RepSecteur.visible)then
    begin
      //Verif que le departement n'est pas deja selectionn? pour un autre repr?sentant
      F_RepSecteur.p_verifDep;
    end;
end;

procedure TM_Donn.zq_reprAfterScroll(DataSet: TDataSet);
begin
  if assigned(F_Repr)
  and (F_Repr.visible)then
    begin
      //initialisation du Grid des secteurs
      F_Repr.p_initSecteur;
      {
      // on r?affiche la liste des devis et des commandes du repr?sentant
      zq_devis_repr.close;
      zq_devis_repr.Params.ParamByName('coderepr').Value:=zq_repr.FieldByName('REPR_Clep').AsString;
      zq_devis_repr.open;
      zq_comm_repr.close;
      zq_comm_repr.Params.ParamByName('coderepr').Value:=zq_repr.FieldByName('REPR_Clep').AsString;
      zq_comm_repr.open;}
    end;

  if assigned(F_Prodrepr)
  and (F_Prodrepr.visible)then
    begin
      F_Prodrepr.ed_location.Text := ExtractFilePath(Application.ExeName)+'Package\'+DataSet.fieldbyname('REPR_Clep').AsString;
    end;

end;


procedure TM_Donn.zq_RepSecteurAfterPost(DataSet: TDataSet);
begin
  if not M_Donn.zq_RepSecteur.FieldByName('SECT_Codeinsee').isNull then
    begin
      if length(M_Donn.zq_RepSecteur.FieldByName('SECT_Codeinsee').AsString) = 2 then
        begin
          F_RepSecteur.gs_repSecteur := M_Donn.zq_RepSecteur.FieldByName('SECT__REPR').AsString;
          F_RepSecteur.gs_depSecteur := M_Donn.zq_RepSecteur.FieldByName('SECT_Codeinsee').AsString;
          F_RepSecteur.p_deleteVilles;
        end
      else
        begin
          F_RepSecteur.gs_repSecteur := M_Donn.zq_RepSecteur.FieldByName('SECT__REPR').AsString;
          F_RepSecteur.gs_villeSecteur := M_Donn.zq_RepSecteur.FieldByName('SECT_Codeinsee').AsString;
          F_RepSecteur.p_deleteDep;
        end;

      //ajout dans la combobox des villes
      F_RepSecteur.p_initComboVille;

      //R?initialisation de la listes des villes non assign?s a des repr?sentants
      M_Donn.zq_villeAlone.Close;
      M_Donn.zq_villeAlone.open;
    end;
end;

procedure TM_Donn.zq_RepSecteurAfterDelete(DataSet: TDataSet);
begin
  //R?initialisation de la listes des villes non assign?s a des repr?sentants
  M_Donn.zq_villeAlone.Close;
  M_Donn.zq_villeAlone.open;
end;

procedure TM_Donn.zq_RepSecteurAfterCancel(DataSet: TDataSet);
begin
    F_RepSecteur.p_affichageCombo;
end;

procedure TM_Donn.zq_modalitAfterPost(DataSet: TDataSet);
var ls_typ,ls_cle : string;
begin
   if (not M_Donn.zq_modalit.fieldbyname('MODA__TYMO').ISNULL)
      and (not M_Donn.zq_modalit.fieldbyname('MODA_Clep').ISNULL) then
        begin
          if F_Modalite.ch_Defaut.Checked then
            begin
              //initialisation de variable
              ls_typ := M_Donn.zq_modalit.fieldbyname('MODA__TYMO').value;
              ls_cle := M_Donn.zq_modalit.fieldbyname('MODA_Clep').value;
              //requete sql
              M_Donn.zq_updModaliteDft.close;
              M_Donn.zq_updModaliteDft.Params.ParamByName('typ').Value := ls_typ;
              M_Donn.zq_updModaliteDft.Params.ParamByName('cle').Value := ls_cle;
              M_Donn.zq_updModaliteDft.ExecSQL;
              //rafraichissement
              M_Donn.zq_modalit.Refresh;
              //M_Donn.zq_modalit.open;
              //M_Donn.zq_modalit.Locate('MODA__TYMO;MODA_Clep',varArrayOf([ls_typ,ls_cle]),[]);
            end;
        end;
end;

procedure TM_Donn.zq_familleNewRecord(DataSet: TDataSet);
begin
    DataSet.fieldbyname('FAMI_Valide').AsBoolean := True;
end;

procedure TM_Donn.zq_clientBeforePost(DataSet: TDataSet);
begin
    DataSet.fieldbyname('CLIE_Diffgen').AsBoolean := True;
end;

///////////////////////////////////////////////////////////////////////
// Procedure : TM_Donn.Modifiezq_Clie
// Description : Modifie la fiche client lorsque l'on modifie les interlocuteurs
// ou les affectations
// Arguments : DataSet: TDataSet
///////////////////////////////////////////////////////////////////////
procedure TM_Donn.Modifiezq_Clie(DataSet: TDataSet);
begin
  // pour mettre ? jour le champs CLIE_Diffgen (zq_clientBeforePost)
  // de la table Client qui indique la modification de la fiche client
  M_Donn.zq_client.Edit;
  M_Donn.zq_client.post;
end;

procedure TM_Donn.zq_FinitionAfterInsert(DataSet: TDataSet);
begin
  zq_Finition.FieldByName('FINI_Declasse').Value := 0;
end;

procedure TM_Donn.zq_clientAfterOpen(DataSet: TDataSet);
begin
  TNumericField ( DataSet.FieldByName('CLIE_Datecrea')).DisplayFormat := 'd/mm/yyyy' ;
end;


procedure TM_Donn.zq_ClieAffecteBeforeDelete(DataSet: TDataSet);
begin
  zq_affe_devi.Close;
  zq_affe_devi.Params.ParamByName('client').Value := zq_client.FieldByName('CLIE_Clep').Asstring;
  zq_affe_devi.Params.ParamByName('affe').Value := zq_ClieAffecte.fieldbyname('AFFE_Clep').AsInteger;
  zq_affe_devi.open;
  if not zq_affe_devi.IsEmpty then
  begin
    showmessage('Action impossible!! affectation li?e a un devis.');
    abort;
  end;
end;

end.
