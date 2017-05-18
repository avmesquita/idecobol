unit unPrincipal;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, StdCtrls, Menus, printers, ShellApi, ImgList, ToolWin, ExtCtrls,
  frmSobre, Registry, JvMenus;

type
  TfrmPrincipal = class(TForm)
    ReplaceDialog1: TReplaceDialog;
    FindDialog1: TFindDialog;
    FontDialog1: TFontDialog;
    PrintDialog1: TPrintDialog;
    SaveDialog1: TSaveDialog;
    OpenDialog1: TOpenDialog;
    StatusBar1: TStatusBar;
    ImageList1: TImageList;
    RichEdit1: TRichEdit;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    ToolButton5: TToolButton;
    ToolButton6: TToolButton;
    ToolButton7: TToolButton;
    ToolButton8: TToolButton;
    ToolButton9: TToolButton;
    ToolButton10: TToolButton;
    ToolButton11: TToolButton;
    ToolButton12: TToolButton;
    ToolButton13: TToolButton;
    ToolButton14: TToolButton;
    ToolButton15: TToolButton;
    MainMenu1: TJvMainMenu;
    Arquivo2: TMenuItem;
    Sair2: TMenuItem;
    N8: TMenuItem;
    Imprimir2: TMenuItem;
    N9: TMenuItem;
    Salvarcomo2: TMenuItem;
    Salvar2: TMenuItem;
    Abrir2: TMenuItem;
    Novo2: TMenuItem;
    Editar2: TMenuItem;
    Alterarfonte1: TMenuItem;
    N10: TMenuItem;
    Substituir2: TMenuItem;
    Localizar2: TMenuItem;
    N11: TMenuItem;
    Colar2: TMenuItem;
    Copiar2: TMenuItem;
    Recortar2: TMenuItem;
    Compilar2: TMenuItem;
    Executar2: TMenuItem;
    N12: TMenuItem;
    Compilar3: TMenuItem;
    Ajuda2: TMenuItem;
    Sobre2: TMenuItem;
    N13: TMenuItem;
    Idioma2: TMenuItem;
    EnglishEUA1: TMenuItem;
    PortugusBR1: TMenuItem;
    N14: TMenuItem;
    Contedo2: TMenuItem;
    procedure HabilitarMenu;
    procedure Colar1Click(Sender: TObject);
    procedure Copiar1Click(Sender: TObject);
    procedure Recortar1Click(Sender: TObject);
    procedure Abrir1Click(Sender: TObject);
    procedure Salvarcomo1Click(Sender: TObject);
    procedure Imprimir1Click(Sender: TObject);
    procedure Novo1Click(Sender: TObject);
    procedure Fontes1Click(Sender: TObject);
    procedure FontDialog1Apply(Sender: TObject; Wnd: HWND);
    procedure Localizar1Click(Sender: TObject);
    procedure FindDialog1Find(Sender: TObject);
    procedure ReplaceDialog1Find(Sender: TObject);
    procedure Substituir1Click(Sender: TObject);
    procedure ReplaceDialog1Replace(Sender: TObject);
    procedure Sair1Click(Sender: TObject);
    procedure FontDialog1Close(Sender: TObject);
    procedure Sobre1Click(Sender: TObject);
    procedure Compilar1Click(Sender: TObject);
    procedure Executar1Click(Sender: TObject);
    procedure Salvar1Click(Sender: TObject);
    procedure Contedo1Click(Sender: TObject);
    procedure RichEdit1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure RichEdit1KeyPress(Sender: TObject; var Key: Char);
    procedure RichEdit1KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormActivate(Sender: TObject);
    procedure RichEdit1Change(Sender: TObject);
    procedure InglsEUA1Click(Sender: TObject);
    procedure Portugus1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    procedure CarregaOpcoes;
    procedure GravaOpcoes;
  public
    Linguagem : Byte;
    procedure Traducao(language : Byte);
  end;

var
   frmPrincipal: TfrmPrincipal;
      k : String;
   Mudou: Boolean;

implementation

{$R *.DFM}

