with Types;     use Types;
with Acc_Def_P; use Acc_Def_P;
with Overflow;  use Overflow;

package Partial_Sum_P with
   Spark_Mode
 is

   procedure Partial_Sum
     (A :        T_Arr;
      B : in out T_Arr) with
      Pre => A'Length = B'Length
      and then (for all J in A'Range => Acc_Def (A, A'First, J, 0).OK),
      Post =>
      (for all J in 0 .. A'Length - 1 =>
         B (B'First + J) = Acc_Def (A, A'First, A'First + J, 0).Value);

end Partial_Sum_P;
