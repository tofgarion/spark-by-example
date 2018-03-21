with Types; use Types;
with Acc_Def_P; use Acc_Def_P;

package Acc_Overflow with
  Spark_Mode,
  Ghost is
   
   function Acc_No_Overflow(A : T_Arr; Init : T) return Boolean is
      (for all I in A'Range => Acc_Def(A(A'First .. I),Init) in T'First .. T'Last);
      
end Acc_Overflow;
