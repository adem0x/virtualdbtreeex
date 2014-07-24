unit U_comm;

{$IFDEF FPC}
  {$MODE Delphi}
{$ENDIF}

interface

uses
  LCLType, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls;

type
  TF_Comm = class(TForm)
    Panel1: TPanel;
    ch_Negocie: TCheckBox;
    ch_Envoie: TCheckBox;
    ch_Recoit: TCheckBox;
    ch_Fin: TCheckBox;
    Timer1: TTimer;
    procedure Timer1Timer(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
  end;

var
  F_Comm: TF_Comm;

implementation

{$IFNDEF FPC}
  {$R *.dfm}
{$ELSE}
  {$R *.lfm}
{$ENDIF}

procedure TF_Comm.Timer1Timer(Sender: TObject);
begin
  Beep();
  if not ch_Envoie.Visible Then
    try
      ch_Envoie.Visible := True ;
      Timer1.Enabled := False;
      Timer1.Enabled := True;
    Except
      Timer1.Enabled := False;
    End
  Else
    if not ch_Envoie.Checked Then
      try
//        M_Dmdevis.zq_MAJDevAEn.ExecSQL ;
        ch_Envoie.Checked := True ;
        Timer1.Enabled := False;
        Timer1.Enabled := True;
      Except
        Timer1.Enabled := False;
      End
    Else
      if not ch_Recoit.Visible Then
        try
          ch_Recoit.Visible := True ;
          Timer1.Enabled := False;
          Timer1.Enabled := True;
        Except
          Timer1.Enabled := False;
        End
      Else
        if not ch_Recoit.Checked Then
          try
//            M_Dmdevis.zq_MAJDevEn.ExecSQL ;
            ch_Recoit.Checked := True ;
            Timer1.Enabled := False;
            Timer1.Enabled := True;
          Except
            Timer1.Enabled := False;
          End
        Else if not ch_Fin.Visible Then
            try
              ch_Fin.Visible := True ;
              Timer1.Enabled := False;
              ch_Fin.Checked := True ;
              Self.Free ;
            Except
            End ;
  Exit ;
  Timer1.Enabled := False;
  if MessageDlg('aucune communication' + #13 +
  'Vérifiez vos branchements et l''activation de la led rouge de votre modem' + #13
  + 'Voulez-vous ré-essayer ?', mtError, [mbYes,mbNo], 0) = mrNo then
    begin
    Close;
    end else begin
    Timer1.Enabled := True;
    exit;
    end;
end;

procedure TF_Comm.FormActivate(Sender: TObject);
begin
Timer1.Enabled := True;
end;

end.
