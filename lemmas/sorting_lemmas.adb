package body Sorting_Lemmas with
     Spark_Mode is
   procedure Weakly_To_Sorted (A : T_Arr) is
   begin
      for J in A'Range loop
         null;
         pragma Loop_Invariant (Sorted (A (A'First .. J)));
      end loop;
   end Weakly_To_Sorted;

   procedure Prove_Partition (A : T_Arr; Mid,Size : Positive) is
   begin
      null;
   end Prove_Partition;

   procedure Occ_To_Has_Value (A : T_Arr; V : T) is
   begin
      if A'Length = 1 then
         return;
      end if;
      if A (A'Last) = V then
         return;
      else
         Occ_To_Has_Value  (Remove_Last (A), V);
      end if;

   end Occ_To_Has_Value;

   procedure Has_Value_To_Occ (A : T_Arr; V : T) is
   begin
      if A'Length = 1 then
         pragma Assert (A (A'First) = V);
         return;
      end if;

      if A (A'Last) = V then
         pragma Assert (Occ (Remove_Last (A), V) >= 0);
         pragma Assert (Occ (A, V) >= 1);
         return;
      else
         Has_Value_To_Occ(Remove_Last (A), V);
      end if;
   end Has_Value_To_Occ;

   procedure Partial_Eq (A, B : T_Arr; Eq : Positive; E : T) is
   begin
      if A'Last = Eq then
         return;
      end if;

      if A (A'Last) = E then
         pragma Assert (B (B'Last) = E);
      else
         pragma Assert (B (B'Last) /= E);
      end if;

      Partial_Eq (Remove_Last (A), Remove_Last (B), Eq, E);
   end Partial_Eq;

   procedure Multiset_With_Eq (A, B : T_Arr; Eq : Positive) is
      Eq_B : constant Positive := Eq - A'First + B'First;
   begin
      for E in T loop
         Partial_Eq (A, B, Eq, E);
         pragma Loop_Invariant
           (for all F in T'First .. E =>
              Occ (A (A'First .. Eq - 1), F) =
              Occ (B (B'First .. Eq_B - 1), F));
      end loop;

   end Multiset_With_Eq;

   procedure Prove_Lower_Bound (A, A_Save : T_Arr; M, J : Positive) is
   begin
      Multiset_With_Eq (A, A_Save, M);
      Has_Value_To_Occ (A(1 .. M-1), A (1));
      Occ_To_Has_Value(A_Save(1 .. M - 1),A(1));

   end Prove_Lower_Bound;

   procedure Prove_Partition_After_Sort (A, A_Save : T_Arr ; M, Size : Positive) is
   begin
      Multiset_With_Eq (A, A_Save, M);
      for J in A'First .. M-1 loop
         Has_Value_To_Occ (A (1 .. M - 1), A(J));
         Occ_To_Has_Value (A_Save (1 .. M - 1), A (J));

         pragma Loop_Invariant (for all K in 1 .. J => (for all L in M .. Size => A (K) <= A (L)));
      end loop;
   end Prove_Partition_After_Sort;

end Sorting_Lemmas;
