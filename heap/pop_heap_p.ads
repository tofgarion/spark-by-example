with Types; use Types;
with Heap_Predicates; use Heap_Predicates;
with Multiset_Unchanged_P; use Multiset_Unchanged_P;
with Max_Element_P; use Max_Element_P;

package Pop_Heap_P with
  SPARK_Mode
is
   
   procedure Pop_Heap(H : in out Heap) with
     Pre => H.Size >=1 
     and then Is_Heap_Def(H),
     Post => Is_Heap(H) 
     and then H.A(H.Size-1) = H'Old.A(0)
     and then Max_Element(H.A,H.Size-1)
     and then Multiset_Unchanged(H.A,H'Old.A);
   
end Pop_Heap_P;
