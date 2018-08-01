-- specification and implementation of Equal ("reversed" version)

with Types;          use Types;
with Equal_Ranges_P; use Equal_Ranges_P;
with Mismatch_P;     use Mismatch_P;

package Equal_Rev_P with
   Spark_Mode
 is

   function Equal
     (A : T_Arr;
      B : T_Arr)
      return Boolean is (A = B (B'First .. B'First - 1 + A'Length)) with
      Pre  => A'Length <= B'Length,
      Post => Equal'Result =
      (not Mismatch (A, B (B'First .. B'First - 1 + A'Length)).Exists);
end Equal_Rev_P;
