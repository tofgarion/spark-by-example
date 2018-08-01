package body Swap_Ranges_P with
   Spark_Mode
 is
   procedure Swap_Ranges
     (A : in out T_Arr;
      B : in out T_Arr)
   is
   begin

      for J in 0 .. A'Length - 1 loop
         declare
            K : constant Positive := A'First + J;
            L : constant Positive := B'First + J;
         begin

            Swap (A (K), B (L));

            pragma Loop_Invariant (K = A'First + J and L = B'First + J);
            pragma Loop_Invariant
              (B'Loop_Entry (B'First .. L) = A (A'First .. K));
            pragma Loop_Invariant
              (A'Loop_Entry (A'First .. K) = B (B'First .. L));
            pragma Loop_Invariant
              (if L < B'Last then
                 B'Loop_Entry (L + 1 .. B'Last) = B (L + 1 .. B'Last));
            pragma Loop_Invariant
              (if K < A'Last then
                 A'Loop_Entry (K + 1 .. A'Last) = A (K + 1 .. A'Last));
         end;

      end loop;
   end Swap_Ranges;
end Swap_Ranges_P;
