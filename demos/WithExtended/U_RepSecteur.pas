////////////////////////////////////
// Nom Unite: U_RepSecteur
// Description : Repartition des secteurs pour les repr?sentants
// Cr?? par Microcelt le 03/03/2005
/////////////////////////
unit U_RepSecteur;

{$IFDEF FPC}
  {$MODE Delphi}
{$ENDIF}

interface

uses
  LCLType, Messages, Graphics, Controls, Classes, ExtCtrls,  Dialogs, DB, IBQuery,IBTable,IBUpdateSQL,
  U_ExtDBNavigator, Buttons, Forms, MaskEdit, DBCtrls, Grids,
  DBGrids, u_framework_dbcomponents, ComCtrls, StdCtrls, SysUtils,  TypInfo,  Variants,
  StrUtils, ToolEdit, U_FormAdapt, U_OnFormInfoIni, JvXPButtons,
  U_ExtDBGrid,U_DmDonn,U_constMessage,
  u_framework_components,u_buttons_appli;

type

  { TF_RepSecteur }

  TF_RepSecteur = class(TF_FormAdapt)
    nv_navigator: TExtDBNavigator;
    nv_saisie: TExtDBNavigator;
    pa_1: TPanel;
    pa_2: TPanel;
    pa_3: TPanel;
    pa_4: TPanel;
    pa_5: TPanel;
    pa_6: TPanel;
    SvgFormInfoIni: TOnFormInfoIni;
    spl_1: TSplitter;
    gd_RepSecteur: TExtDBGrid;
    lb_rep: TFWLabel;
    cbx_rep: TDBLookupComboBox;
    lb_dep: TFWLabel;
    lb_ville: TFWLabel;
    db_secteur: TFWDBEdit;
    cbx_dep: TComboBox;
    cbx_ville: TComboBox;
    bt_rep: TJvXpButton;
    pc_secteur: TPageControl;
    ts_secteur: TTabSheet;
    Panel1: TPanel;
    U_ExtDBNavigator1: TExtDBNavigator;
    gd_secteur: TExtDBGrid;
    Panel2: TPanel;
    Panel11: TPanel;
    bt_apercu: TFWPreview;
    Panel4: TPanel;
    bt_imprimer: TFWPrint;
    Panel7: TPanel;
    Panel8: TPanel;
    bt_fermer: TFWClose;
    procedure F_FormDicoDestroy(Sender: TObject);
    procedure F_FormDicoActivate(Sender: TObject);
    procedure cbx_depClick(Sender: TObject);
    procedure cbx_villeClick(Sender: TObject);
    procedure F_FormDicoCreate(Sender: TObject);
    procedure cbx_depKeyPress(Sender: TObject; var Key: Char);
    procedure gd_RepSecteurTitleClick(Column: TColumn);
    procedure cbx_villeKeyPress(Sender: TObject; var Key: Char);
    procedure gd_secteurFWBeforeEnter(Sender: TObject);



  private
    { D?clarations priv?es }

  public
    { D?clarations publiques }
    b_activateSecteur : boolean;
    gb_dontScrollSecteur : boolean;
    gs_depSecteur : string;
    gs_villeSecteur : string;
    gs_repSecteur : string;
    ls_dep : string;
    ls_ville : string;
    ls_RepALire :string;

    procedure p_affichageCombo;
    procedure p_initComboDep;
    procedure p_initComboVille;
    procedure p_verifDep;
    procedure p_deleteVilles;
    procedure p_deleteDep;
  end;

var
  F_RepSecteur: TF_RepSecteur;

implementation

{$IFNDEF FPC}
  {$R *.dfm}
{$ELSE}
  {$R *.lfm}
{$ENDIF}

uses U_Representant,
     fonctions_forms;


///////////////////////////////////////////////////////////////////////
// Procedure : TF_RepSecteur.F_FormDicoDestroy
// Description : Destruction de la fiche
///////////////////////////////////////////////////////////////////////
procedure TF_RepSecteur.F_FormDicoDestroy(Sender: TObject);
begin
  F_RepSecteur := nil;
