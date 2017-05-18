       IDENTIFICATION DIVISION.
       PROGRAM-ID. PROG1.
      *
       ENVIRONMENT DIVISION.
       CONFIGURATION SECTION.
       SPECIAL-NAMES.
                   DECIMAL-POINT IS COMMA.
                   PRINTER IS LPT1.
      *
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       77 ALTURA    PIC 9(04)V99 VALUE ZEROS.
       77 BASE      PIC 9(04)V99 VALUE ZEROS.
       77 HAREA     PIC Z.ZZ9,99.
       77 RESPOSTA  PIC A.
       77 CODIGO    PIC X(03)    VALUE "SIM".
       77 MENS      PIC X(25)    VALUE SPACES.
       77 MSG-LIMPA PIC X(25)    VALUE SPACES.
      *
       SCREEN SECTION
       01 TELA.
            02 BLANK SCREEN.
            02 LINE 1  COLUMN 1  VALUE
               "----------------------------------------".
            02 LINE 1  COLUMN 41 VALUE
               "----------------------------------------".
            02 LINE 2  COLUMN 25 VALUE
               "*** UNIVERSIDADE ESTACIO DE SA ***".
            02 LINE 3  COLUMN 1  VALUE
               "----------------------------------------".
            02 LINE 3  COLUMN 41 VALUE
               "----------------------------------------".
            02 LINE 5  COLUMN 25 VALUE
               "ENTRE COM O VALOR DA ALTURA..=".
            02 LINE 7  COLUMN 25 VALUE
               "ENTRE COM O VALOR DA BASE....=".
            02 LINE 9  COLUMN 25 VALUE
               "RESULTADO DO CALCULO DA AREA =".
            02 LINE 22 COLUMN 1  VALUE
               "----------------------------------------".
            02 LINE 22 COLUMN 41 VALUE
               "----------------------------------------".
            02 LINE 23 COLUMN 5  VALUE "MENSAGEM : ".
            02 LINE 23 COLUMN 50 VALUE "RESPOSTA : ".
       01 TELA2.
            02 BLANK SCREEN.
      *
       PROCEDURE DIVISION
       010-00-INICIO.
            PERFORM 020-00-PROCESSA THRU
                    020-99-FIM-PROCESSA UNTIL
                    CODIGO = "NAO".
            MOVE "*** FIM DE PROGRAMA ***" TO MENS.
            DISPLAY (23, 16) MENS.
                    DISPLAY (01, 01) ERASE.
            STOP RUN.
      *
      /
       020-00-PROCESSA.
            DISPLAY TELA.
      * Comando READ do Pascal:
            ACCEPT (05, 56) ALTURA.
            ACCEPT (07, 56) BASE.
      * Comando que informa o computador para executar:
            COMPUTE HAREA = (ALTURA * BASE) /2.
      * Mostra a variavel HAREA na coordenada desejada.
            DISPLAY (09, 56) HAREA.
       020-01-REPETE.
            MOVE   "DESEJA CONTINUAR S/N..: " TO MENS.
            DISPLAY (23, 16) MENS.
            ACCEPT  (23, 60) RESPOSTA.
            IF RESPOSTA = "S" or "s"
               MOVE "SIM" TO CODIGO
            ELSE IF RESPOSTA = "N" or "n"
               MOVE "NAO" TO CODIGO
            ELSE IF RESPOSTA NOT EQUAL TO "S" or "s" or "N" or "n"
               MOVE "DIGITAR S/N OU s/n" TO MENS
               DISPLAY (23, 16) MENS
               ACCEPT  (23, 60) RESPOSTA
            GO TO 020-01-REPETE
                 ELSE NEXT SENTENCE.
       020-99-FIM-PROCESSA.
            EXIT.
      ***-------- FIM DO PROGRAMA PROG1 --------***
      * Tres primeiras colunas reservadas para o numero da pagina. 001
      * as tres colunas seguintes referem-se a secao. ex.001
      * ---------------------------------------------------
      * A coluna 7:
      * * (asterisco)       - Define o comentario.
      * / (barra contraria) - separa as paginas na impressao.
      * - (hifen)           - para dar continuidade.
      * ---------------------------------------------------
      * A coluna 8:
      * Todos os nomes de DIVISOES e SECOES;
      *
      * ---------------------------------------------------
      * A coluna 12:
      * ---------------------------------------------------
      * A coluna 72 eh o limite para escrever codigo.
      * ---------------------------------------------------
      * Da coluna 73 ateh a 80 e usada para documentar versoes.
      * ---------------------------------------------------



