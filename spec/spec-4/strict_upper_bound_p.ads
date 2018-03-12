with Types; use Types;

package Strict_Upper_Bound_P with
     Spark_Mode,
     Ghost is
   function Strict_Upper_Bound
     (A   : T_Arr;
      Val : T) return Boolean is
     (for all I in A'Range => A (I) < Val);

end Strict_Upper_Bound_P;
