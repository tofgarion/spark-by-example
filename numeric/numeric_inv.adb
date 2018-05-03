package body Numeric_Inv with
     Spark_Mode is

   procedure Partial_Sum_Inv (A, B : in out T_Arr) is
   begin
      if A'Length = 0 then
         return;
      end if;

      Partial_Sum (A, B);
      pragma Assert
        (for all J in B'First + 1 .. B'Last =>
           B (J) = B (J - 1) + A (A'First + (J - B'First)));
      Adjacent_Difference (B, A);
   end Partial_Sum_Inv;

   procedure Adjacent_Difference_Inv (A, B : in out T_Arr) is
      Tmp : T with
         Ghost;
   begin
      if A'Length = 0 then
         return;
      end if;
      Tmp := A (A'First);
      Adjacent_Difference (A, B);
      pragma Assert
        (Acc_Def (B, B'First, B'First, 0).OK
         and then Acc_Def (B, B'First, B'First, 0).Value = Tmp);

      if A'Length > 1 then
         for J in A'First + 1 .. A'Last loop

            pragma Assert (B (J - A'First + B'First) = A (J) - Tmp);

            Tmp := Tmp + B (J - A'First + B'First);

            pragma Loop_Invariant (Tmp = A (J));
            pragma Loop_Invariant
              (for all K in A'First .. J =>
                 Acc_Def (B, B'First, K - A'First + B'First, 0).OK
                 and then
                   Acc_Def (B, B'First, K - A'First + B'First, 0).Value =
                   A (K));
            pragma Loop_Invariant
              (for all K in B'First .. J - A'First + B'First =>
                 Acc_Def (B, B'First, K, 0).OK);
         end loop;
      end if;
      Partial_Sum (B, A);

   end Adjacent_Difference_Inv;
end Numeric_Inv;
