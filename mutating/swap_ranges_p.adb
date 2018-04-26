package body Swap_Ranges_P with
     Spark_Mode is
   procedure Swap_Ranges (A : in out T_Arr; B : in out T_Arr) is
   begin

       for J in 0 .. A'Length - 1 loop
         Swap (A (A'First + J), B (B'First + J));

         pragma Loop_Invariant
           (B'Loop_Entry (B'First .. B'First + J)= A(A'First .. A'First + J));
         pragma Loop_Invariant
           (A'Loop_Entry (A'First .. A'First + J) =
	      B (B'First .. B'First + J));
	 pragma Loop_Invariant (if B'First + J < B'Last then
	   B'Loop_Entry (B'First +J + 1 .. B'Last) = B (B'First +J + 1 .. B'Last));
	 pragma Loop_Invariant (if A'First + J < A'Last then
	   A'Loop_Entry (A'First + J +1 .. A'Last) = A(A'First + J +1 .. A'Last));
	 
      end loop;
   end Swap_Ranges;
end Swap_Ranges_P;
