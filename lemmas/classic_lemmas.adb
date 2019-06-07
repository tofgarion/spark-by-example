package body Classic_Lemmas with
   Spark_Mode
is

   procedure Occ_Equal
     (A : T_Arr;
      B : T_Arr;
      E : T)
   is
   begin
      if A'Length = 0 then
         return;
      end if;

      if A (A'Last) = E then
         pragma Assert (B (B'Last) = E);
      else
         pragma Assert (B (B'Last) /= E);
      end if;

      Occ_Equal (Remove_Last (A), Remove_Last (B), E);
   end Occ_Equal;

   procedure Occ_Set
     (A : T_Arr;
      B : T_Arr;
      J : Positive;
      V : T;
      E : T)
   is
      Tmp : T_Arr := Remove_Last (A);
   begin
      if A'Length = 0 then
         return;
      end if;

      if J = A'Last then
         Occ_Equal (Tmp, Remove_Last (B), E);
      else
         Tmp (J) := V;
         Occ_Equal (Remove_Last (B), Tmp, E);
         Occ_Set (Remove_Last (A), Tmp, J, V, E);
      end if;
   end Occ_Set;

   procedure New_Element (A, B : T_Arr) is
   begin
      for X in T loop
         pragma Assert (Occ (Remove_Last (A), X) = Occ (Remove_Last (B), X));

         pragma Loop_Invariant
           (for all Y in T'First .. X => (Occ (A, Y) = Occ (B, Y)));
      end loop;
   end New_Element;

   procedure Unchanged_Transitivity (A, B, C : T_Arr) is
   begin
      if B = C then
         Equal_Implies_Multiset_Unchanged (B, C);
      end if;
   end Unchanged_Transitivity;

   procedure Occ_To_Has_Value
     (A : T_Arr;
      V : T)
   is
   begin
      if A'Length = 1 then
         return;
      end if;

      if A (A'Last) = V then
         return;
      else
         Occ_To_Has_Value (Remove_Last (A), V);
      end if;

   end Occ_To_Has_Value;

   procedure Has_Value_To_Occ
     (A : T_Arr;
      V : T)
   is
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
         Has_Value_To_Occ (Remove_Last (A), V);
      end if;
   end Has_Value_To_Occ;

   procedure Partial_Eq
     (A, B : T_Arr;
      Eq   : Positive;
      E    : T)
   is
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

   procedure Multiset_With_Eq
     (A, B : T_Arr;
      Eq   : Positive)
   is
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

   procedure Equal_Implies_Multiset_Unchanged (A, B : T_Arr) is
   begin
      for V in T loop
         Occ_Equal (A, B, V);
         pragma Loop_Invariant
           (for all E in T'First .. V => Occ (A, E) = Occ (B, E));
      end loop;
   end Equal_Implies_Multiset_Unchanged;
end Classic_Lemmas;
