package body Adjacent_Difference_P with
  SPARK_Mode
is
   
   procedure Adjacent_Difference
     (A : T_Arr; B : in out T_Arr)
   is
   begin
      if A'Length > 0 then
	 B(B'First) := A(A'First);
	 
	 for J in 1 .. A'Length-1 loop
	    
	    pragma Assert(Minus_No_Overflow(A(A'First+J),A(A'First+J-1)));
	    
	    B(B'First+J) := A(A'First + J) - A(A'First + J- 1);
	    
	    pragma Loop_Invariant(for all K in 1 .. J =>
				    B(B'First+K) = A(A'First+K)-A(A'First+K-1));
	    pragma Loop_Invariant(B(B'First) = A(A'First));
	    
	 end loop;
	 
      end if;
   end Adjacent_Difference;
end Adjacent_Difference_P;

