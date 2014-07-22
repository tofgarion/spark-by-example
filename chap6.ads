--  This package provides an implementation of case studies from the
--  "ACSL by Example" technical report, chapter 6, from
--  http://www.fokus.fraunhofer.de/de/sqc/_download_sqc/ACSL-by-Example.pdf

package Chap6 with
     Spark_Mode is

   type T is new Integer;

   type T_Arr is array (Positive range <>) of T;

   --  6.1 The 'fill' algorithm
   --
   --  The fill algorithm in the C++ Standard Library initializes
   --  general sequences with a particular value.

   procedure Fill (A : in out T_Arr; Val : T) with
      Post => (for all J in A'Range => A (J) = Val);

      --  6.2 The 'swap' algorithm
      --
      --  The swap algorithm in the C++ STL exchanges the contents of two
      --  variables.

   procedure Swap (X : in out T; Y : in out T) with
      Post => (X'Old = Y and Y'Old = X);

      --  6.3 The swap_ranges Algorithm
      --
      -- The swap_ranges algorithm in the C++ STL exchanges the contents
      --  of two expressed ranges element-wise.

   procedure Swap_Ranges (X : in out T_Arr; Y : in out T_Arr) with
      Pre =>
      (X'First = Y'First and
       X'Last = Y'Last and
       X'Last > X'First and
       Y'Last > Y'First),
      Post =>
      ((for all J in X'Range => X (J) = Y'Old (J))
       and then (for all J in X'Range => X'Old (J) = Y (J)));

      --  6.4 The copy Algorithm
      --
      --  The copy algorithm in the C++ Standard Library implements a
      --  duplication algorithm for general sequences.

   function Copy (X : T_Arr) return T_Arr is (X) with
      Post => (Copy'Result = X);
      --  This one is obviously a tautology

      --  6.5 The reverse_copy Algorithm
      --
      --  The reverse_copy algorithm of the C++ Standard Library
      --  invert the order of elements in a sequence. reverse_copy
      --  does not change the input sequence and copies its result to
      --  the output sequence.

   function Reverse_Copy (X : T_Arr) return T_Arr with
      Pre  => (X'Last > X'First),
      Post =>
      (Reverse_Copy'Result'Last = X'Last and
       Reverse_Copy'Result'First = X'First and
       (for all K in Reverse_Copy'Result'Range =>
          Reverse_Copy'Result (K) = X (X'Last - K + X'First)));
      --  XXX GNATProve GPL 2014 cannot discharge the first two parts
      --  of the post-condition.

      --  6.6. The reverse Algorithm
      --
      --  The reverse algorithm of the C++ Standard Library inverts
      --  the order of elements in a sequence. The reverse algorithm
      --  works in place, meaning, that it modifies its input
      --  sequence.
      --
      --  Note: the function has been renamed Reverse_Array, "reverse"
      --  is a reserved word in Ada.

   procedure Reverse_Array (A : in out T_Arr) with
      Pre  => (A'Last > A'First),
      Post => (for all K in A'Range => A (K) = A (A'Last - K + A'First));

end Chap6;
