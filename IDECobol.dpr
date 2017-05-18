program IDECobol;

uses
  Forms,
  unPrincipal in 'unPrincipal.pas' {frmPrincipal},
  frmSobre in 'frmSobre.pas' {frmAbout};

{$R *.RES}

begin
  Application.Initialize;
  Application.Title := 'IDE COBOL';
  Application.HelpFile := 'IDECOBOL.HLP';
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.Run;
end.
