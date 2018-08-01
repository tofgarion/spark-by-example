with Types;         use Types;
with Sorted_P;      use Sorted_P;
with Upper_Bound_P; use Upper_Bound_P;
with Lower_Bound_P; use Lower_Bound_P;

package Search_Upper_Bound_P with
   Spark_Mode
 is
   function Search_Upper_Bound
     (A   : T_Arr;
      Val : T)
      return Option with
      Pre            => Sorted (A) and then A'Last < Positive'Last,
      Contract_Cases => (A'Length = 0 => not Search_Upper_Bound'Result.Exists,
       A'Length > 0 =>
         Search_Upper_Bound'Result.Exists
         and then A'First <= Search_Upper_Bound'Result.Value
         and then Search_Upper_Bound'Result.Value <= A'Last + 1
         and then Upper_Bound
           (A (A'First .. Search_Upper_Bound'Result.Value - 1), Val)
         and then Strict_Lower_Bound
           (A (Search_Upper_Bound'Result.Value .. A'Last), Val));

end Search_Upper_Bound_P;
