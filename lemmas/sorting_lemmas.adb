package body Sorting_Lemmas with
SPARK_Mode
is
   procedure Weakly_To_Sorted (A : T_Arr)
   is
   begin
      for J in A'Range loop
         null;
         pragma Loop_Invariant (Sorted(A(A'First .. J)));
         end loop;
      end Weakly_To_Sorted;

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
         pragma Loop_Invariant ( for all F in T'First .. E =>
                                   Occ ( A (A'first .. Eq - 1), F) = Occ ( B (B'First .. Eq_B - 1), F));
      end loop;

   end Multiset_With_Eq;

end Sorting_Lemmas;
