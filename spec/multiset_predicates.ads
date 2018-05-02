with Types;   use Types;
with Occ_P; use Occ_P;

package Multiset_Predicates with
     Spark_Mode,
     Ghost is

   function Multiset_Retain_Rest
     (A   : T_Arr;
      B   : T_Arr;
      Val : T) return Boolean is
     (for all X in T => (if X /= Val then Occ (A, X) = Occ (B, X)));

   function Multiset_Unchanged
     (A : T_Arr;
      B : T_Arr) return Boolean is
     (for all K in T => Occ (A, K) = Occ (B, K)) with
   Pre => A'Length = B'Length;

end Multiset_Predicates;
