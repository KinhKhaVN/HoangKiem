PROGRAM Exercise7_3_29;

TYPE
  mang = array[0..4] of integer;

VAR
  A: mang = (5, 4, 3, 2, 1);
  B: mang = (5, 5, 2 ,1, 3);
  C: array[0..2] of integer = (0, 1, 2);

PROCEDURE
  Init;
  BEGIN
  END;

PROCEDURE
  Swap(VAR a, b: integer);
  VAR
    tmp: integer;
  BEGIN
    tmp := a;
    a := b;
    b := tmp;
  END;

PROCEDURE
  Sort(VAR A: mang);
  VAR
    i, j: integer;
    n: integer;
  BEGIN
    n := length(A);
    for i := 0 to n - 1 do
      BEGIN
        for j := i + 1 to n - 1 do
          if A[i] > A[j] then swap(A[i], A[j]);
      END;
  END;

PROCEDURE
  Print(CONST A: mang);
  VAR
    i: integer;
  BEGIN
    for i := 0 to length(A) - 1 do
      Write(A[i]: 2);
    Writeln;
  END;

FUNCTION
  AreTheSame(CONST A, B: array of integer): boolean;
  VAR
    i: integer;
  BEGIN
    for i := 0 to length(A) - 1 do
      if A[i] <> B[i] then exit(false);

    exit(true);
  END;

PROCEDURE
  Counting(CONST A: array of integer; VAR cnt: array of integer);
  VAR
    i: integer;
  BEGIN
    for i := 0 to length(A) - 1 do
      inc(cnt[A[i]]);
  END;

PROCEDURE
  Check(CONST A, B: array of integer);
  VAR
    i, na, nb: integer;
  BEGIN
    Writeln;
    Writeln('[Check 1]');
    na := length(A);
    nb := length(B);

    if na <> nb then
      BEGIN
        Writeln('B is not permutation of A!');
        Writeln('Length A: ', na);
        Writeln('Length B: ', nb);
        exit;
      END;

    if NOT AreTheSame(A, B) then   
      BEGIN
        Writeln('A[i] is not the same as B[i]!');
        exit;
      END;

    Writeln('B is a permutation of A');
  END;

FUNCTION
  FindMax(CONST A: array of integer): integer;
  VAR
    i, max: integer;
  BEGIN
    max := A[0];

    for i := 1 to length(A) - 1 do
      if max < A[i] then max := A[i];
    
    exit(max);
  END;

PROCEDURE
  Check2(CONST A, B: array of integer);
  VAR
    i, na, nb, n: integer;
    maxA, maxB: integer;
    cntA, cntB: array of integer;
  BEGIN
    Writeln;
    Writeln('[Check 2 - Counting distribution]');
    na := length(A);
    nb := length(B);

    maxA := FindMax(A);
    maxB := FindMax(B);

    if (na <> nb) OR (maxA <> maxB) then
      BEGIN
        if na <> nb then
          BEGIN
            Writeln('B is not permutation of A!');
            Writeln('Length A: ', na);
            Writeln('Length B: ', nb);
            exit;
          END;

          if maxA <> maxB then
          BEGIN
            Writeln('B is not permutation of A!');
            Writeln('Max A: ', maxA);
            Writeln('Max B: ', maxB);
            exit;
          END;
        END;

    SetLength(cntA, maxA);
    SetLength(cntB, maxB);

    Counting(A, cntA);
    Counting(B, cntB);

    if NOT AreTheSame(cntA, cntB) then
      BEGIN
        Writeln('Counting distribution are not the same!');
        exit;
      END;

    Writeln('B is a permutation of A');
  END;

BEGIN
  Print(A);
  Print(B);

  Sort(A);
  Sort(B);
  
  Print(A);
  Print(B);

  Check(A, B);
  Check(A, C);

  Check2(A, B);
END.
