package body Reverse_In_Place_P with
   Spark_Mode
 is

   procedure Reverse_In_Place (A : in out T_Arr) is
      Half : Integer :=
        (if A'Length > 0 then
           A'First + (A'Last - A'First) / 2 -
           (if A'Length mod 2 = 0 then 0 else 1)
         else -1);
      T1 : T;
   begin

      for I in 0 .. Half - A'First loop
         T1              := A (A'First + I);
         A (A'First + I) := A (A'Last - I);
         A (A'Last - I)  := T1;
         --Swap(A(A'First+I), A(A'Last - I));  We may run in aliasing issues when calling Swap. See documentation.
         pragma Loop_Variant (Increases => I);
         pragma Loop_Invariant
           (A (A'First + I + 1 .. A'Last - (I + 1)) =
            A'Loop_Entry (A'First + I + 1 .. A'Last - (I + 1)));
         pragma Loop_Invariant
           (Is_Reversed
              (A (A'First .. A'First + I),
               A'Loop_Entry (A'Last - I .. A'Last)));
         pragma Loop_Invariant
           (Is_Reversed
              (A'Loop_Entry (A'First .. A'First + I),
               A (A'Last - I .. A'Last)));

      end loop;

   end Reverse_In_Place;
end Reverse_In_Place_P;
