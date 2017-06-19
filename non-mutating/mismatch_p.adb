-- implementation of Mismatch

package body Mismatch_P with
     Spark_Mode is

   function Mismatch (A : T_Arr; B : T_Arr) return Option is
      Result : Option := (Exists => False);
   begin
      for I in 0 .. A'Length - 1 loop
         if A (A'First + I) /= B (B'First + I) then
            Result := (Exists => True, Value => I);

            return Result;
         end if;

         pragma Loop_Invariant (Equal_Ranges (A, B, I));
         pragma Loop_Invariant (not Result.Exists);
         pragma Loop_Variant (Increases => I);
      end loop;

      return Result;
   end Mismatch;
end Mismatch_P;
