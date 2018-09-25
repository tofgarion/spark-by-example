with Types;          use Types;
with Classic_Lemmas; use Classic_Lemmas;
with Make_Heap_P, Sort_Heap_P;
use Make_Heap_P, Sort_Heap_P;
with Sorted_P;            use Sorted_P;
with Multiset_Predicates; use Multiset_Predicates;

package Heap_Sort_P with
   Spark_Mode
 is
   procedure Heap_Sort (A : in out T_Arr) with
      Pre  => A'Length <= MAX_SIZE and then A'Last < Positive'Last,
      Post => Sorted (A) and then Multiset_Unchanged (A, A'Old);
end Heap_Sort_P;
