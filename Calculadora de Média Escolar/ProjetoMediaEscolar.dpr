program ProjetoMediaEscolar;

uses
  Vcl.Forms,
  TelaPrincipal in 'TelaPrincipal.pas' {frmPrincipal};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.Run;
end.
