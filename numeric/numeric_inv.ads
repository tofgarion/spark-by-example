with Types; use Types;
with Partial_Sum_P; use Partial_Sum_P;
with Adjacent_Difference_P; use Adjacent_Difference_P;
with Acc_Def_P; use Acc_Def_P;
with Overflow; use Overflow;

package Numeric_Inv with
  SPARK_Mode is
   
   procedure Partial_Sum_Inv
     (A,B : in out T_Arr) with
     Pre => A'Length = B'Length
     and then (for all J in A'Range => Acc_Def(A,A'First,J,0).OK),
     Post => A = A'Old;
   
   procedure Adjacent_Difference_Inv
     (A,B : in out T_Arr) with
     Pre => A'Length = B'Length
     and then (for all J in A'First+1 .. A'Last => Minus_No_Overflow(A(J),A(J-1))),
     Post => A = A'Old;
   
end Numeric_Inv;

