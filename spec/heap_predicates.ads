with Types; use Types;

package Heap_Predicates with
  SPARK_Mode,
  Ghost is
   
   function Heap_Left(I : Natural) return Natural is (2*I+1);
   
   function Heap_Right(I : Natural) return Natural is (2*I+2);
   
   function Heap_Parent(I : Natural) return Natural is ((I-1)/2);
   
   function Is_Heap_Def(H : Heap) return Boolean is
      (H.Size = 0 or else (for all I in 1 .. H.Size-1 => H.A(I) <= H.A(Heap_Parent(I))));
      
end Heap_Predicates;

      
