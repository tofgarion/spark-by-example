with Types;               use Types;
with Multiset_Predicates; use Multiset_Predicates;
with Occ_Def_P;           use Occ_Def_P;
with Occ_P;               use Occ_P;
with Has_Value_P;         use Has_Value_P;

package Classic_Lemmas with
   Spark_Mode,
   Ghost
 is

   procedure Occ_Equal
     (A : T_Arr;
      B : T_Arr;
      E : T) with
      Pre  => A = B,
      Post => Occ (A, E) = Occ (B, E);

   function Is_Set
     (A : T_Arr;
      J : Positive;
      V : T;
      B : T_Arr)
      return Boolean is
     (A'First = B'First and then A'Last = B'Last and then B (J) = V
      and then (for all K in A'Range => (if J /= K then B (K) = A (K)))) with
      Pre => J in A'Range;

   procedure Occ_Set
     (A : T_Arr;
      B : T_Arr;
      J : Positive;
      V : T;
      E : T) with
      Pre  => J in A'Range and then Is_Set (A, J, V, B),
      Post =>
      (if V = A (J) then Occ (B, E) = Occ (A, E)
       elsif V = E then Occ (B, E) = Occ (A, E) + 1
       elsif A (J) = E then Occ (B, E) = Occ (A, E) - 1
       else Occ (B, E) = Occ (A, E));

   procedure New_Element (A, B : T_Arr) with
      Pre => A'Length > 0 and then B'Length = A'Length
      and then Multiset_Unchanged (Remove_Last (A), Remove_Last (B))
      and then A (A'Last) = B (B'Last),
      Post => Multiset_Unchanged (A, B);

   procedure Unchanged_Transitivity (A, B, C : T_Arr) with
      Pre => A'Length > 0 and then B'Length = A'Length
      and then C'Length = B'Length and then Multiset_Unchanged (A, B)
      and then (Multiset_Unchanged (B, C) or else B = C),
      Post => Multiset_Unchanged (A, C);

   procedure Occ_To_Has_Value
     (A : T_Arr;
      V : T) with
      Pre  => A'Length >= 1 and then Occ (A, V) >= 1,
      Post => Has_Value (A, V);

   procedure Has_Value_To_Occ
     (A : T_Arr;
      V : T) with
      Pre  => A'Length >= 1 and then Has_Value (A, V),
      Post => Occ (A, V) >= 1;

   procedure Partial_Eq
     (A, B : T_Arr;
      Eq   : Positive;
      E    : T) with
      Pre => A'Length = B'Length and then A'Length >= 1
      and then Eq in A'First + 1 .. A'Last
      and then (for all J in Eq .. A'Last => A (J) = B (J - A'First + B'First))
      and then Occ (A, E) = Occ (B, E),
      Post => Occ (A (A'First .. Eq - 1), E) =
      Occ (B (B'First .. Eq - A'First + B'First - 1), E);

   procedure Multiset_With_Eq
     (A, B : T_Arr;
      Eq   : Positive) with
      Pre => A'Length = B'Length and then B'Last < Positive'Last
      and then A'Length >= 1 and then Eq in A'First + 1 .. A'Last
      and then Multiset_Unchanged (A, B)
      and then
      (for all J in Eq .. A'Last => A (J) = B (J - A'First + B'First)),
      Post => Multiset_Unchanged
        (A (A'First .. Eq - 1), B (B'First .. Eq - A'First + B'First - 1));

   procedure Equal_Implies_Multiset_Unchanged (A, B : T_Arr) with
      Pre  => A = B,
      Post => Multiset_Unchanged (A, B);

end Classic_Lemmas;
