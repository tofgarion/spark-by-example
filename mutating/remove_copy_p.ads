with Types;                        use Types;
with Multiset_Retain_Rest_P;       use Multiset_Retain_Rest_P;
--with Has_Value_P;                  use Has_Value_P;
--with Count_P;                      use Count_P;
with Remove_Count_P;               use Remove_Count_P;
--with Lemma_Multiset_Retain_Rest_P; use Lemma_Multiset_Retain_Rest_P;

--with Remove_Mapping_P;           use Remove_Mapping_P;

package Remove_Copy_P with
     Spark_Mode is

   procedure Remove_Copy (A : T_Arr; B : in out T_Arr; Val : T; K : out Natural) with
     Pre => A'Length > 0
     -- and then B'Last = B'First + Remove_Count(A,Val)
      and then B'Length = A'Length
      and then B'Last < Positive'Last,
     Post => K in B'First - 1 .. B'Last
     and then K = B'First + Remove_Count(A,Val) 
     and then (for all L in B'First .. K => B(L) /= Val)
     and then (for all L in K + 1 .. B'Last => B(L) = B'Old(L))
     and then (if K >=B'First then Multiset_Retain_Rest(A,B(B'First .. K),Val));
    -- and then (if K >= B'First then Remove_Mapping(A,B(B'First .. K),Val));
   -- Post => Multiset_Retain_Rest (A, B, Val)
  --       and then (for all K in B'Range => B (K) /= Val),
--      and then Remove_Mapping(A,B,Val),
     --  B'Length = 0 => True);
end Remove_Copy_P;
