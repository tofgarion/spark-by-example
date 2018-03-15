package body Swap_Ranges_P with
     Spark_Mode is
   procedure Swap_Ranges (A : in out T_Arr; B : in out T_Arr) is
   begin

      for I in A'Range loop
         Swap (A (I), B (B'First + (I- A'First)));

         pragma Loop_Invariant
           (B'Loop_Entry (B'First .. B'First + (I - A'First))= A(A'First .. I));
         pragma Loop_Invariant
           (A'Loop_Entry (A'First .. I) =
	      B (B'First .. B'First + (I - A'First)));
	 pragma Loop_Invariant (if B'First + (I-A'First) < B'Last then
	   B'Loop_Entry (B'First + (I-A'First) + 1 .. B'Last) = B (B'First + (I-A'First) + 1 .. B'Last));
	 pragma Loop_Invariant (if I < A'Last then
	   A'Loop_Entry (I+1 .. A'Last) = A(I+1 .. A'Last));
	 
      end loop;
   end Swap_Ranges;
end Swap_Ranges_P;
