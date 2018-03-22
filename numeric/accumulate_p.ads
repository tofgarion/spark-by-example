with Types; use Types;
with Acc_Def_P; use Acc_Def_P;
with Acc_Overflow; use Acc_Overflow;

package Accumulate_P with
  SPARK_Mode is
   
   function Accumulate(A : T_Arr; Init : T) return T with
     Pre => (for all I in A'Range => Acc_Def(A(A'First ..I),Init) in T),
     Post => Accumulate'Result = Acc_Def(A,Init);
   
end Accumulate_P;
