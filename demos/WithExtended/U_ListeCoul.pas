unit U_ListeCoul;

{$IFDEF FPC}
  {$MODE Delphi}
{$ENDIF}

interface

uses
{$IFNDEF FPC}
  u_extdbgrid,
{$ELSE}
{$ENDIF}
  LCLType, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs,Grids, DBGrids, u_framework_dbcomponents,
  u_extdbgrid;

type
  TF_ListeCoul = class(TForm)
    ExRxDBGrid1: TExtDBGrid;
    procedure FormCreate(Sender: TObject);
  private
    { D?clarations priv?es }
  public
    { D?clarations publiques }
  end;

var
  F_ListeCoul: TF_ListeCoul;

implementation

uses U_DmDonn;

{$IFNDEF FPC}
  {$R *.dfm}
{$ELSE}
  {$R *.lfm}
{$ENDIF}

procedure TF_ListeCoul.FormCreate(Sender: TObject);
begin
  M_Donn.zq_Finition.Open;

//ExRxDBGrid1.DataSource.DataSet.Locate(ExRxDBGrid1.Columns[0],'8    ', [loPartialKey]);
end;

end.
