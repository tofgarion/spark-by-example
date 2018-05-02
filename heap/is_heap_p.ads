with Types; use Types;
with Heap_Predicates; use Heap_Predicates;

package Is_Heap_P with
  SPARK_Mode is
   
   function Is_Heap(H : Heap) return Boolean with
     Post => Is_Heap'Result = Is_Heap_Def(H);
   
end Is_Heap_P;
