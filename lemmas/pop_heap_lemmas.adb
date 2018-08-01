package body Pop_Heap_Lemmas with
   Spark_Mode
 is

   procedure Heap_Set
     (H1 : Heap;
      H2 : Heap;
      P  : Positive;
      C  : Positive)
   is
   begin
      null;
   end Heap_Set;

   procedure Upper_Bound_Heap
     (H : Heap;
      V : T)
   is
   begin
      for J in 1 .. H.Size loop
         pragma Loop_Invariant (for all K in 1 .. J => V >= H.A (K));
      end loop;
   end Upper_Bound_Heap;

end Pop_Heap_Lemmas;
