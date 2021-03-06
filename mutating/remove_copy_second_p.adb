package body Remove_Copy_Second_P with
   SPARK_Mode
 is
   procedure Remove_Copy_Second
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
               pragma Assert
                 (if K > B'First then
                    Multiset_Retain_Rest
                      (A (A'First .. J - 1), B (B'First .. K - 1),
                       Val)); -- proved here
               B (K) := A (J);
               pragma Assert
                 (if K > B'First then
                    Multiset_Retain_Rest
                      (A (A'First .. J - 1), B (B'First .. K - 1),
                       Val)); -- not proved anymore
               K := K + 1;
               Make_Prove_Multiset
                 (A (A'First .. J), B (B'First .. K - 1), Val);
            end if;

            pragma Loop_Invariant
              (if K = B'First then (for all L in A'First .. J => A (L) = Val));
            pragma Loop_Invariant
              (K = B'First + Remove_Count (A (A'First .. J), Val));
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

   end Remove_Copy_Second;
end Remove_Copy_Second_P;
