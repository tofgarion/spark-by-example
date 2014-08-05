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
         pragma Loop_Invariant
           (for all K in X'First .. J => X'Loop_Entry (Inner) (K) = Y (K));
         pragma Loop_Invariant
           (for all K in Y'First .. J => Y'Loop_Entry (Inner) (K) = X (K));
         pragma Loop_Invariant
           (for all K in J .. X'Last => (if K <= X'Last and K > J then X (K) = X'Loop_Entry (Inner) (K)));
         pragma loop_invariant
           (for all K in J .. Y'Last => (if K <= Y'Last and K > J then Y (K) = Y'Loop_Entry (Inner) (K)));
      end loop Inner;
   end Swap_Ranges;

   ----------
   -- Copy --
   ----------

   procedure Copy (A : T_Arr; A_Index : Integer; B : in out T_Arr; B_Index : Integer; Length : Integer) is
   begin
      --  This should be equivalent to the code above, but cannot be discharged
      --      B (B_Index .. B_Index + Length - 1) := A (A_Index .. A_Index + Length - 1);

      for J in 0 .. Length - 1 loop
         B (B_Index + J) := A (A_Index + J);
         pragma Loop_Invariant
           (for all K in 0 .. J => A (A_Index + K) = B (B_Index + K));
      end loop;
   end Copy;

   ------------------
   -- Reverse_Copy --
   ------------------

   function Reverse_Copy (X : T_Arr) return T_Arr is
      Result : T_Arr (X'First .. X'Last);
   begin
      for J in Result'Range loop
         Result (J) := X (X'Last - J + X'First);
         pragma Loop_Invariant
           (for all K in Result'First .. J =>
              Result (K) = X (X'Last - K + X'First));
      end loop;

      pragma Assert (Result'Last = X'Last);
      pragma Assert (Result'First = X'First);

      return Result;
   end Reverse_Copy;

   -------------------
   -- Reverse_Array --
   -------------------

   procedure Reverse_Array (A : in out T_Arr) is
   begin
      --  Note: I changed the implementation to match my own coding
      --  style.

     Inner : for J in A'First .. (A'Last + A'First) / 2 loop
         Swap (A (J), A (A'Last - J + A'First));

         pragma Loop_Invariant
           ((for all K in A'First .. J
            => A (K) = A'Loop_Entry (Inner) (A'Last - K + A'First))
            --  Invariant correct for range up to
            -- => A'First .. (A'Last + A'First) /2
              and
              (for all K in A'Last - J + A'First .. A'Last
                 => A (K) = A'Loop_Entry (Inner) (A'Last - K + A'First)));
         --  Invariant correct for range up to
         -- => A'Last - (A'Last + A'First)/2 + A'First .. A'Last
         -- => (A'Last + A'First) /2 .. A'Last
         pragma Loop_Invariant
           (for all K in J .. A'Last - J + A'First =>
            (if K <  A'Last - J + A'First and K > J then A (K) = A'Loop_Entry (Inner) (K)));
      end loop Inner;
      --  XXX GNATProve GPL 2014 Note from the loop invariant before,
      --  we should have proved the post-condition, but this is not
      --  the case
    end Reverse_Array;

end Chap6;
