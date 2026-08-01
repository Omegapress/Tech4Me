unit Tela.ExtratoConta;

interface

uses
  Modelo.ContaBancaria,
  Modelo.Movimentacao,
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.ComCtrls, Vcl.StdCtrls;

type
  TfrmTelaExtratoConta = class(TForm)
    pnlTop: TPanel;
    pnlCentral: TPanel;
    lblTitular: TLabel;
    lsvDepositar: TListView;
    lsvSacar: TListView;
    lblTituloSacar: TLabel;
    lblTituloDepositar: TLabel;
  private
    { Private declarations }
    procedure ConfigurarTela(Conta: TContaBancaria);
    procedure CarregarDepositos(Conta: TContaBancaria);
    procedure CarregarSaques(Conta: TContaBancaria);

  public
    { Public declarations }
    procedure CarregarExtrato(Conta: TContaBancaria);
  end;

var
  frmTelaExtratoConta: TfrmTelaExtratoConta;

implementation

{$R *.dfm}

procedure TfrmTelaExtratoConta.ConfigurarTela(Conta: TContaBancaria);
begin
  lblTitular.Caption := Conta.Titular;

  lsvDepositar.Clear;
  lsvSacar.Clear;

  lsvDepositar.ViewStyle := vsReport;
  lsvSacar.ViewStyle := vsReport;

  lsvDepositar.Columns.Clear;
  lsvSacar.Columns.Clear;

  lsvDepositar.Columns.Add.Caption := 'Operação';
  lsvDepositar.Columns.Add.Caption := 'Saldo Anterior';
  lsvDepositar.Columns.Add.Caption := 'Novo Saldo';

  lsvSacar.Columns.Add.Caption := 'Operação';
  lsvSacar.Columns.Add.Caption := 'Saldo Anterior';
  lsvSacar.Columns.Add.Caption := 'Novo Saldo';
end;

procedure TfrmTelaExtratoConta.CarregarDepositos(Conta: TContaBancaria);
var
  Mov: TMovimentacao;
  Item: TListItem;
begin
  for Mov in Conta.Movimentacoes do
  begin
    if Mov.Operacao = 'Depósito' then
    begin
      Item := lsvDepositar.Items.Add;

      Item.Caption := Mov.Operacao;
      Item.SubItems.Add(FormatFloat('R$ #,##0.00', Mov.SaldoAnterior));
      Item.SubItems.Add(FormatFloat('R$ #,##0.00', Mov.NovoSaldo));
    end;
  end;
end;

procedure TfrmTelaExtratoConta.CarregarSaques(Conta: TContaBancaria);
var
  Mov: TMovimentacao;
  Item: TListItem;
begin
  for Mov in Conta.Movimentacoes do
  begin
    if Mov.Operacao = 'Saque' then
    begin
      Item := lsvSacar.Items.Add;

      Item.Caption := Mov.Operacao;
      Item.SubItems.Add(FormatFloat('R$ #,##0.00', Mov.SaldoAnterior));
      Item.SubItems.Add(FormatFloat('R$ #,##0.00', Mov.NovoSaldo));
    end;
  end;
end;

procedure TfrmTelaExtratoConta.CarregarExtrato(Conta: TContaBancaria);
begin
  ConfigurarTela(Conta);
  CarregarDepositos(Conta);
  CarregarSaques(Conta);
end;

end.
