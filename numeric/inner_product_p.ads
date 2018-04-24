with Types;                    use Types;
with Inner_Prod_Def_P;             use Inner_Prod_Def_P;
with Overflow; use Overflow;


package Inner_Product_P with
     Spark_Mode is
   function Inner_Product (A : T_Arr; B : T_Arr; Init : T) return T with
     Pre => A'Length = B'Length
       and then (for all J in 0 .. A'Length - 1 => Inner_Prod_Def (A, B, 0, J, Init).OK),
       Post => Inner_Product'Result = Inner_Prod_Def(A,B,0,A'Length - 1,Init).Value;
end Inner_Product_P;
