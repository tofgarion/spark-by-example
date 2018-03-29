package body Remove_Copy_P with
     Spark_Mode is

   procedure Remove_Copy
     (A   :        T_Arr;
      B   : in out T_Arr;
      Val :        T;
      K   :    out Natural)
   is
      J      : Integer := A'First - 1;
      B_Save : T_Arr   := B;

   begin
      K := B'First;
      for J in A'Range loop
         if A (J) /= Val then
            B_Save := B;
            B (K) := A (J);
            if K > B'First then
               No_Changes
                 (A (A'First .. J-1),
                  B_Save (B'First .. K - 1),
                  B (B'First .. K - 1),Val);
            end if;
            K := K + 1;
            Make_Prove (A (A'First .. J), B (B'First .. K - 1), Val);
         end if;

         pragma Loop_Invariant
           (if K = B'First then (for all L in A'First .. J => A (L) = Val));
         pragma Loop_Invariant
           (K = B'First + Remove_Count (A (A'First .. J), Val) + 1);
         pragma Loop_Invariant
           (if
              K > B'First
            then
              Multiset_Retain_Rest
                (A (A'First .. J),
                 B (B'First .. K - 1),
                 Val));
         pragma Loop_Invariant (for all L in B'First .. K - 1 => B (L) /= Val);
         pragma Loop_Invariant
           (for all L in K .. B'Last => B (L) = B'Loop_Entry (L));
      end loop;
      K := K - 1;

   end Remove_Copy;
end Remove_Copy_P;
