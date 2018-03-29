with Types;                        use Types;
with Multiset_Retain_Rest_P;       use Multiset_Retain_Rest_P;
with Remove_Count_P;               use Remove_Count_P;
with Occ_P; use Occ_P;
with Occ_Def_P; use Occ_Def_P;
with Remove_Copy_Lemmas; use Remove_Copy_Lemmas;

package Remove_Copy_P with
     Spark_Mode is

   procedure Remove_Copy (A : T_Arr; B : in out T_Arr; Val : T; K : out Natural) with
     Pre => A'Length > 0
      and then B'Length = A'Length
      and then B'Last < Positive'Last,
     Post => K in B'First - 1 .. B'Last
     and then K = B'First + Remove_Count(A,Val) 
     and then (for all L in B'First .. K => B(L) /= Val)
     and then (for all L in K + 1 .. B'Last => B(L) = B'Old(L))
     and then (if K >= B'First then Multiset_Retain_Rest (A, B (B'First .. K), Val))
   and then (if K = B'First - 1 then (for all L in A'Range => A(L)=Val));
end Remove_Copy_P;
