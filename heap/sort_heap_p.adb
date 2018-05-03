package body Sort_Heap_P with
     Spark_Mode is

   procedure Sort_Heap (H : in out Heap) is
      Interm : Heap := H with
         Ghost;
      N : constant Integer := H.Size;
   begin
      Interm := H;
      pragma Assert (Interm.Size <= N);
      for J in reverse 1 .. N loop
         Interm := H;

         Pop_Heap (H);

         pragma Loop_Invariant (H.A (J) >= H.A (1));
         pragma Loop_Invariant (H.Size = J - 1);
         pragma Loop_Invariant (Is_Heap_Def (H));
         pragma Loop_Invariant (Multiset_Unchanged (H.A, H'Loop_Entry.A));
         pragma Loop_Invariant (Lower_Bound (H.A (J .. N), H.A (J)));
         pragma Loop_Invariant (Sorted (H.A (J .. N)));
         pragma Loop_Invariant
           (if
              N < MAX_SIZE
            then
              H.A (N + 1 .. MAX_SIZE) = H'Loop_Entry.A (N + 1 .. MAX_SIZE));
      end loop;
   end Sort_Heap;

end Sort_Heap_P;
