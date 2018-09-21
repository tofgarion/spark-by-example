package body Make_Heap_P with
     Spark_Mode is

   function Make_Heap (A : T_Arr) return Heap is
      Result : Heap;
   begin
      if A'Length > 0 then

         Result.A (1) := A (A'First);
         Result.Size  := 1;

         for J in A'First + 1 .. A'Last loop
            declare
               Size : constant Positive := Result.Size + 1;
            begin
               Result.Size := Size;
               New_Element (A (A'First .. J), Result.A (1 .. Size));

               if Size < MAX_SIZE then
               end if;
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
