with Types; use Types;
with Multiset_Unchanged_P; use Multiset_Unchanged_P;
with Heap_Predicates; use Heap_Predicates;
with Upper_Bound_P; use Upper_Bound_P;

package Pop_Heap_Min_P with
SPARK_Mode is

   procedure Pop_Heap(H : in out Heap) with
     Pre => H.Size >=1
     and then H.A'Length >=1
     and then Is_Heap_Def(H),
     Post => Multiset_Unchanged(H.A,H'Old.A)
     and then H'Old.Size = H.Size+1
     and then Is_Heap_Def(H)
     and then H.A(H.Size+1) = H'Old.A(1)
     and then Max_Element_Def(H.A(1 .. H.Size+1),H.Size+1);

end Pop_Heap_Min_P;
