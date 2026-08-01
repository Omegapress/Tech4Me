unit Modelo.ContaBancaria;

interface

uses
  System.Generics.Collections,
  Modelo.Movimentacao;

type
  TContaBancaria = class

    private
      FNumeroDaConta : String;
      FTitular : String;
      FSaldo : Double;
      FMovimentacoes: TObjectList<TMovimentacao>;

    public
    constructor Create;
    destructor Destroy; override;

    property Movimentacoes: TObjectList<TMovimentacao> read FMovimentacoes;

    property NumeroConta: string read FNumeroDaConta write FNumeroDaConta;
    property Titular: string read FTitular write FTitular;
    property Saldo: Double read FSaldo;

    procedure Depositar(Valor: Double);
    function Sacar(Valor: Double): Boolean;
    function ExibirSaldo: Double;
  end;

implementation

constructor TContaBancaria.Create;
begin
  inherited;

  FSaldo := 0;
  FMovimentacoes := TObjectList<TMovimentacao>.Create(True);
end;

destructor TContaBancaria.Destroy;
begin
  FMovimentacoes.Free;
  inherited;
end;

procedure TContaBancaria.Depositar(Valor: Double);
var
  Mov: TMovimentacao;
  SaldoAnterior: Double;
begin
  if Valor <= 0 then
    Exit;

  SaldoAnterior := FSaldo;

  FSaldo := FSaldo + Valor;

  Mov := TMovimentacao.Create;
  Mov.Operacao := 'Depósito';
  Mov.SaldoAnterior := SaldoAnterior;
  Mov.NovoSaldo := FSaldo;

  FMovimentacoes.Add(Mov);
end;

function TContaBancaria.Sacar(Valor: Double): Boolean;
var
  Mov: TMovimentacao;
  SaldoAnterior: Double;
begin
  Result := False;

  if (Valor <= 0) or (Valor > FSaldo) then
    Exit;

  SaldoAnterior := FSaldo;

  FSaldo := FSaldo - Valor;

  Mov := TMovimentacao.Create;
  Mov.Operacao := 'Saque';
  Mov.SaldoAnterior := SaldoAnterior;
  Mov.NovoSaldo := FSaldo;

  FMovimentacoes.Add(Mov);

  Result := True;
end;

function TContaBancaria.ExibirSaldo: Double;
begin
  Result := FSaldo;
end;

end.
