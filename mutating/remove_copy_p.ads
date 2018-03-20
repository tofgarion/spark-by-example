with Types;                  use Types;
with Multiset_Retain_Rest_Bis_P; use Multiset_Retain_Rest_Bis_P;
with Has_Value_P;            use Has_Value_P;
with Occ_Def_P;              use Occ_Def_P;
with Count_P;                use Count_P;
with Remove_Count_P;         use Remove_Count_P;
with Remove_Mapping_P;       use Remove_Mapping_P;

package Remove_Copy_P with
     Spark_Mode is

   procedure Remove_Copy (A : in T_Arr; B : in out T_Arr; Val : T) with
      Pre => B'Last = B'First + A'Length - Count(A, Val) - 1
      and then B'Last < Positive'Last
     and then A'Length > 0,
      Post => Multiset_Retain_Rest (A, B, Val)
      and then (for all K in B'Range => B(K) /= Val)
      and then Remove_Mapping (A, B, Val);
end Remove_Copy_P;
