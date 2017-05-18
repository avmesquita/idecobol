       IDENTIFICATION DIVISION.
       PROGRAM-ID.  ALMOX.
      *
       ENVIRONMENT DIVISION.
       CONFIGURATION SECTION,
       SPECIAL-NAMES.
           DECIMAL-POINT IS COMMA.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           SELECT ALMOX-S ASSIGN TO DISK.
       DATA DIVISION.
       FILE SECTION.
       FD ALMOX-S
           RECORD CONTAINS 53 CHARACTERS
           LABEL RECORD IS STANDARD
           DATA RECORD IS REG-ALMOX
           VALUE OF FILE-ID "ALMOX.DAT".
       01  REG-ALMOX.
           02  COD-PRODUTO    PIC 9(04).
           02  NOME-PRODUTO   PIC X(30).
           02  QTD-ESTOQUE    PIC 9(04).
           02  CUSTO-UNITARIO PIC 9(05)V99.
           02  CUSTO-TOTAL    PIC 9(06)V99.
       WORKING-STORAGE SECTION.
       01  VARIAVEIS-SISTEMA.
           02  WS-LIMPA       PIC X(30) VALUE SPACES.
           02  WS-CONT        PIC 9(03) VALUE ZEROS.
           02  ED-CONT        PIC ZZ9.
       01  WS-DATA.
           02  WS-ANO         PIC 9(02) VALUE ZEROS.
           02  WS-MES         PIC 9(02) VALUE ZEROS.
           02  WS-DIA         PIC 9(02) VALUE ZEROS.
       01  WS-HORA.
           02  WS-HOR         PIC 9(02) VALUE ZEROS.
           02  WS-MIN         PIC 9(02) VALUE ZEROS.
           02  WS-SEG         PIC 9(02) VALUE ZEROS.
           02  WS-CSE         PIC 9(02) VALUE ZEROS.
       SCREEN SECTION.
       01  TELA.
           02  BLANK SCREEN.
           02  LINE  1 COLUMN  1  VALUE "DATA:".
           02  LINE  1 COLUMN 29  VALUE "CONTROLE DE ALMOXARIFADO".
           02  LINE  3 COLUMN 07  VALUE "C¢digo do Produto......:".
           02  LINE  4 COLUMN 07  VALUE "Nome do Produto........:".
           02  LINE  5 COLUMN 07  VALUE "Quantidade em Estoque..:".
           02  LINE  6 COLUMN 07  VALUE "Custo Unit rio.........:".
           02  LINE  7 COLUMN 07  VALUE "Custo Total............:".
           02  LINE 21 COLUMN 07  VALUE "MENSAGEM: ".
           02  LINE 21 COLUMN 60  VALUE "Contador <   >".
       PROCEDURE DIVISION.
       010-INICIO.
           DISPLAY (01, 01) ERASE.
           OPEN OUTPUT ALMOX-S.
           ACCEPT WS-DATA FROM DATE.
           ACCEPT WS-HORA FROM TIME.
       020-VIDEO.
           DISPLAY TELA.
           DISPLAY (01, 07) WS-DIA "/" WS-MES "/" WS-ANO.
       030-LIMPA-DADOS.
           DISPLAY (03, 32) WS-LIMPA.
           DISPLAY (04, 32) WS-LIMPA.
           DISPLAY (05, 32) WS-LIMPA.
           DISPLAY (06, 32) WS-LIMPA.
           DISPLAY (07, 32) WS-LIMPA.
       040-CODIGO.
           ACCEPT (03, 32) COD-PRODUTO WITH PROMPT.
           IF COD-PRODUTO = ZEROS
              DISPLAY (21, 18) "C¢digo Inv lido - Redigite"
              GO TO 040-CODIGO.
           IF COD-PRODUTO = 9999
              GO TO 060-FIM.
       041-NOME.
           ACCEPT (04, 32) NOME-PRODUTO WITH PROMPT.
           IF NOME-PRODUTO = SPACES
              DISPLAY (21, 18) "Nome em Branco - Redigite"
              GO TO 041-NOME.
       042-ESTOQUE.
           ACCEPT (05, 32) QTD-ESTOQUE WITH PROMPT.
           IF QTD-ESTOQUE < 1
              DISPLAY (21, 18) "Quantidade Inv lida - Redigite"
              GO TO 042-ESTOQUE.
       043-CUSTO-UNITARIO.
           ACCEPT (06, 32) CUSTO-UNITARIO WITH PROMPT.
           IF CUSTO-UNITARIO = ZEROS
              DISPLAY (21, 18) "Custo Inv lido - Redigite"
              GO TO 043-CUSTO-UNITARIO.
       050-GRAVAR.
           COMPUTE CUSTO-TOTAL = CUSTO-UNITARIO * QTD-ESTOQUE
           DISPLAY (07, 34) CUSTO-TOTAL.
           WRITE REG-ALMOX.
           ADD 1 TO WS-CONT.
           MOVE WS-CONT TO ED-CONT.
           DISPLAY (21, 70) ED-CONT.
           GO TO 030-LIMPA-DADOS.
       060-FIM.
           DISPLAY (01, 01) ERASE.
           DISPLAY (10, 40) "Fim do Programa".
           CLOSE ALMOX-S.
           STOP RUN.
      ***---------- FIM DO PROGRAMA ALMOX ---------***
