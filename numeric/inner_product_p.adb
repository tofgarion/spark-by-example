package body Inner_Product_P with
     Spark_Mode is
   function Inner_Product (A : T_Arr; B : T_Arr; Init : T) return T is
      Count : T := Init;
   begin
      for J in 0 .. A'Length - 1 loop
         pragma Assert
           (Count + A (A'First + J) * B (B'First + J) =
            Inner_Prod
              (A (A'First .. A'First + J),
               B (B'First .. B'First + J),
               Init));
         Count := Count + A (A'First + J) * B (B'First + J);

         pragma Loop_Invariant
           (Count =
            Inner_Prod
              (A (A'First .. A'First + J),
               B (B'First .. B'First + J),
               Init));
      end loop;
      return Count;
   end Inner_Product;
end Inner_Product_P;
