package body Swap_Array_P with
  SPARK_Mode is
   
    function Swap_Array(A : T_Arr; I : Positive; J : Positive)return T_Arr is
      Result : T_Arr :=A;
      Temp : T := Result(I);
   begin
      Result(I) := Result(J);
      Result(J) := Temp;
      
      return Result;
   end Swap_Array;
end Swap_Array_P;
