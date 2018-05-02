with Types;    use Types;
with Sorted_P; use Sorted_P;
with Upper_Bound_P, Lower_Bound_P;
use Upper_Bound_P, Lower_Bound_P;
with Partition_P;         use Partition_P;
with Has_Value_P;         use Has_Value_P;
with Occ_P;               use Occ_P;
with Occ_Def_P;           use Occ_Def_P;
with Multiset_Predicates; use Multiset_Predicates;

package Sorting_Lemmas with
     Spark_Mode is

   procedure Weakly_To_Sorted (A : T_Arr) with
      Pre  => Weakly_Sorted (A),
      Post => Sorted (A);

   procedure Prove_Partition (A : T_Arr; Mid , Size: Positive) with
      Pre => Mid in A'First + 1 .. Size and then Size in A'Range
      and then Upper_Bound (A (A'First .. Mid - 1), A (A'First))
      and then Lower_Bound (A (Mid .. Size), A (A'First)),
      Post => Partition (A, Mid,Size);

   procedure Occ_To_Has_Value (A : T_Arr; V : T) with
      Ghost,
      Pre  => A'Length >= 1 and then Occ (A, V) >= 1,
      Post => Has_Value (A, V);

   procedure Has_Value_To_Occ (A : T_Arr; V : T) with
      Ghost,
      Pre  => A'Length >= 1 and then Has_Value (A, V),
      Post => Occ (A, V) >= 1;

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

   procedure Prove_Lower_Bound (A, A_Save : T_Arr; M, J : Positive) with
      Ghost,
      Pre => A'Length > 0
      and then M in A'First + 1 .. A'Last
      and then J in A'Range
      and then A_Save'First = A'First
      and then A_Save'Last = A'Last
      and then A'First = 1
      and then A'Last = MAX_SIZE
      and then
      (for all K in 1 .. M - 1 => Lower_Bound (A_Save (M .. J), A_Save (K)))
      and then Multiset_Unchanged (A, A_Save)
      and then (for all K in M .. MAX_SIZE => A (K) = A_Save (K)),
     Post => Lower_Bound (A (M .. J), A (1));

   procedure Prove_Partition_After_Sort (A, A_Save : T_Arr ; M, Size : Positive) with
     Ghost,
     Pre => A'Length > 0
      and then M in A'First + 1 .. Size
      and then Size in A'Range
      and then A_Save'First = A'First
      and then A_Save'Last = A'Last
      and then A'First = 1
     and then A'Last = MAX_SIZE
     and then Partition (A_Save, M,Size)
     and then Multiset_Unchanged (A, A_Save)
     and then (for all K in M .. MAX_SIZE => A (K) = A_Save (K)),
     Post => Partition (A, M,Size);



end Sorting_Lemmas;
