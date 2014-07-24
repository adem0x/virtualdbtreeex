///////////////////////////////////////////////////////////////////////
// Nom Unite: U_Prodrepr
// Description : Gestion des productions de base de donn?es et de package
// pour les repr?sentants
// Cr?? par Microcelt le 01/02/2005
// Modifi? le 29/03/2005
///////////////////////////////////////////////////////////////////////
unit U_Prodrepr;

{$IFDEF FPC}
  {$MODE Delphi}
{$ENDIF}

interface

uses
  LCLType, Messages, Graphics, Controls, Classes, ExtCtrls,  Dialogs, DB, IBQuery,IBTable,IBUpdateSQL,
  U_ExtDBNavigator, Buttons, Forms, MaskEdit, DBCtrls, Grids,
  DBGrids, u_framework_dbcomponents, ComCtrls, StdCtrls, SysUtils,  TypInfo,  Variants,
  StrUtils, ToolEdit, U_FormAdapt, U_OnFormInfoIni,  JvXPButtons,
  U_ExtDBGrid, U_DmDonn, fonctions_string,
  u_framework_components,u_buttons_appli, EditBtn,
  U_ConstMessage, FileCtrl, IniFiles, U_FormMainIni;

type

  { TF_Prodrepr }

  TF_Prodrepr = class(TF_FormAdapt)
    nv_navigator: TExtDBNavigator;
    ed_code: TFWDBEdit;
    ed_libelle: TFWDBEdit;
    pa_1: TPanel;
    pa_2: TPanel;
    pa_3: TPanel;
    pa_4: TPanel;
    pa_6: TPanel;
    SvgFormInfoIni: TOnFormInfoIni;
    spl_1: TSplitter;
    Panel3: TPanel;
    bt_fermer: TFWClose;
    gd_prodrepr: TExtDBGrid;
    pg_control: TPageControl;
    ts_param: TTabSheet;
    lb_servref: TFWLabel;
    lb_bddref: TFWLabel;
    lb_localisation: TFWLabel;
    Label3: TFWLabel;
    Label7: TFWLabel;
    lb_serv: TFWLabel;
    lb_bdd: TFWLabel;
    ed_bdd_travail: TEdit;
    ed_serveur_ref: TEdit;
    ed_serveur: TEdit;
    ed_bdd_ref: TEdit;
    ts_result: TTabSheet;
    RbSplitter2: TSplitter;
    gd_acces: TExtDBGrid;
    gd_travail: TExtDBGrid;
    Panel6: TPanel;
    Panel7: TPanel;
    Panel4: TPanel;
    ed_bdd_acces: TEdit;
    lb_bdd_acces: TFWLabel;
    bt_init: TFWInit;
    DirectoryListBox1: TDirectoryEdit;
    FileListBox1: TFileListBox;
    ed_location: TEdit;
    Label1: TFWLabel;
    ed_prod: TEdit;
    Label2: TFWLabel;
    ed_result: TEdit;
    procedure bt_fermerClick(Sender: TObject);
    procedure F_ProdrestCreate(Sender: TObject);
    procedure F_ProdrestClose(Sender: TObject; var Action: TCloseAction);
    procedure ed_codeChange(Sender: TObject);
    procedure bt_initClick(Sender: TObject);
    procedure F_FormDicoDestroy(Sender: TObject);
    procedure p_creationfichier(aFichier: string;aQuery: TIBQuery)  ;


  private
    { D?clarations priv?es }

  public
    { D?clarations publiques }
  end;

  const
  CST_FICHIER_AIDE = 'FDV.chm';
  CST_FICHIER_DTS = 'integrationdts.bat';
  CST_FICHIER_INI = 'MC_FDV.ini';
  CST_FICHIER_DIFFUSION_INI = 'MC_XXXX.ini';
  CST_REP_EDITION = 'Editions';
  CST_REP_BDD = 'Bdd';
  CST_REP_CHM = 'Aide';
  CST_REP_DTS = 'Dts';
  CST_REP_SQL = 'Sql';
  CST_REP_TRANSFERTDEVITRE = 'Transfert\De_Vitre\Sauve';
  CST_REP_TRANSFERTVERSVITRE = 'Transfert\Vers_Vitre\Sauve';
  CST_FICHIER_CMD_ATT = 'attache.cmd';
  CST_FICHIER_SQL_ATT = 'attache_base.sql';
  CST_FICHIER_CMD_DET = 'detache.cmd';
  CST_FICHIER_SQL_DET = 'detache_base.sql';
  CST_PARAM_BASE_ACCE = '[base_acce]';
  CST_PARAM_BASE_ACCE_FIC = '[base_acce_fic]';
  CST_PARAM_BASE_REPR = '[base_repr]';
  CST_PARAM_BASE_REPR_FIC = '[base_repr_fic]';
  CST_PARAM_SERVEUR = '[serveur]';
  CST_SUFFIXE_ACCE = '_IRBA';
  CST_SUFFIXE_REPR = '_IRBT';

  CST_CHAINE_Connexion = 'String d''acces=Provider=SQLOLEDB.1;Integrated Security=SSPI;Persist Security Info=False;Initial Catalog=[Base];Data Source=[Serveur]';


