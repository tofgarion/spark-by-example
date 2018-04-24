package body Inner_Product_P with
     Spark_Mode is
   function Inner_Product (A : T_Arr; B : T_Arr; Init : T) return T is
      Result : T := Init;
   begin
      for J in 0 .. A'Length - 1 loop
         declare
            K : constant Positive := A'First + J;
            L : constant Positive := B'First + J;
         begin

            pragma Assert (Inner_Prod_Def (A, B, 0, J, Init).OK);
            pragma Assert (Multiply_No_Overflow
             (B(L),
                              A (K)));
            pragma assert(Add_No_Overflow (Result,
                                          A (K) * B (L)));
         Result := Result + A(K) * B(L);
         Pragma Loop_Invariant (Result = Inner_Prod_Def (A, B, 0 , J , Init).Value);
         end;
      end loop;
      return Result;
   end Inner_Product;
end Inner_Product_P;
