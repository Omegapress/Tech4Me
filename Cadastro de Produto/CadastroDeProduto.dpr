program CadastroDeProduto;

uses
  Vcl.Forms,
  TelaPrincipal in 'TelaPrincipal.pas' {frmPrincipal},
  TelaCadastroProduto in 'TelaCadastroProduto.pas' {frmTelaCadastroProduto},
  Vcl.Themes,
  Vcl.Styles;

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  TStyleManager.TrySetStyle('Carbon');
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.Run;
end.
