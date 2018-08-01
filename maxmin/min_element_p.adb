package body Min_Element_P with
     Spark_Mode is

   function Min_Element (A : T_Arr) return Option is
      Result : Option := (Exists => False);
   begin
      if A'Length = 0 then
         return Result;
      else
         Result := (Exists => True, Value => A'First);

         for I in A'First .. A'Last loop
            if A (I) < A (Result.Value) then
               Result.Value := I;
            end if;

            pragma Loop_Invariant (Result.Value in A'First .. A'Last);
            pragma Loop_Invariant
              (Lower_Bound (A (A'First .. I), A (Result.Value)));
            pragma Loop_Invariant
              ((if
                  Result.Value > A'First
                then
                  Strict_Lower_Bound
                    (A (A'First .. Result.Value - 1),
                     A (Result.Value))));

         end loop;

         return Result;

      end if;

   end Min_Element;
end Min_Element_P;
