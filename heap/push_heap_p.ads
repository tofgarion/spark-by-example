with Types; use Types;
with Is_Heap_P; use Is_Heap_P;
with Multiset_Unchanged_P; use Multiset_Unchanged_P;

package Push_Heap_P with
  Spark_Mode is
   procedure Push_Heap (H : Heap) with
     Pre => H.Size > 0
     and then Is_Heap( (A => H.A, Size => H.Size - 1) ),
     Post => Is_Heap(H)
     and then Multiset_Unchanged(H'Old.A, H.A);
end Push_Heap_P;
