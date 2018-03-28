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
     Pre => I <=(Positive'Last-1)/2;
   
   function Heap_Parent(I : Positive) return Positive 
   is 
     (I/2) 
     with
     Pre => I > 1 ;
   
   function Is_Heap_Def(H : Heap) return Boolean 
   is
      (H.Size <= H.A'Last
	 and then (H.Size = 0 or else (for all I in 2 .. H.Size => H.A(I) <= H.A(Heap_Parent(I)))));
      
   function Heap_Maximum_Child(H : Heap; P : Positive; C : Positive) return Boolean
   is (Is_Heap_Def(H)
      and then H.Size in 2 .. Positive'Last-1
	 and then P in 1 .. H.Size -1
	 and then (if P > H.Size/2 
		     then C = H.Size +1 
		     else (C in 2 .. H.Size
			   and then  P = Heap_Parent(C)
			     and then (if Heap_Left(P) <= H.Size then H.A(Heap_Left(P))<=H.A(C))
		             and then (if Heap_Right(P) <= H.Size then H.A(Heap_Right(P)) <= H.A(C)))));
   
      
end Heap_Predicates;

      
