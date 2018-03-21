-- specification of Find_end

with Types;          use Types;
with Has_Subrange_P; use Has_Subrange_P;

package Find_End_P with
     Spark_Mode is

   function Find_End (A : T_Arr; B : T_Arr) return Option with
      Pre            => A'Last < Positive'Last and then B'First <= B'Last,
      Contract_Cases =>
      (B'Length = 0 => not Find_End'Result.Exists,
       A'Length < B'Length => not Find_End'Result.Exists,
       A'Length >= B'Length and then Has_Subrange (A, B) =>
         Find_End'Result.Exists
         and then Equal_Subrange (A, Find_End'Result.Value, B)
         and then
         (if
            Find_End'Result.Value < A'Last - B'Length + 1
          then
            (not Has_Subrange_In_Postfix (A, Find_End'Result.Value + 1, B))),
       others => not Find_End'Result.Exists);

end Find_End_P;
