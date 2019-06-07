package body Reverse_In_Place_P with
   Spark_Mode
 is

   procedure Reverse_In_Place (A : in out T_Arr) is
      Half : Positive :=
        (if A'Length > 1 then
           A'First + (A'Last - A'First) / 2 -
           (if A'Length mod 2 = 0 then 0 else 1)
         else 1);
      T1 : T;
   begin

      if A'Length <= 1 then
         return;
      end if;

      for J in 0 .. Half - A'First loop
         T1              := A (A'First + J);
         A (A'First + J) := A (A'Last - J);
         A (A'Last - J)  := T1;

         pragma Loop_Variant (Increases => J);
         pragma Loop_Invariant
           (A (A'First + J + 1 .. A'Last - (J + 1)) =
            A'Loop_Entry (A'First + J + 1 .. A'Last - (J + 1)));
         pragma Loop_Invariant
           (Is_Reversed_Up_To (A, A'Loop_Entry, J));
         pragma Loop_Invariant
           (Is_Reversed_Up_To (A'Loop_Entry, A, J));
      end loop;

   end Reverse_In_Place;
end Reverse_In_Place_P;
