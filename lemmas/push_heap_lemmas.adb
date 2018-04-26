package body Push_Heap_Lemmas with
     Spark_Mode is
   procedure Occ_Eq (A : T_Arr; B : T_Arr; E : T) with
      Ghost,
      Pre  => A = B,
      Post => Occ (A, E) = Occ (B, E);

   procedure Occ_Eq (A : T_Arr; B : T_Arr; E : T) is
   begin
      if A'Length = 0 then
         return;
      end if;

      if A (A'Last) = E then
         pragma Assert (B (B'Last) = E);
      else
         pragma Assert (B (B'Last) /= E);
      end if;

      Occ_Eq (Remove_Last (A), Remove_Last (B), E);
   end Occ_Eq;

   procedure Occ_Set (A : T_Arr; B : T_Arr; I : Positive; V, E : T) is
      Tmp : T_Arr := Remove_Last (A);
   begin
      if A'Length = 0 then
         return;
      end if;

      if I = A'Last then
         Occ_Eq (Tmp, Remove_Last (B), E);
      else
         Tmp (I) := V;
         Occ_Eq (Remove_Last (B), Tmp, E);
         Occ_Set (Remove_Last (A), Tmp, I, V, E);
      end if;
   end Occ_Set;

   -- procedure Push_Heap

   procedure No_Changes (A_Old, A, A_Save : T_Arr; V, V_Old : T; Hole : Positive) is
   begin
      for E in T loop
         Occ_Eq (A, A_Save, E);
         pragma Loop_Invariant (for all F in T'First .. E =>
                                  Occ (A, F) = Occ (A_Save, F));
      end loop;
   end No_Changes;


   procedure Make_Prove_Prologue (A, A_Old : T_Arr ; V : T ; Hole : Positive)
   is
   begin
      for E in T loop
         Occ_Set (A_Old, A, Hole, A (Hole), E);
         pragma Loop_Invariant (for all F in T'First .. E =>
                                   (if F = V then Occ (A, F) = Occ (A_Old, F) - 1
                                elsif F = A (Hole) then Occ (A, F) = Occ (A_Old, F) + 1
                                else Occ (A, F) = Occ (A_Old, F)));
      end loop;
   end Make_Prove_Prologue;


   procedure Make_Prove_Loop
     (A, A_Save, A_Old : T_Arr;
      V_Old, V      : T;
      Hole          : Positive)
   is
   begin

      for E in T loop

         Occ_Set (A_Save, A, Hole, A (Hole), E);

         pragma Loop_Invariant
           (for all F in T'First .. E =>
              (if F = A (Hole) then Occ (A, F) = Occ (A_Old, F) + 1
               elsif F = V then Occ (A, F) = Occ (A_Old, F) - 1
               else Occ (A, F) = Occ (A_Old, F)));
      end loop;

   end Make_Prove_Loop;

   procedure Make_Prove_Epilogue
     (A, A_Save, A_Old : T_Arr;
      V : T;
      Hole : Positive) is
   begin
      for E in T loop

         Occ_Set (A_Save, A, Hole, V, E);

         pragma Loop_Invariant
           (for all F in T'First .. E =>
              Occ (A, F) = Occ (A_Old, F));
      end loop;
   end Make_Prove_Epilogue;

   -- end procedure Push_Heap

   -- function Make_Heap

   procedure New_Element (A, B : T_arr) is
   begin
      for E in T loop
null;
         pragma Loop_Invariant (for all F in T'First .. E =>
                                  Occ (A, F) = Occ (B, F));
      end loop;
   end New_Element;

   procedure Unchanged_Transitivity (A, B, C : T_Arr) is
   begin
      for E in T loop
         if B = C then
            Occ_Eq (B, C, E);
         end if;

         pragma Loop_Invariant (for all F in T'First .. E =>
                                  Occ (A, F) = Occ (C, F));
      end loop;
   end Unchanged_Transitivity;



   -- end function Make_Heap

end Push_Heap_Lemmas;
