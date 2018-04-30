with Types;               use Types;
with Multiset_Predicates; use Multiset_Predicates;
with Occ_P;               use Occ_P;
with Occ_Def_P;           use Occ_Def_P;

package Push_Heap_Lemmas with
     Spark_Mode is
   function Is_Set
     (A : T_Arr;
      I : Positive;
      V : T;
      B : T_Arr) return Boolean is
     (A'First = B'First
      and then A'Last = B'Last
      and then B (I) = V
      and then (for all J in A'Range => (if I /= J then B (J) = A (J)))) with
      Ghost,
      Pre => I in A'Range;

   procedure Occ_Set (A : T_Arr; B : T_Arr; I : Positive; V, E : T) with
      Ghost,
      Pre  => I in A'Range and then Is_Set (A, I, V, B),
      Post =>
      (if V = A (I) then Occ (B, E) = Occ (A, E)
       elsif V = E then Occ (B, E) = Occ (A, E) + 1
       elsif A (I) = E then Occ (B, E) = Occ (A, E) - 1
       else Occ (B, E) = Occ (A, E));

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

--     procedure Make_Prove_Final_Unchanged
--       (H_A, A, H_A_Old, A_Old : T_Arr; Size : Positive) with
--       Pre => (if Size < MAX_SIZE then H_A (Size + 1 .. MAX_SIZE) = H_A_Old (Size + 1 .. MAX_SIZE))
--       and then Multiset_Unchanged (A, A_Old)
--       and then H_A (1 .. Size) = A
--       and then H_A_Old (1 .. Size) = A_Old,
--       Post => Multiset_Unchanged(H_A,H_A_Old);

   procedure New_Element (A, B : T_Arr) with
      Ghost,
      Pre => A'Length > 0
      and then B'Length = A'Length
      and then Multiset_Unchanged (Remove_Last (A), Remove_Last (B))
      and then A (A'Last) = B (B'Last),
      Post => Multiset_Unchanged (A, B);

   procedure Unchanged_Transitivity (A, B, C : T_Arr) with
      Ghost,
     Pre => A'Length > 0 and then
       B'Length = A'Length
      and then C'Length = B'Length
      and then Multiset_Unchanged (A, B)
      and then (Multiset_Unchanged (B, C) or else B=C),
      Post => Multiset_Unchanged (A, C);

end Push_Heap_Lemmas;
