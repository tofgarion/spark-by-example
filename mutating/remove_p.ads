with Types; use Types;
with Remove_Copy_P; use Remove_Copy_P;
with Find_P; use Find_P;
with Remove_Count_P; use Remove_Count_P;
with Occ_P; use Occ_P;
with Multiset_Retain_Rest_P; use Multiset_Retain_Rest_P;
with Remove_Copy_Lemmas; use Remove_Copy_Lemmas;

package Remove_P with
SPARK_Mode
is
   procedure Remove (A : in out T_Arr ; Val : T ; K : in out Natural) with
     Pre => A'Last < Positive'Last, --and then A'Length > 0,
      -- Post =>
      Contract_Cases => (A'Length = 0 => K'Old = K,
     A'Length > 0 =>
       K = A'First + Remove_Count(A'Old,Val) - 1
     and then Multiset_Retain_Rest (A'Old, A (A'First .. K), Val)
     and then (for all J in A'First .. K => A (J) /= Val)
     and then (for all J in K + 1 .. A'Last => A (J) = A'Old (J)));
end Remove_P;
