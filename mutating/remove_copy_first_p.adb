package body Remove_Copy_First_P with
   SPARK_Mode
 is
   procedure Remove_Copy_First
     (A   :        T_Arr;
      B   : in out T_Arr;
      Val :        T;
      K   : in out Natural)
   is
      J : Integer := A'First - 1;

   begin
      if A'Length > 0 then
         K := B'First;

         for J in A'Range loop
            if A (J) /= Val then
               B (K) := A (J);
               K     := K + 1;
            end if;

            pragma Loop_Invariant
              (K = B'First + Remove_Count (A (A'First .. J), Val));
            pragma Loop_Invariant
              (if K = B'First then (for all L in A'First .. J => A (L) = Val));
            pragma Loop_Invariant
              (if K > B'First then
                 Multiset_Retain_Rest
                   (A (A'First .. J), B (B'First .. K - 1), Val));
            pragma Loop_Invariant
              (for all L in B'First .. K - 1 => B (L) /= Val);
            pragma Loop_Invariant
              (for all L in K .. B'Last => B (L) = B'Loop_Entry (L));
         end loop;

         K := K - 1;
      end if;

   end Remove_Copy_First;
end Remove_Copy_First_P;
