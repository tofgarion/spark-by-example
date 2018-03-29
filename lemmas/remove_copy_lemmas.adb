package body Remove_Copy_Lemmas with
SPARK_Mode
is

 procedure Lemma_1 (A : T_Arr; E,Val : T) is
      begin
         if A'Length = 0 then
            return;
         end if;
         Lemma_1 (Remove_Last (A), E,Val);
      end Lemma_1;

      procedure Lemma_2 (A : T_Arr; B : T_Arr; E : T) is
      begin
         if A'Length = 0 then
            return;
         end if;

         if A (A'Last) = E then
            pragma Assert (B (B'Last) = E);
         else
            pragma Assert (B (B'Last) /= E);
         end if;

         Lemma_2 (Remove_Last (A), Remove_Last (B), E);
      end Lemma_2;

      procedure No_Changes (A, B_Save, B : T_Arr; Val :T) is
      begin
         for E in T loop
            if E /= Val then
               Lemma_2 (B, B_Save, E);
               pragma Assert (Occ (A, E) = Occ (B, E));
            end if;
            pragma Loop_Invariant
              (for all F in T'First .. E =>
                 (if F /= Val then Occ (A, F) = Occ (B, F)));
         end loop;
      end No_Changes;

      procedure Make_Prove (A : T_Arr; B : T_Arr; Val : T) is
         V : T := A (A'Last);
      begin
         for E in T loop
            if E /= Val then
               if B'Length = 1 then
                  Lemma_1 (Remove_Last (A), E, Val);
               end if;
               if E /= V then
                  pragma Assert (Occ (Remove_Last (A), E) = Occ (A, E));
                  pragma Assert (Occ (Remove_Last (B), E) = Occ (B, E));
               else
                  pragma Assert (Occ (A, E) = Occ (Remove_Last (A), E) + 1);
                  pragma Assert (Occ (B, E) = Occ (Remove_Last (B), E) + 1);
               end if;
            end if;
            pragma Loop_Invariant
              (for all F in T'First .. E =>
                 (if F /= Val then Occ (A, F) = Occ (B, F)));
         end loop;

   end Make_Prove;

end Remove_Copy_Lemmas;
