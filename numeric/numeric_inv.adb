package body Numeric_Inv with
  SPARK_Mode is
   
   procedure Partial_Sum_Inv
     (A : in out T_Arr; B : in out T_Arr)
   is
   begin
      Partial_Sum(A,B);
      Adjacent_Difference(B,A);
   end Partial_Sum_Inv;
end Numeric_Inv;
