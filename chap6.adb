package body Chap6 with
     Spark_Mode is

   ----------
   -- Fill --
   ----------

   procedure Fill (A : in out T_Arr; Val : T) is
   begin
      for J in A'Range loop
         A (J) := Val;
         pragma Loop_Invariant (for all K in A'First .. J => A (K) = Val);
      end loop;
   end Fill;

   ----------
   -- Swap --
   ----------

   procedure Swap (X : in out T; Y : in out T) is
      Temp : T;
   begin
      Temp := X;
      X    := Y;
      Y    := Temp;
   end Swap;

   -----------------
   -- Swap_Ranges --
   -----------------

   procedure Swap_Ranges (X : in out T_Arr; Y : in out T_Arr) is
   begin
      Inner : for J in X'Range loop
         Swap (X (J), Y (J));
         pragma loop_invariant
           (for all K in X'first .. J => X'Loop_Entry (Inner) (K) = Y (K));
         pragma loop_invariant
           (for all K in Y'first .. J => Y'Loop_Entry (Inner) (K) = X (K));
         pragma loop_invariant
           (for all K in J .. X'Last => (if K <= X'Last and K > J then X (K) = x'Loop_entry (inner) (K)));
         pragma loop_invariant
           (for all K in J .. Y'Last => (if K <= Y'Last and K > J then Y (K) = Y'Loop_entry (inner) (K)));
      end loop Inner;
   end Swap_Ranges;

end Chap6;
