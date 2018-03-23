with Types; use Types;

package Swap_Array_P with
  SPARK_Mode is
   
    function Swap_Array(A : T_Arr; I : Positive; J : Positive) return T_Arr with
      Pre => A'Length >= 1 and then I in A'Range and then J in A'Range and then I >= J,
      Post =>A'First = Swap_Array'Result'First 
      and then A'Last = Swap_Array'Result'Last 
      and then A(I) = Swap_Array'Result(J) 
      and then A(J) = Swap_Array'Result(I)
      and then (for all K in A'Range => (if I/=K and then J /= K then A(K) = Swap_Array'Result(K)));
    
end Swap_Array_P;
