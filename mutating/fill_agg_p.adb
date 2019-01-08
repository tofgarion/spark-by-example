package body Fill_Agg_P with
   Spark_Mode
 is
   procedure Fill
     (A   : in out T_Arr;
      Val :        T)
   is
   begin
      A := (others => Val);
   end Fill;
end Fill_Agg_P;
