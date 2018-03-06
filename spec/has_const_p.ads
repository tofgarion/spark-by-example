-- The Has_Constant_Sub_Range function is used to specify if an array
-- contains a subsequence with only the same value.

with Types;            use Types;
with Constant_Range_P; use Constant_Range_P;

package Has_Const_P with
     Spark_Mode,
     Ghost is

   --  function Constant_Range
   --    (A     : T_Arr;
   --     Val   : T;
   --     N     : Positive;
   --     First : Positive) return Boolean is
   --    (for all I in First .. First - 1 + N => A (I) = Val) with
   --     Pre => A'Length >= N and then First in A'First .. A'Last - N + 1;

   function Has_Constant_Subrange_In_Prefix
     (A    : T_Arr;
      Val  : T;
      N    : Positive;
      Last : Positive) return Boolean is
     (if
        Last >= A'First - 1 + N
      then
        (for some I in A'First .. Last =>
           Constant_Range (A, Val, I, I - 1 + N))
      else False) with
      Pre => A'Length >= N
      -- and then A'Last < Positive'Last
       and then Last <= A'Last + 1 - N;

   function Has_Constant_Subrange
     (A   : T_Arr;
      Val : T;
      N   : Positive) return Boolean is
     (Has_Constant_Subrange_In_Prefix (A, Val, N, A'Last + 1 - N)) with
      Pre => A'Length >= N and then A'Last < Positive'Last;

end Has_Const_P;
