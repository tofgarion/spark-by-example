with Types;   use Types;
with Count_P; use Count_P;

package Multiset_Predicates with
     Spark_Mode,
     Ghost is

   function Multiset_Retain_Rest
     (A   : T_Arr;
      B   : T_Arr;
      Val : T) return Boolean is
     (for all X in T => (if X /= Val then Count (A, X) = Count (B, X)));

   function Multiset_Retain_Rest
     (A    : T_Arr;
      B    : T_Arr;
      Val1 : T;
      Val2 : T) return Boolean is
     (for all X in T =>
        (if X /= Val1 and then X /= Val2 then Count (A, X) = Count (B, X)));

   function Multiset_Unchanged
     (A : T_Arr;
      B : T_Arr) return Boolean is
     (for all K in T => Count (A, K) = Count (B, K)) with
      Pre => A'Length = B'Length;

   function Multiset_Add
     (A   : T_Arr;
      B   : T_Arr;
      Val : T) return Boolean is
     (Count (A, Val) = Count (B, Val) + 1) with
      Pre => A'Length = B'Length;

   function Multiset_Minus
     (A   : T_Arr;
      B   : T_Arr;
      Val : T) return Boolean is
     (Count (A, Val) = Count (B, Val) - 1) with
      Pre => A'Length = B'Length;

end Multiset_Predicates;
