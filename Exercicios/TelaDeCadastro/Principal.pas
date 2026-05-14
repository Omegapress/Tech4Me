unit Principal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.ComCtrls, Vcl.StdCtrls,
  Vcl.Imaging.pngimage, Vcl.Mask;

type
  TfrmPrincipal = class(TForm)
    Splitter: TSplitter;
    pnlResultado: TPanel;
    pnlCadastro: TPanel;
    pgcCadastro: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    ListResultados: TListBox;
    gbInformacoes: TGroupBox;
    lblNome: TLabel;
    edtNome: TEdit;
    lblCPF: TLabel;
    lblSexo: TLabel;
    cbSexo: TComboBox;
    cbAtivo: TCheckBox;
    imgFoto: TImage;
    lblFotoPerfil: TLabel;
    lblEmail: TLabel;
    edtEmail: TEdit;
    lblTelefone: TLabel;
    memoAdicionais: TMemo;
    lblAdicionais: TLabel;
    pnlBottom: TPanel;
    btnSalvar: TButton;
    ProgressoSalvar: TProgressBar;
    btnLimpar: TButton;
    edtCPF: TMaskEdit;
    edtTelefone: TMaskEdit;
    OpenDialog: TOpenDialog;
    Image1: TImage;
    btnCarregarFoto: TButton;
    Timer: TTimer;
    function ValidaCamposVazios: boolean;
    procedure LimparTudo;
    procedure CadastrarInformacoes;
    procedure BotaoSalvando;
    procedure btnLimparClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnCarregarFotoClick(Sender: TObject);
    procedure TimerTimer(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

function TfrmPrincipal.ValidaCamposVazios: Boolean;
begin
  Result :=
    (Trim(edtNome.Text) <> '') and
    (Trim(edtCPF.Text) <> '') and
    (cbSexo.ItemIndex <> -1) and
    (Trim(edtEmail.Text) <> '') and
    (Trim(edtTelefone.Text) <> '');
end;

procedure TfrmPrincipal.CadastrarInformacoes;
begin

  ListResultados.Items.Add('Nome: ' + edtNome.Text);
  ListResultados.Items.Add('CPF: ' + edtCPF.Text);
  ListResultados.Items.Add('Sexo: ' + cbSexo.Text);

    if cbAtivo.Checked then
  begin
    ListResultados.Items.Add('Ativo');
  end
  else
  begin
    ListResultados.Items.Add('Inativo');
  end;

  ListResultados.Items.Add('E-mail: ' + edtEmail.Text);
  ListResultados.Items.Add('Telefone: ' + edtTelefone.Text);
  ListResultados.Items.Add('Informações Adicionais: ' + memoAdicionais.Text)

end;

procedure TfrmPrincipal.LimparTudo;
begin
  edtNome.Clear;
  edtCPF.Clear;
  cbSexo.ItemIndex := -1;
  cbAtivo.State := cbUnchecked;
  edtEmail.Clear;
  edtTelefone.Clear;
  memoAdicionais.Clear;
  ListResultados.Clear;
end;

procedure TfrmPrincipal.TimerTimer(Sender: TObject);
begin
  Timer.Enabled := False;

  btnSalvar.Caption := 'Salvar';
  btnSalvar.Enabled := True;

  ShowMessage('Salvo com sucesso!');
end;

procedure TfrmPrincipal.BotaoSalvando;
begin

  btnSalvar.Caption := 'Salvando';
  btnSalvar.Enabled := False;
  Timer.Enabled := True;

end;

procedure TfrmPrincipal.btnCarregarFotoClick(Sender: TObject);
begin
  OpenDialog.Filter :=
    'Imagens|*.png;*.jpg;*.jpeg;*.bmp';

  if OpenDialog.Execute then
  begin
    ImgFoto.Picture.LoadFromFile(OpenDialog.FileName);
  end;
end;

procedure TfrmPrincipal.btnLimparClick(Sender: TObject);
begin

LimparTudo;

end;

procedure TfrmPrincipal.btnSalvarClick(Sender: TObject);
begin

  ProgressoSalvar.StepBy(33);

   if not ValidaCamposVazios then
  begin
    ShowMessage('Todos os campos devem ser preenchidos');
    Exit;
  end;

  BotaoSalvando;
  ProgressoSalvar.StepBy(33);

  CadastrarInformacoes;
  ProgressoSalvar.StepBy(34);

end;

end.
