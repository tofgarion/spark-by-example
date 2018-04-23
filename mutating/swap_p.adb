package body Swap_P with
     Spark_Mode is
   procedure Swap (P : in out T; Q : in out T) is
      Save : T := P;
   begin
      P := Q;
      Q := Save;
   end Swap;
end Swap_P;