var
  F_Prodrepr: TF_Prodrepr;
  gs_bdd_acces : string;
implementation

uses fonctions_init, FileUtil, fonctions_file;

{$IFNDEF FPC}
  {$R *.dfm}
{$ELSE}
  {$R *.lfm}
{$ENDIF}

///////////////////////////////////////////////////////////////////////
// Procedure : bt_fermerClick
// Description : Fermeture de la fiche
// Arguments : Sender: TObject
///////////////////////////////////////////////////////////////////////
procedure TF_Prodrepr.bt_fermerClick(Sender: TObject);
begin
  Close;
end;


///////////////////////////////////////////////////////////////////////
// Procedure : F_ProdrestCreate
// Description : cr?ation de la fiche
// Arguments : Sender: TObject
///////////////////////////////////////////////////////////////////////
procedure TF_Prodrepr.F_ProdrestCreate(Sender: TObject);
begin
  F_Prodrepr := Self;

  {
  ed_serveur_ref.Text := fs_ArgConnectString(M_Donnees.Database.DatabaseString, 'Data Source');
  ed_bdd_ref.Text := fs_ArgConnectString(M_Donnees.Database.DatabaseString, 'Initial Catalog');
  gs_bdd_acces := fs_ArgConnectString(M_Donnees.Acces.DatabaseString, 'Initial Catalog');
  }
  ed_serveur.Text := '';
end;


///////////////////////////////////////////////////////////////////////
// Procedure : F_ProdrestClose
// Description : Fermeture de la fiche de production d'une base
// Arguments : Sender: TObject
///////////////////////////////////////////////////////////////////////
procedure TF_Prodrepr.F_ProdrestClose(Sender: TObject; var Action: TCloseAction);
begin
  M_Donn.zq_prod_acces.Close;
  M_Donn.zq_prod_travail.Close;
end;

///////////////////////////////////////////////////////////////////////
// Procedure : ed_codeChange
// Description : changement du code de la base de donn?e
// Arguments : Sender: TObject
///////////////////////////////////////////////////////////////////////
procedure TF_Prodrepr.ed_codeChange(Sender: TObject);
begin
  ed_bdd_travail.Text := (Sender as TFWDBEdit).Text;
  ed_bdd_acces.Text := 'MC_Acces_Fdv_' + (Sender as TFWDBEdit).Text;
end;

///////////////////////////////////////////////////////////////////////
// Procedure : bt_initClick
// Description : Production de la base de donn?e et
// du package du repr?sentant avec l'?x?cutable, les ?ditions, l'aide,
// les fichiers .cmd et .sql pour attacher la base de donn?es
// Arguments : Sender: TObject
///////////////////////////////////////////////////////////////////////
procedure TF_Prodrepr.bt_initClick(Sender: TObject);
var
  lTs_ex: Array[0..0] of String;
  t_string: TStringList;
  ls_chemin_serveur, ls_chemin_local, ls_ficsource, ls_ficdest, ls_rep: String;
  i, l: integer;
  ls_nom, Chaine, NewFileName: String;
  NewFile, OldFile: TFileStream;
  f: TextFile;

