package body Partial_Sum_P with
  SPARK_Mode is
   
   procedure Partial_Sum(A : T_Arr; B : in out T_Arr) is
   begin
      if A'Length > 0 then
	 B(B'First) := A(A'First);
	 
	 for J in 1 .. A'Length-1  loop
	    
	    pragma Assert(Acc_Def(A,A'First,A'First+J,0).OK);
	    pragma Assert(Add_No_Overflow(A(A'First + J), B(B'First + (J-1))));
	    B(B'First + J) := B(B'First + (J-1)) + A(A'First + J);
	    
	    pragma Loop_Invariant(for all K in 0 .. J => B(B'First+K) = Acc_Def(A,A'First, A'First+K,0).Value);
	    
	 end loop;
      end if;
   end Partial_Sum;
end Partial_Sum_P;
