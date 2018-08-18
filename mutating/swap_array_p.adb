package body Swap_Array_P with
   Spark_Mode
 is

   procedure Swap_Array
     (A : in out T_Arr;
      J :        Positive;
      K :        Positive)
   is
      A_Init : T_Arr (A'Range) := A;
      Temp   : T               := A (J);

      -- ghost variable

      A_After_First : T_Arr (A'Range) with
         Ghost;

         -- ghost procedure

      procedure Prove_Perm with
         Ghost,
         Pre => J in A'Range and then K in A'Range
         and then Is_Set (A_Init, J, A_Init (K), A_After_First)
         and then Is_Set (A_After_First, K, A_Init (J), A),
         Post => Multiset_Unchanged (A_Init, A)
       is
      begin
         for V in T loop
            Occ_Set (A_Init, A_After_First, J, A_Init (K), V);
            Occ_Set (A_After_First, A, K, A_Init (J), V);
            pragma Loop_Invariant
              (for all F in T'First .. V => Occ (A_Init, F) = Occ (A, F));
         end loop;
      end Prove_Perm;

   begin
      A (J)         := A (K);
      A_After_First := A; -- ghost code

      pragma Assert (Is_Set (A_Init, J, A_Init (K), A_After_First));

      A (K) := Temp;

      pragma Assert (Is_Set (A_After_First, K, A_Init (J), A));
      Prove_Perm; -- ghost code

   end Swap_Array;
end Swap_Array_P;
