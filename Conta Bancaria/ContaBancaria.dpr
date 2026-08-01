program ContaBancaria;

uses
  Vcl.Forms,
  Repositorio in 'Repositorio.pas',
  Tela.Principal in 'Tela.Principal.pas' {FrmContaBancaria},
  Modelo.ContaBancaria in 'Modelo.ContaBancaria.pas',
  Tela.NovaConta in 'Tela.NovaConta.pas' {FrmTelaNovaConta},
  Tela.ExibirConta in 'Tela.ExibirConta.pas' {frmExibirConta},
  Tela.ExtratoConta in 'Tela.ExtratoConta.pas' {frmTelaExtratoConta},
  Modelo.Movimentacao in 'Modelo.Movimentacao.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;

  // Inicializa o repositório (DataBase)
  CarregarDataBaseInicial;

  Application.CreateForm(TFrmContaBancaria, FrmContaBancaria);
  Application.Run;

  // Libera o repositório ao encerrar a aplicação
  DataBase.Free;
end.
