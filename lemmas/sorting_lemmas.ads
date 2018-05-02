with Types;    use Types;
with Sorted_P; use Sorted_P;
with Occ_P, Occ_Def_P;
use Occ_P, Occ_Def_P;
with Multiset_Predicates; use Multiset_Predicates;

package Sorting_Lemmas with
     Spark_Mode is

   procedure Weakly_To_Sorted (A : T_Arr) with
      Pre  => Weakly_Sorted (A),
      Post => Sorted (A);

   procedure Partial_Eq (A, B : T_Arr; Eq : Positive; E : T) with
      Ghost,
      Pre => A'Length = B'Length
     and then A'Length >= 1
      and then Eq in A'First + 1 .. A'Last
      and then (for all J in Eq .. A'Last => A (J) = B (J - A'First + B'First))
      and then Occ (A, E) = Occ (B, E),
      Post => Occ (A (A'First .. Eq - 1), E) =
      Occ (B (B'First .. Eq - A'First + B'First - 1), E);

   procedure Multiset_With_Eq (A, B : T_Arr; Eq : Positive) with
      Ghost,
     Pre => A'Length = B'Length
       and then B'Last < Positive'Last
      and then A'Length >= 1
      and then Eq in A'First + 1 .. A'Last
      and then Multiset_Unchanged (A, B)
      and then
      (for all J in Eq .. A'Last => A (J) = B (J - A'First + B'First)),
      Post => Multiset_Unchanged
        (A (A'First .. Eq - 1),
         B (B'First .. Eq - A'First + B'First - 1));

end Sorting_Lemmas;
