--  This package provides an implementation of case studies from the
--  "ACSL by Example" technical report, chapter 3, from
--  http://www.fokus.fraunhofer.de/download/acsl_by_example

package Chap3 with
  Spark_Mode is

   type T is new Integer;

   type T_Arr is array (Positive range <>) of T;

   --  3.1 The 'equal' algorithm
   --
   --  Equal_Ranges is an helper function to write clearer assertions.

   function Equal_Ranges
     (A    : T_Arr;
      B    : T_Arr;
      Size : Natural) return Boolean is
     (for all I in 0 .. Size - 1 => A (A'First + I) = B (B'First + I)) with
     Pre => (Size <= A'Length and Size <= B'Length),
     Ghost;

   --  The function Equal returns true if a[i] == b[i] holds for each
   --  0 <= i < n.  Otherwise, equal returns false.

   function Equal (A : T_Arr; B : T_Arr; Size : Natural) return Boolean with
     Pre  => (Size <= A'Length and Size <= B'Length),
     Post => (Equal'Result = Equal_Ranges (A, B, Size));

   --  3.2 The 'mismatch' algorithm
   --
   --  The function Mismatch returns the smallest index where the two
   --  ranges a and b differ. If no such index exists, that is, if
   --  both ranges are equal then mismatch returns the length n of
   --  the two ranges.

   function Mismatch
     (A    : T_Arr;
      B    : T_Arr;
      Size : Natural) return Natural with
     Pre  => (Size <= A'Length and Size <= B'Length),
     Post => (Mismatch'Result <= Size and then
              Equal_Ranges (A, B, Mismatch'Result)),
     Contract_Cases =>
       (Equal_Ranges (A, B, Size) => Mismatch'Result = Size,
        others                =>
          Mismatch'Result < Size and then
          A (A'First + Mismatch'Result) /= B (B'First + Mismatch'Result)
       );

   --  3.3 The 'find' algorithm
   --
   --  Has_Value is an helper function to write clearer assertions.
   function Has_Value
     (A    : T_Arr;
      Size : Natural;
      Val  : T) return Boolean is
     (for some I in 0 .. Size - 1 => A (A'First + I) = Val) with
     Pre => Size <= A'Length,
     Ghost;

   --  The function Find returns the least valid index i of A where
   --  the condition a[i] == val holds.  If no such index exists then
   --  find returns the length n of the array.

   function Find (A : T_Arr; Size : Natural; Val : T) return Natural with
     Pre  => (Size <= A'Length),
     Post => (Find'Result <= Size and then
                not Has_Value(A, Find'Result, Val)),
     Contract_Cases =>
       (Has_Value(A, Size, Val) =>
          Find'Result < Size and then
          A (A'First + Find'Result) = Val and then
          not Has_Value(A, Find'Result, Val),
        others                  => Find'Result = Size
       );

   --  3.5 The 'find_first_of' Algorithm
   --
   --  Has_Value_Of is an helper function to write clearer assertions.

   function Has_Value_Of
     (A : T_Arr;
      M : Natural;
      B : T_Arr;
      N : Natural) return Boolean is
     (for some I in 0 .. M - 1 => Has_Value(B, N, A (A'First + I))) with
     Pre => M <= A'Length and then N <= B'Length,
     Ghost;


   --  As in Find this function performs a sequential search. However,
   --  whereas find searches for a particular value, Find_First_Of
   --  returns the least index i such that a[i] is equal to one of the
   --  values B(0), . . ., B(Size_B - 1).

   function Find_First_Of
     (A      : T_Arr;
      Size_A : Natural;
      B      : T_Arr;
      Size_B : Natural) return Natural with
     Pre  => (Size_A <= A'Length and Size_B <= B'Length),
     Post => Find_First_Of'Result <= Size_A,
     Contract_Cases =>
       (Has_Value_Of(A, Size_A, B, Size_B) =>
          Find_First_Of'Result < Size_A and then
          Has_Value(B, Size_B, A (A'First + Find_First_Of'Result)) and then
          not Has_Value_Of(A, Find_First_Of'Result, B, Size_B),
        others                   => Find_First_Of'Result = Size_A
       );

   --  3.6 The 'adjacent_first' Algorithm
   --
   --  Has_Equal_Neighbors is an helper function to write clearer assertions.

   function Has_Equal_Neighbors
     (A    : T_Arr;
      Size : Natural) return Boolean is
     (for some I in 0 .. Size - 2 => A (A'First + I) = A (A'First + I + 1)) with
     Pre => Size <= A'Length,
     Ghost;

   --  The Adjacent_First function returns the smallest valid index I
   --  such that I + 1 is also a valid index and A(I) = A(I + 1). If
   --  there is no such index, Size is returned.

   function Adjacent_First
     (A    : T_Arr;
      Size : Natural) return Natural with
     Pre  => Size <= A'Length,
     Post => Adjacent_First'Result <= Size,
     Contract_Cases =>
       (Has_Equal_Neighbors(A, Size) =>
          A (A'First + Adjacent_First'Result) = A (A'First + Adjacent_First'Result + 1)
          and then not Has_Equal_Neighbors(A, Adjacent_First'Result),
        others                       => Adjacent_First'Result = Size
     );

   --  3.7 The 'search' Algorithm
   --
   --  Has_Sub_Range is an helper function to write clearer assertions.

   function Has_Sub_Range
     (A      : T_Arr;
      Size_A : Natural;
      B      : T_Arr;
      Size_B : Natural) return Boolean is
     -- The following does not work. Maybe a slice problem?
     -- (for some I in 0 .. Size_A - Size_B => Equal_Ranges(A(A'First + I .. A'Last), B, Size_B)) with
     (for some I in 0 .. Size_A - Size_B =>
        (for all J in 0 .. Size_B - 1 => A(A'First + I + J) = B(B'First + J))) with
     Pre => Size_A <= A'Length and then
            Size_B <= B'Length,
     Post => (if Has_Sub_Range'Result then Size_B <= Size_A),
     Ghost;

   --  The function Search returns the first index I of the array A
   --  where the condition A(I + K) = B(K) for each 0 <= K < Size_B
   --  holds. If no such index exists then Search returns Size_B.

   function Search
     (A      : T_Arr;
      Size_A : Natural;
      B      : T_Arr;
      Size_B : Natural) return Natural with
     Pre => Size_A <= A'Length and then
             Size_B <= B'Length,
     Post => Search'Result <= Size_A and then
     (if Size_A = 0 or else Size_B = 0 then Search'Result = 0 else
     (if Has_Sub_Range(A, Size_A, B, Size_B) then
        (Search'Result <= Size_A - Size_B and then
           (Equal_Ranges(A(A'First + Search'Result .. A'Last), B, Size_B) and then
            not Has_Sub_Range(A, Search'Result + Size_B - 1, B, Size_B)))
      else Search'Result = Size_A));

   -- should have used Contract Cases here, but does not work due to a
   -- bug with gnatprove (see
   -- https://gt3-prod-2.adacore.com/#/tickets/P630-039)
   --
   --  Contract_Cases =>
   --    (Size = 0 or Size_B = 0              =>
   --       Search'Result = 0,
   --     Has_Sub_Range(A, Size_A, B, Size_B) =>
   --       Equal_Ranges(A(A'First + Search'Result .. A'Last), B, Size_B) and then
   --       not Has_Sub_Range(A, Search'Result + Size_B - 1, B, Size_B),
   --     others                              =>
   --       Search'Result = Size_A);

   --  3.8 the 'count' algorithm
   --
   --  Remove_Last and Occ are helper functions needed to
   --  axiomatically define Count. See
   --  http://docs.adacore.com/spark2014-docs/html/ug/gnatprove_by_example/manual_proof.html#manual-proof-using-ghost-code

   function Remove_Last (A : T_Arr) return T_Arr is (A (A'First .. A'Last - 1))
   with
     Pre => A'Length > 0,
     Ghost;

   function Occ_Def
     (A   : T_Arr;
      Val : T) return Natural is
     (if A'Length = 0 then 0
      elsif A (A'Last) = Val then Occ_Def(Remove_Last (A), Val) + 1
      else Occ_Def(Remove_Last (A), Val)
     )
   with
     Post => Occ_Def'Result <= A'Length,
     Ghost;

   -- this function is needed as Occ_Def is recursive to use Occ_Def
   -- postcondition, see previous link
   function Occ (A : T_Arr; Val : T) return Natural is
     (Occ_Def (A, Val))
   with
     Post => Occ'Result <= A'Length,
     Ghost;

   --  The Count function counts the frequency of occurrences of a
   --  particular element in a sequence.

   function Count (A      : T_Arr;
                   -- Size_A : Natural;
                   Val    : T) return Natural
   with
     Post => Count'Result <= A'Length and then
             Count'Result = Occ (A, Val);

   --  IMPLEMENTATION: the function Equal_Mismatch behaves like Equal,
   --  but its implementation use Mismatch.

   function Equal_Mismatch (A : T_Arr; B : T_Arr; Size : Natural) return Boolean with
     Pre  => (Size <= A'Length and Size <= B'Length),
     Post => (Equal_Mismatch'Result = Equal_Ranges (A, B, Size));

   --  The Search_N algorithm
   --
   --  Constant_Range is an helper predicate for Search_N

   function Constant_Range (A     : T_Arr;
                            First : Integer;
                            Last  : Integer;
                            Val   : T) return Boolean is
     (if Last < First then True else
        (for all I in First .. Last => A (I) = Val)) with
     Ghost;

   function Has_Constant_Sub_Range (A      : T_Arr;
                                    -- Size_A : Natural;
                                    N      : Natural;
                                    Val    : T) return Boolean is
     (for some I in A'First .. A'Last - N + 1 =>
        Constant_Range(A, I, I + N - 1, Val)) with
     Post => (if Has_Constant_Sub_Range'Result then N <= A'Length),
     Ghost;

   --  The Search_N function returns the first natural number I such
   --  that value Val occurs a given number of times (denoted here by
   --  N) starting from A'First + I.

   function Search_N (A      : T_Arr;
                      -- Size_A : Natural;
                      N      : Natural;
                      Val    : T) return Integer with
     Pre  => A'Last < Natural'Last,
     Post => (if N = 0 then Search_N'Result = 0
              elsif Has_Constant_Sub_Range(A, N, Val) then
               (Search_N'Result <= A'Last - N + 1 and then
                Constant_Range(A, Search_N'Result, Search_N'Result + N - 1, Val) and then
                (not Has_Constant_Sub_Range(A(A'First .. Search_N'Result + N - 2), N, Val)))
              else Search_N'Result = A'Length
             );

end Chap3;
