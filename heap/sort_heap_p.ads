with Types; use Types;
with Pop_Heap_P; use Pop_Heap_P;
with Multiset_Predicates; use Multiset_Predicates;
with Sorted_P; use Sorted_P;
with Heap_Predicates; use Heap_Predicates;
with Lower_Bound_p; use Lower_Bound_P;
with Upper_Bound_P; use Upper_Bound_P;

package Sort_Heap_P with
SPARK_Mode is

   procedure Sort_Heap(H : in out Heap) with
     Pre => Is_Heap_Def(H),
     Post => Multiset_Unchanged(H.A,H.A'Old)
     and then Sorted (H.A (1 .. H'Old.Size))
   and then (if H'Old.Size < MAX_SIZE then H.A(H'Old.Size + 1 .. MAX_SIZE) = H'Old.A(H'Old.Size + 1 .. MAX_SIZE));
end Sort_Heap_P;
