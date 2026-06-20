unit TelaPrincipal;

interface

uses
  TelaCadastroProduto,
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Data.DB, Vcl.Grids,
  Vcl.DBGrids, Vcl.StdCtrls, Datasnap.DBClient;

type
  TfrmPrincipal = class(TForm)
    pnlTopo: TPanel;
    pnlGrid: TPanel;
    DBGrid1: TDBGrid;
    btnAdicionar: TButton;
    Remover: TButton;
    lblBuscar: TLabel;
    btnBuscar: TButton;
    cdsProduto: TClientDataSet;
    dtsProduto: TDataSource;
    edtBuscar: TEdit;
    btnEditar: TButton;
    procedure FormCreate(Sender: TObject);
    procedure btnAdicionarClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure RemoverClick(Sender: TObject);
    procedure btnBuscarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

procedure TfrmPrincipal.btnAdicionarClick(Sender: TObject);
begin
  TfrmTelaCadastroProduto.AdicionarProduto(cdsProduto, Self);
end;

procedure TfrmPrincipal.btnBuscarClick(Sender: TObject);
begin
  if Trim(edtBuscar.Text) = '' then
  begin
    ShowMessage('Digite um produto para buscar.');
    Exit;
  end;

  if not cdsProduto.Locate('Nome',edtBuscar.Text,[loPartialKey, loCaseInsensitive]) then
  begin
    ShowMessage('Produto não encontrado.');
  end;
end;

procedure TfrmPrincipal.btnEditarClick(Sender: TObject);
begin
  if cdsProduto.IsEmpty then
    Exit;

  TfrmTelaCadastroProduto.EditarProduto(cdsProduto, Self);
end;

procedure TfrmPrincipal.FormCreate(Sender: TObject);
begin
  cdsProduto.FieldDefs.Add('Nome', ftString, 50);
  cdsProduto.FieldDefs.Add('Preço', ftString, 6);
  cdsProduto.FieldDefs.Add('Quantidade', ftString, 5);
  cdsProduto.CreateDataSet;
end;

procedure TfrmPrincipal.RemoverClick(Sender: TObject);
begin

  if cdsProduto.IsEmpty then
  begin
    ShowMessage('Nenhum produto selecionado para exclusão.');
    Exit;
  end;

  if MessageDlg('Tem certeza que deseja excluir o produto "' + cdsProduto.FieldByName('Nome').AsString + '"?',
  mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
    cdsProduto.Delete;
    ShowMessage('Produto excluído com sucesso.');
  end;
end;

end.
