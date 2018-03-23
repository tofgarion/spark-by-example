with Types; use Types;
with Occ_P; use Occ_P;

package Multiset_Unchanged_P with
     Spark_Mode,
     Ghost is

   function Multiset_Unchanged
     (A : T_Arr;
      B : T_Arr) return Boolean is
     (for all K in T => Occ (A, K) = Occ (B, K)) with
       Pre => A'Length = B'Length;

end Multiset_Unchanged_P;
