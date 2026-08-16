PROGRAM Exercise7_3_29;

TYPE
  mang = array[0..4] of integer;

VAR
  A: mang = (5, 4, 3, 2, 1);
  B: mang = (5, 4, 2 ,1, 3);
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

PROCEDURE
  Check(CONST A, B: array of integer);
  VAR
    i, na, nb: integer;
  BEGIN
    na := length(A);
    nb := length(B);

    if na <> nb then
      BEGIN
        Writeln('B is not permutation of A!');
        Writeln('Length A: ', na);
        Writeln('Length B: ', nb);
        exit;
      END;

    for i := 0 to na - 1 do
      BEGIN
        if A[i] <> B[i] then
          BEGIN
            Writeln('A[i] is not the same as B[i]!');
            Writeln('A[', i, ']: ', A[i]);
            Writeln('B[', i, ']: ', B[i]);
            exit;
          END;
      END;

    Writeln('B is a permutation of A');
  END;

BEGIN
  Print(A);
  Sort(A);
  Sort(B);
  Print(A);

  Check(A, B);
  Check(A, C);
END.
