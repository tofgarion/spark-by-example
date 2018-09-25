package body Is_Sorted_P with
   Spark_Mode
 is

   procedure Weakly_To_Sorted (A : T_Arr) is
   begin
      for J in A'Range loop
         null;
         pragma Loop_Invariant (Sorted (A (A'First .. J)));
      end loop;
   end Weakly_To_Sorted;

   function Is_Sorted
     (A : T_Arr)
      return Boolean
   is
   begin
      if A'Length > 0 then
         for J in A'First .. A'Last - 1 loop
            if A (J) > A (J + 1) then
               return False;
            end if;

            pragma Loop_Invariant (Weakly_Sorted (A (A'First .. J + 1)));

         end loop;
      end if;

      Weakly_To_Sorted (A);

      return True;
   end Is_Sorted;

end Is_Sorted_P;
