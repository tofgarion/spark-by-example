package body Sorting_Lemmas with
SPARK_Mode
is
   procedure Weakly_To_Sorted (A : T_Arr)
   is
   begin
      for J in A'Range loop
         null;
         pragma Loop_Invariant (Sorted(A(A'First .. J)));
         end loop;
      end Weakly_To_Sorted;

end Sorting_Lemmas;
