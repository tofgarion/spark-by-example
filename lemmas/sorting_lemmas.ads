with Types; use Types;
with Sorted_P; use Sorted_P;

package Sorting_Lemmas with
SPARK_Mode
is

   procedure Weakly_To_Sorted (A : T_arr)
     with Pre => Weakly_Sorted (A),
     Post => Sorted (A);

end Sorting_Lemmas;
