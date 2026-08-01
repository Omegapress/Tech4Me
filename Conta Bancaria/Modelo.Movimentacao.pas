unit Modelo.Movimentacao;

interface

type
  TMovimentacao = class
  private
    FOperacao: string;
    FSaldoAnterior: Double;
    FNovoSaldo: Double;
  public
    property Operacao: string read FOperacao write FOperacao;
    property SaldoAnterior: Double read FSaldoAnterior write FSaldoAnterior;
    property NovoSaldo: Double read FNovoSaldo write FNovoSaldo;
  end;

implementation

end.
