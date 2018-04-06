package body Push_Heap_P with
     Spark_Mode is
   procedure Push_Heap (H : in out Heap) is
      V      : T              := H.A (H.Size);
      Hole   : Natural;
      Parent : Natural;
      A_Old  : constant T_Arr := H.A (1 .. H.Size);
      A_Save : T_Arr          := H.A (1 .. H.Size);
      V_Old  : T;

   begin
      if 1 < H.Size then

         Hole := Heap_Parent (H.Size);

         if H.A (Hole) < V then

            H.A (H.Size) := H.A (Hole);
            Make_Prove_Prologue (H.A (1 .. H.Size), A_Old, V, H.Size);
            pragma Assert
                    (Multiset_Add (A_Old, H.A (1 .. H.Size), H.A(Hole)));
                  pragma Assert (Multiset_Minus (A_Old, H.A (1 .. H.Size), V));
                  pragma Assert
                    (Multiset_Retain_Rest_Double
                       (A_Old,
                        H.A (1 .. H.Size),
                        H.A(Hole),
                        V));
            if 1 < Hole then

               Parent := Heap_Parent (Hole);

               while 1 < Hole and then H.A (Parent) < V loop

                  A_Save := H.A (1 .. H.Size);
                  V_Old  := H.A (Hole);
                  pragma Assert (H.A (1 .. H.Size)'Last < Positive'Last);
                  pragma Assert (H.A (1 .. H.Size)'First = A_Save'First);
                  pragma Assert (H.A (1 .. H.Size)'First = A_Old'First);
                  pragma Assert (H.A (1 .. H.Size)'Last = A_Save'Last);
                  pragma Assert (H.A (1 .. H.Size)'Last = A_Old'Last);
                  pragma Assert (A_Save = H.A (1 .. H.Size));
                  pragma Assert
                    (Multiset_Add (A_Old, H.A (1 .. H.Size), V_Old));
                  pragma Assert (Multiset_Minus (A_Old, H.A (1 .. H.Size), V));
                  pragma Assert
                    (Multiset_Retain_Rest_Double
                       (A_Old,
                        H.A (1 .. H.Size),
                        V_Old,
                        V));
                  No_Changes (A_Old, H.A (1 .. H.Size), A_Save, V, V_Old);

                  if H.A (Hole) < H.A (Parent) then
                     H.A (Hole) := H.A (Parent);

                  end if;

                  Make_Prove_Loop
                    (H.A (1 .. H.Size),
                     A_Save,
                     A_Old,
                     V_Old,
                     V,
                     Hole);
                  Hole := Parent;

                  if (1 < Hole) then
                     Parent := Heap_Parent (Hole);
                  end if;

                  pragma Loop_Invariant (H.Size > 1);
                  pragma Loop_Invariant (H.Size = H'Loop_Entry.Size);
                  pragma Loop_Invariant (Hole in 1 .. H.Size);
                  pragma Loop_Invariant (Is_Heap (H));
                  pragma Loop_Invariant
                    (if 1 < Hole then Parent = Heap_Parent (Hole));
                  pragma Loop_Invariant (H.A (Hole) < V);
                  pragma Loop_Invariant
                    (Multiset_Add (A_Old, H.A (1 .. H.Size), H.A (Hole)));
                  pragma Loop_Invariant
                    (Multiset_Minus (A_Old, H.A (1 .. H.Size), V));
                  pragma Loop_Invariant
                    (Multiset_Retain_Rest_Double
                       (A_Old,
                        H.A (1 .. H.Size),
                        H.A (Hole),
                        V));
               end loop;

            end if;
            H.A (Hole) := V;
         end if;
      end if;

   end Push_Heap;
end Push_Heap_P;
