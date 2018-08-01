package body Reverse_Copy_P with
   Spark_Mode
 is

   procedure Reverse_Copy
     (A :        T_Arr;
      B : in out T_Arr)
   is
   begin
      for I in B'Range loop
         B (I) := A (A'Last - (I - B'First));

         pragma Loop_Variant (Increases => I);
         pragma Loop_Invariant
           (Is_Reversed
              (B (B'First .. I), A (A'Last - (I - B'First) .. A'Last)));

      end loop;
   end Reverse_Copy;
end Reverse_Copy_P;
