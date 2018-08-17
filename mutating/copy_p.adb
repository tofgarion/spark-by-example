package body Copy_P with
   Spark_Mode
 is

   procedure Copy
     (A :        T_Arr;
      B : in out T_Arr)
   is
   begin
      for J in A'Range loop
         declare
            K : Positive := B'First + (J - A'First);
         begin
            B (K) := A (J);

            pragma Loop_Invariant (A (A'First .. J) = B (B'First .. K));

         end;
      end loop;
   end Copy;
end Copy_P;
