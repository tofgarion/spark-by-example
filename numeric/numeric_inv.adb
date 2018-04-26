package body Numeric_Inv with
  SPARK_Mode is
   
   procedure Partial_Sum_Inv
     (A : in out T_Arr; B : in out T_Arr)
   is
      Tmp : Constant T_Arr(A'Range) := A with Ghost;
   begin
      if A'Length = 0 then
         return;
      end if;
      
      Partial_Sum(A,B);
      pragma Assert(for all J in B'First+1 .. B'Last => B(J) = B(J-1)+A(A'First+(J-B'First)));
      pragma Assert(for all J in B'First+1 .. B'Last => Minus_No_Overflow(B(J),B(J-1)));
      Adjacent_Difference(B,A);
   end Partial_Sum_Inv;
end Numeric_Inv;
