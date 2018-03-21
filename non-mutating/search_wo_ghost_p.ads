with Types; use Types;

package Search_Wo_Ghost_P with
     Spark_Mode is

   function Search (A : T_Arr; B : T_Arr) return Option with
      Pre            => A'Last < Positive'Last and then B'First <= B'Last,
      Contract_Cases =>
      (B'Length = 0        => not Search'Result.Exists,
       A'Length < B'Length => not Search'Result.Exists,
       A'Length >= B'Length
       and then
       (for some J in A'First .. A'Last - B'Length + 1 =>
          A (J .. J - 1 + B'Length) = B) =>
         Search'Result.Exists
         and then
           A (Search'Result.Value .. Search'Result.Value - 1 + B'Length) =
           B
         and then
         (if
            Search'Result.Value > A'First
          then
            (for all K in A'First .. Search'Result.Value - 1 =>
               A (K .. K - 1 + B'Length) /= B)),
       others => not Search'Result.Exists);

end Search_Wo_Ghost_P;
