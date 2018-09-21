package body Make_Heap_P with
     Spark_Mode is

   function Make_Heap (A : T_Arr) return Heap is
      Result : Heap;
      A_Save : T_Arr := Result.A with
         Ghost;
   begin
      if A'Length > 0 then

         Result.A (1) := A (A'First);
         Result.Size  := 1;

         pragma Assert
           (Multiset_Unchanged (A (A'First .. A'First), Result.A (1 .. 1)));

         for J in A'First + 1 .. A'Last loop
            declare
               Size : constant Positive := Result.Size + 1;
            begin
               Result.Size := Size;
               A_Save      := Result.A;

               Unchanged_Transitivity
                 (A (A'First .. J - 1),
                  Result.A (1 .. Size - 1),
                  A_Save (1 .. Size - 1));

               Result.A (Size) := A (J);

               Unchanged_Transitivity
                 (A (A'First .. J - 1),
                  A_Save (1 .. Size - 1),
                  Result.A (1 .. Size - 1));
               New_Element (A (A'First .. J), Result.A (1 .. Size));

               A_Save := Result.A;

               Unchanged_Transitivity
                 (A (A'First .. J),
                  Result.A (1 .. Size),
                  A_Save (1 .. Size));
               Push_Heap (Result);
               if Size < MAX_SIZE then
                  Multiset_With_Eq (A_Save, Result.A, Size + 1);
               end if;
               Unchanged_Transitivity
                 (A (A'First .. J),
                  A_Save (1 .. Size),
                  Result.A (1 .. Size));

               pragma Loop_Invariant
                 (Result.Size = J - A'First + 1 and Result.Size = Size);
               pragma Loop_Invariant (Is_Heap_Def (Result));
               pragma Loop_Invariant
                 (Multiset_Unchanged (A (A'First .. J), Result.A (1 .. Size)));
            end;

         end loop;

      end if;
      return Result;
   end Make_Heap;
end Make_Heap_P;
