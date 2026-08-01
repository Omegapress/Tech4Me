unit Tela.ExibirConta;

interface

uses
  Repositorio,
  Modelo.ContaBancaria,
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Datasnap.DBClient;

type
  TfrmExibirConta = class(TForm)
    dbContas: TDBGrid;
    dsContas: TDataSource;
    cdsContas: TClientDataSet;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    procedure CarregarContas;
    procedure ConfigurarContas;

  public
    { Public declarations }
  end;

var
  frmTelaExibirConta: TfrmExibirConta;

implementation

{$R *.dfm}

procedure TfrmExibirConta.CarregarContas;
var
  Conta: TContaBancaria;
begin
  cdsContas.EmptyDataSet;

  for Conta in DataBase.Contas do
  begin
    cdsContas.Append;
    cdsContas.FieldByName('Numero da Conta').AsString := Conta.NumeroConta;
    cdsContas.FieldByName('Nome do Titular').AsString := Conta.Titular;
    cdsContas.Post;
  end;
end;

procedure TfrmExibirConta.ConfigurarContas;
begin
  cdsContas.FieldDefs.Clear;
  cdsContas.FieldDefs.Add('Numero da Conta', ftString, 50);
  cdsContas.FieldDefs.Add('Nome do Titular', ftString, 50);
  cdsContas.CreateDataSet;

end;

procedure TfrmExibirConta.FormCreate(Sender: TObject);
begin
ConfigurarContas;
CarregarContas;
end;

end.
