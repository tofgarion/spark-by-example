-- The Equal_Ranges function is used to specify is two arrays are
-- equal on a specified range.

with Types; use Types;

package Equal_Ranges_P with
   Spark_Mode,
   Ghost
 is

   function Equal_Ranges
     (A : T_Arr;
      B : T_Arr)
      return Boolean is (A = B);

   function Equal_Ranges
     (A      : T_Arr;
      B      : T_Arr;
      Offset : Natural)
      return Boolean is
     (A (A'First .. A'First + Offset) = B (B'First .. B'First + Offset)) with
      Pre => Offset < A'Length and then Offset < B'Length;
end Equal_Ranges_P;
