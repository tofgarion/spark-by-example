package body Rotate_Copy_P with
  SPARK_Mode is
   
   procedure Rotate_Copy
     (A : T_Arr;
      N : Positive;
      B : in out T_Arr) is
   begin
      Copy(A(A'First + N .. A'Last), B(B'First .. B'Last - N));
      Copy(A(A'First .. A'First + (N -1)),B(B'Last - (N - 1) .. B'Last));
      pragma Assert(A(A'First + N .. A'Last)= B(B'First .. B'Last - N));
      pragma Assert(A(A'First + N .. A'Last)= B(B'First .. B'Last - N));
      pragma Assert(A(A'First .. A'First + (N -1)) = B(B'Last - (N - 1) .. B'Last));
      pragma Assert(A(A'First .. A'First + (N -1)) = B(B'Last - (N - 1) .. B'Last));
   end Rotate_Copy;
end Rotate_Copy_P;
