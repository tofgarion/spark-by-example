with Types; use Types;
with Acc_Overflow; use Acc_Overflow;
with Partial_Sum_Def_P; use Partial_Sum_Def_P;
with Acc_Def_P; use Acc_Def_P;

package Partial_Sum_P with
  SPARK_Mode is
   
   procedure Partial_Sum(A : T_Arr; B : in out T_Arr) with
     Pre => A'Length = B'Length and then Acc_No_Overflow(A,0),
     Post => Partial_Sum_Def(A,B);
   
end Partial_Sum_P;
