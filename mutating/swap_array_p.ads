with Types;               use Types;
with Multiset_Predicates; use Multiset_Predicates;
with Classic_Lemmas;      use Classic_Lemmas;
with Occ_P;               use Occ_P;

package Swap_Array_P with
   Spark_Mode
 is

   procedure Swap_Array
     (A : in out T_Arr;
      J :        Positive;
      K :        Positive) with
      Pre  => A'Length >= 1 and then J in A'Range and then K in A'Range,
      Post => A'Old (J) = A (K) and then A'Old (K) = A (J)
      and then
      (for all L in A'Old'Range =>
         (if J /= K and then K /= K then A'Old (L) = A (L)))
      and then Multiset_Unchanged (A'Old, A);

end Swap_Array_P;
