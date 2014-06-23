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

end Chap6;
