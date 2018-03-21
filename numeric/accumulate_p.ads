with Types; use Types;
with Acc_Def_P; use Acc_Def_P;
with Acc_Overflow; use Acc_Overflow;

package Accumulate_P with
  SPARK_Mode is
   
   function Accumulate(A : T_Arr; Init : T) return T with
     Pre => Acc_No_Overflow(A,Init),
     Post => Accumulate'Result = Acc_Def(A,Init);
   
end Accumulate_P;
