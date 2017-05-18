unit frmSobre;

interface

uses Windows, SysUtils, Classes, Graphics, Forms, Controls, StdCtrls,
  Buttons, ExtCtrls;

type
  TfrmAbout = class(TForm)
    Panel1: TPanel;
    ProgramIcon: TImage;
    ProductName: TLabel;
    lblVersion: TLabel;
    lblCopyright: TLabel;
    lblComents: TLabel;
    OKButton: TButton;
    procedure FormCreate(Sender: TObject);
  end;

var
  frmAbout: TfrmAbout;

implementation

uses unPrincipal;

{$R *.DFM}

procedure TfrmAbout.FormCreate(Sender: TObject);
begin
  Case frmPrincipal.Linguagem of
    0 : begin // Português
          frmAbout.Caption     := 'Sobre';
          lblVersion.Caption   := 'Versão 1.2.0';
          lblCopyright.Caption := 'AVM Sistemas';
          lblComents.Caption   := 'GPL License';
          ProductName.Caption  := 'IDE Cobol';
        end;
    1 : begin // English
          frmAbout.Caption     := 'About';
          lblVersion.Caption   := 'Version 1.2.0';
          lblCopyright.Caption := 'AVM Sistemas';
          lblComents.Caption   := 'GPL License';
          ProductName.Caption  := 'IDE Cobol';
        end;
  end;
end;

end.
 
