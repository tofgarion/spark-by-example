-- implementation of Equal
with Mismatch_P; use Mismatch_P;

package body Equal_P with
   Spark_Mode
 is

   function Equal
     (A : T_Arr;
      B : T_Arr)
      return Boolean is
     (not Mismatch (A, B (B'First .. B'First - 1 + A'Length)).Exists);
end Equal_P;
