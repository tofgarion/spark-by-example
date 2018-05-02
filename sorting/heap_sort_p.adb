package body Heap_Sort_P with
SPARK_Mode is

   procedure Heap_Sort ( A : in out T_Arr ) is
      H : Heap ;
      A_Save : T_Arr := H.A;
      A_Old : constant T_Arr := A;
      Size : constant Natural := A'Length;
   begin
      if Size > 0 then
         H := Make_Heap (A);
         A_Save := H.A;
         Sort_Heap (H);

         if Size < Max_Size then
            Multiset_With_Eq (A_Save, H.A, Size + 1);
         end if;

         Unchanged_Transitivity (A, A_Save (1 .. Size), H.A (1 .. Size));
         Unchanged_Transitivity (H.A (1 .. Size), A, A_Old);
         A := H.A (1 .. Size);
         Unchanged_Transitivity (A_Old, H.A(1 .. Size), A);
      end if;
   end Heap_Sort;
end Heap_Sort_P;
