package body Is_Heap_P with
     Spark_Mode is

   function Is_Heap (H : Heap) return Boolean is
      Parent : Natural := 1;
   begin
      if H.Size > H.A'Length then
         return False;
      else

         if H.Size >= 1 then
            for Child in 2 .. H.Size loop

               if H.A (Parent) < H.A (Child) then
                  return False;
               end if;

               pragma Loop_Invariant
                 (1 <= Parent
                  and then Parent < Child
                  and then Child <= H.Size);
               pragma Loop_Invariant (Parent = Heap_Parent (Child));
               pragma Loop_Invariant (Is_Heap_Def ((A => H.A, Size => Child)));

               if Child mod 2 = 1 then
                  Parent := Parent + 1;
               end if;

            end loop;
         end if;

         return True;
      end if;

   end Is_Heap;
end Is_Heap_P;
