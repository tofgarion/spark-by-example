package body Fill_P with
   Spark_Mode
 is
   procedure Fill
     (A   : in out T_Arr;
      Val :        T)
   is
   begin
      for I in A'Range loop
         A (I) := Val;

         pragma Loop_Invariant
           (Constant_Range_From_Location (A, Val, A'First, I - A'First + 1));
      end loop;
   end Fill;
end Fill_P;
