-- implementation of Equal
with Mismatch;

package body Equal with
  SPARK_Mode is

   function Equal (A : T_Arr; B : T_Arr) return Boolean is
     (not Mismatch.Mismatch(A, B).Exists);
end Equal;
