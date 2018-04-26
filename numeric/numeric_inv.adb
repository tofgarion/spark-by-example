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
      pragma Assert(for all J in 1 .. A'Length-1 => B(B'First+J) = B(B'First+J-1)+A(A'First+J));
      pragma Assert(for all J in 1 .. B'Length-1 => Minus_No_Overflow(B(B'First+J),B(B'First+J-1)));
      pragma Assert( B(B'First) = A(A'First));
      pragma Assert(A'Length = B'Length);
      Adjacent_Difference(B,A);
      pragma assert(A'Length = Tmp'Length);
      pragma Assert(for all J in 1 .. A'Length-1 => Tmp(A'First + J) = B(B'First+J)-B(B'First+J-1));
      pragma Assert(for all J in 1 .. A'Length-1 => A(A'First + J) = B(B'First+J)-B(B'First+J-1));
      pragma Assert(A(A'First) = Tmp(Tmp'First));
      pragma Assert(for all J in 0 .. A'Length-1 => A(A'First+J) = Tmp(A'First+J));  -- assertion prooved, but cannot deduce A = Tmp
      pragma Assert(for all J in A'First ..A'First + A'Length-1 => A(J) = Tmp(J));   -- assertion unprovable,but postcondition can be deduced from this one.
      pragma assert(A'Last =  A'First + A'Length-1);
      pragma Assert(A = Tmp);
   end Partial_Sum_Inv;
end Numeric_Inv;
