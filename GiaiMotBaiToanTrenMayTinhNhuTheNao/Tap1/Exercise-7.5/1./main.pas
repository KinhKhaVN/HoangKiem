PROGRAM Exercise7_5_1;


FUNCTION
  Recursive(n: integer): longint;
  BEGIN
    Writeln(n);
    if (n = 0) OR (n = 1) then exit(n);

    if n mod 2 = 0 then exit(Recursive(n div 2))

    else 
        exit(Recursive(n div 2) + Recursive((n div 2) + 1));
  END;


BEGIN
  Writeln('Recursive: ', Recursive(10));
END.
