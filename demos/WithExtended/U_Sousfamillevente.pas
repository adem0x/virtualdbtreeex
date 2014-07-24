unit U_Sousfamillevente;

{$IFDEF FPC}
  {$MODE Delphi}
{$ENDIF}

interface

uses
{$IFNDEF FPC}
  JvDBLookup, JvComponent, JvExControls, AdvListV, RbSplitter, RXSplit, Mask,
{$ELSE}
  MaskEdit,
{$ENDIF}
  LCLType, Messages, Graphics, Controls, Classes, ExtCtrls,  Dialogs, DB, IBQuery,IBTable,IBUpdateSQL,
  U_ExtDBNavigator, Buttons, Forms, DBCtrls, Grids,
  DBGrids, u_framework_dbcomponents, ComCtrls, StdCtrls, SysUtils,  TypInfo,  Variants,
  StrUtils, ToolEdit, U_FormAdapt, U_OnFormInfoIni,  JvXPButtons,
  u_framework_components, u_buttons_appli,
  U_ExtDBGrid,U_DmDonn, U_ConstMessage, U_GroupView,fonctions_string;

type
  TF_Sousfamillevente = class(TF_FormAdapt)
    nv_navigator: TExtDBNavigator;
    nv_saisie: TExtDBNavigator;
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
    gd_sofv: TExtDBGrid;
    lb_code: TFWLabel;
    lb_famille: TFWLabel;
    ed_famille: TFWDBLookupCombo;
    bt_sousfam: TJvXpButton;
    ct_ssfv: TPageControl;
    ts_ssfam: TTabSheet;
    RbSplitter1: TSplitter;
    Panel10: TPanel;
    Panel12: TPanel;
    Panel13: TPanel;
    Panel1: TPanel;
    Panel5: TPanel;
    bt_abandonner: TFWCancel;
    bt_enregistrer: TFWOK;
    bt_retour: TJvXpButton;
    Panel6: TPanel;
    lv_sousssfam: TDBGroupView;
    Panel2: TPanel;
    bt_in_item: TFWInSelect;
    bt_in_total: TFWInAll;
    bt_out_item: TFWOutSelect;
    bt_out_total: TFWOutAll;
    lv_transfert: TDBGroupView;
    RbSplitter2: TSplitter;
    procedure F_FormDicoCloseQuery(Sender: TObject;
      var CanClose: Boolean);
    procedure bt_sousfamClick(Sender: TObject);

  private
    { Déclarations privées }

  public
    { Déclarations publiques }
  end;

var
  F_Sousfamillevente: TF_Sousfamillevente;

implementation

uses U_Famillevente,
     fonctions_forms, fonctions_erreurs;
{$IFNDEF FPC}
  {$R *.dfm}
{$ELSE}
  {$R *.lfm}
{$ENDIF}


procedure TF_Sousfamillevente.F_FormDicoCloseQuery(Sender: TObject;
  var CanClose: Boolean);
var lTs_mes : array[0..1] of string;
begin
  // en cas d'element present dans la liste a reaffecter
  if (lv_transfert.Items.Count <> 0) then
    begin
      lTs_mes[0] := 'sous sous famille';
      lTs_mes[1] := 'une sous famille ';
      MessageDlg(fs_RemplaceMsg(U_CST_9026,lTs_mes ), mtWarning, [mbOk], 0);
      CanClose := FALSE;
      Exit;
    end;
end;

procedure TF_Sousfamillevente.bt_sousfamClick(Sender: TObject);
begin
  F_Famillevente := TF_Famillevente(ffor_getForm(TF_Famillevente));
  if Assigned(F_Famillevente) then
    // pour faire revenir en 1er la fiche des pays si elle est deja créée
    F_Famillevente.Show
  else
    fp_CreateUniqueChild ( TF_Famillevente, fsMDIChild );
end;

end.

