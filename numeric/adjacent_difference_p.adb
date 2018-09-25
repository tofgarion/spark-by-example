package body Adjacent_Difference_P with
   Spark_Mode
 is

   procedure Adjacent_Difference
     (A :        T_Arr;
      B : in out T_Arr)
   is
   begin
      if A'Length > 0 then
         B (B'First) := A (A'First);

         if A'Length = 1 then
            return;
         end if;
         for J in A'First + 1 .. A'Last loop

            pragma Assert (Minus_No_Overflow (A (J), A (J - 1)));

            B (J - A'First + B'First) := A (J) - A (J - 1);

            pragma Loop_Invariant
              (for all K in A'First + 1 .. J =>
                 B (B'First + K - A'First) = A (+K) - A (K - 1));
            pragma Loop_Invariant (B (B'First) = A (A'First));

         end loop;

      end if;
   end Adjacent_Difference;
end Adjacent_Difference_P;
