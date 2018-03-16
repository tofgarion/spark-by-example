package body Remove_Copy_P with
     Spark_Mode is
   procedure Remove_Copy (A : T_Arr; B : in out T_Arr; Val : T) is
      J : Integer := B'First;
   begin
      for I in A'Range loop
         if A (I) /= Val then
	    
            B (J) := A (I);
	    pragma Assert(if J > B'First then Multiset_Retain_Rest(A(A'First .. I-1), B(B'First .. J-1), Val));
	    pragma Assert(if J > B'First then Multiset_Retain_Rest(A(A'First .. I), B(B'First .. J), Val));
            J     := J + 1;
	    
         end if;

         pragma Loop_Invariant (B'First <= J);
	 pragma Loop_Invariant (J - B'First <= I - A'First + 1);
         pragma Loop_Invariant (J <= B'Last+1);-- or else (J = B'Last + 1 and then (for all K in I+1.. A'Last => A(K)=Val)));
         pragma Loop_Invariant
           (J - B'First = I - A'First - Count (A (A'First .. I), Val) + 1);
	 pragma Loop_Invariant (if J = B'First then (for all K in A'First .. I => A(K) = Val));
	 --pragma Loop_Invariant (if (for all K in I+1.. A'Last => A(K)=Val) then J=B'Last +1);
         pragma Loop_Invariant
           (if
              J > B'First
            then
	   Multiset_Retain_Rest( A(A'First .. I), B(B'First .. J-1), Val)
	   );
	
	  
	 pragma Loop_Invariant (for all K in B'First .. J-1 => B(K) /= Val);
	 --pragma Loop_Invariant (if J = B'Last+1 then (for all  K in I+1 .. A'Last => A(K) = Val));
	   end loop;

--pragma Assert (J= B'Last + 1);
--pragma Assert (Multiset_Retain_Rest(A(A'First .. A'Last), B(B'First .. J-1),Val));
--pragma Assert  (Multiset_Retain_Rest (A, B, Val));

   end Remove_Copy;
end Remove_Copy_P;
