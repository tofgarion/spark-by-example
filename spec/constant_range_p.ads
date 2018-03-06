with Types; use Types;

package Constant_Range_P with
     Spark_Mode,
     Ghost is

   function Constant_Range
     (A     : T_Arr;
      Val   : T;
      First : Positive;
      Last  : Positive) return Boolean is
      --  (if Last < First then True
      --    else (for all I in First .. Last => A (I) = Val)) with
     (for all I in First .. Last => A (I) = Val) with
      Pre => (First in A'Range and then Last in A'Range) or else Last < First;

end Constant_Range_P;
