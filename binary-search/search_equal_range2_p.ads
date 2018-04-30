with Types;                use Types;
with Search_Lower_Bound_P; use Search_Lower_Bound_P;
with Search_Upper_Bound_P; use Search_Upper_Bound_P;
with Sorted_P;             use Sorted_P;
with Constant_Range_P;     use Constant_Range_P;
with Lower_Bound_P;        use Lower_Bound_P;
with Upper_Bound_P;        use Upper_Bound_P;

package Search_Equal_Range2_P with
     Spark_Mode is

   function Search_Equal_Range2 (A : T_Arr; V : T) return Option_Pair with
      Pre            => A'Last < Positive'Last and then Sorted (A),
      Contract_Cases =>
      (A'Length = 0 => not Search_Equal_Range2'Result.Exists,
       A'Length > 0 =>
         Search_Equal_Range2'Result.Exists
         and then A'First <= Search_Equal_Range2'Result.Lower
         and then
           Search_Equal_Range2'Result.Lower <=
           Search_Equal_Range2'Result.Upper
         and then Search_Equal_Range2'Result.Upper <= A'Last + 1
         and then Strict_Upper_Bound
           (A (A'First .. Search_Equal_Range2'Result.Lower - 1),
            V)
         and then
         (if
            Search_Equal_Range2'Result.Lower /=
            Search_Equal_Range2'Result.Upper
          then
            Constant_Range
              (A,
               V,
               Search_Equal_Range2'Result.Lower,
               Search_Equal_Range2'Result.Upper - 1))
         and then Strict_Lower_Bound
           (A (Search_Equal_Range2'Result.Upper .. A'Last),
            V));

end Search_Equal_Range2_P;
