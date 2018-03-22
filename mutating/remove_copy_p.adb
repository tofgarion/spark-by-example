package body Remove_Copy_P with
     Spark_Mode is

   procedure Remove_Copy (A : in T_Arr; B : in out T_Arr; Val : T) is
      K : Integer := B'First;
   begin
      if B'Length > 0 then
         for J in A'Range loop

            if A (J) /= Val then
               B (K) := A (J);
               K     := K + 1;
            end if;

            pragma Loop_Invariant (K in B'First .. B'Last + 1);
            pragma Loop_Invariant
              (K =
               B'First + Remove_Count (A (A'First .. J), Val) + 1);
           pragma Loop_Invariant
             (if K = B'First then (for all L in A'First .. J => A (L) = Val));
            pragma Loop_Invariant
              (if
                 K > B'First
		 then
	    --  Remove_Mapping(A(A'First .. J), B(B'First .. K-1), Val) and then
	      Multiset_Retain_Rest
                   (A (A'First .. J),
                    B (B'First .. K - 1),
                    Val));
	    pragma Loop_Invariant(if K > B'First then Remove_Mapping(A(A'First .. J),B(B'First .. K-1),Val));
            pragma Loop_Invariant
              (for all L in B'First .. K - 1 => B (L) /= Val);
         end loop;
      end if;

   end Remove_Copy;
end Remove_Copy_P;
