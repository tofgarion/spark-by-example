with Types;                  use Types;
with Multiset_Retain_Rest_Bis_P; use Multiset_Retain_Rest_Bis_P;
with Has_Value_P;            use Has_Value_P;
with Count_P;                use Count_P;

package Remove_Copy_P with
     Spark_Mode is
   procedure Remove_Copy (A : T_Arr; B : in out T_Arr; Val : T) with
      Pre => B'Last = B'First + A'Length - Count (A, Val) - 1
      and then B'Last < Positive'Last,
      Post => Multiset_Retain_Rest (A, B, Val) and then (for all I in B'Range => B(I) /= Val);
end Remove_Copy_P;
