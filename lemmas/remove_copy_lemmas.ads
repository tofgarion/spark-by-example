with Types;                  use Types;
with Occ_P;                  use Occ_P;
with Occ_Def_P;              use Occ_Def_P;
with Multiset_Retain_Rest_P; use Multiset_Retain_Rest_P;

package Remove_Copy_Lemmas with
     Spark_Mode is
   procedure Lemma_1 (A : T_Arr; E, Val : T) with
      Ghost,

      Pre => (for all L in A'First .. A'Last => A (L) = Val) and then E /= Val,
      Post => Occ (A, E) = 0;

   procedure Lemma_2 (A : T_Arr; B : T_Arr; E : T) with
      Ghost,

      Pre  => A = B,
      Post => Occ (A, E) = Occ (B, E);

   procedure No_Changes (A, B, C : T_Arr; Val : T) with
      Ghost,
      Pre => A'Length > 0
      and then B = C
      and then Multiset_Retain_Rest (A, B, Val),
      Post => Multiset_Retain_Rest (A, C, Val);

   procedure Make_Prove_Multiset (A : T_Arr; B : T_Arr; Val : T) with
      Ghost,
      Pre => A'Length > 0
      and then B'Length > 0
      and then
      (if B'Length = 1 then (for all L in A'First .. A'Last - 1 => A (L) = Val)
       else
         Multiset_Retain_Rest
           (Remove_Last (A),
            Remove_Last(B),
            Val))
      and then A (A'Last) = B (B'Last),
      Post => Multiset_Retain_Rest (A, B, Val);

end Remove_Copy_Lemmas;
