unit Tela.Principal;

interface

uses
  Repositorio,
  Modelo.ContaBancaria,
  Tela.ExibirConta,
  Tela.NovaConta,
  Tela.ExtratoConta,
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Mask;

type
  TFrmContaBancaria = class(TForm)
    lblNumeroConta: TLabel;
    edtNumeroConta: TEdit;
    btnBuscarNumeroConta: TButton;
    lblTitular: TLabel;
    pnlTop: TPanel;
    pnlCenter: TPanel;
    lblOperacao: TLabel;
    btnSacar: TButton;
    btnDepositar: TButton;
    lblSaldo: TLabel;
    pnlOperacao: TPanel;
    btnLimpar: TButton;
    btnCriarEditarConta: TButton;
    btnExibirSaldo: TButton;
    btnExibirContas: TButton;
    mskValor: TMaskEdit;
    procedure btnCriarEditarContaClick(Sender: TObject);
    procedure btnExibirContasClick(Sender: TObject);
    procedure btnLimparClick(Sender: TObject);
    procedure btnBuscarNumeroContaClick(Sender: TObject);
    procedure btnDepositarClick(Sender: TObject);
    procedure btnSacarClick(Sender: TObject);
    procedure btnExibirSaldoClick(Sender: TObject);
    procedure ValidarApenasNumeros(Sender: TObject);
  private
    { Private declarations }
    function ContaSelecionada: Boolean;
    procedure LimparInformacoes;
    procedure BuscarConta;
    procedure DepositarValor;
    procedure SacarValor;
  public
    { Public declarations }
  end;

var
  FrmContaBancaria: TFrmContaBancaria;

implementation

{$R *.dfm}

function TFrmContaBancaria.ContaSelecionada: Boolean;
begin
  Result := Trim(edtNumeroConta.Text) <> '';
end;

procedure TFrmContaBancaria.btnBuscarNumeroContaClick(Sender: TObject);
begin
  BuscarConta;
end;

procedure TFrmContaBancaria.btnCriarEditarContaClick(Sender: TObject);
var
  Conta: TContaBancaria;
begin
  frmTelaNovaConta := TFrmTelaNovaConta.Create(Self);
  try
    if ContaSelecionada then
    begin
      Conta := DataBase.BuscarConta(edtNumeroConta.Text);
      if Assigned(Conta) then
        frmTelaNovaConta.ConfigurarEdicao(Conta)
      else
        frmTelaNovaConta.ConfigurarInclusao;
    end
    else
      frmTelaNovaConta.ConfigurarInclusao;

    if frmTelaNovaConta.ShowModal = mrOk then
      LimparInformacoes;
  finally
    frmTelaNovaConta.Free;
  end;
end;

procedure TFrmContaBancaria.btnDepositarClick(Sender: TObject);
begin
  DepositarValor;
end;

procedure TFrmContaBancaria.btnExibirContasClick(Sender: TObject);
begin
  frmTelaExibirConta := TfrmExibirConta.Create(Self);
  try
    frmTelaExibirConta.ShowModal;
  finally
    frmTelaExibirConta.Free;
  end;
end;

procedure TFrmContaBancaria.btnExibirSaldoClick(Sender: TObject);
var
  Conta: TContaBancaria;
begin
  if not ContaSelecionada then
  begin
    ShowMessage('Por favor, informe ou selecione uma conta.');
    Exit;
  end;

  Conta := DataBase.BuscarConta(edtNumeroConta.Text);

  if not Assigned(Conta) then
  begin
    ShowMessage('Conta não encontrada.');
    Exit;
  end;

  frmTelaExtratoConta := TfrmTelaExtratoConta.Create(Self);
  try
    frmTelaExtratoConta.CarregarExtrato(Conta);
    frmTelaExtratoConta.ShowModal;
  finally
    frmTelaExtratoConta.Free;
  end;
end;

procedure TFrmContaBancaria.btnLimparClick(Sender: TObject);
begin
  LimparInformacoes;
end;

procedure TFrmContaBancaria.btnSacarClick(Sender: TObject);
begin
  SacarValor;
end;

procedure TFrmContaBancaria.LimparInformacoes;
begin
  edtNumeroConta.Clear;
  mskValor.Clear;
  lblSaldo.Caption := 'Saldo';
  lblTitular.Caption := '';
end;

procedure TFrmContaBancaria.SacarValor;
var
  Conta: TContaBancaria;
  Valor: Double;
begin
  if not ContaSelecionada then
  begin
    ShowMessage('Por favor, informe ou selecione uma conta.');
    Exit;
  end;

  Conta := DataBase.BuscarConta(edtNumeroConta.Text);

  if not Assigned(Conta) then
  begin
    ShowMessage('Conta não encontrada.');
    Exit;
  end;

  Valor := StrToFloatDef(mskValor.Text, 0);

  if Valor <= 0 then
  begin
    ShowMessage('Informe um valor válido.');
    Exit;
  end;

  if Conta.Sacar(Valor) then
  begin
    lblSaldo.Caption := FormatFloat('R$ #,##0.00', Conta.Saldo);
    ShowMessage('Saque realizado com sucesso.');
  end
  else
    ShowMessage('Saldo insuficiente.');

  mskValor.Clear;
end;

procedure TFrmContaBancaria.BuscarConta;
var
  Conta: TContaBancaria;
begin
  if not ContaSelecionada then
  begin
    ShowMessage('Por favor, informe ou selecione uma conta.');
    Exit;
  end;

  Conta := DataBase.BuscarConta(edtNumeroConta.Text);

  if Assigned(Conta) then
  begin
    lblTitular.Caption := Conta.Titular;
    lblSaldo.Caption := FormatFloat('R$ #,##0.00', Conta.Saldo);
  end
  else
    ShowMessage('Conta não encontrada.');
end;

procedure TFrmContaBancaria.DepositarValor;
var
  Conta: TContaBancaria;
  Valor: Double;
begin
  if not ContaSelecionada then
  begin
    ShowMessage('Por favor, informe ou selecione uma conta.');
    Exit;
  end;

  Conta := DataBase.BuscarConta(edtNumeroConta.Text);

  if not Assigned(Conta) then
  begin
    ShowMessage('Conta não encontrada.');
    Exit;
  end;

  Valor := StrToFloatDef(mskValor.Text, 0);

  if Valor <= 0 then
  begin
    ShowMessage('Informe um valor válido.');
    Exit;
  end;

  Conta.Depositar(Valor);

  lblSaldo.Caption := FormatFloat('R$ #,##0.00', Conta.Saldo);

  ShowMessage('Depósito realizado com sucesso.');

  mskValor.Clear;
end;

procedure TFrmContaBancaria.ValidarApenasNumeros(Sender: TObject);
var
  Texto: string;
  ValorTemp: Double;
begin
  if Sender is TCustomEdit then
  begin
    Texto := Trim(TCustomEdit(Sender).Text);

    if Texto = '' then Exit;

    if not TryStrToFloat(Texto, ValorTemp) then
    begin
      ShowMessage('Este campo aceita apenas números!');
      TCustomEdit(Sender).Clear;
      TCustomEdit(Sender).SetFocus;
    end;
  end;
end;

end.
