function Multiply_No_Overflow
  (X, Y : T)
   return Boolean is
  (case X is when 0     => True,
     when -1            => Y /= T'First,
     when T'First .. -2 => Y in T'Last / X .. T'First / X,
     when 1 .. T'Last   => Y in T'First / X .. T'Last / X) with
   Contract_Cases => ((X * Y in T) => Multiply_No_Overflow'Result = True,
    others => Multiply_No_Overflow'Result = False);
