with Types;   use Types;
with Count_P; use Count_P;

package Multiset_Retain_Rest_P with
     Spark_Mode,
     Ghost is
   function Multiset_Retain_Rest
     (A   : T_Arr;
      B   : T_Arr;
      Val : T) return Boolean is
     (for all X in T => (if X /= Val then Count (A, X) = Count (B, X)));
end Multiset_Retain_Rest_P;
