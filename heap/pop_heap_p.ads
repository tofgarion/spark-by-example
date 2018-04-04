with Types; use Types;
with Heap_Predicates; use Heap_Predicates;
with Multiset_Predicates; use Multiset_Predicates;
with Upper_Bound_P; use Upper_Bound_P;
with Swap_Array_P; use Swap_Array_P;

package Pop_Heap_P with
  SPARK_Mode
is
   
   function Maximum_Heap_Child(H : Heap; P : Positive) return Positive with
     Pre =>
       H.Size  in 2 .. Positive'Last-1
       and then P in 1 .. H.Size-1
       and then Is_Heap_Def(H),
     Post =>
       Heap_Maximum_Child(H,P,Maximum_Heap_Child'Result)
       and then P < Maximum_Heap_Child'Result
       and then (if Maximum_Heap_Child'Result <= H.Size 
		   then P = Heap_Parent(Maximum_Heap_Child'Result));
   
   
     procedure Pop_Heap(H : in out Heap) with
     Pre => H.Size >=1
     and then H.A'Length >=1
     and then Is_Heap_Def(H),
     Post => Is_Heap_Def(H) 
     and then H'Old.Size = H.Size+1
     and then H.A(H.Size+1) = H'Old.A(1)
     and then Max_Element_Def(H.A(1 .. H.Size+1),H.Size+1)
     and then Multiset_Unchanged(H.A,H'Old.A);
   
end Pop_Heap_P;
