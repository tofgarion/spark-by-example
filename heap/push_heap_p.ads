with Types;               use Types;
with Multiset_Predicates; use Multiset_Predicates;
with Heap_Predicates;     use Heap_Predicates;
with Push_Heap_Lemmas;    use Push_Heap_Lemmas;

package Push_Heap_P with
     Spark_Mode is
   procedure Push_Heap (H : in out Heap) with
      Pre => H.Size in 1 .. MAX_SIZE
      and then Is_Heap_Def ((A => H.A, Size => H.Size - 1)),
      Post => Is_Heap_Def (H)
      and then Multiset_Unchanged (H'Old.A, H.A)
      and then
      (if
         H.Size < MAX_SIZE
       then
         H'Old.A (H.Size + 1 .. MAX_SIZE) = H.A (H.Size + 1 .. MAX_SIZE))
      and then H.Size = H'Old.Size;

end Push_Heap_P;
