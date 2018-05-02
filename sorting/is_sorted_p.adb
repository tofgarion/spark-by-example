package body Is_Sorted_P with
SPARK_Mode
is

   function Is_Sorted (A : T_arr) return Boolean
   is
   begin
      if A'Length > 0 then
         for J in A'First .. A'Last - 1 loop
            if A (J) > A (J + 1) then
               return false;
            end if;

            pragma Loop_Invariant ( Weakly_Sorted (A (A'First .. J + 1)));

         end loop;
      end if;
      Weakly_To_Sorted(A);
      return true;
   end Is_Sorted;

end Is_Sorted_P;