begin
  // Contr?le champs vides
  if fb_stringVide(ed_serveur.Text) then
    begin
      pg_control.ActivePageIndex := 0;
      ed_serveur.SetFocus;
      lTs_ex[0] := 'Serveur';
      MessageDlg(fs_RemplaceMsg(U_CST_9007, lTs_ex), mtWarning, [mbOk], 0);
      Abort;
    end;

  // Contr?le champs vides
  if fb_stringVide(ed_prod.Text) then
    begin
      pg_control.ActivePageIndex := 0;
      ed_prod.SetFocus;
      lTs_ex[0] := 'R?p. de production des lots';
      MessageDlg(fs_RemplaceMsg(U_CST_9007, lTs_ex), mtWarning, [mbOk], 0);
      Abort;
    end;

  // Contr?le champs vides
  if fb_stringVide(ed_result.Text) then
    begin
      pg_control.ActivePageIndex := 0;
      ed_result.SetFocus;
      lTs_ex[0] := 'R?p d''int?gration des lots';
      MessageDlg(fs_RemplaceMsg(U_CST_9007, lTs_ex), mtWarning, [mbOk], 0);
      Abort;
    end;

    // Controle champs vides
  if fb_stringVide(ed_serveur.Text) then
    begin
      pg_control.ActivePageIndex := 0;
      ed_serveur.SetFocus;
      lTs_ex[0] := 'Serveur';
      MessageDlg(fs_RemplaceMsg(U_CST_9007, lTs_ex), mtWarning, [mbOk], 0);
      Abort;
    end;


  // recherche la localisation de la base en cours pour
  // produire la base au même endroit
  M_Donn.zq_cheminbase.Close;
  M_Donn.zq_cheminbase.Open;
  if not M_Donn.zq_cheminbase.IsEmpty then
    ls_chemin_serveur := ExtractFilePath(M_Donn.zq_cheminbase.fieldbyname('Filename').asstring)
  else
    ls_chemin_serveur := ed_location.text;

  if not DirectoryExistsUTF8(ed_location.text) then
    begin
      if MessageDlg('Voulez vous créer le répertoire '+ed_location.text, mtConfirmation, [mbYes,mbNo],  0) = mryes then
        ForceDirectoriesUTF8(ed_location.text)
      else
  end;
   
  // les fichier d'attache de la base de données
  // cr?tion du r?pertoire s'il nexiste pas
  if not DirectoryExistsUTF8(ed_location.text + '\' + CST_REP_BDD  ) then
    ForceDirectoriesUTF8(ed_location.text + '\' + CST_REP_BDD );

  // Production de la base access
  Screen.Cursor := crHourGlass;
  M_Donn.zq_prod_acces.Close;
  M_Donn.zq_prod_acces.Params.ParamByName('serveur').Value := ed_serveur.Text;
  M_Donn.zq_prod_acces.Params.ParamByName('bdd').Value := ed_bdd_acces.Text ;
  M_Donn.zq_prod_acces.Params.ParamByName('serveur_ref').Value := ed_serveur_ref.Text;
  M_Donn.zq_prod_acces.Params.ParamByName('bdd_ref').Value := ed_bdd_ref.Text;
  M_Donn.zq_prod_acces.Params.ParamByName('location').Value := ed_location.text + '\' + CST_REP_BDD ;
  M_Donn.zq_prod_acces.Params.ParamByName('representant').Value := M_Donn.zq_repr.Fields[0].AsString;
  M_Donn.zq_prod_acces.Params.ParamByName('bdd_acces').Value := gs_bdd_acces;
  M_Donn.zq_prod_acces.Params.ParamByName('bdd_travail').Value := ed_code .Text;
  M_Donn.zq_prod_acces.Open;

  // Production de la base de travail
  M_Donn.zq_prod_travail.Close;
  M_Donn.zq_prod_travail.Params.ParamByName('serveur').Value := ed_serveur.Text;
  M_Donn.zq_prod_travail.Params.ParamByName('bdd').Value := ed_bdd_travail .Text;
  M_Donn.zq_prod_travail.Params.ParamByName('serveur_ref').Value := ed_serveur_ref.Text;
  M_Donn.zq_prod_travail.Params.ParamByName('bdd_ref').Value := ed_bdd_ref.Text;
  M_Donn.zq_prod_travail.Params.ParamByName('location').Value := ed_location.text + '\' + CST_REP_BDD ;
  M_Donn.zq_prod_travail.Params.ParamByName('representant').Value := M_Donn.zq_repr.Fields[0].AsString;
  M_Donn.zq_prod_travail.Params.ParamByName('prod').Value := ed_prod.Text;
  M_Donn.zq_prod_travail.Params.ParamByName('result').Value := ed_result.Text;

  M_Donn.zq_prod_travail.Open;  

  // copie de l'ex?cutable
  ls_ficsource := Application.ExeName;
  ls_ficdest := ed_location.text +'\' + ExtractFileName(Application.ExeName);
  fb_CopyFile( ls_ficsource,ls_ficdest,False);


  // Cr?ation du fichier FDV.ini ? l'aide de la fonction sql fn_fichier_ini_access
  M_Donn.zq_ini_access.Close;
  M_Donn.zq_ini_access.Params.ParamByName('serveur').Value := ed_serveur .Text;
  M_Donn.zq_ini_access.Params.ParamByName('baseaccess').Value := ed_bdd_acces.Text;
  M_Donn.zq_ini_access.Open;
  if not M_Donn.zq_ini_access.IsEmpty then
    p_creationfichier(ed_location.text +'\' + CST_FICHIER_INI, M_Donn.zq_ini_access);


  ls_rep := gs_aide;
  if Pos(CST_FICHIER_AIDE, ls_rep) > 0  then
  ls_rep := LeftStr(ls_rep , Length(ls_rep) - (Length(CST_FICHIER_AIDE)+1));
  // copie de l'aide de l'outil
  if not DirectoryExistsUTF8(ed_location.text + '\' + ls_rep ) { *Converted from DirectoryExists*  }then
    ForceDirectoriesUTF8(ed_location.text + '\' +ls_rep ); { *Converted from ForceDirectories*  }

  ls_ficsource := ExtractFilePath(Application.ExeName) + ls_rep + '\' + CST_FICHIER_AIDE;
  ls_ficdest := ed_location.text +'\'+ ls_rep + '\' + CST_FICHIER_AIDE;
  fb_CopyFile(ls_ficsource,ls_ficdest,False);

  // copie des ?ditions
  // cr?ation du r?pertoire s'il n'existe pas
  if not DirectoryExistsUTF8(ed_location.text + '\' + CST_REP_EDITION  ) { *Converted from DirectoryExists*  }then
    ForceDirectoriesUTF8(ed_location.text + '\' + CST_REP_EDITION ); { *Converted from ForceDirectories*  }

  // on positionne l'objet DirectoryListBox1 sur le r?pertoire des ?ditions que l'on veut copier
  DirectoryListBox1.Directory := ExtractFilePath(Application.ExeName) + '\' + CST_REP_EDITION ;

  // toutes les ?ditions sont list?es dans l'objet FileListBox1
  // que l'on copie dans le package du repr?sentant
  FileListBox1.Update;
  for i := 0 to FileListBox1.Count - 1 do
    begin
      Chaine := FileListBox1.Items[i];
      if (ExtractFileExt(Chaine) = '.dot') or (ExtractFileExt(Chaine) = '.rpt') then
        begin
          OldFile := TFileStream.Create(Chaine, fmOpenRead or fmShareDenyWrite);
          NewFileName := ed_location.text + '\' + CST_REP_EDITION + '\' + ExtractFileName(Chaine);

          try
            NewFile := TFileStream.Create(NewFileName, fmCreate or fmShareDenyRead);
            try
              NewFile.CopyFrom(OldFile, OldFile.Size);
            finally
              FreeAndNil(NewFile);
            end;
          finally
            FreeAndNil(OldFile);
          end;
      end;
    end;
  FileListBox1.Update;

  // les fichier d'attache de la base de donn?es
  // cr?tion du r?pertoire s'il nexiste pas
  if not DirectoryExistsUTF8(ed_location.text + '\' + CST_REP_BDD  ) { *Converted from DirectoryExists*  }then
    ForceDirectoriesUTF8(ed_location.text + '\' + CST_REP_BDD ); { *Converted from ForceDirectories*  }


  // Cr?ation du fichier attache_base.sql
  // on d?termine le nom logique des fichiers des base
  if Length(ed_code.Text) >= 10 then
    ls_nom := LeftStr(ed_code.Text,10)
  else
  begin
    ls_nom := ed_code.Text;
    for l:= 0 To (9-Length(ed_code.Text)) do
      ls_nom := ls_nom +'_';
  end;

  // Fran?ois 18/10/2005 suppression du fichier sql
  // tout est fait dans le fichier cmd (suite ? une demande de seb)
  {M_Donn.zq_attache_base.Close;
  M_Donn.zq_attache_base.Params.ParamByName('baseaccess').Value := ed_bdd_acces.Text;
  M_Donn.zq_attache_base.Params.ParamByName('baserepr').Value := ed_bdd_travail.Text;
  M_Donn.zq_attache_base.Params.ParamByName('baseficaccess').Value := ls_nom + CST_SUFFIXE_ACCE;
  M_Donn.zq_attache_base.Params.ParamByName('baseficrepr').Value := ls_nom + CST_SUFFIXE_REPR;
  M_Donn.zq_attache_base.Open;
  if not M_Donn.zq_attache_base.IsEmpty then
    p_creationfichier(ed_location.text + '\' + CST_REP_BDD + '\' + CST_FICHIER_SQL_ATT , M_Donn.zq_attache_base);}

  // Cr?ation du fichier attache.cmd.
  M_Donn.zq_attache_cmd.Close;
  M_Donn.zq_attache_cmd.Params.ParamByName('serveur').Value := ed_serveur .Text;
  M_Donn.zq_attache_cmd.Open;
  if not M_Donn.zq_attache_cmd.IsEmpty then
    p_creationfichier(ed_location.text + '\' + CST_REP_BDD + '\' + CST_FICHIER_CMD_ATT, M_Donn.zq_attache_cmd);

  // Fran?ois 18/10/2005 suppression du fichier sql
  // tout est fait dans le fichier cmd (suite ? une demande de seb)
  // Cr?ation du fichier detache_base.sql
  {M_Donn.zq_detache_base.Close;
  M_Donn.zq_detache_base.Params.ParamByName('baseaccess').Value := ed_bdd_acces.Text;
  M_Donn.zq_detache_base.Params.ParamByName('baserepr').Value := ed_bdd_travail.Text;
  M_Donn.zq_detache_base.Open;
  if not M_Donn.zq_detache_base.IsEmpty then
    p_creationfichier(ed_location.text + '\' + CST_REP_BDD + '\' + CST_FICHIER_SQL_DET, M_Donn.zq_detache_base);}

  // Cr?ation du fichier detache.cmd.
  M_Donn.zq_detache_cmd.Close;
  M_Donn.zq_detache_cmd.Params.ParamByName('serveur').Value := ed_serveur .Text;
  M_Donn.zq_detache_cmd.Open;
  if not M_Donn.zq_detache_cmd.IsEmpty then
    p_creationfichier(ed_location.text + '\' + CST_REP_BDD + '\' + CST_FICHIER_CMD_DET , M_Donn.zq_detache_cmd);

  // copie des lots dts
  // cr?ation du r?pertoire s'il n'existe pas
  if not DirectoryExistsUTF8(ed_location.text + '\' + CST_REP_DTS   ) { *Converted from DirectoryExists*  }then
    ForceDirectoriesUTF8(ed_location.text + '\' + CST_REP_DTS ); { *Converted from ForceDirectories*  }

  // on positionne l'objet DirectoryListBox1 sur le r?pertoire des ?ditions que l'on veut copier
  DirectoryListBox1.Directory := ExtractFilePath(Application.ExeName) + '\' + CST_REP_DTS ;

  // tous les fichiers du r?pertoire DTS sont list?s dans l'objet FileListBox1
  // que l'on copie dans le r?pertoire DTS du package du repr?sentant
  FileListBox1.Update;
  for i := 0 to FileListBox1.Count - 1 do
    begin
      Chaine := FileListBox1.Items[i];
      OldFile := TFileStream.Create(Chaine, fmOpenRead or fmShareDenyWrite);
      NewFileName := ed_location.text + '\' + CST_REP_DTS + '\' + ExtractFileName(Chaine);

      try
        NewFile := TFileStream.Create(NewFileName, fmCreate or fmShareDenyRead);
        try
          NewFile.CopyFrom(OldFile, OldFile.Size);
        finally
          FreeAndNil(NewFile);
        end;
      finally
        FreeAndNil(OldFile);
      end;
    end;
  FileListBox1.Update;



  // Cr?ation du fichier integration_dts.bat (ne sert plus Fran?ois le 19/10/2005)
  {M_Donn.zq_dts.Close;
  M_Donn.zq_dts.Open;

  if not M_Donn.zq_dts.IsEmpty then
    p_creationfichier(ed_location.text + '\' + CST_REP_DTS + '\' + CST_FICHIER_DTS, M_Donn.zq_dts);}


  // copie des fichiers du r?pertoire SQL
  // cr?ation du r?pertoire s'il n'existe pas
  if not DirectoryExistsUTF8(ed_location.text + '\' + CST_REP_SQL   ) { *Converted from DirectoryExists*  }then
    ForceDirectoriesUTF8(ed_location.text + '\' + CST_REP_SQL ); { *Converted from ForceDirectories*  }

  // on positionne l'objet DirectoryListBox1 sur le r?pertoire SQL que l'on veut copier
  DirectoryListBox1.Directory := ExtractFilePath(Application.ExeName) + '\' + CST_REP_SQL ;

  // toutes les fichiers du r?pertoire SQL sont list?s dans l'objet FileListBox1
  // que l'on copie dans le r?pertoire SQL du package du repr?sentant
  FileListBox1.Update;
  for i := 0 to FileListBox1.Count - 1 do
    begin
      Chaine := FileListBox1.Items[i];
      OldFile := TFileStream.Create(Chaine, fmOpenRead or fmShareDenyWrite);
      NewFileName := ed_location.text + '\' + CST_REP_SQL + '\' + ExtractFileName(Chaine);

      try
        NewFile := TFileStream.Create(NewFileName, fmCreate or fmShareDenyRead);
        try
          NewFile.CopyFrom(OldFile, OldFile.Size);
        finally
          FreeAndNil(NewFile);
        end;
      finally
        FreeAndNil(OldFile);
      end;
    end;
  FileListBox1.Update;

  // cr?ation des r?pertoires de transfert.
  if not DirectoryExistsUTF8(ed_location.text + '\' + CST_REP_TRANSFERTDEVITRE  ) { *Converted from DirectoryExists*  }then
    ForceDirectoriesUTF8(ed_location.text + '\' + CST_REP_TRANSFERTDEVITRE ); { *Converted from ForceDirectories*  }

  if not DirectoryExistsUTF8(ed_location.text + '\' + CST_REP_TRANSFERTVERSVITRE  ) { *Converted from DirectoryExists*  }then
    ForceDirectoriesUTF8(ed_location.text + '\' + CST_REP_TRANSFERTVERSVITRE ); { *Converted from ForceDirectories*  }


  Screen.Cursor := crDefault;
  pg_control.ActivePageIndex := 1;
end;

procedure TF_Prodrepr.F_FormDicoDestroy(Sender: TObject);
begin
F_Prodrepr := nil;
end;

///////////////////////////////////////////////////////////////////////
// Procedure : p_creationfichier
// Description : Procedure qui cr??e un fichier avec les donn?es d'une requ?te SQL.
//  elle est utilis?e pour cr?er les fichiers FDV.ini, attache.cmd et attache_base.sql  et integrationdts
// Arguments : aFichier: nom du fichier ? cr?er
//             aQuery: Requ?te retournant des lignes que l'on enregistre dans le fichier
///////////////////////////////////////////////////////////////////////
procedure TF_Prodrepr.p_creationfichier(aFichier: string;aQuery: TIBQuery)  ;
var i,l: integer;
Chaine: String;
ls_nom:string;
f:TextFile;
begin

    // cr?ation du fichier
    AssignFile(f, aFichier);
    Rewrite(f);
    For i:= 0 to aQuery.RecordCount - 1  do
    begin
      // copie des lignes dans le fichier
      Chaine := aQuery.Fields[0].AsString;
      Writeln(f,Chaine);
      aQuery.Next;
    end;
    CloseFile(f);

end;

end.

