--  This package provides an implementation of case studies from the
--  "ACSL by Example" technical report, chapter 3, from
--  http://www.fokus.fraunhofer.de/de/sqc/_download_sqc/ACSL-by-Example.pdf

package Chap3 with
     Spark_Mode is

   type T is new Integer;

   type T_Arr is array (Positive range <>) of T;

   --  3.1 The 'equal' algorithm
   --
   --  The function returns true if a[i] == b[i] holds for each 0 <= i < n.
   --  Otherwise, equal returns false.

   function Equal (A : T_Arr; B : T_Arr; Size : Natural) return Boolean with
      Pre  => (Size <= A'Length and Size <= B'Length),
      Post => (Equal'Result = Is_Equal (A, B, Size));

   function Is_Equal
     (A    : T_Arr;
      B    : T_Arr;
      Size : Natural) return Boolean is
     (for all I in 0 .. Size - 1 => A (A'First + I) = B (B'First + I)) with
      Pre => (Size <= A'Length and Size <= B'Length);

      --  3.2 The 'mismatch' algorithm
      --
      --  The function mismatch returns the smallest index where the two
      --  ranges a and b differ. If no such index exists, that is, if
      --  both ranges are equal then mismatch returns the length n of
      --  the two ranges.12

   function Mismatch
     (A    : T_Arr;
      B    : T_Arr;
      Size : Positive) return Natural with
      Pre  => (Size <= A'Length and Size <= B'Length),
      Post =>
      ((Mismatch'Result < Size
        and then Is_Equal (A, B, Mismatch'Result)
        and then
          A (A'First + Mismatch'Result) /=
          B (B'First + Mismatch'Result)) or
       (Mismatch'Result = Size and Is_Equal (A, B, Size)));

      --  3.3 The 'find' algorithm
      --
      --  The function find returns the least valid index i of a where
      --  the condition a[i] == val holds.  If no such index exists then
      --  find returns the length n of the array.

   function Find (A : T_Arr; Size : Positive; Val : T) return Natural with
      Pre  => (Size <= A'Length),
      Post =>
      (Find'Result < Size and
       (for some I in 0 .. Size - 1 => A (A'First + I) = Val) and
       (for all I in 0 .. Find'Result - 1 => A (A'First + I) /= Val)) or
      (Find'Result = Size and
       (for all I in 0 .. Size - 1 => A (A'First + I) /= Val));

      --  3.5 The find_first_of Algorithm
      --
      -- As in find it performs a sequential search. However, whereas
      --  find searches for a particular value, find_first_of returns
      --  the least index i such that a[i] is equal to one of the
      --  values b[0], . . ., b[n-1].

   function Find_First_Of
     (A : T_Arr;
      M : Positive;
      B : T_Arr;
      N : Positive) return Natural with
      Pre  => (M <= A'Length and N <= B'Length),
      Post =>
      ((Find_First_Of'Result = M)
       or else
       (Find_First_Of'Result < M and
        (for some I in 0 .. N - 1 =>
           B (B'First + I) = A (A'First + Find_First_Of'Result))));

end Chap3;
