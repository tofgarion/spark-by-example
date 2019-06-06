with Types; use Types;

package Has_Constant_Subrange_P with
   Spark_Mode,
   Ghost
 is

   function Constant_Range_From_Location
     (A      : T_Arr;
      Val    : T;
      Loc    : Positive;
      Length : Positive)
      return Boolean is
     (Loc - 1 + Length <= A'Last
      and then (for all I in Loc .. Loc - 1 + Length => A (I) = Val)) with
      Pre => Loc >= A'First and then Loc <= A'Last - Length + 1
      and then Loc - 1 + Length <= Positive'Last;

   function Has_Constant_Subrange
     (A    : T_Arr;
      Val  : T;
      I, N : Positive)
      return Boolean is
     (for some J in A'First .. I - N + 1 =>
        Constant_Range_From_Location (A, Val, J, N)) with
      Pre => I in A'Range;

end Has_Constant_Subrange_P;
