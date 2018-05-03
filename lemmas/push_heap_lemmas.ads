with Types;               use Types;
with Multiset_Predicates; use Multiset_Predicates;
with Occ_P;               use Occ_P;
with Occ_Def_P;           use Occ_Def_P;
with Classic_Lemmas;      use Classic_Lemmas;

package Push_Heap_Lemmas with
     Spark_Mode is

   procedure No_Changes
     (A_Old, A, A_Save : T_Arr;
      V, V_Old         : T;
      Hole             : Positive) with
      Ghost,
      Pre => A'Last < Positive'Last
      and then A'First = A_Save'First
      and then A'First = A_Old'First
      and then A'Last = A_Save'Last
      and then A'Last = A_Old'Last
      and then Hole in A'Range
      and then A_Save = A
      and then V_Old = A (Hole)
      and then Multiset_Add (A_Old, A, A (Hole))
      and then Multiset_Minus (A_Old, A, V)
      and then Multiset_Retain_Rest_Double (A_Old, A, A (Hole), V),
      Post => Multiset_Add (A_Old, A_Save, V_Old)
      and then Multiset_Minus (A_Old, A_Save, V)
      and then Multiset_Retain_Rest_Double (A_Old, A_Save, V_Old, V);

   procedure Make_Prove_Prologue
     (A, A_Old : T_Arr;
      V        : T;
      Hole     : Positive) with
      Ghost,
      Pre => A'First = A_Old'First
      and then A'Last = A_Old'Last
      and then Hole in A'Range
      and then A'Last < Positive'Last
      and then Is_Set (A_Old, Hole, A (Hole), A)
      and then A_Old (Hole) = V
      and then A (Hole) /= V,
      Post => Multiset_Add (A_Old, A, A (Hole))
      and then Multiset_Minus (A_Old, A, V)
      and then Multiset_Retain_Rest_Double (A_Old, A, V, A (Hole));

   procedure Make_Prove_Loop
     (A, A_Save, A_Old : T_Arr;
      V_Old, V         : T;
      Hole             : Positive) with
      Ghost,
      Pre => A'Last < Positive'Last
      and then A'First = A_Save'First
      and then A'First = A_Old'First
      and then A'Last = A_Save'Last
      and then A'Last = A_Old'Last
      and then Hole in A'Range
      and then A_Save (Hole) = V_Old
      and then A (Hole) /= V
      and then Multiset_Add (A_Old, A_Save, V_Old)
      and then Multiset_Minus (A_Old, A_Save, V)
      and then Multiset_Retain_Rest_Double (A_Old, A_Save, V_Old, V)
      and then Is_Set (A_Save, Hole, A (Hole), A),
      Post => Multiset_Add (A_Old, A, A (Hole))
      and then Multiset_Minus (A_Old, A, V)
      and then Multiset_Retain_Rest_Double (A_Old, A, A (Hole), V);

   procedure Make_Prove_Epilogue
     (A, A_Save, A_Old : T_Arr;
      V                : T;
      Hole             : Positive) with
      Ghost,
      Pre => A'Last < Positive'Last
      and then A'First = A_Save'First
      and then A'First = A_Old'First
      and then A'Last = A_Save'Last
      and then A'Last = A_Old'Last
      and then Hole in A'Range
      and then A (Hole) = V
      and then Multiset_Add (A_Old, A_Save, A_Save (Hole))
      and then Multiset_Minus (A_Old, A_Save, V)
      and then Multiset_Retain_Rest_Double (A_Old, A_Save, A_Save (Hole), V)
      and then Is_Set (A_Save, Hole, V, A),
      Post => Multiset_Unchanged (A, A_Old);

end Push_Heap_Lemmas;
