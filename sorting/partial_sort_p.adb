package body Partial_Sort_P with
     Spark_Mode is

   procedure Upper_Bound_Heap (H : Heap; V : T) is
   begin
      null;
   end Upper_Bound_Heap;

   procedure Partial_Sort_Aux (H : in out Heap; M : Positive) is
      Old_Size : constant Natural := H.Size;
      Size     : constant Natural := M - 1;
      A_Save   : T_Arr            := H.A with
         Ghost;
   begin
         H.Size := Size;
         for J in M .. Old_Size loop
            if H.A (J) < H.A (1) then
               Pop_Heap (H);
               Swap_Array (H.A, M - 1, J);
               H.Size := Size;
               A_Save := H.A;
               Push_Heap (H);
               Prove_Lower_Bound (H.A, A_Save, M, J);

            end if;
            Upper_Bound_Heap (H, H.A (1));
            pragma Loop_Invariant (H.Size = Size);
            pragma Loop_Invariant (Is_Heap_Def (H));
            pragma Loop_Invariant (Upper_Bound (H.A (1 .. M - 1), H.A (1)));
            pragma Loop_Invariant (Lower_Bound (H.A (M .. J), H.A (1)));
            pragma Loop_Invariant (Multiset_Unchanged (H.A, H'Loop_Entry.A));
            pragma Loop_Invariant
              (if
                 J < MAX_SIZE
               then
                 H.A (J + 1 .. MAX_SIZE) = H'Loop_Entry.A (J + 1 .. MAX_SIZE));
         end loop;
         A_Save := H.A;
         Sort_Heap (H);

         H.Size := Old_Size;
         Prove_Partition (H.A, A_Save, M, Old_Size);
   end Partial_Sort_Aux;

   procedure Partial_Sort (A : in out T_Arr; M : Positive) is
      H      : Heap;
      A_Save : T_Arr := H.A with
         Ghost;
      A_Old : constant T_Arr := A with
         Ghost;
      Size : constant Natural := A'Length;
   begin
      if Size > 0 and then M > A'First then
         H := Make_Heap (A (A'First .. M - 1));
         for J in M .. A'Last loop
            pragma Assert (Is_Heap_Def ((A => H.A, Size => M - A'First)));
            A_Save := H.A;

            Unchanged_Transitivity
              (A_Old (A'First .. J - 1),
               H.A (1 .. J - A'First),
               A_Save (1 .. J - A'First));
            H.A (J - A'First + 1) := A (J);
            Unchanged_Transitivity
              (A_Old (A'First .. J - 1),
               A_Save (1 .. J - A'First),
               H.A (1 .. J - A'First));
            New_Element (A_Old (A'First .. J), H.A (1 .. J - A'First + 1));

            pragma Loop_Invariant
              (Multiset_Unchanged
                 (A_Old (A'First .. J),
                  H.A (1 .. J - A'First + 1)));
            pragma Loop_Invariant
              (Is_Heap_Def ((A => H.A, Size => M - A'First)));
         end loop;

         A_Save := H.A;
         Unchanged_Transitivity (A_Old, H.A (1 .. Size), A_Save (1 .. Size));
         H.Size := Size;

         Partial_Sort_Aux (H, M - A'First + 1);
         if Size < MAX_SIZE then
            Multiset_With_Eq (H.A, A_Save, Size + 1);
         end if;
         Unchanged_Transitivity (A_Old, A_Save (1 .. Size), H.A (1 .. Size));
         A := H.A (1 .. Size);
         Unchanged_Transitivity (A_Old, H.A (1 .. Size), A);
      end if;

   end Partial_Sort;

end Partial_Sort_P;
