-- implementation of Adjacent_Find.

package body Adjacent_Find_P with
   Spark_Mode
 is

   function Adjacent_Find
     (A : T_Arr)
      return Option
   is
      Result : Option := (Exists => False);
   begin
      if A'Length <= 1 then
         return Result;
      end if;

      for I in A'First .. A'Last - 1 loop
         if A (I) = A (I + 1) then
            Result := (Exists => True, Value => I);

            return Result;
         end if;

         pragma Loop_Invariant
           (not Has_Equal_Neighbors (A (A'First .. I + 1)));
         pragma Loop_Invariant (not Result.Exists);
      end loop;

      return Result;
   end Adjacent_Find;
end Adjacent_Find_P;
