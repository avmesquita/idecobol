       IDENTIFICATION DIVISION.
       PROGRAM-ID. PROG1b.
       AUTHOR. ANDRE MESQUITA.
       INSTALLATION. UNESA.
       DATE-WRITTEN. 17/06/2002.
       DATE-COMPILED.
      *
       ENVIRONMENT DIVISION.
       CONFIGURATION SECTION.
       SPECIAL-NAMES.
           DECIMAL-POINT IS COMMA.
      *
       DATA DIVISION.
      *FILE SECTION.
      *01  REG-ALUNO.
      *    02  MATRICULA.
      *        03 P-CINCO.
      *           04 P-QUATRO  PIC 9(04).
      *           04 P-UM      PIC 9(01).
      *        03 S-CINCO  PIC 9(05).
      *    02  NOME-ALUNO  PIC X(40).
       WORKING-STORAGE SECTION.
       77  ALTURA    PIC 9(04)V99 VALUE ZEROS.
       77  BASE      PIC 9(04)V99 VALUE ZEROS.
       77  HAREA     PIC Z.ZZ9,99.
       77  RESPOSTA  PIC A.
       77  CODIGO    PIC X(03)    VALUE "SIM".
       77  MENS      PIC X(25)    VALUE SPACES.
       77  MSG-LIMPA PIC X(25)    VALUE SPACES.
      *
       SCREEN SECTION
       01  TELA.
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
            02  LINE 23 COLUMN 58 VALUE "00:00:00".
            02  LINE 23 COLUMN 69 VALUE "17/06/2002".
            02  LINE 23 COLUMN 80 VALUE "บ".
            02  LINE 24 COLUMN 1  VALUE
                "ศออออออออออสออออออออออออออออออออออออออออ".
            02  LINE 24 COLUMN 41 VALUE
                "อออออออออออออออสออออออออออสออออออออออออผ".
            02  LINE 2  COLUMN 25 VALUE
                "*** UNIVERSIDADE ESTACIO DE SA ***".
            02  LINE 5  COLUMN 5 VALUE
                "Entre com o valor da Altura: ".
            02  LINE 7  COLUMN 5 VALUE
                "Entre com o valor da Base..: ".
            02  LINE 9  COLUMN 5 VALUE
                "A ตrea do Tringulo ......: ".
      * Para manter a janela, apagar somente da coordenada (4,2) at a (21,79)
      *
       PROCEDURE DIVISION
       010-00-INICIO.
           PERFORM 020-00-PROCESSA THRU
                   020-99-FIM-PROCESSA UNTIL
                   CODIGO = "NAO".
           MOVE "*** FIM DE PROGRAMA ***" TO MENS.
           DISPLAY (23, 14) MENS.
           DISPLAY (01, 01) ERASE.
           STOP RUN.
      *
       020-00-PROCESSA.
           DISPLAY TELA.
           ACCEPT (05, 36) ALTURA.
           ACCEPT (07, 36) BASE.
           COMPUTE HAREA = (ALTURA * BASE) /2.
           DISPLAY (09, 36) HAREA.
       020-01-REPETE.
           MOVE    "Deseja Continuar? (S/N): " TO MENS.
           DISPLAY (23, 14) MENS.
           ACCEPT  (23, 39) RESPOSTA.
           IF RESPOSTA = "S" or "s"
              MOVE "SIM" TO CODIGO
           ELSE IF RESPOSTA = "N" or "n"
              MOVE "NAO" TO CODIGO
           ELSE IF RESPOSTA NOT EQUAL TO "S" or "s" or "N" or "n"
              MOVE "Digitar (S/N) ou (s/n): " TO MENS
              DISPLAY (23, 14) MENS
              ACCEPT  (23, 39) RESPOSTA
              GO TO 020-01-REPETE
           ELSE NEXT SENTENCE.
       020-99-FIM-PROCESSA.
           EXIT.
      ***-------- FIM DO PROGRAMA PROG1 --------***
      * Caracteres Especiais *
      * 201 ษ ป 187          *
      * 204 ฬ น 185          *
      * 200 ศ ผ 188          *
      * 205 อ บ 186          *
      * 203 ห ส 202          *
      ************************
             

