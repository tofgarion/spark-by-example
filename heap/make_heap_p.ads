with Types;               use Types;
with Multiset_Predicates; use Multiset_Predicates;
with Is_Heap_P;           use Is_Heap_P;
with Push_Heap_P; use Push_Heap_P;

package Make_Heap_P with
     Spark_Mode is
   function Make_Heap (A : T_Arr) return Heap with
     Pre => A'Length <= MAX_SIZE,
      Contract_Cases =>
      (A'Length = 0 => Make_Heap'Result.Size = 0,
       A'Length > 0 =>
         Is_Heap (Make_Heap'Result)
         and then Multiset_Unchanged
           (Make_Heap'Result.A (1 .. Make_Heap'Result.Size),
            A));
end Make_Heap_P;