end;


///////////////////////////////////////////////////////////////////////
// Procedure : F_FormDicoActivate
// Description : Ouverture du Query d'affichage des departements
///////////////////////////////////////////////////////////////////////
procedure TF_RepSecteur.F_FormDicoActivate(Sender: TObject);
begin
    //ajout des d?partements dans la combobox
    p_initComboDep;
    //initialisations
    p_affichageCombo;
    b_activateSecteur := true;
    M_Donn.zq_villeAlone.Close;
    M_Donn.zq_villeAlone.open;
end;



///////////////////////////////////////////////////////////////////////
// Procedure : TF_RepSecteur.cbx_depClick
// Description : -Remplissage de la combobox des villes associ?es au departement s?lectionn?
//               -Initialisation par d?faut du champ SECT_Codeinsee au departement s?lectionn?
///////////////////////////////////////////////////////////////////////
procedure TF_RepSecteur.cbx_depClick(Sender: TObject);
begin
    if M_Donn.zq_RepSecteur.Fields.DataSet.fieldbyname('SECT_Codeinsee').Value = cbx_dep.text then
      begin
        M_Donn.zq_RepSecteur.Cancel;
        Abort;
      end
    else
      begin
        p_initComboVille;

        if (not M_Donn.zq_RepSecteur.IsEmpty) then
          begin
            M_Donn.zq_RepSecteur.Edit;
            M_Donn.zq_RepSecteur.Fields.DataSet.fieldbyname('SECT_Codeinsee').Value := cbx_dep.text;
          end;

        cbx_ville.text := '';
      end;
end;



///////////////////////////////////////////////////////////////////////
// Procedure : TF_RepSecteur.cbx_villeClick
// Description : Initialisation par d?faut du champ SECT_Codeinsee a la ville s?lectionn?e
///////////////////////////////////////////////////////////////////////
procedure TF_RepSecteur.cbx_villeClick(Sender: TObject);
begin
  if (not M_Donn.zq_RepSecteur.IsEmpty) then
    begin
      M_Donn.zq_RepSecteur.Edit;
      M_Donn.zq_RepSecteur.Fields.DataSet.fieldbyname('SECT_Codeinsee').Value := MidBStr(cbx_ville.text, 2, 5);
    end;
end;


///////////////////////////////////////////////////////////////////////
// Procedure : TF_RepSecteur.F_FormDicoCreate
// Description : Initialisation de la fiche
///////////////////////////////////////////////////////////////////////
procedure TF_RepSecteur.F_FormDicoCreate(Sender: TObject);
begin
  F_RepSecteur := self;
end;


///////////////////////////////////////////////////////////////////////
// Procedure : TF_RepSecteur.p_affichageCombo
// Description : Affichage des valeurs courantes dans les combobox
///////////////////////////////////////////////////////////////////////
procedure TF_RepSecteur.p_affichageCombo;
begin
   //remplissage des combobox
   if not M_Donn.zq_RepSecteur.FieldByName('SECT_Codeinsee').IsNull then
      begin
        //affichage du texte dans la combo des departements
        cbx_dep.text := leftstr(M_Donn.zq_RepSecteur.FieldByName('SECT_Codeinsee').AsString,2);

        //ajout dans la combobox des villes
        p_initComboVille;

        if length(M_Donn.zq_RepSecteur.FieldByName('SECT_Codeinsee').AsString)>2 then
          begin
            M_Donn.zq_villeSearched.Close;
            M_Donn.zq_villeSearched.Params.ParamByName('ville').Value := M_Donn.zq_RepSecteur.FieldByName('SECT_Codeinsee').AsString;
            M_Donn.zq_villeSearched.open;
            cbx_ville.text := M_Donn.zq_villeSearched.FieldByName('ville').AsString;
          end;
      end
   else
      begin
        cbx_dep.text := '';
        cbx_ville.text := '';
      end;
end;


