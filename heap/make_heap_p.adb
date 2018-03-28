package body Make_Heap_P with
SPARK_Mode
is
   function Make_Heap (A : T_arr) return Heap is
      Result : Heap;
   begin
      if A'Length > 0 then


         for J in 0 .. A'Length - 1 loop
            Result.A (1 + J) := A (A'First + J);
            Result.Size := Result.Size + 1;
            Push_Heap(Result);

            pragma Loop_Invariant(Result.Size = 1 + J);
            pragma Loop_Invariant (Is_Heap (Result));
            pragma Loop_Invariant (Multiset_Unchanged (Result.A (1 .. Result.Size), A (A'First .. A'First + J)));
         end loop;
      end if;
      return Result;
   end Make_Heap;
end Make_Heap_P;
