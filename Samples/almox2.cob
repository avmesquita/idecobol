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
           02  RESPOSTA       PIC A.
           02  CODIGO         PIC X(03) VALUE "SIM".
           02  CT             PIC ZZZ.ZZ9,99.
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
       01  JANELA.
           02  BLANK SCREEN.
           02  LINE 1  COLUMN 1  VALUE
               "ษอออออออออออออออออออออออออออออออออออออออ".
           02  LINE 1  COLUMN 41 VALUE
               "อออออออออออออออออออออออออออออออออออออออป".
           02  LINE 2  COLUMN 1  VALUE "บ".
           02  LINE 2  COLUMN 80 VALUE "บ".
           02  LINE 3  COLUMN 1  VALUE
               "ฬอออออออออออออออออออออออออออออออออออออออ".
           02  LINE 3  COLUMN 41 VALUE
               "อออออออออออออออออออออออออออออออออออออออน".
           02  LINE 4  COLUMN 1  VALUE "บ".
           02  LINE 4  COLUMN 80 VALUE "บ".
           02  LINE 5  COLUMN 1  VALUE "บ".
           02  LINE 5  COLUMN 80 VALUE "บ".
           02  LINE 6  COLUMN 1  VALUE "บ".
           02  LINE 6  COLUMN 80 VALUE "บ".
           02  LINE 7  COLUMN 1  VALUE "บ".
           02  LINE 7  COLUMN 80 VALUE "บ".
           02  LINE 8  COLUMN 1  VALUE "บ".
           02  LINE 8  COLUMN 80 VALUE "บ".
           02  LINE 9  COLUMN 1  VALUE "บ".
           02  LINE 9  COLUMN 80 VALUE "บ".
           02  LINE 10 COLUMN 1  VALUE "บ".
           02  LINE 10 COLUMN 80 VALUE "บ".
           02  LINE 11 COLUMN 1  VALUE "บ".
           02  LINE 11 COLUMN 80 VALUE "บ".
           02  LINE 12 COLUMN 1  VALUE "บ".
           02  LINE 12 COLUMN 80 VALUE "บ".
           02  LINE 13 COLUMN 1  VALUE "บ".
           02  LINE 13 COLUMN 80 VALUE "บ".
           02  LINE 14 COLUMN 1  VALUE "บ".
           02  LINE 14 COLUMN 80 VALUE "บ".
           02  LINE 15 COLUMN 1  VALUE "บ".
           02  LINE 15 COLUMN 80 VALUE "บ".
           02  LINE 16 COLUMN 1  VALUE "บ".
           02  LINE 16 COLUMN 80 VALUE "บ".
           02  LINE 17 COLUMN 1  VALUE "บ".
           02  LINE 17 COLUMN 80 VALUE "บ".
           02  LINE 18 COLUMN 1  VALUE "บ".
           02  LINE 18 COLUMN 80 VALUE "บ".
           02  LINE 19 COLUMN 1  VALUE "บ".
           02  LINE 19 COLUMN 80 VALUE "บ".
           02  LINE 20 COLUMN 1  VALUE "บ".
           02  LINE 20 COLUMN 80 VALUE "บ".
           02  LINE 21 COLUMN 1  VALUE "บ".
           02  LINE 21 COLUMN 80 VALUE "บ".
           02  LINE 22 COLUMN 1  VALUE
               "ฬออออออออออหออออออออออออออออออออออออออออ".
           02  LINE 22 COLUMN 41 VALUE
               "อออออออออออออออหออออออออออหออออออออออออน".
           02  LINE 23 COLUMN 1  VALUE "บ MENSAGEM บ".
           02  LINE 23 COLUMN 56 VALUE "บ".
           02  LINE 23 COLUMN 67 VALUE "บ".
           02  LINE 23 COLUMN 80 VALUE "บ".
           02  LINE 24 COLUMN 1  VALUE
               "ศออออออออออสออออออออออออออออออออออออออออ".
           02  LINE 24 COLUMN 41 VALUE
               "อออออออออออออออสออออออออออสออออออออออออผ".
           02  LINE 2  COLUMN 25 VALUE
               "*** UNIVERSIDADE ESTACIO DE SA ***".
       01  TELA.
           02  LINE  4 COLUMN 30  VALUE "CONTROLE DE ALMOXARIFADO".
           02  LINE  6 COLUMN 07  VALUE "Cขdigo do Produto......:".
           02  LINE  7 COLUMN 07  VALUE "Nome do Produto........:".
           02  LINE  8 COLUMN 07  VALUE "Quantidade em Estoque..:".
           02  LINE  9 COLUMN 07  VALUE "Custo Unit rio.........:".
           02  LINE 10 COLUMN 07  VALUE "Custo Total............:".
           02  LINE 21 COLUMN 60  VALUE "Contador <   >".
       01  TELA-FIM.
           02  BLANK SCREEN.
           02  LINE 10 COLUMN 20  VALUE
               "ษออออออออออออออออออออออออออออออออออออออป  ".
           02  LINE 11 COLUMN 20  VALUE
               "บ                                      บฒฒ".
           02  LINE 12 COLUMN 20  VALUE
               "บ           Desenvolvido por           บฒฒ".
           02  LINE 13 COLUMN 20 VALUE
               "บ                                      บฒฒ".
           02  LINE 14 COLUMN 20  VALUE
               "บ       Andre Veloso de Mesquita       บฒฒ".
           02  LINE 15 COLUMN 20  VALUE
               "บ                                      บฒฒ".
           02  LINE 16 COLUMN 20  VALUE
               "ศออออออออออออออออออออออออออออออออออออออผฒฒ".
           02  LINE 17 COLUMN 20  VALUE
               "  ฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒ".
       PROCEDURE DIVISION.
       010-INICIO.
           DISPLAY (01, 01) ERASE.
           OPEN OUTPUT ALMOX-S.
           ACCEPT WS-DATA FROM DATE.
           ACCEPT WS-HORA FROM TIME.
       020-VIDEO.
           DISPLAY JANELA.
           DISPLAY TELA.
           DISPLAY (23, 69) WS-DIA "/" WS-MES "/20" WS-ANO.
           DISPLAY (23, 58) WS-HOR ":" WS-MIN ":" WS-SEG.
       030-LIMPA-DADOS.
           DISPLAY (07, 32) WS-LIMPA.
           DISPLAY (08, 32) WS-LIMPA.
           DISPLAY (09, 32) WS-LIMPA.
           DISPLAY (10, 32) WS-LIMPA.
           DISPLAY (11, 32) WS-LIMPA.
           DISPLAY (23, 14) "                                         ".
       040-CODIGO.
           ACCEPT (06, 32) COD-PRODUTO WITH PROMPT.
           IF COD-PRODUTO = ZEROS
              DISPLAY (23, 14) "Cขdigo Inv lido - Redigite"
              GO TO 040-CODIGO.
           IF COD-PRODUTO = 9999
              GO TO 080-FIM.
           DISPLAY (23, 14) "                              ".
       041-NOME.
           ACCEPT (07, 32) NOME-PRODUTO WITH PROMPT.
           IF NOME-PRODUTO = SPACES
              DISPLAY (23, 14) "Nome em Branco - Redigite"
              GO TO 041-NOME.
           DISPLAY (23, 14) "                              ".
       042-ESTOQUE.
           ACCEPT (08, 32) QTD-ESTOQUE WITH PROMPT.
           IF QTD-ESTOQUE < 1
              DISPLAY (23, 14) "Quantidade Inv lida - Redigite"
              GO TO 042-ESTOQUE.
           DISPLAY (23, 14) "                              ".
       043-CUSTO-UNITARIO.
           ACCEPT (09, 32) CUSTO-UNITARIO WITH PROMPT.
           IF CUSTO-UNITARIO = ZEROS
              DISPLAY (23, 14) "Custo Inv lido - Redigite"
              GO TO 043-CUSTO-UNITARIO.
           DISPLAY (23, 14) "                              ".
       060-GRAVAR.
           COMPUTE CUSTO-TOTAL = CUSTO-UNITARIO * QTD-ESTOQUE
           MOVE CUSTO-TOTAL TO CT.
           DISPLAY (10, 34) CT.
           DISPLAY (23, 14) "Deseja gravar e continuar? (S/N/T)"
           ACCEPT  (23, 49) RESPOSTA.
           IF RESPOSTA = "N" or "n"
              MOVE "NAO" TO CODIGO
              GO TO 030-LIMPA-DADOS
           ELSE IF RESPOSTA = "T" or "t"
              GO TO 080-FIM
           ELSE IF RESPOSTA = "S" or "s"
              NEXT SENTENCE
           ELSE IF RESPOSTA NOT EQUAL TO "S" or "s" or "N" or "n" or
                "T" or "t"
              DISPLAY (23, 14) "Digitar (S/N) ou (s/n) ou (T/t): "
              ACCEPT  (23, 41) RESPOSTA
              DISPLAY (23, 14) "                                 ".
       070-GRAVAR.
           WRITE REG-ALMOX.
           ADD 1 TO WS-CONT.
           MOVE WS-CONT TO ED-CONT.
           DISPLAY (21, 70) ED-CONT.
           GO TO 030-LIMPA-DADOS.
       080-FIM.
           DISPLAY TELA-FIM.
           CLOSE ALMOX-S.
           STOP RUN.
      ***---------- FIM DO PROGRAMA ALMOX ---------***