///////////////////////////////////////////////////////////////////////
// Procedure : TF_RepSecteur.p_initComboDep
// Description : Vidage puis Remplissage de la combo des d?partements
///////////////////////////////////////////////////////////////////////
procedure TF_RepSecteur.p_initComboDep;
begin
    cbx_dep.Clear;
    M_Donn.zq_dep.Open;
    M_Donn.zq_dep.first;
    while not M_Donn.zq_dep.Eof do
      begin
        //ajout dans la combobox des villes
        cbx_dep.AddItem(M_Donn.zq_dep.fieldbyname('dep').asString,nil);
        M_Donn.zq_dep.Next;
      end;
    M_Donn.zq_dep.Close;
end;


///////////////////////////////////////////////////////////////////////
// Procedure : TF_RepSecteur.p_initComboVille
// Description : Remplissage de la combo des villes
///////////////////////////////////////////////////////////////////////
procedure TF_RepSecteur.p_initComboVille;
begin
  //remplissage de la combo des villes si necesssaire
  cbx_ville.Clear;

  //Reinitialisation de l'affichage
  if not M_Donn.zq_RepSecteur.FieldByName('SECT_Codeinsee').isnull then
    begin
      if length(M_Donn.zq_RepSecteur.FieldByName('SECT_Codeinsee').AsString)=5 then
        begin
          M_Donn.zq_villeSearched.close;
          M_Donn.zq_villeSearched.Params.ParamByName('ville').Value := M_Donn.zq_RepSecteur.FieldByName('SECT_Codeinsee').AsString;
          M_Donn.zq_villeSearched.open;
          cbx_ville.Text := M_Donn.zq_villeSearched.FieldByName('Ville').AsString;
        end
    end;

  //M_Donn.zq_villeInDep.Close;
  M_Donn.zq_villeInDep.Params.ParamByName('dep').Value := cbx_dep.text;
  M_Donn.zq_villeInDep.open;
  M_Donn.zq_villeInDep.first;
  while not M_Donn.zq_villeInDep.Eof do
    begin
      //ajout dans la combobox des villes
      cbx_ville.AddItem(M_Donn.zq_villeInDep.fieldbyname('villes').asString,nil);
      M_Donn.zq_villeInDep.Next;
    end;
  if M_Donn.zq_villeInDep.RecordCount >25 then
    begin
      cbx_ville.DropDownCount := 25;
    end
  else
    begin
      cbx_ville.DropDownCount :=  M_Donn.zq_villeInDep.RecordCount;
    end;
  M_Donn.zq_villeInDep.close;

end;


///////////////////////////////////////////////////////////////////////
// Procedure : TF_RepSecteur.p_verifDep
// Description : Verif que le departement n'est pas deja selectionn? pour un autre repr?sentant
///////////////////////////////////////////////////////////////////////
procedure TF_RepSecteur.p_verifDep;
begin
  if length(M_Donn.zq_RepSecteur.FieldByName('SECT_Codeinsee').AsString) =2 then
    begin
    if (M_Donn.zq_RepSecteur.State in [dsInsert, dsEdit]) then
      begin
       M_Donn.zq_depSearched.close;
       M_Donn.zq_depSearched.Params.ParamByName('dep').Value := M_Donn.zq_RepSecteur.FieldByName('SECT_Codeinsee').AsString;
       M_Donn.zq_depSearched.open;
       if( not M_Donn.zq_depSearched.IsEmpty) then
        begin
          MessageDlg(U_CST_9030, mtWarning, [mbOk], 0);
          //Re?affichage dans la combobox
          cbx_dep.Text := gs_depSecteur;
          //remplir ? nouveau la combo des villes
          p_initComboVille;
          //Un representant est deja assign? ? ce departement
          M_Donn.zq_RepSecteur.Cancel;
          Abort;
        end;
     end;
  end;
end;

