-- specification of Mismatch. The Option returned contains the first
-- offset from which the two arrays are different.

with Spec_Types;
use Spec_Types;
with Spec_Types.Spec_Functions_Non_Mutating;
use Spec_Types.Spec_Functions_Non_Mutating;

package Mismatch with
  SPARK_Mode is
   function Mismatch (A : T_Arr; B : T_Arr) return Option With
     Pre => A'Length <= B'Length,
     Contract_Cases => (
       Equal_Ranges(A, B(B'First .. B'First - 1 + A'Length)) => not Mismatch'Result.Exists,
       others             => Mismatch'Result.Exists and then
            (A (A'First + Mismatch'Result.Value) /= B (B'First + Mismatch'Result.Value)) and then
            (if (Mismatch'Result.Value /= 0) then Equal_Ranges(A, B, Mismatch'Result.Value - 1))
       );
end Mismatch;
