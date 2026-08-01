unit Repositorio;

interface

uses
  Modelo.ContaBancaria,
  System.Generics.Collections,System.SysUtils;

type
  TRepositorio = class
  private
    FContas: TObjectList<TContaBancaria>;
  public
    constructor Create;
    destructor Destroy; override;
    function BuscarConta(NumeroConta: string): TContaBancaria;
    property Contas: TObjectList<TContaBancaria> read FContas write FContas;
  end;

procedure CarregarDataBaseInicial;

var
  DataBase: TRepositorio;

implementation

procedure CarregarDataBaseInicial;
begin
  if Assigned(DataBase) then
    DataBase.Free;

  DataBase := TRepositorio.Create;
end;

function TRepositorio.BuscarConta(NumeroConta: string): TContaBancaria;
var
  Conta: TContaBancaria;
begin
  Result := nil;

  for Conta in FContas do
    if SameText(Conta.NumeroConta, NumeroConta) then
      Exit(Conta);
end;

constructor TRepositorio.Create;
begin
  FContas := TObjectList<TContaBancaria>.Create(True);
end;

destructor TRepositorio.Destroy;
begin
  FContas.Free;
  inherited;
end;

end.
