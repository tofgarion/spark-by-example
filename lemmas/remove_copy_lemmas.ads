with Types;               use Types;
with Occ_P;               use Occ_P;
with Occ_Def_P;           use Occ_Def_P;
with Multiset_Predicates; use Multiset_Predicates;
with Classic_Lemmas;      use Classic_Lemmas;

package Remove_Copy_Lemmas with
   Spark_Mode,
   Ghost
 is
   procedure Unique_Value
     (A   : T_Arr;
      E   : T;
      Val : T) with
      Pre => (for all L in A'First .. A'Last => A (L) = Val) and then E /= Val,
      Post => Occ (A, E) = 0;

   procedure Make_Prove_Multiset
     (A   : T_Arr;
      B   : T_Arr;
      Val : T) with
      Pre => A'Length > 0 and then B'Length > 0
      and then
      (if B'Length = 1 then (for all L in A'First .. A'Last - 1 => A (L) = Val)
       else Multiset_Retain_Rest (Remove_Last (A), Remove_Last (B), Val))
      and then A (A'Last) = B (B'Last),
      Post => Multiset_Retain_Rest (A, B, Val);

   procedure Multiset_Retain_Rest_Equal
     (A   : T_Arr;
      B   : T_Arr;
      C   : T_Arr;
      Val : T) with
      Pre => A'Length > 0 and then B = C
      and then Multiset_Retain_Rest (A, B, Val),
      Post => Multiset_Retain_Rest (A, C, Val);

end Remove_Copy_Lemmas;
