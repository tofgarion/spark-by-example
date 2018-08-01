package body Swap_Array_P with
   Spark_Mode
 is

   procedure Swap_Array
     (A : in out T_Arr;
      I :        Positive;
      J :        Positive)
   is
      Init : T_Arr (A'Range) := A;
      Temp : T               := A (I);

      --ghost variables

      Interm : T_Arr (A'Range) with
         Ghost;

         -- ghost procedure

      procedure Prove_Perm with
         Ghost,
         Pre => I in A'Range and then J in A'Range
         and then Is_Set (Init, I, Init (J), Interm)
         and then Is_Set (Interm, J, Init (I), A),
         Post => Multiset_Unchanged (Init, A)
       is
      begin
         for V in T loop
            Occ_Set (Init, Interm, I, Init (J), V);
            Occ_Set (Interm, A, J, Init (I), V);
            pragma Loop_Invariant
              (for all F in T'First .. V => Occ (Init, F) = Occ (A, F));
         end loop;
      end Prove_Perm;

   begin
      A (I)  := A (J);
      Interm := A; -- ghost

      pragma Assert (Is_Set (Init, I, Init (J), Interm));

      A (J) := Temp;

      pragma Assert (Is_Set (Interm, J, Init (I), A));
      Prove_Perm; --ghost
   end Swap_Array;
end Swap_Array_P;