{ 0 = Português & 1 = Inglês }
procedure TfrmPrincipal.Traducao(language : Byte);
begin
   Linguagem := language;
   Case language of
      0 : begin // Português
             PortugusBR1.Checked   := True;
             EnglishEUA1.Checked   := False;
             Arquivo2.Caption    := 'Arquivo';
             Editar2.Caption     := 'Editar';
             Ajuda2.Caption      := 'Ajuda';
             Novo2.Caption       := 'Novo...';
             Abrir2.Caption      := 'Abrir...';
             Salvar2.Caption     := 'Salvar';
             Salvarcomo2.Caption := 'Salvar como...';
             Imprimir2.Caption   := 'Imprimir...';
             Sair2.Caption       := 'Sair';
             Recortar2.Caption   := 'Recortar';
             Copiar2.Caption     := 'Copiar';
             Colar2.Caption      := 'Colar';
             Localizar2.Caption  := 'Localizar...';
             Substituir2.Caption := 'Substituir...';
             Alterarfonte1.Caption := 'Alterar Fonte';
             Compilar2.Caption   := 'Compilar';
             Executar2.Caption   := 'Executar';
             Contedo2.Caption    := 'Conteúdo';
             Idioma2.Caption     := 'Idioma';
             Sobre2.Caption      := 'Sobre';
             ToolButton1.Caption := 'Novo...';
             ToolButton2.Caption := 'Abrir...';
             ToolButton3.Caption := 'Salvar';
             ToolButton4.Caption := 'Imprimir...';
             ToolButton6.Caption := 'Recortar';
             ToolButton7.Caption := 'Copiar';
             ToolButton8.Caption := 'Colar';
             ToolButton12.Caption := 'Alterar Fonte';
             ToolButton14.Caption := 'Compilar';
             ToolButton15.Caption := 'Executar';
             StatusBar1.SimpleText := 'Linha: '+IntToStr((RichEdit1.CaretPos.y + 1))+' - Coluna: '+IntToStr((RichEdit1.CaretPos.x) + 1);
             OpenDialog1.Title  := 'Abrindo um programa...';
             OpenDialog1.Filter := 'Arquivos COBOL|*.cob;*.cbl';
             SaveDialog1.Title  := 'Salvando um programa...';
             SaveDialog1.Filter := 'Arquivos COBOL|*.cob;*.cbl';
          end;
      1 : begin // English
             PortugusBR1.Checked   := True;
             EnglishEUA1.Checked   := False;
             Arquivo2.Caption    := 'File';
             Editar2.Caption     := 'Edit';
             Ajuda2.Caption      := 'Help';
             Novo2.Caption       := 'New...';
             Abrir2.Caption      := 'Open...';
             Salvar2.Caption     := 'Save';
             Salvarcomo2.Caption := 'Save as...';
             Imprimir2.Caption   := 'Print...';
             Sair2.Caption       := 'Exit';
             Recortar2.Caption   := 'Cut';
             Copiar2.Caption     := 'Copy';
             Colar2.Caption      := 'Paste';
             Localizar2.Caption  := 'Find...';
             Substituir2.Caption := 'Replace...';
             Alterarfonte1.Caption := 'Change Font';
             Compilar2.Caption   := 'Compile';
             Executar2.Caption   := 'Run';
             Contedo2.Caption    := 'Contents';
             Idioma2.Caption     := 'Language';
             Sobre2.Caption      := 'About';
             ToolButton1.Caption := 'New...';
             ToolButton2.Caption := 'Open...';
             ToolButton3.Caption := 'Save';
             ToolButton4.Caption := 'Print...';
             ToolButton6.Caption := 'Cut';
             ToolButton7.Caption := 'Copy';
             ToolButton8.Caption := 'Paste';
             ToolButton12.Caption := 'Change Font';
             ToolButton14.Caption := 'Compile';
             ToolButton15.Caption := 'Run';
             StatusBar1.SimpleText := 'Row: '+IntToStr((RichEdit1.CaretPos.y + 1))+' - Column: '+IntToStr((RichEdit1.CaretPos.x) + 1);
             OpenDialog1.Title  := 'Open...';
             OpenDialog1.Filter := 'COBOL Files|*.cob;*.cbl';
             SaveDialog1.Title  := 'Save...';
             SaveDialog1.Filter := 'COBOL Files|*.cob;*.cbl';
          end;
   end;
   GravaOpcoes;
end;


