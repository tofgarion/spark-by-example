with Types; use Types;
with Overflow; use Overflow;

package Adjacent_Difference_P with
  SPARK_Mode
is
   
   procedure Adjacent_Difference
     (A : T_Arr; B : in out T_Arr)
     with 
     Pre => (if A'Length > 0 then 
     (for all J in A'First+1 .. A'Last => Minus_No_Overflow(A(J),A(J-1))))
     and then B'Length = A'Length,
     Post => (if A'Length > 0 then B(B'First) = A(A'First) 
     and then (for all J in 1 .. A'Length-1 => B(B'First+J) = A(A'First+J)-A(A'First+J-1)));
      
   
end Adjacent_Difference_P;


