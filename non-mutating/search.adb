-- implementation of Search
with Equal;

Package body Search with
  SPARK_Mode is

   function Search (A : T_Arr; B : T_Arr) return Option is
      Result : Option := (Exists => False, Value => 1);
   begin
      if (A'Length < B'Length) then
         return Result;
      end if;

      for I in A'First .. A'Last - B'Length + 1 loop
         if (Equal.Equal(A(I .. I - 1 + B'Length), B)) then
            Result.Exists := True;
            Result.Value  := I;

            pragma Assert (Has_Sub_Range.Has_Sub_Range(A, B));

            return Result;
         end if;

         pragma Loop_Invariant
           (not Has_Sub_Range.Has_Sub_Range(A(A'First .. I + B'Length - 1), B));
         pragma Loop_Invariant
           (not Result.Exists);
      end loop;

      pragma assert (not Has_Sub_Range.Has_Sub_Range(A, B));
      return Result;
   end Search;

end Search;
