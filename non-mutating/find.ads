-- a better specification of Find using the Has_Value function
with Spec_Types;
use Spec_Types;
with Spec_Types.Spec_Functions_Non_Mutating;
use Spec_Types.Spec_Functions_Non_Mutating;

package Find with
  SPARK_Mode is

   function Find (A : T_Arr; Val : T) return Option with
     Contract_Cases =>
       (Has_Value(A, Val) =>
          (Find'Result.Exists = True) and then
          (A (Find'Result.Value) = Val) and then
          (for all I in A'First .. Find'Result.Value - 1 => A(I) /= Val),
        others            => Find'Result.Exists = False
       );

end Find;
