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


   procedure Prove_Partition (A : T_Arr; Mid : Positive) is
   begin
      null;
   end Prove_Partition;

   procedure Test (A : T_Arr; V : T) is
   begin
      if A'Length = 1 then
         return;
      end if;
      if A (A'Last) = V then
         return;
      else
         Test (Remove_Last (A), V);
      end if;

   end Test;



end Sorting_Lemmas;
