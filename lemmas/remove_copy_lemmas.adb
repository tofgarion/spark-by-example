package body Remove_Copy_Lemmas with
     Spark_Mode is

   procedure Lemma_1 (A : T_Arr; E, Val : T) is
   begin
      if A'Length = 0 then
         return;
      end if;
      Lemma_1 (Remove_Last (A), E, Val);
   end Lemma_1;

   procedure Lemma_3 (A : T_Arr; Val : T) is
   begin
      if A'Length = 0 then
         return;
      end if;

      Lemma_3 (Remove_Last (A), Val);
   end Lemma_3;

   procedure No_Changes (A, B, C : T_Arr; Val : T) is
   begin
      for E in T loop
         if E /= Val then
            Occ_Eq (B, C, E);
            pragma Assert (Occ (A, E) = Occ (C, E));
         end if;
         pragma Loop_Invariant
           (for all F in T'First .. E =>
              (if F /= Val then Occ (A, F) = Occ (C, F)));
      end loop;
   end No_Changes;

   procedure Make_Prove_Multiset (A : T_Arr; B : T_Arr; Val : T) is
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

   end Make_Prove_Multiset;

end Remove_Copy_Lemmas;
