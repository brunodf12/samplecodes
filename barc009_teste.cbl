IDENTIFICATION DIVISION.
PROGRAM-ID. PrimeNumberCheck.

DATA DIVISION.
WORKING-STORAGE SECTION.
   01 WS-NUMBER PIC 9(5).
   01 WS-I PIC 9(5).
   01 WS-FLAG PIC X VALUE 'T'.

PROCEDURE DIVISION.
    DISPLAY "Enter a number: " WITH NO ADVANCING.
    ACCEPT WS-NUMBER.

    IF WS-NUMBER <= 1
       DISPLAY "The number is not prime."
       STOP RUN
    END-IF.

    PERFORM VARYING WS-I FROM 2 BY 1 UNTIL WS-I >= WS-NUMBER
       IF WS-NUMBER MOD WS-I = 0
          MOVE 'F' TO WS-FLAG
          EXIT PERFORM
       END-IF
    END-PERFORM.

    IF WS-FLAG = 'T'
       DISPLAY "The number is prime."
    ELSE
       DISPLAY "The number is not prime."
    END-IF.

    STOP RUN.
