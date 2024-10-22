      IDENTIFICATION DIVISION.
      PROGRAM-ID.                GerarArquivoSaida.




      ENVIRONMENT DIVISION.
      CONFIGURATION SECTION.
      SOURCE-COMPUTER. IBM-370.
      OBJECT-COMPUTER. IBM-370.

      INPUT-OUTPUT SECTION.
      FILE-CONTROL.
          SELECT SAIDA-FILE ASSIGN TO 'saida.txt'
              ORGANIZATION IS LINE SEQUENTIAL.

      DATA DIVISION.
      FILE SECTION.
      FD  SAIDA-FILE.
      01  SAIDA-RECORD.
          05  NUMERO-SAIDA    PIC 9(10).

      WORKING-STORAGE SECTION.
      01  SQLCODE               PIC S9(9) COMP.
      01  WS-NUMERO             PIC 9(10).
      01  EOF                   PIC X VALUE 'N'.
      01  DB-CONNECTION         PIC X(20) VALUE 'compras'.

      EXEC SQL INCLUDE SQLCA END-EXEC.

      PROCEDURE DIVISION.
      MAIN-PROCEDURE.
          PERFORM CONNECT-DB
          PERFORM FETCH-RECORDS
          PERFORM DISCONNECT-DB
          STOP RUN.

      CONNECT-DB.
          EXEC SQL
              CONNECT TO :DB-CONNECTION
          END-EXEC
          IF SQLCODE NOT = 0
              DISPLAY 'Erro ao conectar ao banco de dados, SQLCODE: ' SQLCODE
              STOP RUN
          END-IF.

      FETCH-RECORDS.
          OPEN OUTPUT SAIDA-FILE
          EXEC SQL
              DECLARE CURSOR1 CURSOR FOR
              SELECT numero FROM numeros
          END-EXEC
          EXEC SQL
              OPEN CURSOR1
          END-EXEC
          PERFORM UNTIL EOF = 'Y'
              EXEC SQL
                  FETCH CURSOR1 INTO :WS-NUMERO
              END-EXEC
              IF SQLCODE = 0
                  MOVE WS-NUMERO TO NUMERO-SAIDA
                  WRITE SAIDA-RECORD
              ELSE IF SQLCODE = 100
                  MOVE 'Y' TO EOF
              ELSE
                  DISPLAY 'Erro ao buscar dados, SQLCODE: ' SQLCODE
                  PERFORM CLOSE-CURSOR
                  STOP RUN
              END-IF
          END-PERFORM
          PERFORM CLOSE-CURSOR
          CLOSE SAIDA-FILE.

      CLOSE-CURSOR.
          EXEC SQL
              CLOSE CURSOR1
          END-EXEC.

      DISCONNECT-DB.
          EXEC SQL
              DISCONNECT CURRENT
          END-EXEC.
