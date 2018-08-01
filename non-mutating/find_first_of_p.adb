-- implementation of Find_First_Of
with Find_P; use Find_P;

package body Find_First_Of_P with
   Spark_Mode
 is

   function Find_First_Of
     (A : T_Arr;
      B : T_Arr)
      return Option
   is
      Result : Option := (Exists => False);
   begin
      for I in A'Range loop
         if Find (B, A (I)).Exists then
            Result := (Exists => True, Value => I);

            return Result;
         end if;

         pragma Loop_Invariant (not Has_Value_Of (A (A'First .. I), B));
         pragma Loop_Invariant (not Result.Exists);
      end loop;

      return Result;
   end Find_First_Of;
end Find_First_Of_P;
