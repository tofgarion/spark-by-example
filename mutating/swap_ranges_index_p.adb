package body Swap_Ranges_Index_P with
   Spark_Mode
 is
   procedure Swap_Ranges
     (A : in out T_Arr;
      B : in out T_Arr)
   is
   begin

      for J in A'Range loop
         declare
            K : Positive := B'First + (J - A'First);
         begin
            Swap (A (J), B (K));

            pragma Loop_Invariant
              (B'Loop_Entry (B'First .. K) = A (A'First .. J));
            pragma Loop_Invariant
              (A'Loop_Entry (A'First .. J) =
               B (B'First .. B'First + (J - A'First)));
            pragma Loop_Invariant
              (if K < B'Last then
                 B'Loop_Entry (K + 1 .. B'Last) = B (K + 1 .. B'Last));
            pragma Loop_Invariant
              (if J < A'Last then
                 A'Loop_Entry (J + 1 .. A'Last) = A (J + 1 .. A'Last));

         end;
      end loop;
   end Swap_Ranges;
end Swap_Ranges_Index_P;
