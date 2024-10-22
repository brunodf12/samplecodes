IDENTIFICATION DIVISION.
PROGRAM-ID. LeapYearCheck.

DATA DIVISION.
WORKING-STORAGE SECTION.
   01 WS-YEAR PIC 9(4).

PROCEDURE DIVISION.
    DISPLAY "Enter a year: " WITH NO ADVANCING.
    ACCEPT WS-YEAR.

    IF WS-YEAR MOD 400 = 0 OR (WS-YEAR MOD 4 = 0 AND WS-YEAR MOD 100 NOT = 0)
       DISPLAY "The year " WS-YEAR " is a leap year."
    ELSE
       DISPLAY "The year " WS-YEAR " is not a leap year."
    END-IF.

    STOP RUN.
