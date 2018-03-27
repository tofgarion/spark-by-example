with Types; use Types;

package Heap_Predicates with
  SPARK_Mode,
  Ghost is
   
   function Heap_Left(I : Positive) return Positive
   is 
     (2*I) 
     with
     Pre => I <= (Positive'Last)/2;
   
   function Heap_Right(I : Positive) return Positive
   is
     (2*I+1) 
     with
     Pre => I <= (Positive'Last-1)/2;
   
   function Heap_Parent(I : Positive) return Positive 
   is 
     (I/2) 
     with
     Pre => I > 1 ;
   
   function Is_Heap_Def(H : Heap) return Boolean 
   is
      (H.Size <= H.A'Last
      and then (H.Size = 0 or else (for all I in 2 .. H.Size => H.A(I) <= H.A(Heap_Parent(I)))));
       
      
end Heap_Predicates;

      
