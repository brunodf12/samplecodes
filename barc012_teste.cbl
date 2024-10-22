IDENTIFICATION DIVISION.
PROGRAM-ID. SumNumbers.

DATA DIVISION.
WORKING-STORAGE SECTION.
   01 WS-NUMBER PIC 9(3) OCCURS 10 TIMES.
   01 WS-SUM PIC 9(5) VALUE 0.
   01 WS-I PIC 9(2).

PROCEDURE DIVISION.
    PERFORM VARYING WS-I FROM 1 BY 1 UNTIL WS-I > 10
       DISPLAY "Enter number " WS-I ": " WITH NO ADVANCING
       ACCEPT WS-NUMBER(WS-I)
       ADD WS-NUMBER(WS-I) TO WS-SUM
    END-PERFORM.

    DISPLAY "Sum of numbers: " WS-SUM.
    STOP RUN.