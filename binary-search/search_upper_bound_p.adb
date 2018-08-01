package body Search_Upper_Bound_P with
   Spark_Mode
 is
   function Search_Upper_Bound
     (A   : T_Arr;
      Val : T)
      return Option
   is
      Left   : Integer := A'First;
      Middle : Integer := A'First;
      Result : Option  := (Exists => False);
   begin
      if A'Length = 0 then
         return Result;
      else
         Result := (Exists => True, Value => A'Last + 1);
         while (Left < Result.Value) loop
            Middle := Left + (Result.Value - Left) / 2;

            if A (Middle) <= Val then
               Left := Middle + 1;
            else
               Result.Value := Middle;
            end if;

            pragma Loop_Variant (Decreases => Result.Value - Left);
            pragma Loop_Invariant (A'First <= Left);
            pragma Loop_Invariant (Left <= Result.Value);
            pragma Loop_Invariant (Result.Value <= A'Last + 1);
            pragma Loop_Invariant
              (if Left /= A'First then
                 Upper_Bound (A (A'First .. Left - 1), Val));
            pragma Loop_Invariant
              (if Result.Value /= A'Last + 1 then
                 Strict_Lower_Bound (A (Result.Value .. A'Last), Val));
         end loop;
         return Result;
      end if;

   end Search_Upper_Bound;

end Search_Upper_Bound_P;
