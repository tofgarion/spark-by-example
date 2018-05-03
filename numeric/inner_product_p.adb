package body Inner_Product_P with
     Spark_Mode is
   function Inner_Product (A : T_Arr; B : T_Arr; Init : T) return T is
      Result : T := Init;
   begin
      for J in 0 .. A'Length - 1 loop

         pragma Assert (Inner_Prod_Def (A, B, 0, J, Init).OK);
         Result := Result + A (A'First + J) * B (B'First + J);

         pragma Loop_Invariant
           (Result = Inner_Prod_Def (A, B, 0, J, Init).Value);

      end loop;
      return Result;
   end Inner_Product;
end Inner_Product_P;
