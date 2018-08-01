with Types;               use Types;
with Multiset_Predicates; use Multiset_Predicates;
with Classic_Lemmas;      use Classic_Lemmas;
with Occ_P;               use Occ_P;

package Swap_Array_P with
   Spark_Mode
 is

   procedure Swap_Array
     (A : in out T_Arr;
      I :        Positive;
      J :        Positive) with
      Pre  => A'Length >= 1 and then I in A'Range and then J in A'Range,
      Post => A'Old (I) = A (J) and then A'Old (J) = A (I)
      and then
      (for all K in A'Old'Range =>
         (if I /= K and then J /= K then A'Old (K) = A (K)))
      and then Multiset_Unchanged (A'Old, A);

end Swap_Array_P;
