with Types;               use Types;
with Is_Heap_P;           use Is_Heap_P;
with Multiset_Predicates; use Multiset_Predicates;
with Heap_Predicates;     use Heap_Predicates;
with Is_Heap_P;           use Is_Heap_P;
with Push_HEap_Lemmas; use Push_Heap_Lemmas;
--with Occ_P; use Occ_P;

package Push_Heap_P with
     Spark_Mode is
   procedure Push_Heap (H : in out Heap) with
      Pre => H.Size in 1 .. MAX_SIZE
      and then Is_Heap ((A => H.A, Size => H.Size - 1)),
      Post => Is_Heap (H) and then Multiset_Unchanged (H'Old.A(1 .. H.Size) , H.A(1 .. H.Size)) and then H.size = H'Old.size;
end Push_Heap_P;
