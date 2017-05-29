-- implementation of Adjacent_Find

package body Adjacent_Find_P with
     Spark_Mode is

   function Adjacent_Find (A : T_Arr) return Option is
      Result : Option := (Exists => False, Value => 1);
   begin
      for I in A'First .. A'Last - 1 loop
         if (A (I) = A (I + 1)) then
            Result.Exists := True;
            Result.Value  := I;

            return Result;
         end if;

         pragma Loop_Invariant
           (not Has_Equal_Neighbors (A (A'First .. I + 1)));
         pragma Loop_Invariant (Result.Exists = False);
         pragma Loop_Variant (Increases => I);
      end loop;
      pragma Annotate
        (Gnatprove,
         False_Positive,
         "overflow check might fail",
         "reviewed by C. Garion");

      return Result;
   end Adjacent_Find;
end Adjacent_Find_P;
