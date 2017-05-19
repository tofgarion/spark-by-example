-- specification of Search
with Spec_Types;
use Spec_Types;
with Spec_Types.Spec_Functions_Non_Mutating;
use Spec_Types.Spec_Functions_Non_Mutating;

package Search with
  SPARK_Mode is

   function Search (A : T_Arr; B : T_Arr) return Option with
     Pre => B'Length > 0,
     Contract_Cases => (
       A'Length < B'Length => Not Search'Result.Exists,
       A'Length >= B'Length and then Has_Sub_Range(A, B) => Search'Result.Exists and then
         Equal_Ranges(A(Search'Result.Value .. Search'Result.Value - 1 + B'Length),
                      B) and then
         (if Search'Result.Value > A'First then not Has_Sub_Range(A(A'First .. Search'Result.Value - 2 + B'Length), B)),
       Others       => not Search'Result.Exists
     );

end Search;
