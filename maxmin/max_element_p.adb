package body Max_Element_P with
     Spark_Mode is

   function Max_Element (A : T_Arr) return Option is
      Result : Option := (Exists => False);
   begin
      if A'Length = 0 then
         return Result;
      else
         Result := (Exists => True, Value => A'First);
         for I in A'First .. A'Last loop
            if A (Result.Value) < A (I) then
               Result.Value := I;
            end if;

            pragma Loop_Invariant (A'First <= Result.Value);
            pragma Loop_Invariant (Result.Value <= A'Last);
            pragma Loop_Invariant
              (Upper_Bound (A (A'First .. I), A (Result.Value)));
            pragma Loop_Invariant
              (if
                 Result.Value > A'First
               then
                 Strict_Upper_Bound
                   (A (A'First .. Result.Value - 1),
                    A (Result.Value)));
         end loop;

         return Result;
      end if;
   end Max_Element;

end Max_Element_P;
