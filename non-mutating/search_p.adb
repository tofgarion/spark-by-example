-- implementation of Search

package body Search_P with
   Spark_Mode
 is

   function Search (A : T_Arr; B : T_Arr) return Option is
      Result : Option := (Exists => False);
   begin
      if (A'Length < B'Length or else B'Length = 0) then

         return Result;
      end if;

      for J in A'First .. A'Last + 1 - B'Length loop
         if A (J .. J - 1 + B'Length) = B then
            Result := (Exists => True, Value => J);

            return Result;
         end if;

         pragma Loop_Invariant
           (for all K in A'First .. J => A (K .. Last (K, B)) /= B);
         pragma Loop_Invariant (not Result.Exists);
      end loop;

      return Result;
   end Search;

end Search_P;