procedure TfrmPrincipal.HabilitarMenu;
begin
   if RichEdit1.Lines.Count > 0 then begin
      Recortar2.Enabled   := True;
      Copiar2.Enabled     := True;
      Colar2.Enabled      := True;
      Localizar2.Enabled  := True;
      Substituir2.Enabled := True;
      Alterarfonte1.Enabled := True;
      Compilar2.Enabled   := True;
      Executar2.Enabled   := True;
      ToolButton6.Enabled := True;
      ToolButton7.Enabled := True;
      ToolButton8.Enabled := True;
      ToolButton12.Enabled := True;
      ToolButton14.Enabled := True;
      ToolButton15.Enabled := True;
      Mudou := True;
   end else begin
      Recortar2.Enabled   := False;
      Copiar2.Enabled     := False;
      Colar2.Enabled      := False;
      Localizar2.Enabled  := False;
      Substituir2.Enabled := False;
      Alterarfonte1.Enabled := False;
      Compilar2.Enabled   := False;
      Executar2.Enabled   := False;
      ToolButton6.Enabled := False;
      ToolButton7.Enabled := False;
      ToolButton8.Enabled := False;
      ToolButton12.Enabled := False;
      ToolButton14.Enabled := False;
      ToolButton15.Enabled := False;
      Mudou := False;
   end;
end;

procedure TfrmPrincipal.Colar1Click(Sender: TObject);
begin
    RichEdit1.PasteFromClipboard;
end;

procedure TfrmPrincipal.Copiar1Click(Sender: TObject);
begin
   With RichEdit1 do
      if SelLength <> 0 then
         CopyToClipboard;
end;

procedure TfrmPrincipal.Recortar1Click(Sender: TObject);
begin
   With RichEdit1 do
      if SelLength <> 0 then
         CutToClipboard;
end;

procedure TfrmPrincipal.Abrir1Click(Sender: TObject);
begin
   if OpenDialog1.Execute = True then begin
      k := OpenDialog1.FileName;
      frmPrincipal.Caption := 'IDE COBOL - '+k;
      RichEdit1.Lines.LoadFromFile(k);
      HabilitarMenu;
   end;
end;

procedure TfrmPrincipal.Salvarcomo1Click(Sender: TObject);
var
   msg : String;
begin
   if PortugusBR1.Checked then
      Msg := 'Não é possível gravar um arquivo vazio!'
   else
      Msg := 'Can'+#39+'t save an empty file!';
   if RichEdit1.Lines.Count <> 0 then begin
      if SaveDialog1.Execute = True then begin
         k := SaveDialog1.FileName;
         frmPrincipal.Caption := 'IDE COBOL - '+k;
         RichEdit1.Lines.SaveToFile(k);
      end;
   end else
      ShowMessage(msg);
end;

procedure TfrmPrincipal.Imprimir1Click(Sender: TObject);
var
   msg : String;
begin
   if PortugusBR1.Checked then
      Msg := 'Nada a imprimir!'
   else
      Msg := 'Nothing to print';
   if RichEdit1.Lines.Count <> 0 then
      RichEdit1.Print(k)
   else
      MessageDlg(msg,mtInformation,[mbOk],0);
end;

procedure TfrmPrincipal.Novo1Click(Sender: TObject);
var
   msg : String;
begin
   if PortugusBR1.Checked then
      Msg := 'Deseja salvar o arquivo?'
   else
      Msg := 'Do you want to save it?';
   if RichEdit1.Lines.Count <> 0 then begin
      if MessageDlg(msg,mtConfirmation,[mbYes,mbNo],0)
         = mrYes then begin
         if SaveDialog1.Execute = True then
            k := SaveDialog1.FileName;
            frmPrincipal.Caption := 'IDE COBOL - '+k;
            RichEdit1.Lines.SaveToFile(k);
         RichEdit1.Lines.Clear;
      end else
         RichEdit1.Lines.Clear;
   end;
end;

procedure TfrmPrincipal.Fontes1Click(Sender: TObject);
begin
   FontDialog1.Execute;
end;

procedure TfrmPrincipal.FontDialog1Apply(Sender: TObject; Wnd: HWND);
begin
   if ActiveControl is TRichEdit then
      with ActiveControl as TRichEdit do
         Font.Assign(TFontDialog(Sender).Font);
end;

