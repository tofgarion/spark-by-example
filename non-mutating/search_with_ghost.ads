with Types; use Types;

package Search_With_Ghost with
     Spark_Mode is

   function Has_Sub_Range
     (A : T_Arr;
      B : T_Arr) return Boolean is
     (for some J in A'First .. A'Last + 1 - B'Length =>
        A (J .. J - 1 + B'Length) = B) with
      Pre => A'Length >= B'Length and then A'Last < Positive'Last,
      Ghost;

   function Search (A : T_Arr; B : T_Arr) return Option with
      Pre            => A'Last < Positive'Last and then B'First <= B'Last,
      Contract_Cases =>
      (B'Length = 0        => not Search'Result.Exists,
       A'Length < B'Length => not Search'Result.Exists,
       A'Length >= B'Length and then
      --  (for some J in A'First .. A'Last - B'Length + 1 =>
      --     A (J .. J - 1 + B'Length) = B) =>
       Has_Sub_Range (A, B) =>
         Search'Result.Exists
         and then
           A (Search'Result.Value .. Search'Result.Value - 1 + B'Length) =
           B
         and then
         (if
            Search'Result.Value > A'First
          then
            (not Has_Sub_Range
               (A (A'First .. Search'Result.Value + B'Length - 2),
                B))),
       others => not Search'Result.Exists);

end Search_With_Ghost;
