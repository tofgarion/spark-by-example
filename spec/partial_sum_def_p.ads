with Types; use Types;
with Acc_Overflow; use Acc_Overflow;
with Acc_Def_P; use Acc_Def_P;

package Partial_Sum_Def_P with
  SPARK_Mode,
  Ghost is
   
   function Partial_Sum_Def(A : T_Arr; B : T_Arr) return Boolean is
      (for all I in A'Range => B(B'First + (I-A'First)) = Acc_Def(A(A'First .. I),0)) with
	Pre => A'Length = B'Length and then Acc_No_Overflow(A,0);
      
end Partial_Sum_Def_P;
