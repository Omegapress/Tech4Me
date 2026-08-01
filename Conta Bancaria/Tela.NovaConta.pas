unit Tela.NovaConta;

interface

uses
  Repositorio,
  Modelo.ContaBancaria,
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls;

type
  TFrmTelaNovaConta = class(TForm)
    pnlCentral: TPanel;
    lblNumeroConta: TLabel;
    edtNumeroConta: TEdit;
    lblNomeTitular: TLabel;
    edtNomeTitular: TEdit;
    btnCancelar: TButton;
    btnLimpar: TButton;
    btnCadastrar: TButton;
    btnExcluir: TButton;
    procedure btnCadastrarClick(Sender: TObject);
    procedure btnLimparClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure ValidarApenasNumeros(Sender: TObject);
  private
    { Private declarations }
    FModoEdicao: Boolean;
    FContaAtual: TContaBancaria;
    procedure AdicionarConta(NumeroDaConta, Titular: string);
    procedure SalvarAlteracao(Titular: string);
    procedure LimparInformacoes;
    function ValidarCamposVazios: Boolean;
  public
    { Public declarations }
    procedure ConfigurarInclusao;
    procedure ConfigurarEdicao(AConta: TContaBancaria);
  end;

var
  FrmTelaNovaConta: TFrmTelaNovaConta;

implementation

{$R *.dfm}

procedure TFrmTelaNovaConta.ConfigurarInclusao;
begin
  FModoEdicao := False;
  FContaAtual := nil;

  LimparInformacoes;
  edtNumeroConta.Enabled := True;
  btnCadastrar.Caption := 'Cadastrar';
  btnExcluir.Visible := False;
end;

procedure TFrmTelaNovaConta.ConfigurarEdicao(AConta: TContaBancaria);
begin
  FModoEdicao := True;
  FContaAtual := AConta;

  edtNumeroConta.Text := AConta.NumeroConta;
  edtNomeTitular.Text := AConta.Titular;

  edtNumeroConta.Enabled := False;

  btnCadastrar.Caption := 'Alterar';
  btnExcluir.Visible := True;
end;

procedure TFrmTelaNovaConta.AdicionarConta(NumeroDaConta, Titular: string);
var
  Conta: TContaBancaria;
begin
  Conta := TContaBancaria.Create;
  Conta.NumeroConta := NumeroDaConta;
  Conta.Titular := Titular;

  DataBase.Contas.Add(Conta);
end;

procedure TFrmTelaNovaConta.SalvarAlteracao(Titular: string);
begin
  if Assigned(FContaAtual) then
    FContaAtual.Titular := Titular;
end;

procedure TFrmTelaNovaConta.btnCadastrarClick(Sender: TObject);
begin
  if not ValidarCamposVazios then
  begin
    ShowMessage('Por favor, preencha todos os campos antes de prosseguir.');
    Exit;
  end;

  if FModoEdicao then
  begin
    SalvarAlteracao(edtNomeTitular.Text);
    ShowMessage('Conta alterada com sucesso!');
  end
  else
  begin
    AdicionarConta(edtNumeroConta.Text, edtNomeTitular.Text);
    ShowMessage('Conta cadastrada com sucesso!');
  end;

  LimparInformacoes;
  ModalResult := mrOk;
end;

procedure TFrmTelaNovaConta.btnExcluirClick(Sender: TObject);
begin
  if Assigned(FContaAtual) then
  begin
    if MessageDlg('Deseja realmente excluir esta conta?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    begin
      DataBase.Contas.Remove(FContaAtual);
      ShowMessage('Conta excluída com sucesso!');
      ModalResult := mrOk;
    end;
  end;
end;

procedure TFrmTelaNovaConta.btnCancelarClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TFrmTelaNovaConta.btnLimparClick(Sender: TObject);
begin
  LimparInformacoes;
end;

procedure TFrmTelaNovaConta.LimparInformacoes;
begin

if not FModoEdicao then
    edtNumeroConta.Clear;

  edtNomeTitular.Clear;
end;

procedure TFrmTelaNovaConta.ValidarApenasNumeros(Sender: TObject);
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

function TFrmTelaNovaConta.ValidarCamposVazios: Boolean;
begin
  Result := (Trim(edtNumeroConta.Text) <> '') and (Trim(edtNomeTitular.Text) <> '');
end;

end.
