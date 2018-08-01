with Types; use Types;

package Lower_Bound_P with
   Spark_Mode,
   Ghost
 is

   function Lower_Bound
     (A : T_Arr;
      V : T)
      return Boolean is (for all I in A'First .. A'Last => A (I) >= V);

   function Strict_Lower_Bound
     (A : T_Arr;
      V : T)
      return Boolean is (for all I in A'First .. A'Last => A (I) > V);

end Lower_Bound_P;
