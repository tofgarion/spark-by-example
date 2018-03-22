with Types;                    use Types;
with Inner_Prod_P;             use Inner_Prod_P;
with No_Inner_Prod_Overflow_P; use No_Inner_Prod_Overflow_P;

package Inner_Product_P with
     Spark_Mode is
   function Inner_Product (A : T_Arr; B : T_Arr; Init : T) return T with
      Pre => A'Length = B'Length
     and then (for all J in 0 .. A'Length - 1 => A(A'First + J) * B(B'First + J) in T)
     and then Inner_Prod_Bounds(A,B,Init),
      Contract_Cases =>
      (A'Length > 0 => Inner_Product'Result = Inner_Prod (A, B, Init),
       A'Length = 0 => Inner_Product'Result = Init);
end Inner_Product_P;
