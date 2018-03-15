package body Reverse_In_Place_P with
  SPARK_Mode is
   
   procedure Reverse_In_Place(A : in out T_Arr) is
      Half : Integer := A' First + (A'Last - A'First)/2 - (if A'Length mod 2 = 0 then 0 else 1);
      T1 : T;
	  Old_A : T :=A(A'First) with Ghost;
   begin
      
      for I in 0 .. Half-A'First  loop
	 pragma Assert(Half <A'Last-(I-A'First));
	 
	 T1 := A(A'First+I);
	 A(A'First+I) :=A(A'Last -I);
	 A(A'Last -I) := T1;
	-- Swap(A(I), A(A'Last - (I-A'First)));
	-- Swap(A(1),A(2));
	 
	 pragma Loop_Invariant(if I /= 0 then A(A'Last-I+1)=Old_A);	 
	 pragma Loop_Variant(Increases => I);
	 pragma Loop_Invariant(A'First + I /= A'Last -I);
	 pragma Loop_Invariant(for all K in 0 .. I =>A(A'First+K) =  A'Loop_Entry(A'Last -K ));
	 Old_A := A(A'Last-I);
	 
	-- pragma Loop_Invariant(Is_Reversed(A'Loop_Entry(A'First .. I), A(A'Last - I + A'First .. A'Last)));
	-- pragma Loop_Invariant(if I /= A'First then
	--		       A(I+1 .. A'Last - I-1 + A'First)=A'Loop_Entry(I+1 .. A'Last - I-1 + A'First));
      end loop;
      
   end Reverse_In_Place;
end Reverse_In_Place_P;

   
