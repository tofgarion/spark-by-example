with Types; use Types;
with Acc_Def_P; use Acc_Def_P;
with Overflow; use Overflow;

package Partial_Sum_P with
  SPARK_Mode is
   
   procedure Partial_Sum(A : T_Arr; B : in out T_Arr) with
     Pre => A'Length = B'Length
     and then (for all J in A'Range => Acc_Def(A,A'First,J,0).OK),
     Post => (for all J in A'Range => B(B'First + (J-A'First)) = Acc_Def(A,A'First,J,0).Value);
   
end Partial_Sum_P;
