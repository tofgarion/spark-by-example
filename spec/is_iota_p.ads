with Types; use Types;

package Is_Iota_P with
   Spark_Mode,
   Ghost
 is
   function Is_Iota
     (A   : T_Arr;
      Val : T)
      return Boolean is
     (for all I in A'Range => A (I) = Val + T (I - A'First)) with
      Pre => Val + T (A'Length) <= T'Last;
end Is_Iota_P;
