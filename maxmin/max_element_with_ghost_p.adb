package body Max_Element_With_Ghost_P with
     Spark_Mode is

   function Max_Element_With_Ghost (A : T_Arr) return Positive is
      Max : Positive := A'First;
   begin
      for I in A'First .. A'Last loop
         if A (Max) < A (I) then
            Max := I;
         end if;

         pragma Loop_Invariant (A'First <= Max);
         pragma Loop_Invariant (Max <= A'Last);
         pragma Loop_Invariant (Upper_Bound (A (A'First .. I), A (Max)));
         pragma Loop_Invariant
           (if
              Max > A'First
            then
              Strict_Upper_Bound (A (A'First .. Max - 1), A (Max)));
      end loop;

      return Max;

   end Max_Element_With_Ghost;

end Max_Element_With_Ghost_P;
