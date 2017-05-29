-- The Has_Sub_Range function function is used to specify if an array
-- is a subrange of another one.

with Types; use Types;
with Equal_Ranges_P; use Equal_Ranges_P;

package Has_Sub_Range_P with
     Spark_Mode,
     Ghost is
   function Has_Sub_Range
     (A : T_Arr;
      B : T_Arr) return Boolean is
     (for some I in A'First .. A'Last - B'Length + 1 =>
        Equal_Ranges (A (I .. I - 1 + B'Length), B)) with
      Pre => B'Length > 0 and then A'Length >= B'Length;

end Has_Sub_Range_P;
