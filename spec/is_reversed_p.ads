with Types; use Types;

package Is_Reversed_P with
   Spark_Mode,
   Ghost
 is

   function Is_Reversed
     (A : T_Arr;
      B : T_Arr)
      return Boolean is
     (for all J in A'Range => A (J) = B (B'Last - (J - A'First))) with
      Pre => A'Length = B'Length;

   function Is_Reversed_Up_To
     (A : T_Arr;
      B : T_Arr;
      N : Natural)
      return Boolean is
     (for all J in A'First .. A'First + N  => A (J) = B (B'Last - (J - A'First))) with
      Pre => A'Length = B'Length and then N < A'Length;

end Is_Reversed_P;
