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

--        procedure Lemma_1 (A : T_Arr; E : T) with
--           Ghost,
--           Pre => (for all L in A'First .. A'Last => A (L) = Val)
--           and then E /= Val,
--           Post => Occ (A, E) = 0 is
--        begin
--           if A'Length = 0 then
--              return;
--           end if;
--           Lemma_1 (Remove_Last (A), E);
--        end Lemma_1;
--
--        procedure Lemma_2 (A : T_Arr; B : T_Arr; E : T) with
--           Ghost,
--           Pre  => A = B,
--           Post => Occ (A, E) = Occ (B, E) is
--        begin
--           if A'Length = 0 then
--              return;
--           end if;
--
--           if A (A'Last) = E then
--              pragma Assert (B (B'Last) = E);
--           else
--              pragma Assert (B (B'Last) /= E);
--           end if;
--
--           Lemma_2 (Remove_Last (A), Remove_Last (B), E);
--        end Lemma_2;
--
--        procedure No_Changes (A, B_Save, B : T_Arr) with
--           Pre => A'Length > 0
--           and then B_Save = B
--           and then Multiset_Retain_Rest (A, B_Save, Val),
--           Post => Multiset_Retain_Rest (A, B, Val) is
--        begin
--           for E in T loop
--              if E /= Val then
--                 Lemma_2 (B, B_Save, E);
--                 pragma Assert (Occ (A, E) = Occ (B, E));
--              end if;
--              pragma Loop_Invariant
--                (for all F in T'First .. E =>
--                   (if F /= Val then Occ (A, F) = Occ (B, F)));
--           end loop;
--        end No_Changes;
--
--        procedure Make_Prove (A : T_Arr; B : T_Arr) with
--           Pre => A'Length > 0
--           and then B'Length > 0
--           and then
--           (if
--              B'Length = 1
--            then
--              (for all L in A'First .. A'Last - 1 => A (L) = Val)
--            else
--              Multiset_Retain_Rest
--                (Remove_Last (A),
--                 B (B'First .. B'Last - 1),
--                 Val))
--           and then A (A'Last) = B (B'Last),
--           Post => Multiset_Retain_Rest (A, B, Val) is
--           V : T := A (A'Last);
--        begin
--           --   if B'Length > 1 then
--           for E in T loop
--              if E /= Val then
--                 if B'Length = 1 then
--                    Lemma_1 (Remove_Last (A), E);
--                 end if;
--                 if E /= V then
--                    pragma Assert (Occ (Remove_Last (A), E) = Occ (A, E));
--                    pragma Assert (Occ (Remove_Last (B), E) = Occ (B, E));
--                 else
--                    pragma Assert (Occ (A, E) = Occ (Remove_Last (A), E) + 1);
--                    pragma Assert (Occ (B, E) = Occ (Remove_Last (B), E) + 1);
--                 end if;
--              end if;
--              pragma Loop_Invariant
--                (for all F in T'First .. E =>
--                   (if F /= Val then Occ (A, F) = Occ (B, F)));
--           end loop;
--
--        end Make_Prove;

   begin
      K := B'First;
      for J in A'Range loop
         if A (J) /= Val then
            B_Save := B;
            --    pragma Assert (if K > B'First then Multiset_Retain_Rest (Remove_Last (A(A'First .. J)), Remove_Last (B(B'First .. K)), Val));
            B (K) := A (J);
            -- pragma Assert (for all E in T => Occ(B_Save(B'First .. K - 1),E) = Occ(B(B'First .. K - 1),E));
            --  pragma Assert(if K > B'First then Multiset_Retain_Rest (A(A'First .. J-1), B(B'First .. K - 1), Val));
            pragma Assert
              (if
                 K > B'First
               then
                 Multiset_Retain_Rest
                   (A (A'First .. J - 1),
                    B_Save (B'First .. K - 1),
                    Val));
            pragma Assert (B (B'First .. K - 1) = B_Save (B'First .. K - 1));
            if K > B'First then
               No_Changes
                 (A (A'First .. J-1),
                  B_Save (B'First .. K - 1),
                  B (B'First .. K - 1),Val);
            end if;
            K := K + 1;
            --  pragma Assert (if K > B'First + 1 and then J > A'First then Multiset_Retain_Rest (A(A'First .. J-1), B(B'First .. K-2), Val));
            -- pragma Assert (if K > B'First+1 then Multiset_Retain_Rest (Remove_Last (A(A'First .. J)), Remove_Last (B_Save(B'First .. K-1)), Val));
            Make_Prove (A (A'First .. J), B (B'First .. K - 1), Val);
         end if;

         pragma Loop_Invariant (K - 1 - B'First <= J - A'First);
         pragma Loop_Invariant
           (if K = B'First then (for all L in A'First .. J => A (L) = Val));
         pragma Loop_Invariant (K in B'First .. B'Last + 1);
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
