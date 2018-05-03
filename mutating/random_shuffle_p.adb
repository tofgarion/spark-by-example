package body Random_Shuffle_P with
     Spark_Mode is

   procedure Random_Shuffle (A : in out T_Arr) is
      J : Positive;
   begin

      for I in A'Range loop
         J := Random_Number (A'First, I);

         Swap_Array (A, I, J);
         pragma Loop_Invariant (Multiset_Unchanged (A, A'Loop_Entry));

      end loop;
   end Random_Shuffle;
end Random_Shuffle_P;
