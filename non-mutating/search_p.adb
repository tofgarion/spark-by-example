-- implementation of Search

package body Search_P with
   Spark_Mode
 is

   function Search
     (A : T_Arr;
      B : T_Arr)
      return Option
   is
   begin
      if (A'Length < B'Length or else B'Length = 0) then

         return (Exists => False);
      end if;

      for J in A'First .. A'Last + 1 - B'Length loop
         if A (J .. J - 1 + B'Length) = B then
            return (Exists => True, Value => J);
         end if;

         pragma Loop_Invariant
           (for all K in A'First .. J => A (K .. Last (K, B)) /= B);
      end loop;

      return (Exists => False);
   end Search;

end Search_P;
