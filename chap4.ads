--  This package provides an implementation of case studies from the
--  "ACSL by Example" technical report, chapter 4, from
--  http://www.fokus.fraunhofer.de/de/sqc/_download_sqc/ACSL-by-Example.pdf

generic
   type T is (<>);

package Chap4 is

   type T_Arr is array (Positive range <>) of T;

   --  4.2 The 'max_element' algorithm
   --
   --  The function finds the largest element in the range a[0, n).
   --  More precisely, it returns the unique valid index i such that
   --  1. for each index k with 0 <= k < n the condition a[k] <= a[i] holds and
   --  2. for each index k with 0 <= k < i the condition a[k] < a[i] holds.
   --
   --  The return value of max_element is n if and only if there is no
   --  maximum, which can only occur if n == 0.

   function Max_Element (A : T_Arr) return Positive with
      Pre  => (A'Length > 0),
      Post =>
      ((Max_Element'Result in A'Range) and
       (for all J in A'Range => A (J) <= A (Max_Element'Result)) and
       (for all J in A'First .. Max_Element'Result - 1 =>
          A (J) < A (Max_Element'Result)));

   --  4.4 The 'max_seq' algorithm

   function Max_Seq (A : T_Arr) return T is (A (Max_Element (A))) with
      Pre  => (A'Length > 0),
      Post =>
      ((for all J in A'Range => Max_Seq'Result >= A (J)) and
       (for some J in A'Range => Max_Seq'Result = A (J)));

   --  4.5 The 'min_element' algorithm
   --
   --  Note: equivalent to 4.3, left as an exercise

end Chap4;
