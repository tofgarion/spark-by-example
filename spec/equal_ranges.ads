-- The Equal_Ranges function is used to specify is two arrays are
-- equal on a specified range.

with Types; use Types;

package Equal_Ranges with
     Spark_Mode,
     Ghost is

   -- this version of Equal_Ranges verifies if arrays A and B are
   -- equal for Offset elements starting from their first element.
   function Equal_Ranges
     (A      : T_Arr;
      B      : T_Arr;
      Offset : Natural) return Boolean is
     (for all I in 0 .. Offset => A (A'First + I) = B (B'First + I)) with
      Pre => Offset < A'Length and then Offset < B'Length;

   -- this version of Equal_Ranges verifies if the array A is equal to
   -- array B (on the length of A, cf. precondition).
   function Equal_Ranges
     (A : T_Arr;
      B : T_Arr) return Boolean is
     (if (A'Length = 0) then True else Equal_Ranges (A, B, A'Length - 1)) with
      Pre => A'Length <= B'Length;

end Equal_Ranges;
