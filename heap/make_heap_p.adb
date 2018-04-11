package body Make_Heap_P with
     Spark_Mode is
   function Make_Heap (A : T_Arr) return Heap is
      Result : Heap;
      Size : Natural := 0;
      A_Save : T_Arr := Result.A;
   begin
      Result.Size := 0;
      if A'Length > 0 then

         Result.A (1) := A (A'First);
         Size := Size + 1;
         Result.Size := Size;

         pragma Assert (Multiset_Unchanged(A(A'First .. A'First), Result.A(1 .. Size)));

         for J in A'First + 1 .. A'Last loop

            Size := Size + 1;
            Result.Size := Size;
            A_Save      := Result.A;

--              Unchanged_Transitivity
--                (A (A'First .. J - 1),
--                 Result.A (1 .. Size - 1),
--                 A_Save (1 .. Size - 1));
           --    end if;

            Result.A (Size) := A (J);


           -- Unchanged_Transitivity (A (A'First .. J - 1), A_Save (1 .. Size - 1),Result.A (1 .. Size - 1));


           -- New_Element (A (A'First .. J), Result.A (1 .. Size));
            Push_Heap (Result);
           -- Unchanged_Transitivity(A(A'First .. J), A_Save(1 .. Size), Result.A(1 .. Size));

            pragma Loop_Invariant (Size = J - A'First + 1
                                   and then     Result.size = Size);
            pragma Loop_Invariant (Size in 2 .. MAX_SIZE-1);
            pragma Loop_Invariant (Is_Heap (Result));
            pragma Loop_Invariant
              (Multiset_Unchanged
                 (A (A'First .. J),
                  Result.A(1 .. Size)));

         end loop;

      end if;
      return Result;
   end Make_Heap;
end Make_Heap_P;
