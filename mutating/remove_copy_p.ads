with Types;               use Types;
with Multiset_Predicates; use Multiset_Predicates;
with Remove_Count_P;      use Remove_Count_P;
with Occ_P;               use Occ_P;
with Occ_Def_P;           use Occ_Def_P;
with Remove_Copy_Lemmas;  use Remove_Copy_Lemmas;

package Remove_Copy_P with
   Spark_Mode
 is

   procedure Remove_Copy
     (A   :        T_Arr;
      B   : in out T_Arr;
      Val :        T;
      K   : in out Natural) with
      Pre            => B'Length = A'Length and then B'Last < Positive'Last,
      Contract_Cases =>
      (A'Length > 0 =>
         (K in B'First - 1 .. B'Last
          and then K = B'First + Remove_Count (A, Val) - 1
          and then (for all L in B'First .. K => B (L) /= Val)
          and then (for all L in K + 1 .. B'Last => B (L) = B'Old (L))
          and then
          (if K >= B'First then
             Multiset_Retain_Rest (A, B (B'First .. K), Val))),
       others => (B'Old = B and then K'Old = K));
end Remove_Copy_P;
