with Types; use Types;
with Shuffle_Lemmas; use Shuffle_Lemmas;
with Heap_Predicates; use Heap_Predicates;

package Heap_Lemmas with
SPARK_Mode,
  Ghost
is

   pragma warnings
     (off, "postcondition does not check the outcome of calling");

   procedure Heap_Set( H1 : Heap; H2 : Heap; P : Positive; C : Positive) with
     Pre => H1.Size = H2.Size
     and then C in 2 .. H1.Size
     and then P in 1 .. C
     and then P = Heap_Parent(C)
     and then Heap_Maximum_Child(H1,P,C)
     and then Is_Heap_Def(H1)
     and then Is_Set(H1.A, P, H1.A(C), H2.A),
     Post => Is_Heap_Def(H2);

   procedure Upper_Bound_Heap(H : Heap; V : T) with
     Pre => H.Size >=1
     and then Is_Heap_Def(H)
     and then V >= H.A(1),
     Post => (for all J in 1 .. H.Size => V >= H.A(J));


end Heap_Lemmas;
