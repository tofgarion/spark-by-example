-- Naive Find function specification

with Types; use Types;

package Naive_Find_P with
     Spark_Mode is

   function Find (A : T_Arr; Val : T) return Positive with
      Post =>
      (Find'Result <= A'Last + 1
       and then (for all I in A'First .. Find'Result - 1 => A (I) /= Val)),
      Contract_Cases =>
      ((for some I in A'Range => A (I) = Val) =>
         Find'Result <= A'Last and then A (Find'Result) = Val,
       others => Find'Result = A'Last + 1);

end Naive_Find_P;
