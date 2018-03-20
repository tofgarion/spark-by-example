with Types;                  use Types;
with Multiset_Retain_Rest_P; use Multiset_Retain_Rest_P;
with Has_Value_P;            use Has_Value_P;
with Occ_Def_P;              use Occ_Def_P;
with Count_P;                use Count_P;
with Remove_Count_P;         use Remove_Count_P;
with Remove_Mapping_P;       use Remove_Mapping_P;

package Remove_Copy_With_Aux_P with
     Spark_Mode is

   procedure Remove_Copy_Aux
     (A   :        T_Arr;
      B   : in out T_Arr;
      Val :        T;
      J   : in out Integer) with
      Pre => A'Length > 0
      and then B'Length > 0
      and then J = B'First + Remove_Count (Remove_Last (A), Val) - A'First
      and then J in B'First .. B'Last + 1
      and then B'Last < Positive'Last
      and then (if J = B'Last + 1 then A (A'Last) = Val)
      and then not Has_Value (B (B'First .. J - 1), Val)
      and then Multiset_Retain_Rest
        (Remove_Last (A),
         B (B'First .. J - 1),
         Val)
      and then Remove_Mapping (A (A'First .. A'Last - 1), B, Val),
      Post => J = B'First + Remove_Count (A, Val) - A'First
      and then not Has_Value (B (B'First .. J - 1), Val)
      and then Multiset_Retain_Rest (A, B (B'First .. J - 1), Val)
      and then Remove_Mapping (A, B, Val)
      and then (if A (A'Last) /= Val then B (J - 1) = A (A'Last));

--   procedure Remove_Copy (A : in T_Arr; B : in out T_Arr; Val : T) with
--      Pre => B'Last = B'First + Remove_Count (A, Val) + A'First
---      and then B'Last < Positive'Last
--      and then B'Length > 0
--      and then A'Length > 0,
--      Post => Multiset_Retain_Rest (A, B, Val)
--      and then (not Has_Value (B, Val))
--      and then Remove_Mapping (A, B, Val);
end Remove_Copy_With_Aux_P;
