unit TelaCadastroProduto;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, DataSnap.DBClient;

type
  TfrmTelaCadastroProduto = class(TForm)
    gbProduto: TGroupBox;
    lblNomeProduto: TLabel;
    lblPreco: TLabel;
    btnCancelar: TButton;
    btnSalvar: TButton;
    btnLimpar: TButton;
    edtPreco: TEdit;
    edtQuantidade: TEdit;
    lblQuantidade: TLabel;
    edtNomeProduto: TEdit;
    procedure btnCancelarClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnLimparClick(Sender: TObject);
    procedure edtPrecoExit(Sender: TObject);
    procedure edtQuantidadeExit(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  class procedure AdicionarProduto(pDataSet: TClientDataSet; pOwner: TComponent);
  class procedure EditarProduto(pDataSet: TClientDataSet; pOwner: TComponent);
  procedure ValidarPreco;
  procedure ValidarQuantidade;
  function ValidarCamposVazios: Boolean;

  end;

var
  frmTelaCadastroProduto: TfrmTelaCadastroProduto;

implementation

{$R *.dfm}

class procedure TfrmTelaCadastroProduto.AdicionarProduto(pDataSet: TClientDataSet; pOwner: TComponent);
begin
  var lFrmTelaCadastroProduto := TfrmTelaCadastroProduto.Create(pOwner);
  try
    if lFrmTelaCadastroProduto.ShowModal = mrOK then
    begin
      pDataSet.Append;
      pDataSet.FieldByName('Nome').AsString := lFrmTelaCadastroProduto.edtNomeProduto.Text;
      pDataSet.FieldByName('Preço').AsString := lFrmTelaCadastroProduto.edtPreco.Text;
      pDataSet.FieldByName('Quantidade').AsString := lFrmTelaCadastroProduto.edtQuantidade.Text;
      pDataSet.Post;
    end;
  finally
    lFrmTelaCadastroProduto.Free;
  end;
end;

class procedure TfrmTelaCadastroProduto.EditarProduto(pDataSet: TClientDataSet; pOwner: TComponent);
begin
  var lFrmTelaCadastroProduto := TfrmTelaCadastroProduto.Create(pOwner);
  try

    lFrmTelaCadastroProduto.edtNomeProduto.Text := pDataSet.FieldByName('Nome').AsString;
    lFrmTelaCadastroProduto.edtPreco.Text := pDataSet.FieldByName('Preço').AsString;
    lFrmTelaCadastroProduto.edtQuantidade.Text := pDataSet.FieldByName('Quantidade').AsString;

    if lFrmTelaCadastroProduto.ShowModal = mrOK then
    begin
      pDataSet.Edit;
      pDataSet.FieldByName('Nome').AsString := lFrmTelaCadastroProduto.edtNomeProduto.Text;
      pDataSet.FieldByName('Preço').AsString := lFrmTelaCadastroProduto.edtPreco.Text;
      pDataSet.FieldByName('Quantidade').AsString := lFrmTelaCadastroProduto.edtQuantidade.Text;
      pDataSet.Post;
    end;

  finally
    lFrmTelaCadastroProduto.Free;
  end;
end;

procedure TfrmTelaCadastroProduto.edtPrecoExit(Sender: TObject);
begin
  ValidarPreco;
end;

procedure TfrmTelaCadastroProduto.edtQuantidadeExit(Sender: TObject);
begin
  ValidarQuantidade;
end;

function TfrmTelaCadastroProduto.ValidarCamposVazios: Boolean;
begin
  Result := False;

  if Trim(edtNomeProduto.Text) = '' then
  begin
    ShowMessage('O campo Nome é obrigatório.');
    edtNomeProduto.SetFocus;
    Exit;
  end;

  if Trim(edtPreco.Text) = '' then
  begin
    ShowMessage('O campo Preço é obrigatório.');
    edtPreco.SetFocus;
    Exit;
  end;

  if Trim(edtQuantidade.Text) = '' then
  begin
    ShowMessage('O campo Quantidade é obrigatório.');
    edtQuantidade.SetFocus;
    Exit;
  end;

  Result := True;
end;

procedure TfrmTelaCadastroProduto.ValidarPreco;
var
  LPreco: Double;
begin
  if Trim(edtPreco.Text) = '' then
    Exit;

  if not TryStrToFloat(edtPreco.Text, LPreco) then
  begin
    ShowMessage('Preço inválido. Informe um valor numérico.');
    edtPreco.SetFocus;
    Abort;
  end;

  if LPreco <= 0 then
  begin
    ShowMessage('O preço deve ser um valor positivo.');
    edtPreco.SetFocus;
    Abort;
  end;
end;

procedure TfrmTelaCadastroProduto.ValidarQuantidade;
var
  LQuantidade: Integer;
begin
  if Trim(edtQuantidade.Text) = '' then
    Exit;

  if not TryStrToInt(edtQuantidade.Text, LQuantidade) then
  begin
    ShowMessage('Quantidade inválida. Informe um número inteiro.');
    edtQuantidade.SetFocus;
    Abort;
  end;

  if LQuantidade <= 0 then
  begin
    ShowMessage('A quantidade deve ser um número inteiro positivo.');
    edtQuantidade.SetFocus;
    Abort;
  end;
end;

procedure TfrmTelaCadastroProduto.btnCancelarClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TfrmTelaCadastroProduto.btnLimparClick(Sender: TObject);
begin
  edtNomeProduto.Clear;
  edtPreco.Clear;
  edtQuantidade.Clear;
end;

procedure TfrmTelaCadastroProduto.btnSalvarClick(Sender: TObject);
begin
  if not ValidarCamposVazios then
    Exit;

  ModalResult := mrOK;
end;

end.
