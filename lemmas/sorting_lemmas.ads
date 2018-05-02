with Types;    use Types;
with Sorted_P; use Sorted_P;
with Upper_Bound_P, Lower_Bound_P;
use Upper_Bound_P, Lower_Bound_P;
with Partition_P;         use Partition_P;
with Has_Value_P;         use Has_Value_P;
with Occ_P;               use Occ_P;
with Occ_Def_P;           use Occ_Def_P;
with Multiset_Predicates; use Multiset_Predicates;
with Classic_Lemmas; use Classic_Lemmas;

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
