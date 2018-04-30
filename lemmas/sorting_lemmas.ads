with Types; use Types;
with Sorted_P; use Sorted_P;
with Upper_Bound_P, Lower_Bound_P; use Upper_Bound_P, Lower_Bound_P;
with Partition_P; use Partition_P;
with Has_Value_P; use Has_Value_P;
with Occ_P; use Occ_P;
with Occ_Def_P; use Occ_Def_P;

package Sorting_Lemmas with
SPARK_Mode
is

   procedure Weakly_To_Sorted (A : T_arr)
     with Pre => Weakly_Sorted (A),
     Post => Sorted (A);

   procedure Prove_Partition (A : T_Arr; Mid : Positive) with
     Pre => Mid in A'First + 1 .. A'Last
     and then Upper_Bound ( A (A'First .. Mid - 1) , A (A'First))
     and then Lower_Bound (A (Mid.. A'Last), A (A'First)),
     Post => Partition (A, Mid);

   procedure Test (A : T_Arr ; V : T) with Ghost,
     Pre => A'Length >= 1 and then Occ (A, V) >= 1,
     Post => Has_Value (A, V);




end Sorting_Lemmas;
