package body Reverse_Copy_P with
   Spark_Mode
 is

   procedure Reverse_Copy
     (A :        T_Arr;
      B : in out T_Arr)
   is
   begin
      for J in B'Range loop
         B (J) := A (A'Last - (J - B'First));

         pragma Loop_Invariant
           (Is_Reversed
              (B (B'First .. J), A (A'Last - (J - B'First) .. A'Last)));

      end loop;
   end Reverse_Copy;
end Reverse_Copy_P;
