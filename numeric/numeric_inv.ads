with Types; use Types;
with Partial_Sum_P; use Partial_Sum_P;
with Adjacent_Difference_P; use Adjacent_Difference_P;
with Acc_Def_P; use Acc_Def_P;
with Overflow; use Overflow;

package Numeric_Inv with
  SPARK_Mode is
   
   procedure Partial_Sum_Inv
     (A : in out T_Arr; B : in out T_Arr) with
     Pre => A'Length = B'Length
     and then (for all J in A'Range => Acc_Def(A,A'First,J,0).OK),
     Post => A = A'Old;
   
end Numeric_Inv;

