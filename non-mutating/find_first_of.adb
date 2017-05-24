-- implementation of Find_First_Of
with Find;

package body Find_First_Of with
     Spark_Mode is

   function Find_First_Of (A : T_Arr; B : T_Arr) return Option is
      Result : Option := (Exists => False, Value => 1);
   begin
      for I in A'Range loop
         if (Find.Find (B, A (I)).Exists = True) then
            Result.Exists := True;
            Result.Value  := I;

            return Result;
         end if;

         pragma Loop_Invariant
           (not Has_Value_Of.Has_Value_Of (A (A'First .. I), B));
         pragma Loop_Invariant (Result.Exists = False);
      end loop;

      return Result;
   end Find_First_Of;
end Find_First_Of;
