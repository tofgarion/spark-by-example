with Types; use Types;
with Is_Heap_P; use Is_Heap_P;
with Push_Heap_P; use Push_Heap_P;
with Occ_P; use Occ_P;
with Multiset_Predicates; use Multiset_Predicates;
with Push_Heap_Lemmas; use Push_Heap_Lemmas;
with Sorting_Lemmas; use Sorting_Lemmas;

package Make_Heap_P with
SPARK_Mode
is

   function Unchanged_Split (A : T_Arr; A_F, A_L : Positive ; B : T_Arr; B_F, B_L : Positive) return Boolean
   is
      (Multiset_Unchanged (A (A_F .. A_L), B (B_F .. B_L)))
   with
   Ghost,
   Pre => A_F in A'Range and A_L in A'Range and B_F in B'Range and B_L in B'Range
   and A_L - A_F = B_L - B_F;

   function Make_Heap (A : T_Arr) return Heap with
     Pre => A'Length <= MAX_SIZE and A'Last < Positive'Last,
     Contract_Cases => (A'Length > 0 => Make_Heap'Result.Size = A'Length
                        and then  Is_Heap (Make_Heap'Result)
                        and then Multiset_Unchanged (Make_Heap'Result.A (1 .. Make_Heap'Result.Size), A),
                        others => Make_Heap'Result = (A => (others => 0), Size => 0));
end Make_Heap_P;
