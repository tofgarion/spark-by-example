package body Partial_Sum_P with
  SPARK_Mode is
   
   procedure Partial_Sum(A : T_Arr; B : in out T_Arr) is
   begin
      if A'Length > 0 then
	 B(B'First) := A(A'First);
	 
	 for I in 1 .. A'Length-1  loop
	    pragma Assert(Acc_Def(A(A'First .. A'First + I),0) in T'First .. T'Last);
	    B(B'First + I) := B(B'First + (I-1)) + A(A'First + I);
	    
	    pragma Loop_Invariant(B(B'First + I) = Acc_Def(A(A'First .. A'First+I),0));
	    pragma Loop_Invariant(Partial_Sum_Def(A(A'First .. A'First+I),B(B'First .. B'First +I)));
	    
	 end loop;
      end if;
   end Partial_Sum;
end Partial_Sum_P;
