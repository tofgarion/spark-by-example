package body Max_Element_P with
     Spark_Mode is

   function Max_Element (A : T_Arr) return Positive is
      Max : Positive := A'First;
   begin
      for I in A'First .. A'Last loop
         if A (Max) < A (I) then
            Max := I;
         end if;

         pragma Loop_Invariant (A'First <= Max);
         pragma Loop_Invariant (A'Last >= Max);
         pragma Loop_Invariant (for all K in A'First .. I => A (K) <= A (Max));
         pragma Loop_Invariant
           (for all K in A'First .. Max - 1 => A (K) < A (Max));
      end loop;

      return Max;

   end Max_Element;

end Max_Element_P;
