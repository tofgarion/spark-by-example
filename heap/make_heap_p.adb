package body Make_Heap_P with
     Spark_Mode is
   function Make_Heap (A : T_Arr) return Heap is
      Result : Heap;
      A_Save : T_Arr := Result.A;
   begin
      Result.Size := 0;
      if A'Length > 0 then

         Result.A (1) := A (A'First);
         Result.Size := 1;

         pragma Assert (Multiset_Unchanged(A(A'First .. A'First), Result.A(1 .. 1)));

         for J in A'First + 1 .. A'Last loop
            pragma Assert (Multiset_Unchanged(A(A'First .. J - 1), Result.A(1 .. J - A'First)));
            Result.Size := Result.Size+1;
            A_Save      := Result.A;

              Unchanged_Transitivity
                (A (A'First .. J - 1),
                 Result.A (1 .. J - A'First),
                 A_Save (1 .. J - A'First));


            Result.A (J - A'First + 1) := A (J);


            Unchanged_Transitivity (A (A'First .. J - 1), A_Save (1 .. J - A'First),Result.A (1 .. J - A'First));


            New_Element (A (A'First .. J), Result.A (1 .. J - A'First + 1));
            Push_Heap (Result);
           -- Unchanged_Transitivity(A(A'First .. J), A_Save(1 .. J - A'First + 1), Result.A(1 .. J - A'First + 1));

            pragma Loop_Invariant (Result.Size = J - A'First + 1);
            pragma Loop_Invariant (J - A'First + 1 in 2 .. MAX_SIZE);
            pragma Loop_Invariant (Is_Heap (Result));
            pragma Loop_Invariant
              (Multiset_Unchanged
                 (A (A'First .. J),
                  Result.A(1 .. J - A'First + 1)));

         end loop;

      end if;
      return Result;
   end Make_Heap;
end Make_Heap_P;
