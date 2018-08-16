-- implementation of Find_End

package body Find_End_P with
   Spark_Mode
 is

   function Find_End
     (A : T_Arr;
      B : T_Arr)
      return Option
   is
      Result : Option := (Exists => False);
   begin
      if (A'Length < B'Length or else B'Length = 0) then
         return Result;
      end if;

      for I in A'First .. A'Last - B'Length + 1 loop
         if A (I .. I - 1 + B'Length) = B then
            Result := (Exists => True, Value => I);

            pragma Assert (I - 1 + B'Length = Last (I, B));
         end if;

         pragma Loop_Invariant
           (if Result.Exists then
              Result.Value in A'First .. A'Last + 1 - B'Length
              and then Has_Subrange (A, B)
              and then Equal_Subrange (A, Result.Value, B)
              and then
              (if Result.Value < I then
                 not Has_Subrange
                   (A (Result.Value + 1 .. I - 1 + B'Length), B))
            else not Has_Subrange (A (A'First .. I - 1 + B'Length), B));

      end loop;

      return Result;

   end Find_End;
end Find_End_P;
