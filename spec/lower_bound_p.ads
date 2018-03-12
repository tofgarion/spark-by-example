package Lower_Bound_P with
  SPARK_Mode,
  Ghost is
   
   function Lower_Bound(A: T_Arr; N: Positive; V: T) return Boolean is
      (for all I in A'First .. N => A(I)>=V);
      
   function Strict_Lower_Bound(A(T_Arr; N: Positive; V: T) Returb Boolean is
      (for all I in A'First .. N => A(I)>V);
      
      
   