procedure TfrmPrincipal.Localizar1Click(Sender: TObject);
begin
   FindDialog1.Execute;
end;

procedure TfrmPrincipal.FindDialog1Find(Sender: TObject);
var
  FoundAt: LongInt;
  StartPos, ToEnd: Integer;
begin
  with RichEdit1 do begin
     if SelLength <> 0 then
        StartPos := SelStart + SelLength
    else
        StartPos := 0;
    ToEnd := Length(Text) - StartPos;
    FoundAt := FindText(FindDialog1.FindText, StartPos, ToEnd, [stMatchCase]);
    if FoundAt <> -1 then begin
      SetFocus;
      SelStart := FoundAt;
      SelLength := Length(FindDialog1.FindText);
    end;
  end;
end;

procedure TfrmPrincipal.ReplaceDialog1Find(Sender: TObject);
var
  FoundAt: LongInt;
  StartPos, ToEnd: Integer;
begin
  with RichEdit1 do begin
     if SelLength <> 0 then
        StartPos := SelStart + SelLength
    else
        StartPos := 0;
    ToEnd := Length(Text) - StartPos;
    FoundAt := FindText(FindDialog1.FindText, StartPos, ToEnd, [stMatchCase]);
    if FoundAt <> -1 then begin
      SetFocus;
      SelStart := FoundAt;
      SelLength := Length(FindDialog1.FindText);
    end;
  end;
end;

procedure TfrmPrincipal.Substituir1Click(Sender: TObject);
begin
   ReplaceDialog1.Execute;
end;

procedure TfrmPrincipal.ReplaceDialog1Replace(Sender: TObject);
var
   SelPos: Integer;
   msg : String;
begin
   if PortugusBR1.Checked then
      Msg := 'Texto não encontrado '
   else
      Msg := 'Text not found ';
   with TReplaceDialog(Sender) do begin
      SelPos := Pos(FindText, RichEdit1.Lines.Text);
      if SelPos > 0 then begin
         RichEdit1.SelStart  := SelPos - 1;
         RichEdit1.SelLength := Length(FindText);
         RichEdit1.SelText   := ReplaceText;
      end else
          MessageDlg(Concat(msg+'("', FindText, '")'), mtError, [mbOk], 0);
  end;
end;

procedure TfrmPrincipal.Sair1Click(Sender: TObject);
var
   msg : String;
begin
   if PortugusBR1.Checked then
      Msg := 'Deseja salvar o arquivo?'
   else
      Msg := 'Do you want to save it?';
   if (RichEdit1.Lines.Count <> 0) AND Mudou then begin
      if MessageDlg(msg,mtConfirmation,[mbYes,mbNo],0)
         = mrYes then begin
         if k <> '' then
            RichEdit1.Lines.SaveToFile(k)
         else
            if SaveDialog1.Execute = True then
               RichEdit1.Lines.SaveToFile(SaveDialog1.FileName);
      end;
   end;
   Application.Terminate;
end;

procedure TfrmPrincipal.FontDialog1Close(Sender: TObject);
begin
   if ActiveControl is TRichEdit then
      with ActiveControl as TRichEdit do
         Font.Assign(TFontDialog(Sender).Font);
end;

procedure TfrmPrincipal.Sobre1Click(Sender: TObject);
begin
  try
    Application.CreateForm(TfrmAbout,frmAbout);
    frmAbout.ShowModal;
  finally
    frmAbout.Free;
  end;
end;

procedure TfrmPrincipal.Compilar1Click(Sender: TObject);
var
   msg : String;
begin
   if PortugusBR1.Checked then
      Msg := 'Deseja salvar o arquivo?'
   else
      Msg := 'Do you want to save it?';

   if (Mudou) AND (k <> '') then
      RichEdit1.Lines.SaveToFile(k)
   else if (k = '') then begin
      if MessageDlg(msg,mtConfirmation,[mbYes,mbNo],0)
         = mrYes then begin
         if k <> '' then
            RichEdit1.Lines.SaveToFile(k)
         else
            if SaveDialog1.Execute = True then begin
               RichEdit1.Lines.SaveToFile(SaveDialog1.FileName);
               k := SaveDialog1.FileName;
               frmPrincipal.Caption := 'IDE COBOL - '+k;
            end;
      end;
   end;
   ShellExecute(0, Nil, PChar('COBOL.EXE'), PChar(k), Nil, SW_SHOWMAXIMIZED);
