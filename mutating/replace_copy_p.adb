package body Replace_Copy_P with
     Spark_Mode is

   procedure Replace_Copy (A : T_Arr; B : in out T_Arr; V : T; W : T) is
   begin
      for I in A'Range loop
         B (B'First + (I - A'First)) := (if A (I) = V then W else A (I));

         pragma Loop_Invariant
           (Is_Replaced
              (A (A'First .. I),
               B (B'First .. B'First + (I - A'First)),
               V,
               W));

      end loop;
   end Replace_Copy;
end Replace_Copy_P;
