--  This package provides an implementation of case studies from the
--  "ACSL by Example" technical report, chapter 6, from
--  http://www.fokus.fraunhofer.de/de/sqc/_download_sqc/ACSL-by-Example.pdf

generic
   type T is (<>);

package Chap6 is

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

end Chap6;
