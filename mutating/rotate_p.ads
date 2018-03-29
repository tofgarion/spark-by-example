with Types; use Types;
with Reverse_In_Place_P; use Reverse_In_Place_P;

package Rotate_P with
  SPARK_Mode is
   
   procedure Rotate
     (A : in out T_Arr;
      N : Positive) with
     Pre => N < A'Length,
     Post => A'Old(A'First .. A'First + (N-1)) = A(A'Last -(N-1) .. A'Last)
     and then A'Old(A'First + N .. A'Last) = A(A'First .. A'Last - N);
   
end Rotate_P;
