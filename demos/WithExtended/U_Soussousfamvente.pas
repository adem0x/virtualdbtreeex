unit U_Soussousfamvente;

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
  DBGrids, u_framework_dbcomponents, u_framework_components,
  ComCtrls, StdCtrls, SysUtils,  TypInfo,  Variants,
  u_buttons_appli,
  StrUtils, ToolEdit, U_FormAdapt, U_OnFormInfoIni,  JvXpButtons,
  U_ExtDBGrid,U_DmDonn, U_ConstMessage, U_GroupView, ImgList,fonctions_string;

type
  TF_Soussousfamvente = class(TF_FormAdapt)
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
    gd_sousousfamillevente: TExtDBGrid;
    lb_code: TFWLabel;
    lb_sousfamille: TFWLabel;
    ed_sousfamille: TFWDBLookupCombo;
    bt_ssfam: TJvXpButton;
    ct_pvr: TPageControl;
    ts_pvr: TTabSheet;
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
    lv_pvr: TDBGroupView;
    Panel2: TPanel;
    bt_in_item: TFWInSelect;
    bt_in_total: TFWInAll;
    bt_out_item: TFWOutSelect;
    bt_out_total: TFWOutAll;
    lv_transfert: TDBGroupView;
    im_images: TImageList;
    RbSplitter2: TSplitter;
    procedure F_FormDicoCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure bt_ssfamClick(Sender: TObject);

  private
    { Déclarations privées }

  public
    { Déclarations publiques }
  end;

var
  F_Soussousfamvente: TF_Soussousfamvente;

implementation

uses U_Sousfamillevente,
     fonctions_forms,
     fonctions_erreurs;
{$IFNDEF FPC}
  {$R *.dfm}
{$ELSE}
  {$R *.lfm}
{$ENDIF}

procedure TF_Soussousfamvente.F_FormDicoCloseQuery(Sender: TObject; var CanClose: Boolean);
var lTs_mes : array[0..1] of string;
begin
  // en cas d'element present dans la liste a reaffecter
  if (lv_transfert.Items.Count <> 0) then
    begin
      lTs_mes[0] := 'produits de vente de regroupement';
      lTs_mes[1] := 'une sous sous famille ';
      MessageDlg(fs_RemplaceMsg(U_CST_9026,lTs_mes ), mtWarning, [mbOk], 0);
      CanClose := FALSE;
      exit;
    end;

end;

procedure TF_Soussousfamvente.bt_ssfamClick(Sender: TObject);
begin
  F_Sousfamillevente := TF_Sousfamillevente(ffor_getForm(TF_Sousfamillevente));
  if Assigned(F_Sousfamillevente) then
    // pour faire revenir en 1er la fiche des pays si elle est deja créée
    F_Sousfamillevente.Show
  else
    fp_CreateUniqueChild( TF_Sousfamillevente  , fsMDIChild);
end;

end.

