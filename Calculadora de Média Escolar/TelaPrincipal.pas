unit TelaPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TfrmPrincipal = class(TForm)
    lblTitulo: TLabel;
    lblTituloResultado: TLabel;
    lblResultadoTexto: TLabel;
    pnlCentral: TPanel;
    lblSegundaNota: TLabel;
    lblTerceiraNota: TLabel;
    lblPrimeiraNota: TLabel;
    btnCalcularMedia: TButton;
    edtPrimeiraNota: TEdit;
    edtSegundaNota: TEdit;
    edtTerceiraNota: TEdit;
    lblResultadoMedia: TLabel;
    Button1: TButton;
    procedure Validacao(Sender: TObject);
    procedure ObterNotas;
    procedure LimparTudo;
    procedure btnCalcularMediaClick(Sender: TObject);
    function CalcularMedia:double;
    procedure Button1Click(Sender: TObject);
  private
    PrimeiraNota, SegundaNota, TerceiraNota : double;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

procedure TfrmPrincipal.LimparTudo;
begin
  edtPrimeiraNota.Clear;
  edtSegundaNota.Clear;
  edtTerceiraNota.Clear;

  lblResultadoTexto.Caption := '';
  lblResultadoMedia.Caption := '';
end;

procedure TfrmPrincipal.ObterNotas;
begin

PrimeiraNota := StrToFloatDef(edtPrimeiraNota.Text , 0);
SegundaNota := StrToFloatDef(edtSegundaNota.Text , 0);
TerceiraNota := StrToFloatDef(edtTerceiraNota.Text, 0);

end;

procedure TfrmPrincipal.Button1Click(Sender: TObject);
begin
  LimparTudo;
end;

function TfrmPrincipal.CalcularMedia : double;
begin
  Result := (PrimeiraNota + SegundaNota + TerceiraNota) / 3;
end;

procedure TfrmPrincipal.btnCalcularMediaClick(Sender: TObject);
begin

ObterNotas;

if CalcularMedia >= 7 then
begin
  lblResultadoTexto.Font.Color := clGreen;
  lblResultadoTexto.Caption := 'Aprovado';
  lblResultadoMedia.Caption := 'A média das Notas é: ' + FloatToStr(CalcularMedia);
end;
if (CalcularMedia > 5) and (CalcularMedia <= 6.9) then
begin
  lblResultadoTexto.Font.Color := clOlive;
  lblResultadoTexto.Caption := 'Recuperação';
  lblResultadoMedia.Caption := 'A média das Notas é: ' + FloatToStr(CalcularMedia);
end;
if CalcularMedia < 5 then
begin
  lblResultadoTexto.Font.Color := clMaroon;
  lblResultadoTexto.Caption := 'Recuperação';
  lblResultadoMedia.Caption := 'A média das Notas é: ' + FloatToStr(CalcularMedia);
end;

end;

procedure TfrmPrincipal.Validacao(Sender: TObject);
var
Valor: Double;

begin
  if not TryStrToFloat(edtPrimeiraNota.Text, Valor) then
  begin
    MessageDlg('Valor inválido! Digite um número entre 0 e 10.', mtError, [mbOK], 0);
    (Sender as TEdit).SetFocus;
    Exit;
  end;

  if (Valor < 0) or (Valor > 10) then
  begin
    MessageDlg('Valor inválido! Digite um número entre 0 e 10.', mtError, [mbOK], 0);
    (Sender as TEdit).SetFocus;
    Exit;
  end;
end;
end.
