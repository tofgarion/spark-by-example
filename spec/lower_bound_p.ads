with Types; use Types;

package Lower_Bound_P with
  SPARK_Mode,
  Ghost is
   
   function Lower_Bound(A: T_Arr; N: Positive; V: T) return Boolean is
      (for all I in A'First .. N => A(I)>=V) with
	Pre=> N>= A'First
	and then N<= A'Last;
      
   function Strict_Lower_Bound(A:T_Arr; N: Positive; V: T) return Boolean is
      (for all I in A'First .. N => A(I)>V) with
	Pre => N>= A'First
	and then N<= A'Last;
      
end Lower_Bound_P;
