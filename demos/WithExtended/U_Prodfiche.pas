unit U_Prodfiche;

{$IFDEF FPC}
  {$MODE Delphi}
{$ENDIF}

interface

uses
  LCLType, Dialogs, Controls, Classes, ExtCtrls,  JvXpButtons, Forms,
  Grids, DBGrids, u_framework_dbcomponents, u_framework_components, StdCtrls,
  ComCtrls, U_FormAdapt, U_OnFormInfoIni, u_buttons_appli,
  U_ExtDBGrid, U_DmDonn, U_ConstMessage;

type

  { TF_Prodfiche }

  TF_Prodfiche = class(TF_FormAdapt)
    SvgFormInfoIni: TOnFormInfoIni;
    Panel1: TPanel;
    bt_fermer: TFWClose;
    bt_init: TFWInit;
    Panel2: TPanel;
    pg_control: TPageControl;
    ts_param: TTabSheet;
    gd_representant: TExtDBGrid;
    Panel3: TPanel;
    lb_localisation: TFWLabel;
    ed_location: TEdit;
    procedure bt_initClick(Sender: TObject);
    procedure F_ProdficheClose(Sender: TObject; var Action: TCloseAction);
    procedure F_ProdficheCreate(Sender: TObject);
    procedure F_FormDicoActivate(Sender: TObject);

  private
    { D?clarations priv?es }

  public
    { D?clarations publiques }
  end;

var
  F_Prodfiche: TF_Prodfiche;

implementation

uses DB, fonctions_forms;

{$IFNDEF FPC}
  {$R *.dfm}
{$ELSE}
  {$R *.lfm}
{$ENDIF}

procedure TF_Prodfiche.bt_initClick(Sender: TObject);
var li_i: integer;
begin
  if gd_representant.SelectedRows.Count > 0 then
    begin
      Screen.Cursor := crHourGlass;
      for li_i := 0 to gd_representant.SelectedRows.Count - 1 do
        begin
          gd_representant.DataSource.DataSet.GotoBookmark(Pointer(gd_representant.SelectedRows.Items[li_i]));
          M_Donn.zq_prod_fichiers.Close;
          M_Donn.zq_prod_fichiers.Params.ParamByName('repr').Value := gd_representant.DataSource.DataSet.Fields[0].AsString;
          M_Donn.zq_prod_fichiers.ExecSQL;
        end;
      Screen.Cursor := crDefault;
    end;
end;

procedure TF_Prodfiche.F_ProdficheClose(Sender: TObject; var Action: TCloseAction);
begin
  M_Donn.zq_prod_fichiers.Close;
  M_Donn.zq_location.Close;
end;

procedure TF_Prodfiche.F_ProdficheCreate(Sender: TObject);
begin
  M_Donn.zq_location.Close;
  M_Donn.zq_location.Open;
  ed_location.Text := M_Donn.zq_location.Fields[0].AsString;
end;

procedure TF_Prodfiche.F_FormDicoActivate(Sender: TObject);
begin
  gd_representant.Columns[0].Title.Caption := 'Nom';
end;

end.

