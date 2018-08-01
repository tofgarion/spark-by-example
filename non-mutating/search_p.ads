with Types;          use Types;
with Has_Subrange_P; use Has_Subrange_P;

package Search_P with
   Spark_Mode
 is

   function Search
     (A : T_Arr;
      B : T_Arr)
      return Option with
      Pre            => A'Last < Positive'Last,
      Contract_Cases =>
      (A'Length >= B'Length and then B'Length /= 0
       and then Has_Subrange (A, B) =>
         Search'Result.Exists
         and then A (Search'Result.Value .. Last (Search'Result.Value, B)) = B
         and then
         (if Search'Result.Value > A'First then
            (for all J in A'First .. Search'Result.Value - 1 =>
               A (J .. Last (J, B)) /= B)),
       others => not Search'Result.Exists);

end Search_P;
