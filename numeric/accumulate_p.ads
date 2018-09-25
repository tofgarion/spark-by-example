with Types;     use Types;
with Acc_Def_P; use Acc_Def_P;

package Accumulate_P with
   Spark_Mode
 is

   function Accumulate
     (A    : T_Arr;
      Init : T)
      return T with
      Pre  => (for all J in A'Range => Acc_Def (A, A'First, J, Init).OK),
      Post => Accumulate'Result = Acc_Def (A, A'First, A'Last, Init).Value;

end Accumulate_P;
