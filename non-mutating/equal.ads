-- specification of Equal
with Spec_Types;
use Spec_Types;
with Spec_Types.Spec_Functions_Non_Mutating;
use Spec_Types.Spec_Functions_Non_Mutating;

package Equal with
  SPARK_Mode is

   function Equal (A : T_Arr; B : T_Arr) return Boolean with
     Pre => A'Length <= B'Length,
     Post => Equal'Result = Equal_Ranges(A, B);
end Equal;
