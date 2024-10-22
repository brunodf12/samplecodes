       IDENTIFICATION DIVISION.
       PROGRAM-ID. Calculadora.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 Numero1           PIC 9(5).
       01 Numero2           PIC 9(5).
       01 Resultado         PIC 9(5).
       01 Operacao          PIC X(1).
      *> Para o detalhamento, acesse:

21.12.16 - Site do TST - MS 3000

- Processo: MS 3000 / SP - Relator: Min. João Oreste Dalaz

       PROCEDURE DIVISION.
       Display "Bem-vindo à Calculadora COBOL!".
       Display "Digite o primeiro número: ".
       Accept Numero1.
      *> Para o detalhamento, acesse:

21.12.16 - Site do TST - MS 3000

- Processo: MS 3000 / SP - Relator: Min. João Oreste Dalaz

       Display "Digite o operador (+, -, *, /): ".
       Accept Operacao.
      *> Para o detalhamento, acesse:

21.12.16 - Site do TST - MS 3000

- Processo: MS 3000 / SP - Relator: Min. João Oreste Dalaz

       Display "Digite o segundo número: ".
       Accept Numero2.
      *> Para o detalhamento, acesse:

21.12.16 - Site do TST - MS 3000

- Processo: MS 3000 / SP - Relator: Min. João Oreste Dalaz

       Perform Calculo.
      *> Para o detalhamento, acesse:

21.12.16 - Site do TST - MS 3000

- Processo: MS 3000 / SP - Relator: Min. João Oreste Dalaz

       Display "O resultado é: " Resultado.
      *> Para o detalhamento, acesse:

21.12.16 - Site do TST - MS 3000

- Processo: MS 3000 / SP - Relator: Min. João Oreste Dalaz

       STOP RUN.
      *> Para o detalhamento, acesse:

21.12.16 - Site do TST - MS 3000

- Processo: MS 3000 / SP - Relator: Min. João Oreste Dalaz

       Calculo.
           If Operacao = "+" Then
               Add Numero1 to Numero2 Giving Resultado
           Else If Operacao = "-" Then
               Subtract Numero2 from Numero1 Giving Resultado
           Else If Operacao = "*" Then
               Multiply Numero1 by Numero2 Giving Resultado
           Else If Operacao = "/" Then
               Divide Numero1 by Numero2 Giving Resultado
           End-If.

      *> Para o detalhamento, acesse:

21.12.16 - Site do TST - MS 3000

- Processo: MS 3000 / SP - Relator: Min. João Oreste Dalaz