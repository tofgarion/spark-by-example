with Types; use Types;

package Is_Reversed_P with
     Spark_Mode,
     Ghost is

   function Is_Reversed
     (A : T_Arr;
      B : T_Arr) return Boolean is
     (for all I in A'Range => A (I) = B (B'Last - (I - A'First))) with
      Pre => A'Length = B'Length;

end Is_Reversed_P;
