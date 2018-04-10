with Types; use Types;
with Pop_Heap_Min_P; use Pop_Heap_Min_P;
--with Pop_Heap_P; use Pop_Heap_P;
with Multiset_Unchanged_P; use Multiset_Unchanged_P;
with Sorted_P; use Sorted_P;
with Heap_Predicates; use Heap_Predicates;

package Sort_Heap_P with
SPARK_Mode is

   procedure Sort_Heap(H : in out Heap) with
     Pre => Is_Heap_Def(H),
     Post => Multiset_Unchanged(H.A,H.A'Old)
     and then Sorted(H.A(1 .. H.Size));

end Sort_Heap_P;
