package body Push_Heap_P with
     Spark_Mode is
   procedure Push_Heap (H : in out Heap) is
      V    : T                 := H.A (H.Size);
      Size : constant Positive := H.Size with
         Ghost;
      Hole   : Natural;
      Parent : Natural;
      A_Old  : constant T_Arr := H.A with
         Ghost;
      A_Save : T_Arr := H.A with
         Ghost;
      V_Old : T with
         Ghost;

   begin
      if 1 < H.Size then

         Hole := Heap_Parent (H.Size);

         if H.A (Hole) < V then

            H.A (H.Size) := H.A (Hole);
            Make_Prove_Prologue (H.A, A_Old, V, H.Size);

            if 1 < Hole then

               Parent := Heap_Parent (Hole);

               while 1 < Hole and then H.A (Parent) < V loop

                  A_Save := H.A;
                  V_Old  := H.A (Hole);
                  No_Changes (A_Old, H.A, A_Save, V, V_Old, Hole);

                  if H.A (Hole) < H.A (Parent) then
                     H.A (Hole) := H.A (Parent);

                  end if;

                  Make_Prove_Loop (H.A, A_Save, A_Old, V_Old, V, Hole);

                  Hole := Parent;

                  if (1 < Hole) then
                     Parent := Heap_Parent (Hole);
                  end if;

                  pragma Loop_Invariant
                    (if
                       Size < MAX_SIZE
                     then
                       A_Old (Size + 1 .. MAX_SIZE) =
                       H.A (Size + 1 .. MAX_SIZE));
                  pragma Loop_Invariant (Hole in 1 .. H.Size);
                  pragma Loop_Invariant (Is_Heap_Def (H));
                  pragma Loop_Invariant
                    (if 1 < Hole then Parent = Heap_Parent (Hole));
                  pragma Loop_Invariant (H.A (Hole) < V);
                  pragma Loop_Invariant
                    (Multiset_Add (A_Old, H.A, H.A (Hole)));
                  pragma Loop_Invariant (Multiset_Minus (A_Old, H.A, V));
                  pragma Loop_Invariant
                    (Multiset_Retain_Rest_Double (A_Old, H.A, H.A (Hole), V));
               end loop;
            end if;

            A_Save := H.A;
            V_Old  := H.A (Hole);
            No_Changes (A_Old, H.A, A_Save, V, H.A (Hole), Hole);
            H.A (Hole) := V;

            Make_Prove_Epilogue (H.A, A_Save, A_Old, V, Hole);

         end if;
      end if;

   end Push_Heap;
end Push_Heap_P;
