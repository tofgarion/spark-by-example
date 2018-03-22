package body Random_Shuffle_P with
  SPARK_Mode is
   
   procedure Random_Shuffle (A : in out T_Arr) is
      J : Positive;
     -- V : T;
      Tmp : T_Arr := A with Ghost;
      Init : T_Arr := A with Ghost;
   begin
      
      for I in A'Range loop
	 J := Random_Number(A'First, I);
	 Tmp := A;  -- ghost
	 
	-- V := A(I);
	-- A(I) := A(J);
	-- A(J) := V;
	A:= Swap_Array(A,I,J);
	-- Swap(A(I),A(J));
	Swap_Multiset_Inv_Lemma(Tmp,A,I,J);
	Multiset_Transitivity_Lemma(Init,Tmp,A);
	pragma Loop_Invariant(Multiset_Unchanged(Tmp,A));
	pragma Loop_Invariant(Multiset_Unchanged(Init,Tmp));
	--pragma Loop_Invariant(Multiset_Unchanged(A(A'First .. I),A'Loop_Entry(A'First .. I)));
	--pragma Loop_Invariant(if I /=A'Last then A'Loop_Entry(I+1 .. A'Last) = A(I+1 .. A'Last));
	pragma Loop_Invariant(Multiset_Unchanged(Init,A));
	 
      end loop;
   end Random_Shuffle;
end Random_Shuffle_P;
