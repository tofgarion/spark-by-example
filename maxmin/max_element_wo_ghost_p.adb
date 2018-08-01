package body Max_Element_Wo_Ghost_P with
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
            pragma Loop_Invariant (A'Last >= Result.Value);
            pragma Loop_Invariant
              (for all K in A'First .. I => A (K) <= A (Result.Value));
            pragma Loop_Invariant
              (for all K in A'First .. Result.Value - 1 =>
                 A (K) < A (Result.Value));
         end loop;

         return Result;
      end if;
   end Max_Element;

end Max_Element_Wo_Ghost_P;
