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

            -- pragma Assert (Equal_Ranges(A(I .. I - 1 + B'Length), B));
            -- pragma Assert (Equal_Ranges(A, A));
            -- pragma Assert (Equal_Ranges(A(A'First .. A'First - 1 + A'Length), A));
            -- pragma Assert (A'Last - A'Length + 1 = A'First);
            -- pragma Assert (For Some I In A'First .. A'Last - A'Length + 1 => Equal_Ranges(A(I .. I - 1 + A'Length), A));
            -- pragma Assume (Has_Sub_Range(A, A));
            -- pragma Assert (Equal_Ranges(A(I .. I - 1 + B'Length), B));
            -- pragma Assert (Has_Sub_Range(A(I .. I - 1 + B'Length), B));
            -- Pragma Assert
            -- pragma Assert (For Some J In A'First .. A'Last - B'Length + 1 => Equal_Ranges(A(J .. J + B'Length - 1), B));
            -- pragma Assert (B'Length <= A'Length);
            -- pragma Assert (A(I) = B(B'First));
            -- Pragma Assert (Equal_Ranges(A(I .. I - 1 + B'Length), B));
            -- Pragma Assume (For All J In 0 .. B'Length - 1 => A(I + J) = B(B'First + J));
            pragma Assert (Has_Sub_Range(A, B));

            return Result;
         end if;

         pragma Loop_Invariant
           (not Has_Sub_Range(A(A'First .. I + B'Length - 1), B));
         pragma Loop_Invariant
           (not Result.Exists);
      end loop;

      pragma assert (not Has_Sub_Range(A, B));
      return Result;
   end Search;

end Search;
