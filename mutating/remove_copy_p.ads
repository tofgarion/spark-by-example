with Types;                      use Types;
with Multiset_Retain_Rest_P; use Multiset_Retain_Rest_P;
with Has_Value_P;                use Has_Value_P;
with Occ_Def_P;                  use Occ_Def_P;
with Count_P;                    use Count_P;
with Remove_Count_P;             use Remove_Count_P;
with Remove_Mapping_P;           use Remove_Mapping_P;

package Remove_Copy_P with
     Spark_Mode is

   procedure Remove_Copy (A : in T_Arr; B : in out T_Arr; Val : T) with
     Pre => A'Length > 0 and then 
     B'Last = B'First + Remove_Count(A,Val)
     and then B'Last < Positive'Last,
     Contract_Cases =>
     (B'Length > 0 => Multiset_Retain_Rest(A,B,Val)
	and then (for all K in B'Range => B(K) /= Val)
	and then Remove_Mapping(A,B,Val),
      B'Length = 0 => True);
     -- Post => Multiset_Retain_Rest (A, B, Val)
     -- and then (for all K in B'Range => B (K) /= Val)
     -- and then (if B'Length > 0 then Remove_Mapping(A,B,Val));
end Remove_Copy_P;
