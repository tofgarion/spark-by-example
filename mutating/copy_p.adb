package body Copy_P with
  SPARK_Mode is
   
   procedure Copy
     (A : T_Arr;
      B : in out T_Arr) is
   begin 
      for I in A'Range loop
	 B(B'First + (I - A'First)) := A(I);
	 
	 pragma Loop_Variant(Increases => I);
	 pragma Loop_Invariant(A(A'First .. I) = B(B'First .. B'First + (I - A'First))); 
	 
      end loop;
   end Copy;
end Copy_P;
