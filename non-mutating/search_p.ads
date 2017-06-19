with Types;           use Types;
with Has_Sub_Range_P; use Has_Sub_Range_P;

package Search_P with
     Spark_Mode is

   function Search (A : T_Arr; B : T_Arr) return Option with
      Pre            => A'Last < Positive'Last and then B'First <= B'Last,
      Contract_Cases =>
      (B'Length = 0 => not Search'Result.Exists,
       A'Length < B'Length => not Search'Result.Exists,
       A'Length >= B'Length and then Has_Sub_Range (A, B) =>
         Search'Result.Exists
         and then Equal_Subrange (A, Search'Result.Value, B)
         and then
         (if
            Search'Result.Value > A'First
          then
            (not Has_Sub_Range_In_Prefix (A, Search'Result.Value - 1, B))),
       others => not Search'Result.Exists);

end Search_P;
