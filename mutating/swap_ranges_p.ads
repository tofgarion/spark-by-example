with Types;  use Types;
with Swap_P; use Swap_P;

package Swap_Ranges_P with
   Spark_Mode
 is
   procedure Swap_Ranges
     (A : in out T_Arr;
      B : in out T_Arr) with
      Pre  => A'Length = B'Length,
      Post => A'Old = B and then B'Old = A;

end Swap_Ranges_P;
