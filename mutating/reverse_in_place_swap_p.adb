package body Reverse_In_Place_Swap_P with
   Spark_Mode
 is

   procedure Reverse_In_Place (A : in out T_Arr) is
      Half : Positive :=
        (if A'Length > 1 then
           A'First + (A'Last - A'First) / 2 -
           (if A'Length mod 2 = 0 then 0 else 1)
         else 1);
   begin

      if A'Length <= 1 then
         return;
      end if;

      for J in 0 .. Half - A'First loop

         pragma Assert (A'First + J /= A'Last - J);
         Swap (A (A'First + J), A (A'Last - J));

         pragma Loop_Variant (Increases => J);
         pragma Loop_Invariant
           (A (A'First + J + 1 .. A'Last - (J + 1)) =
            A'Loop_Entry (A'First + J + 1 .. A'Last - (J + 1)));
         pragma Loop_Invariant
           (Is_Reversed
              (A (A'First .. A'First + J),
               A'Loop_Entry (A'Last - J .. A'Last)));
         pragma Loop_Invariant
           (Is_Reversed
              (A'Loop_Entry (A'First .. A'First + J),
               A (A'Last - J .. A'Last)));

      end loop;

   end Reverse_In_Place;
end Reverse_In_Place_Swap_P;
