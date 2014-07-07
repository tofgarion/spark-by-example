--  This package provides an implementation of case studies from the
--  "ACSL by Example" technical report, chapter 5, from
--  http://www.fokus.fraunhofer.de/de/sqc/_download_sqc/ACSL-by-Example.pdf

--  Note:
--  * all examples from this chapter are implemented
--  * GNATProve GPL2014 discharges all VCs of this package

package Chap5 with
     Spark_Mode is

   type T is new Integer;

   type Index_T is range 0 .. 10;
   subtype Index is Index_T range 1 .. 10;

   type T_Arr is array (Index) of T;

   --  Is_Sorted predicate

   function Is_Sorted
     (A : T_Arr) return Boolean is
     (for all J in A'Range =>
        (for all K in J + 1 .. A'Last => A (J) <= A (K)));

   --  5.1 The 'lower_bound' algorithm
   --
   --  lower_bound will return the largest index i with 0 <= i <= n
   --  such that for each indexk with 0 <= k < i the condition
   --  a[k] < val holds.
   --
   --  * If lower_bound returns n then for each index 0 <= i < n holds
   --    a[i] < val. Thus, val is not contained in a.
   --
   --  * If, however, lower_bound returns an index 0 <= i < n then we
   --    can only be sure that val <= a[i] holds.
   --
   --  Note: GNATProve GPL2014 requires progressive_split proof strategy

   function Lower_Bound (A : T_Arr; Val : T) return Index_T with
      Pre =>
     --  XXX GNATProve GPL 2014
     --  For now, we inline definition of Is_Sorted
      (for all J in A'Range =>
         (for all K in J + 1 .. A'Last => A (J) <= A (K))),
      Post =>
      (if
         Lower_Bound'Result in A'Range
       then
         (for all K in A'First .. Lower_Bound'Result - 1 => A (K) < Val) and
         (for all K in Lower_Bound'Result .. A'Last => A (K) >= Val));

   --  5.2 The 'upper_bound' algorithm
   --
   --  upper_bound will return the largest index i with 0 <= i <= n
   --  such that for each indexk with 0 <= k < i the condition
   --  a[k] < val holds.
   --
   --  * If upper_bound returns n then for each index 0 <= i < n holds
   --    a[i] < val. Thus, val is not contained in a.
   --
   --  * If, however, upper_bound returns an index 0 <= i < n then we
   --    can only be sure that val <= a[i] holds.
   --
   --  Note: GNATProve GPL2014 requires progressive_split proof strategy

   function Upper_Bound (A : T_Arr; Val : T) return Index_T with
      Pre =>
     --  XXX GNATProve GPL 2014
     --  For now, we inline definition of Is_Sorted
      (for all J in A'Range =>
         (for all K in J + 1 .. A'Last => A (J) <= A (K))),
      Post =>
      (if
         Upper_Bound'Result in A'Range
       then
         (for all K in A'First .. Upper_Bound'Result - 1 => A (K) <= Val) and
         (for all K in Upper_Bound'Result .. A'Last => A (K) > Val));

      --  5.3. The equal_range Algorithm
      --
      --  Informally, the specification of equal_range states that it
      --  combines the results of the algorithms lower_bound (Section
      --  5.1) and upper_bound (Section 5.2). Thus, if pair is the
      --  return value of equal_range(a, n, val) then pair.first shall
      --  equal lower_bound(a, n, val) whereas pair.second shall equal
      --  upper_bound(a, n, val)

      type Index_Pair is record
         First : Index_T;
         Second : Index_T;
      end record;

      function Equal_Range (A : T_Arr; Val : T) return Index_Pair
      is (Index_Pair'(Lower_Bound (A, Val), Upper_Bound (A, Val)))
        with
      Pre =>
     --  XXX GNATProve GPL 2014
     --  For now, we inline definition of Is_Sorted
      (for all J in A'Range =>
         (for all K in J + 1 .. A'Last => A (J) <= A (K))),
        Post =>
      (if
         (Equal_Range'Result.First in A'Range
            and then Equal_Range'Result.Second in A'Range)
       then
         (for all K in A'First .. Equal_Range'Result.First - 1 => A (K) < Val) and then
         (for all K in Equal_Range'Result.First .. Equal_Range'Result.Second - 1 => A (K) = Val) and then
         (for all K in Equal_Range'Result.Second .. A'Last => A (K)> Val));

      --  5.4. The binary_search Algorithm
      --
      --  binary_search requires that its input array is sorted in
      --  ascending order. It will return true if there exists an
      --  index i in a such that a[i] == val holds.

      function Binary_Search (A : T_Arr; Val : T) return Boolean
        with Pre =>
        --  XXX GNATProve GPL 2014
        --  For now, we inline definition of Is_Sorted
        (for all J in A'Range =>
           (for all K in J + 1 .. A'Last => A (J) <= A (K))),
          Post => (if Binary_Search'Result then
          (for some I in A'Range => A (I) = Val));

end Chap5;