end;

procedure TfrmPrincipal.Executar1Click(Sender: TObject);
begin
   ShellExecute(0, Nil, PChar('RUNCOB.EXE'), PChar(k), Nil, SW_SHOWMAXIMIZED);
end;

procedure TfrmPrincipal.Salvar1Click(Sender: TObject);
begin
   RichEdit1.Lines.SaveToFile(k);
end;

procedure TfrmPrincipal.Contedo1Click(Sender: TObject);
begin
   Application.HelpContext(0);
end;

procedure TfrmPrincipal.RichEdit1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if PortugusBR1.Checked then
      StatusBar1.SimpleText := 'Linha: '+IntToStr((RichEdit1.CaretPos.y + 1))+' - Coluna: '+IntToStr((RichEdit1.CaretPos.x) + 1)
   else
      StatusBar1.SimpleText := 'Row: '+IntToStr((RichEdit1.CaretPos.y + 1))+' - Column: '+IntToStr((RichEdit1.CaretPos.x) + 1);
end;

procedure TfrmPrincipal.RichEdit1KeyPress(Sender: TObject; var Key: Char);
begin
   if PortugusBR1.Checked then
      StatusBar1.SimpleText := 'Linha: '+IntToStr((RichEdit1.CaretPos.y + 1))+' - Coluna: '+IntToStr((RichEdit1.CaretPos.x) + 1)
   else
      StatusBar1.SimpleText := 'Row: '+IntToStr((RichEdit1.CaretPos.y + 1))+' - Column: '+IntToStr((RichEdit1.CaretPos.x) + 1);
end;

procedure TfrmPrincipal.RichEdit1KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if PortugusBR1.Checked then
      StatusBar1.SimpleText := 'Linha: '+IntToStr((RichEdit1.CaretPos.y + 1))+' - Coluna: '+IntToStr((RichEdit1.CaretPos.x) + 1)
   else
      StatusBar1.SimpleText := 'Row: '+IntToStr((RichEdit1.CaretPos.y + 1))+' - Column: '+IntToStr((RichEdit1.CaretPos.x) + 1);
end;

procedure TfrmPrincipal.FormActivate(Sender: TObject);
begin
   if PortugusBR1.Checked then
      StatusBar1.SimpleText := 'Linha: '+IntToStr((RichEdit1.CaretPos.y + 1))+' - Coluna: '+IntToStr((RichEdit1.CaretPos.x) + 1)
   else
      StatusBar1.SimpleText := 'Row: '+IntToStr((RichEdit1.CaretPos.y + 1))+' - Column: '+IntToStr((RichEdit1.CaretPos.x) + 1);
end;

procedure TfrmPrincipal.RichEdit1Change(Sender: TObject);
begin
   HabilitarMenu;
end;

procedure TfrmPrincipal.InglsEUA1Click(Sender: TObject);
begin
   Traducao(1);
end;

procedure TfrmPrincipal.Portugus1Click(Sender: TObject);
begin
   Traducao(0);
end;

procedure TfrmPrincipal.CarregaOpcoes;
var
  reg : TRegistry;
  b   : Byte;
begin
  b := 0;
  reg := TRegistry.Create;
  reg.RootKey := HKEY_LOCAL_MACHINE;
  reg.OpenKey('\Software\AVM Sistemas e Multimídia\IDE Cobol',True);
  if reg.ValueExists('Linguagem') then
    b := StrToInt(reg.ReadString('Linguagem'))
  else
    reg.WriteString('Linguagem','0');
  //end if
  case b of
    0 : Traducao(0);
    1 : Traducao(1);
  end;
end;

procedure TfrmPrincipal.FormCreate(Sender: TObject);
begin
  CarregaOpcoes;
end;

procedure TfrmPrincipal.GravaOpcoes;
var
  reg : TRegistry;
begin
  reg := TRegistry.Create;
  reg.RootKey := HKEY_LOCAL_MACHINE;
  reg.OpenKey('\Software\AVM Sistemas e Multimídia\IDE Cobol',True);
  if reg.ValueExists('Linguagem') then
    reg.WriteString('Linguagem',IntToStr(Linguagem));
  reg.Free;
end;

end.
