with Types; use Types;
with Copy_P; use Copy_P;

package Rotate_Copy_P with
  SPARK_Mode is
   
   procedure Rotate_Copy
     (A : T_Arr;
      N : Positive;
      B : in out T_Arr) with
     Pre => A'Length = B'Length and then N < A'Length,
     Post => A(A'First .. A'First +(N -1)) = B(B'Last - (N -1) .. B'Last)
     and then A(A'First + N .. A'Last) = B(B'First .. B'Last - N);
   
end Rotate_Copy_P;
