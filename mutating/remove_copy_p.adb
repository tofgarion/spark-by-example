package body Remove_Copy_P with
     Spark_Mode is
   procedure Remove_Copy (A : in T_Arr; B : in out T_Arr; Val : T) is
      J : Integer := B'First;
   begin
      for I in A'Range loop
         if A (I) /= Val then
	    pragma Assert(Multiset_Retain_Rest(A (A'First .. I - 1), B( B'First .. J-1), Val));
            B (J) := A (I);
	    J     := J + 1;
	    pragma Assert(Count (A(A'First .. I), A(I)) = Count (B(B'First .. J-1), A(I)));
	    pragma Assert(Multiset_Retain_Rest(A (A'First .. I), B(B'First .. J-1), Val));
         end if;

         pragma Loop_Invariant (J in B'First .. B'Last + 1);
         pragma Loop_Invariant
           (J = B'First + I - A'First - Count (A (A'First .. I), Val) + 1);
         pragma Loop_Invariant
           (if J = B'First then (for all K in A'First .. I => A (K) = Val));
         pragma Loop_Invariant
           (if
              J > B'First
            then
              Multiset_Retain_Rest
                (A (A'First .. I),
                 B (B'First .. J - 1),
                 Val));
         pragma Loop_Invariant (for all K in B'First .. J - 1 => B (K) /= Val);

	   end loop;
end Remove_Copy;
end Remove_Copy_P;
