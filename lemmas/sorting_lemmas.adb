package body Sorting_Lemmas with
     Spark_Mode is
   procedure Weakly_To_Sorted (A : T_Arr) is
   begin
      for J in A'Range loop
         null;
         pragma Loop_Invariant (Sorted (A (A'First .. J)));
      end loop;
   end Weakly_To_Sorted;

   procedure Prove_Partition (A : T_Arr; Mid,Size : Positive) is
   begin
      null;
   end Prove_Partition;


   procedure Prove_Lower_Bound (A, A_Save : T_Arr; M, J : Positive) is
   begin
      Multiset_With_Eq (A, A_Save, M);
      Has_Value_To_Occ (A(1 .. M-1), A (1));
      Occ_To_Has_Value(A_Save(1 .. M - 1),A(1));

   end Prove_Lower_Bound;

   procedure Prove_Partition_After_Sort (A, A_Save : T_Arr ; M, Size : Positive) is
   begin
      Multiset_With_Eq (A, A_Save, M);
      for J in A'First .. M-1 loop
         Has_Value_To_Occ (A (1 .. M - 1), A(J));
         Occ_To_Has_Value (A_Save (1 .. M - 1), A (J));

         pragma Loop_Invariant (for all K in 1 .. J => (for all L in M .. Size => A (K) <= A (L)));
      end loop;
   end Prove_Partition_After_Sort;

end Sorting_Lemmas;
