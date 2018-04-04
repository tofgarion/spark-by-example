package body Replace_P with
  Spark_Mode is
   procedure Replace ( A : in out T_Arr ; Val : T ; Rep : T) is
   begin
      for I in A'Range loop
	 if A(I) = Val then
	    A(I) := Rep;
	 end if;
	 
	 pragma Loop_Invariant(Is_Replaced( A'Loop_Entry ( A'First ..I ), A(A'First ..I), Val, Rep));
	 pragma Loop_Invariant( if I < A'Last then A'Loop_Entry (I+1 .. A'Last) = A( I+1 .. A'Last));
	 end loop;
      end Replace;
   end Replace_P;
