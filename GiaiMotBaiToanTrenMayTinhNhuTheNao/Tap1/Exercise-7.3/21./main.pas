PROGRAM Exercise7_3_21;

USES math;

VAR
  i: longint;

FUNCTION
  P(CONST i: longint): integer;
  BEGIN
    exit(Floor(Log10(i)) + 1);
  END;

FUNCTION
  Sum(CONST n: longint): real;
  VAR
    s: real = 0;
  BEGIN
    for i := 1 to n do
      s := s + P(i) / i;

    exit(s);
  END;

BEGIN

  Writeln(Sum(100):0:3);

END.
