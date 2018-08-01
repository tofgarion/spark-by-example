-- specification of Find_end

with Types;          use Types;
with Has_Subrange_P; use Has_Subrange_P;

package Find_End_P with
   Spark_Mode
 is

   function Find_End
     (A : T_Arr;
      B : T_Arr)
      return Option with
      Pre            => A'Last < Positive'Last,
      Contract_Cases => (
       A'Length >= B'Length And Then B'Length /= 0 And then Has_Subrange (A, B) =>
         Find_End'Result.Exists
         and then Equal_Subrange (A, Find_End'Result.Value, B)
         and then
         (if Find_End'Result.Value < A'Last - B'Length + 1 then
            (not Has_Subrange (A (Find_End'Result.Value + 1 ..A'Last), B))),
       others => not Find_End'Result.Exists);

end Find_End_P;
