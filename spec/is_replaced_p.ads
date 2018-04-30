with Types; use Types;

package Is_Replaced_P with
     Spark_Mode,
     Ghost is

   function Is_Replaced
     (A : T_Arr;
      B : T_Arr;
      V : T;
      W : T) return Boolean is
     (for all K in A'Range =>
        (if A (K) = V then B (B'First + (K - A'First)) = W
         else A (K) = B (B'First + (K - A'First)))) with
      Pre => A'Length = B'Length;

end Is_Replaced_P;
