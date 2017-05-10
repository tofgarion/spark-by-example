-- a better specification of Find using the Has_Value function
with Spec_Types;
use Spec_Types;
with Spec_Types.Spec_Functions_Non_Mutating;
use Spec_Types.Spec_Functions_Non_Mutating;

package Find with
  SPARK_Mode is

   function Find (A : T_Arr; Val : T) return Positive with
     Post => (Find'Result <= A'Last + 1 and then
                (for all I in A'First .. Find'Result - 1 => A(I) /= Val)),
     Contract_Cases =>
       (Has_Value(A, Val) =>
          Find'Result <= A'Last and then
            A (Find'Result) = Val,
        others            => Find'Result = A'Last + 1
       );

end Find;
