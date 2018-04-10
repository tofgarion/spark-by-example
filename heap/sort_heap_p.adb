package body Sort_Heap_P with
  SPARK_Mode is


   procedure Sort_Heap(H : in out Heap)
   is
      Interm : Heap := H with ghost;
   begin
      while H.Size > 0 loop
         Interm := H;
         Pop_Heap(H);
         pragma Loop_Invariant(Is_Heap_Def(H));
         pragma Loop_Invariant(Multiset_Unchanged(H.A,H'Loop_Entry.A));
      end loop;

   end Sort_Heap;

end Sort_Heap_P;
