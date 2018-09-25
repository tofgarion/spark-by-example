package body Push_Heap_Lemmas with
   Spark_Mode
 is

   procedure Make_Prove_Prologue
     (A, A_Old : T_Arr;
      V        : T;
      Hole     : Positive)
   is
   begin
      for E in T loop
         Occ_Set (A_Old, A, Hole, A (Hole), E);
         pragma Loop_Invariant
           (for all F in T'First .. E =>
              (if F = V then Occ (A, F) = Occ (A_Old, F) - 1
               elsif F = A (Hole) then Occ (A, F) = Occ (A_Old, F) + 1
               else Occ (A, F) = Occ (A_Old, F)));
      end loop;
   end Make_Prove_Prologue;

   procedure Make_Prove_Loop
     (A, A_Save, A_Old : T_Arr;
      V_Old, V         : T;
      Hole             : Positive)
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
      V                : T;
      Hole             : Positive)
   is
   begin
      for E in T loop

         Occ_Set (A_Save, A, Hole, V, E);

         pragma Loop_Invariant
           (for all F in T'First .. E => Occ (A, F) = Occ (A_Old, F));
      end loop;
   end Make_Prove_Epilogue;

end Push_Heap_Lemmas;
