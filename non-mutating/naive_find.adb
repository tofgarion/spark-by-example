-- Naive Find implementation

package body Naive_Find with
     Spark_Mode is

   function Find (A : T_Arr; Val : T) return Positive is
   begin
      for I in A'Range loop
         if A (I) = Val then
            return I;
         end if;

         pragma Loop_Invariant (for all J in A'First .. I => A (J) /= Val);
      end loop;

      return A'Last + 1;
   end Find;
end Naive_Find;
