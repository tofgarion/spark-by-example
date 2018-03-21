-- specification of Search_N function

with Types;                   use Types;
with Has_Constant_Subrange_P; use Has_Constant_Subrange_P;

package Search_N_P with
     Spark_Mode is

   function Search_N (A : T_Arr; Val : T; N : Positive) return Option with
      Pre            => A'First <= A'Last and then A'Last < Positive'Last,
      Contract_Cases =>
      (Has_Constant_Subrange (A, Val, N) =>
         Search_N'Result.Exists
         and then Search_N'Result.Value >= A'First
         and then Search_N'Result.Value <= A'Last - N + 1
         and then Constant_Range_From_Location
           (A,
            Val,
            Search_N'Result.Value,
            N)
         and then
         (if
            Search_N'Result.Value > A'First
          then
            not Has_Constant_Subrange
              (A (A'First .. Search_N'Result.Value - 1),
               Val,
               N)),
       others => not Search_N'Result.Exists);

end Search_N_P;
