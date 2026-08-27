PROGRAM Exercise7_3_17;

CONST 
  n = 8;

TYPE
  Stack = array of integer;

VAR
  number: longint = 12304958;
  A: array[0..n - 1] of integer = (1, 2, 3, 5, 5, 5, 5, 5);
  s: Stack;
  stackSize: integer;

PROCEDURE
  InitStack(VAR s: Stack);
  BEGIN
    SetLength(s, n);
    stackSize := 0;
  END;

PROCEDURE
  Push(VAR s: Stack; CONST x: integer);
  BEGIN
    inc(stackSize);
    s[stackSize] := x;
  END;

FUNCTION
  Pop(VAR s: Stack): integer;
  BEGIN
    Pop := s[stackSize];
    dec(stackSize);
  END;

FUNCTION
  isEmptyStack(VAR s: Stack): boolean;
  BEGIN
    exit(stackSize = 0);
  END;

PROCEDURE
  SolveWithStack(VAR s: Stack; CONST A: array of integer);
  VAR
    lastDigit: integer;
  BEGIN
    while number > 0 do
      BEGIN
        lastDigit := number mod 10;
        if (lastDigit <> 5) AND (lastDigit <> 0) then
          Push(S, lastDigit);

        number := number div 10;
      END;
  END;

PROCEDURE
  PrintStack(s: Stack);
  BEGIN
    Writeln('PRINT STACK');

    while NOT isEmptyStack(S) do
      BEGIN
        Write(s[stackSize]);
        dec(stackSize);
      END;

    Writeln;
  END;

PROCEDURE
  Mark(VAR A: array of integer);
  VAR
    i: integer;
  BEGIN
    for i := 0 to length(A) - 1 do
      if (A[i] = 0) OR (A[i] = 5) then
        A[i] := -1;
  END;

PROCEDURE
  Print(CONST A: array of integer);
  VAR
    i: integer;
  BEGIN
    for i := 0 to length(A) - 1 do
      Write(A[i], ' ');
    Writeln;
  END;

PROCEDURE
  Solve(CONST A: array of integer );
  VAR
    i: integer;
  BEGIN
    for i := 0 to length(A) - 1 do
      if A[i] <> -1 then Write(A[i]);
    Writeln;
  END;

BEGIN

  Print(A);
  Mark(A);
  Print(A);

  Solve(A);

  InitStack(s);
  SolveWithStack(s, A);
  PrintStack(s);
END.
