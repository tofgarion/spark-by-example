package body Insertion_Sort_P with 
  SPARK_Mode
is
   
   procedure Insertion_Sort(A : in out T_Arr)
   is
      K : Integer;
   begin
      if A'Length = 0 then
	 return;
      end if;
      
      for J in A'Range loop
	 K :=(if J = A'First then A'First else Search_Upper_Bound(A(A'First .. J-1),A(J)).Value);
	 
	 for L in reverse K .. J-1 loop
	       
	    Swap_Array(A,L,L+1);
	    
	    pragma Loop_Invariant(if L > K then A(L-1)<=A(L+1));
	    pragma Loop_Invariant(Multiset_Unchanged(A,A'Loop_Entry));
	    pragma Loop_Invariant(for all M in A'First .. L-1 => A(M) = A'Loop_Entry(M));
	    pragma Loop_Invariant(Sorted(A(A'First .. L-1)));
	    pragma Loop_Invariant(for all M in A'First .. K-1 => A(M) <= A(L));
	    pragma Loop_Invariant(for all M in K .. J => A(M) >= A(L));
	    pragma Loop_Invariant(Sorted(A(L .. J)));
	 end loop;
	 
	 pragma Loop_Invariant(Sorted(A(A'First .. J)));
	 pragma Loop_Invariant(Multiset_Unchanged(A,A'Loop_Entry));
	 
      end loop;     
      
   end Insertion_Sort;
   
end Insertion_Sort_P;