///////////////////////////////////////////////////////////////////////
// Procedure : TF_RepSecteur.cbx_depKeyUp
// Description : Evite que l'utilisateur ?crive n'importe quoi
///////////////////////////////////////////////////////////////////////
procedure TF_RepSecteur.cbx_depKeyPress(Sender: TObject; var Key: Char);
begin
Key := #0;
end;


///////////////////////////////////////////////////////////////////////
// Procedure : TF_RepSecteur.cbx_depKeyUp
// Description : Evite que l'utilisateur ?crive n'importe quoi
///////////////////////////////////////////////////////////////////////
procedure TF_RepSecteur.cbx_villeKeyPress(Sender: TObject; var Key: Char);
begin
  Key := #0;
end;

procedure TF_RepSecteur.gd_secteurFWBeforeEnter(Sender: TObject);
begin

end;


///////////////////////////////////////////////////////////////////////
// Procedure : TF_RepSecteur.gd_RepSecteurTitleClick
// Description : Reaffichage dans les combobox
///////////////////////////////////////////////////////////////////////
procedure TF_RepSecteur.gd_RepSecteurTitleClick(Column: TColumn);
begin
  p_affichageCombo;
  gs_depSecteur := M_Donn.zq_RepSecteur.FieldByName('SECT_Codeinsee').AsString;
end;


///////////////////////////////////////////////////////////////////////
// Procedure : TF_RepSecteur.deleteVilles
// Description : si on ajoute un couple RepresentantX-DepartementX
//                ,il faut supprimer les couples RepresentantX-VillesDuDepartementX
///////////////////////////////////////////////////////////////////////
procedure TF_RepSecteur.p_deleteVilles;
var dep,rep : String;
begin
  //init
  dep :=  gs_depSecteur;
  rep :=  gs_repSecteur;
  gb_dontScrollSecteur := true; //Sert a eviter l'appel de la procedure zq_rep.AfterScroll  POUR : M_Donn.zq_RepSecteur.close;   M_Donn.zq_RepSecteur.open;
  //suppression
  M_Donn.zq_deleteVille.Close;
  M_Donn.zq_deleteVille.Params.ParamByName('dep').Value := dep;
  M_Donn.zq_deleteVille.Params.ParamByName('rep').Value := rep;
  M_Donn.zq_deleteVille.ExecSQL;
      //rafraichissment du DBSources[0].Datasource
      M_Donn.zq_RepSecteur.close;
      M_Donn.zq_RepSecteur.open;
      //relocate sur l'enregistrement
      M_Donn.zq_RepSecteur.Locate('SECT__REPR;SECT_Codeinsee',VarArrayOf([rep, dep]),[]);
  gb_dontScrollSecteur := false;
end;


///////////////////////////////////////////////////////////////////////
// Procedure : TF_RepSecteur.deleteDep
// Description : si on ajoute un couple RepresentantX-VilleX
//                ,il faut supprimer si il existe le couple RepresentantX-DepartementDeLaVilleX
///////////////////////////////////////////////////////////////////////
procedure TF_RepSecteur.p_deleteDep;
var ville,rep : String;
begin
  //init
  ville :=  gs_villeSecteur;
  rep :=  gs_repSecteur;
  gb_dontScrollSecteur := true; //Sert a eviter l'appel de la procedure zq_rep.AfterScroll  POUR : M_Donn.zq_RepSecteur.close;   M_Donn.zq_RepSecteur.open;
  //suppression
  M_Donn.zq_deleteDep.Close;
  M_Donn.zq_deleteDep.Params.ParamByName('ville').Value := ville;
  M_Donn.zq_deleteDep.Params.ParamByName('rep').Value := rep;
  M_Donn.zq_deleteDep.ExecSQL;
      //rafraichissment du DBSources[0].Datasource
      M_Donn.zq_RepSecteur.close;
      M_Donn.zq_RepSecteur.open;
      //relocate sur l'enregistrement
      M_Donn.zq_RepSecteur.Locate('SECT__REPR;SECT_Codeinsee',VarArrayOf([rep, ville]),[]);
  gb_dontScrollSecteur := false;
end;

end.

