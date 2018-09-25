with Types;               use Types;
with Heap_Predicates;     use Heap_Predicates;
with Push_Heap_P;         use Push_Heap_P;
with Occ_P;               use Occ_P;
with Multiset_Predicates; use Multiset_Predicates;
with Classic_Lemmas;      use Classic_Lemmas;

package Make_Heap_P with
   Spark_Mode
 is

   function Make_Heap
     (A : T_Arr)
      return Heap with
      Pre            => A'Length <= MAX_SIZE and A'Last < Positive'Last,
      Contract_Cases =>
      (A'Length > 0 =>
         Make_Heap'Result.Size = A'Length
         and then Is_Heap_Def (Make_Heap'Result)
         and then Multiset_Unchanged
           (Make_Heap'Result.A (1 .. Make_Heap'Result.Size), A),
       others => Make_Heap'Result = (A => (others => 0), Size => 0));

end Make_Heap_P;
